import asyncio
import concurrent.futures
from functools import partial
import gc
from operator import methodcaller
import os
import shutil
import subprocess
import sys
import time

import aiofiles
import aiohttp
import libarchive
import psutil
import zipfile
import json
from collections import defaultdict
from pathlib import Path

from transform_utils import transform_xml_to_html, transform_xml_to_pdf

from tqdm import tqdm
import argparse

from pebble import ProcessPool
from concurrent.futures import TimeoutError as PebbleTimeoutError

import aioboto3

YEARS = ["2019", "2020", "2021", "2022", "2023", "2024", "2025"]

# -----------------------------------------------------------------------------
# Helpers
# -----------------------------------------------------------------------------


def process_xml_to_pdf(xml_path: str, html_output_dir: str, s3_bucket: str | None):
    """Worker helper to convert a single XML file and upload it to S3.

    Returns (ein, s3_uri, form_id) on success or None on failure.
    """
    try:
        # A dummy path is needed. Its parent directory will be used for output files.
        dummy_path = Path(html_output_dir) / (Path(xml_path).stem + ".dummy")

        meta = transform_xml_to_pdf(
            xml_path=xml_path, output_path=dummy_path, s3_bucket=s3_bucket
        )

        if not meta:
            return None

        return (
            meta.get("ein"),
            meta.get("s3_uri"),
            meta.get("form_id"),
            meta.get("tax_year"),
            meta.get("html_path"),
        )
    except Exception as exc:
        tqdm.write(f"Error converting {xml_path}: {exc}")
        return None


def set_process_priority(nice_value=0):
    """Set process priority for current process"""
    try:
        process = psutil.Process(os.getpid())
        process.nice(nice_value)
    except Exception as e:
        pass


async def test_url(client: aiohttp.ClientSession, url: str):
    try:
        async with client.get(url, timeout=aiohttp.ClientTimeout(total=5)) as response:
            return (url, response.status == 200)
    except Exception as _:
        return (url, False)


def generate_url_new(year: str, num: int):
    return f"https://apps.irs.gov/pub/epostcard/990/xml/{year}/{year}_TEOS_XML_{num:02}A.zip"


def generate_url_old(year: str, num: int):
    return f"https://apps.irs.gov/pub/epostcard/990/xml/{year}/download990xml_{year}_{num}.zip"


def run_process_board_on_year(year: str, data_dir: str):
    output_csv = f"results/{year}_results.csv"
    # Set priority for the subprocess
    try:
        # Use subprocess with preexec_fn to set priority
        subprocess.run(
            ["python", "process_board.py", data_dir, output_csv],
            check=True,
            preexec_fn=lambda: os.nice(0) if hasattr(os, "nice") else None,
        )
    except AttributeError:
        # Fallback if preexec_fn not available
        subprocess.run(["python", "process_board.py", data_dir, output_csv], check=True)


def extract_zip_libarchive(zip_path, out_dir):
    # Set priority for worker processes
    set_process_priority(0)

    os.makedirs(out_dir, exist_ok=True)
    try:
        with libarchive.file_reader(zip_path) as entries:
            for entry in entries:
                # Skip directories
                if entry.isdir:
                    continue
                # Create the full path for the file
                file_path = os.path.join(out_dir, entry.pathname)
                # Create parent directories if they don't exist
                os.makedirs(os.path.dirname(file_path), exist_ok=True)
                # Read the file content and write it
                with open(file_path, "wb") as f:
                    for block in entry.get_blocks():
                        f.write(block)
    except libarchive.exception.ArchiveError as e:
        try:
            with zipfile.ZipFile(zip_path, "r") as zip_ref:
                zip_ref.extractall(out_dir)
        except Exception as e:
            tqdm.write(f"Error extracting {zip_path} with zipfile: {e}")


