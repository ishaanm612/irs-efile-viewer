import asyncio
import concurrent.futures
import gc
import os
import shutil
import subprocess
import sys

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

YEARS = ["2019", "2020", "2021", "2022", "2023", "2024", "2025"]

# Collects mapping EIN -> list[pdf_paths]
summary_map = defaultdict(list)


# -----------------------------------------------------------------------------
# Helpers
# -----------------------------------------------------------------------------


def process_xml_to_pdf(xml_path: str, pdf_dir: str):
    """Worker helper to convert a single XML file into a PDF.

    Returns (ein, pdf_path) on success or None on failure.
    """
    try:
        # First pass to get metadata for naming
        meta_preview = transform_xml_to_html(xml_path)
        ein = meta_preview.get("ein") or "UNKNOWN"
        tax_year = meta_preview.get("tax_year") or "UNKNOWN"
        form_id = meta_preview.get("form_id") or "Form"

        pdf_name = f"{ein}_{tax_year}_{form_id}.pdf"
        pdf_path = os.path.join(pdf_dir, pdf_name)

        # Full transform to PDF
        transform_xml_to_pdf(xml_path=xml_path, pdf_path=pdf_path)

        return ein, pdf_path
    except Exception as exc:
        tqdm.write(f"Error converting {xml_path} → PDF: {exc}")
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


async def download_handler(
    client: aiohttp.ClientSession,
    year: str,
    *,
    max_concurrent: int = 6,
    skip: bool = False,
    output_dir: str = "output",
):
    dest_dir = f"/home/ec2-user/DonorAtlas/990_scrape/990_scrape/data/{year}/"
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

        # ------------------------------------------------------------------
        # Convert extracted XML files to PDFs
        # ------------------------------------------------------------------
        pdf_dir = os.path.join(output_dir, "pdfs")
        os.makedirs(pdf_dir, exist_ok=True)

        xml_files = [
            os.path.join(root, fname)
            for root, _, files in os.walk(dest_dir)
            for fname in files
            if fname.lower().endswith(".xml")
        ]

        if xml_files:
            with concurrent.futures.ProcessPoolExecutor(
                max_workers=max_concurrent
            ) as pool:
                for res in tqdm(
                    pool.map(lambda p: process_xml_to_pdf(p, pdf_dir), xml_files),
                    total=len(xml_files),
                    desc="XML→PDF",
                    unit="file",
                ):
                    if res:
                        ein, pdf_path = res
                        summary_map[ein].append(pdf_path)
    else:
        tqdm.write(f"Skipping download and unzip for {year}")

    # Optionally, run process_board after all unzips for the year
    run_process_board_on_year(year, dest_dir)
    shutil.rmtree(dest_dir, ignore_errors=True)


async def main(*, skip: bool = False, output_dir: str = "output", max_workers: int = 6):
    set_process_priority(0)
    async with aiohttp.ClientSession(timeout=aiohttp.ClientTimeout(total=30)) as client:
        for year in YEARS[-1:]:
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

    # Write summary JSON
    summary_out = os.path.join(output_dir, "summary.json")
    Path(summary_out).parent.mkdir(parents=True, exist_ok=True)
    with open(summary_out, "w", encoding="utf-8") as fp:
        json.dump({k: v for k, v in summary_map.items()}, fp, indent=2)

    tqdm.write(f"Summary written to {summary_out}")


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