async def download_and_extract(client, url, dest_dir, sem):
    async with sem:
        filename = os.path.join(dest_dir, url.split("/")[-1])
        if not await test_url(client, url):
            return
        async with client.get(url, timeout=aiohttp.ClientTimeout(total=300)) as resp:
            if resp.status == 200:
                total = int(resp.headers.get("Content-Length", 0))
                f = await aiofiles.open(filename, mode="wb")
                with tqdm(
                    total=total,
                    unit="B",
                    unit_scale=True,
                    desc=os.path.basename(filename),
                    leave=False,
                ) as pbar:
                    async for chunk in resp.content.iter_chunked(1024 * 32):
                        await f.write(chunk)
                        pbar.update(len(chunk))
                await f.close()
                tqdm.write(f"Downloaded {filename}")
            else:
                tqdm.write(f"Failed to download {url} (status {resp.status})")


async def async_upload_to_s3(
    file_path: str, s3_bucket: str, s3_key: str, session: aioboto3.Session
):
    async with session.client("s3") as s3:
        await s3.upload_file(file_path, s3_bucket, s3_key)


async def download_handler(
    client: aiohttp.ClientSession,
    year: str,
    *,
    max_concurrent: int = 6,
    skip: bool = False,
    output_dir: str = "output",
):
    # Collects mapping EIN -> list[pdf_paths]
    start_time = time.monotonic()
    summary_map = defaultdict(list)
    dest_dir = f"/home/ec2-user/DonorAtlas/irs-efile-viewer/data/{year}/"
    os.makedirs(dest_dir, exist_ok=True)
    sem = asyncio.Semaphore(max_concurrent)
    if not skip:
        tasks = []
        for num in range(1, 20):
            if int(year) < 2021:
                url = generate_url_old(year, num)
            else:
                url = generate_url_new(year, num)
            tasks.append(test_url(client, url))
        urls = await asyncio.gather(*tasks)
        urls = [url for url, good in urls if good]
        tqdm.write(f"Found {len(urls)} good urls: {urls}")
        tasks = []
        for url in urls:
            tasks.append(download_and_extract(client, url, dest_dir, sem))
        await asyncio.gather(*tasks)
        tqdm.write("Starting unzip")
        # Multiprocessing unzip after all downloads
        zip_files = [
            os.path.join(dest_dir, f)
            for f in os.listdir(dest_dir)
            if f.endswith(".zip")
        ]
        if zip_files:
            with tqdm(
                total=len(zip_files), desc="Unzipping", unit="file", leave=False
            ) as unzip_pbar:
                with concurrent.futures.ProcessPoolExecutor(
                    max_workers=max_concurrent
                ) as executor:
                    futures = []
                    for zip_file in zip_files:
                        out_dir = zip_file.replace(".zip", "")
                        futures.append(
                            executor.submit(extract_zip_libarchive, zip_file, out_dir)
                        )
                    for f in futures:
                        f.result()
                        unzip_pbar.update(1)
    else:
        tqdm.write(f"Skipping download and unzip for {year}")

    # ------------------------------------------------------------------
    # Convert extracted XML files to PDFs (always run this part)
    # ------------------------------------------------------------------
    html_output_dir = os.path.join(output_dir, "html")
    os.makedirs(html_output_dir, exist_ok=True)

    xml_files = [
        os.path.join(root, fname)
        for root, _, files in os.walk(dest_dir)
        for fname in files
        if fname.lower().endswith(".xml")
    ]

    if xml_files:
        s3_bucket_name = os.environ.get("S3_BUCKET_NAME")

        worker_func = partial(
            process_xml_to_pdf,
            html_output_dir=html_output_dir,
            s3_bucket=None,  # Do not upload in worker
        )
        completed = 0
        batch_size = 100
        futures = []
        results = []
        with ProcessPool(max_workers=max_concurrent) as pool:
            for xml_file in xml_files:
                futures.append(
                    pool.schedule(worker_func, args=(xml_file,), timeout=300)
                )
            with tqdm(
                total=len(futures), desc="XML→HTML→S3", unit="file", leave=False
            ) as pbar:
                for future in concurrent.futures.as_completed(futures):
                    try:
                        res = future.result()
                        if res and res[0] and res[2]:
                            # We'll upload after pool
                            results.append(res)
                    except PebbleTimeoutError:
                        tqdm.write(
                            "A file transformation timed out after 5 minutes and was killed."
                        )
                    except Exception as _:
                        # tqdm.write(f"A file transformation failed: {exc}")
                        pass
                    completed += 1
                    if completed % batch_size == 0:
                        pbar.update(batch_size)
                remainder = completed % batch_size
                if remainder:
                    pbar.update(remainder)
        tqdm.write("Completed Process Pool")

        # Async S3 upload after pool
        if s3_bucket_name:
            session = aioboto3.Session()
            upload_tasks = []
            for ein, s3_uri, form_id, tax_year, html_path in results:
                if html_path and os.path.exists(html_path):
                    s3_key = os.path.basename(html_path)
                    upload_tasks.append(
                        async_upload_to_s3(html_path, s3_bucket_name, s3_key, session)
                    )
            if upload_tasks:
                await asyncio.gather(*upload_tasks)
                # Delete local files after upload
                for ein, s3_uri, form_id, tax_year, html_path in results:
                    if html_path and os.path.exists(html_path):
                        os.remove(html_path)
                tqdm.write(
                    f"Uploaded {len(upload_tasks)} files to S3 and deleted local copies."
                )

        # Update summary_map with S3 URIs if uploaded
        for ein, s3_uri, form_id, tax_year, html_path in results:
            if s3_uri:
                summary_map[ein].append(
                    {
                        "form_type": form_id,
                        "s3_uri": s3_uri,
                        "tax_year": tax_year,
                    }
                )
    else:
        tqdm.write("No XML files found for transformation.")

    tqdm.write("Completed XML→HTML→S3")

    # Optionally, run process_board after all unzips for the year
    # run_process_board_on_year(year, dest_dir)
    shutil.rmtree(dest_dir, ignore_errors=True)

    # Write summary JSON for the year
    end_time = time.monotonic()
    elapsed_time = end_time - start_time
    hours, rem = divmod(elapsed_time, 3600)
    minutes, seconds = divmod(rem, 60)
    if hours >= 1:
        tqdm.write(f"Time taken: {int(hours)}h {int(minutes)}m {seconds:.2f}s")
    elif minutes >= 1:
        tqdm.write(f"Time taken: {int(minutes)}m {seconds:.2f}s")
    else:
        tqdm.write(f"Time taken: {seconds:.2f}s")
    summary_out = os.path.join(output_dir, f"{year}_summary.json")
    Path(summary_out).parent.mkdir(parents=True, exist_ok=True)
    with open(summary_out, "w", encoding="utf-8") as fp:
        json.dump({k: v for k, v in summary_map.items()}, fp, indent=2)

    tqdm.write(f"Summary for {year} written to {summary_out}")


async def main(*, skip: bool = False, output_dir: str = "output", max_workers: int = 6):
    set_process_priority(0)
    async with aiohttp.ClientSession(timeout=aiohttp.ClientTimeout(total=30)) as client:
        for year in YEARS[-2:-1]:
            tqdm.write(f"Starting {year}")
            await download_handler(
                client,
                year,
                max_concurrent=max_workers,
                skip=skip,
                output_dir=output_dir,
            )
            columns, _ = shutil.get_terminal_size(fallback=(100, 24))
            tqdm.write(f"Finished {year}\n{'=' * columns}\n")


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--skip",
        action="store_true",
        help="Skip both download and unzip steps (process only)",
    )
    parser.add_argument(
        "--output-dir",
        default="output",
        help="Directory where PDFs and summary.json will be written (default: output)",
    )
    parser.add_argument(
        "--max-workers",
        type=int,
        default=6,
        help="Maximum parallel workers for unzip and PDF transform",
    )
    return parser.parse_args()


if __name__ == "__main__":
    try:
        args = parse_args()
        asyncio.run(
            main(
                skip=args.skip, output_dir=args.output_dir, max_workers=args.max_workers
            )
        )
    except KeyboardInterrupt:
        gc.collect()
        tqdm.write("Keyboard interrupt")
        sys.exit(1)
