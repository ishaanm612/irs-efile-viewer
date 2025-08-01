#!/usr/bin/env python3
"""IRS e-file processing pipeline for downloading, extracting, and converting XML files to HTML.

This module provides functionality to:
- Download IRS e-file ZIP archives from S3
- Extract XML files from ZIP archives
- Convert XML files to standalone HTML files
- Upload generated HTML files back to S3
- Generate summary reports of processed files

The pipeline processes files by year and supports concurrent processing with configurable
batch sizes and worker limits.

Example
-------
>>> import asyncio
>>> from fetch_irs_files import main
>>> asyncio.run(main(max_workers=4, output_dir="output"))
"""

import argparse
import asyncio
import concurrent.futures
import gc
import json
import os
import shutil
import subprocess
import sys
import threading
import time
import zipfile
from collections import defaultdict
from concurrent.futures import TimeoutError as PebbleTimeoutError
from concurrent.futures import wait as futures_wait
from functools import partial
from pathlib import Path

import aioboto3
import botocore.exceptions
import libarchive
from pebble import ProcessPool
from tqdm import tqdm

from transform_utils import generate_html_files_for_xml

# Global failure counter
FAILURE_COUNT = 0
FAILURE_LOGFILE = "failures.log"

# S3 Configuration
S3_BUCKET = "da-990-filings"


def log_failure(context: str, exc: Exception):
    """Log a failure with context and exception details, increment failure counter.

    This function maintains a global failure counter and logs failure details
    for debugging and monitoring purposes.

    Parameters
    ----------
    context : str
        Contextual information about where the failure occurred
    exc : Exception
        The exception that caused the failure

    Notes
    -----
    Currently logs are commented out but the failure counter is still incremented
    for monitoring purposes.
    """
    global FAILURE_COUNT
    FAILURE_COUNT += 1
    # if not os.path.exists(FAILURE_LOGFILE):
    #     with open(FAILURE_LOGFILE, "w", encoding="utf-8") as logf:
    #         logf.write(f"[{datetime.now().isoformat()}] {context}: {repr(exc)}\n")
    # with open(FAILURE_LOGFILE, "a", encoding="utf-8") as logf:
    #     logf.write(f"[{datetime.now().isoformat()}] {context}: {repr(exc)}\n")


YEARS = ["2018", "2019", "2020", "2021", "2022", "2023", "2024", "2025"]

CONCURRENT_UPLOAD_LIMIT = 400

# -----------------------------------------------------------------------------
# Helpers
# -----------------------------------------------------------------------------


def process_xml_to_html_files(xml_path: str, html_output_dir: str):
    """Worker helper to convert a single XML file to multiple HTML files.

    This function is designed to be called from a ProcessPool worker. It takes
    an IRS XML file and converts it to standalone HTML files for all forms
    contained in the XML.

    Parameters
    ----------
    xml_path : str
        Path to the XML file to process
    html_output_dir : str
        Directory where generated HTML files will be saved

    Returns
    -------
    dict or None
        Metadata about generated files on success, including:
        - generated_files: List of file information dictionaries
        - ein: Employer Identification Number
        - tax_year: Tax year of the filing
        - errors: List of any errors encountered
        Returns None on failure.

    Notes
    -----
    This function is designed to be called from a ProcessPool worker and handles
    exceptions gracefully, logging failures without crashing the worker process.
    """
    try:
        meta = generate_html_files_for_xml(
            xml_path=xml_path, output_dir=html_output_dir
        )

        if "error" in meta:
            return meta

        return meta
    except Exception as exc:
        tqdm.write(f"Error converting {xml_path} to HTML files: {exc}")
        log_failure(f"process_xml_to_html_files: {xml_path}", exc)
        return None


def extract_zip_libarchive(zip_path, out_dir):
    """Extract ZIP file using libarchive with fallback to zipfile and system unzip.

    Attempts to extract a ZIP file using multiple methods in order of preference:
    1. libarchive (fastest, handles various archive formats)
    2. zipfile (Python standard library)
    3. system unzip command (fallback)

    Parameters
    ----------
    zip_path : str
        Path to the ZIP file to extract
    out_dir : str
        Directory where files should be extracted

    Notes
    -----
    Creates the output directory if it doesn't exist. Handles various ZIP file
    formats and corruption gracefully by trying multiple extraction methods.
    """
    os.makedirs(out_dir, exist_ok=True)
    try:
        with libarchive.file_reader(zip_path) as entries:
            for entry in entries:
                if entry.isdir:
                    continue
                file_path = os.path.join(out_dir, entry.pathname)
                os.makedirs(os.path.dirname(file_path), exist_ok=True)
                with open(file_path, "wb") as f:
                    for block in entry.get_blocks():
                        f.write(block)
    except libarchive.exception.ArchiveError as _:
        try:
            with zipfile.ZipFile(zip_path, "r") as zip_ref:
                zip_ref.extractall(out_dir)
        except Exception as err:
            tqdm.write(f"Error extracting {zip_path} with zipfile: {err}")
            # Fallback to system unzip command
            try:
                result = subprocess.run(
                    ["unzip", "-q", zip_path, "-d", out_dir],
                    capture_output=True,
                    text=True,
                    check=False,
                )
                if result.returncode == 0:
                    tqdm.write(f"Successfully extracted {zip_path} using system unzip")
                else:
                    tqdm.write(f"System unzip failed for {zip_path}: {result.stderr}")
            except Exception as unzip_error:
                tqdm.write(
                    f"All extraction methods failed for {zip_path}: {unzip_error}"
                )


async def list_s3_files_by_year(year: str, bucket: str = S3_BUCKET):
    """List all zip files in S3 for a specific year.

    Parameters
    ----------
    year : str
        The year to list files for (e.g., "2023")
    bucket : str, optional
        S3 bucket name, defaults to S3_BUCKET constant

    Returns
    -------
    list[str]
        List of S3 keys for ZIP files in the specified year folder

    Notes
    -----
    Only returns files that end with '.zip' extension. Returns empty list
    if no files found or if an error occurs.
    """
    try:
        session = aioboto3.Session()
        async with session.client("s3") as s3_client:
            response = await s3_client.list_objects_v2(Bucket=bucket, Prefix=f"{year}/")

            if "Contents" in response:
                return [
                    obj["Key"]
                    for obj in response["Contents"]
                    if obj["Key"].endswith(".zip")
                ]
            return []
    except Exception as e:
        tqdm.write(f"Error listing S3 files for {year}: {e}")
        return []


async def download_from_s3(s3_key: str, local_path: str, bucket: str = S3_BUCKET):
    """Download a file from S3 to local filesystem.

    Parameters
    ----------
    s3_key : str
        S3 key (path) of the file to download
    local_path : str
        Local file path where the file should be saved
    bucket : str, optional
        S3 bucket name, defaults to S3_BUCKET constant

    Returns
    -------
    bool
        True if download was successful, False otherwise

    Notes
    -----
    Creates parent directories for local_path if they don't exist.
    Logs errors but doesn't raise exceptions.
    """
    try:
        session = aioboto3.Session()
        async with session.client("s3") as s3_client:
            await s3_client.download_file(bucket, s3_key, local_path)
        return True
    except Exception as e:
        tqdm.write(f"Error downloading {s3_key} from S3: {e}")
        return False


async def download_and_extract_s3_with_semaphore(
    s3_key: str, dest_dir: str, sem: asyncio.Semaphore, pbar
):
    """Download and extract a zip file from S3 with semaphore control.

    Downloads a ZIP file from S3, extracts it, and removes the ZIP file.
    Uses a semaphore to limit concurrent operations.

    Parameters
    ----------
    s3_key : str
        S3 key of the ZIP file to download
    dest_dir : str
        Local directory where files should be extracted
    sem : asyncio.Semaphore
        Semaphore to control concurrent operations
    pbar : tqdm.tqdm
        Progress bar to update

    Returns
    -------
    bool
        True if operation was successful, False otherwise

    Notes
    -----
    The ZIP file is automatically deleted after extraction to save disk space.
    Updates the progress bar regardless of success/failure.
    """
    async with sem:
        try:
            # Download from S3
            filename = os.path.basename(s3_key)
            local_path = os.path.join(dest_dir, filename)

            if await download_from_s3(s3_key, local_path):
                tqdm.write(f"Downloaded {filename} from S3")

                # Extract the zip file
                out_dir = local_path.replace(".zip", "")
                extract_zip_libarchive(local_path, out_dir)

                # Remove the zip file after extraction
                os.remove(local_path)
                pbar.update(1)
                return True
            else:
                tqdm.write(f"Failed to download {s3_key} from S3")
                pbar.update(1)
                return False
        except Exception as e:
            tqdm.write(f"Error processing {s3_key}: {e}")
            pbar.update(1)
            return False


async def async_upload_to_s3(
    file_path: str,
    s3_bucket: str,
    s3_key: str,
    s3: aioboto3.Session.client,
    sem: asyncio.Semaphore,
):
    """Upload a file to S3 with semaphore control.

    Uploads a file to S3 and then deletes the local file. Uses a semaphore
    to limit concurrent uploads. Only uploads files that don't contain "Schedule"
    in the key name.

    Parameters
    ----------
    file_path : str
        Local path to the file to upload
    s3_bucket : str
        S3 bucket name
    s3_key : str
        S3 key (path) where the file should be uploaded
    s3 : aioboto3.Session.client
        S3 client instance
    sem : asyncio.Semaphore
        Semaphore to control concurrent uploads

    Notes
    -----
    Only uploads files that don't contain "Schedule" in the S3 key name.
    Deletes the local file after successful upload to save disk space.
    Logs failures but doesn't raise exceptions.
    """
    if not "Schedule" in s3_key:
        return
    async with sem:
        try:
            if not os.path.exists(file_path):
                log_failure(
                    f"async_upload_to_s3: {file_path} to {s3_bucket}/{s3_key}",
                    Exception(f"File does not exist: {file_path}"),
                )
                return
            await s3.upload_file(file_path, s3_bucket, s3_key)
            os.remove(file_path)
        except botocore.exceptions.NoCredentialsError as e:
            tqdm.write(f"No credentials found for {s3_bucket}: {e}")
            log_failure(f"async_upload_to_s3: {file_path} to {s3_bucket}/{s3_key}", e)
            return
        except Exception as e:
            tqdm.write(f"Error uploading to S3: {e}")
            log_failure(f"async_upload_to_s3: {file_path} to {s3_bucket}/{s3_key}", e)
            return


def batched_file_generator(directory, batch_size):
    """Yield batches of XML files from a directory.

    Generator function that yields batches of XML files from a directory tree.
    Useful for processing large numbers of files without loading them all
    into memory at once.

    Parameters
    ----------
    directory : str
        Directory path to search for XML files
    batch_size : int
        Number of files to include in each batch

    Yields
    ------
    list[Path]
        Batch of Path objects pointing to XML files

    Notes
    -----
    Recursively searches for all .xml files in the directory tree.
    The last batch may be smaller than batch_size if there are fewer
    remaining files.
    """
    batch = []
    for file in Path(directory).rglob("*.xml"):
        batch.append(file)
        if len(batch) == batch_size:
            yield batch
            batch = []
    if batch:
        yield batch


async def download_handler(
    year: str,
    *,
    max_concurrent: int = 6,
    skip: bool = False,
    output_dir: str = "output",
    batch_size: int = 10000,
    skip_delete: bool = False,
):
    """Main handler for processing a single year of IRS e-file data.

    This function orchestrates the entire pipeline for a single year:
    1. Downloads ZIP files from S3 (unless skip=True)
    2. Extracts XML files from ZIP archives
    3. Converts XML files to standalone HTML files
    4. Uploads HTML files to S3
    5. Generates summary reports
    6. Cleans up temporary files (unless skip_delete=True)

    Parameters
    ----------
    year : str
        The year to process (e.g., "2023")
    max_concurrent : int, optional
        Maximum number of concurrent workers for processing, default 6
    skip : bool, optional
        Skip download and extraction steps, process only existing files, default False
    output_dir : str, optional
        Directory for output files and summaries, default "output"
    batch_size : int, optional
        Number of XML files to process in each batch, default 10000
    skip_delete : bool, optional
        Don't delete temporary files after processing, default False

    Notes
    -----
    Creates a background thread for S3 uploads to avoid blocking the main
    processing pipeline. Generates summary JSON files with metadata about
    processed files. Handles failures gracefully and maintains a global
    failure counter.

    The function processes files in batches to manage memory usage and
    provides progress bars for monitoring.
    """
    # --- Upload thread/event loop setup ---
    if not hasattr(download_handler, "upload_loop"):

        def start_background_loop(loop):
            asyncio.set_event_loop(loop)
            loop.run_forever()

        upload_loop = asyncio.new_event_loop()
        t = threading.Thread(
            target=start_background_loop, args=(upload_loop,), daemon=True
        )
        t.start()
        download_handler.upload_loop = upload_loop
    else:
        upload_loop = download_handler.upload_loop
    # --- End upload thread/event loop setup ---
    # Collects mapping EIN -> list[pdf_paths]
    start_time = time.monotonic()
    summary_map = defaultdict(list)
    dest_dir = f"/home/ec2-user/DonorAtlas/irs-efile-viewer/data/{year}/"
    os.makedirs(dest_dir, exist_ok=True)
    sem = asyncio.Semaphore(max_concurrent)
    session = aioboto3.Session()  # Create a single session for this handler
    if not skip:
        # List all zip files in S3 for this year
        s3_files = await list_s3_files_by_year(year)
        tqdm.write(f"Found {len(s3_files)} zip files in S3 for {year}")

        if s3_files:
            # Download and extract files concurrently
            with tqdm(
                total=len(s3_files), desc=f"Processing {year}", unit="file", leave=False
            ) as pbar:
                tasks = []
                for s3_key in s3_files:
                    tasks.append(
                        download_and_extract_s3_with_semaphore(
                            s3_key, dest_dir, sem, pbar
                        )
                    )
                await asyncio.gather(*tasks)
        else:
            tqdm.write(f"No zip files found in S3 for {year}")
    else:
        tqdm.write(f"Skipping download and unzip for {year}")

        # ------------------------------------------------------------------
    # Convert extracted XML files to standalone HTML files
    # ------------------------------------------------------------------
    forms_html_output_dir = os.path.join(output_dir, "forms_html")
    os.makedirs(forms_html_output_dir, exist_ok=True)

    xml_dir = dest_dir
    # Use batched_file_generator instead of flat list
    batches = list(batched_file_generator(xml_dir, batch_size))
    total_files = sum(len(batch) for batch in batches)

    if total_files:
        s3_bucket_name = os.environ.get("S3_BUCKET_NAME")
        worker_func = partial(
            process_xml_to_html_files,
            html_output_dir=forms_html_output_dir,
        )

        completed = 0
        progress_update_counter = 0
        PROGRESS_BATCH_SIZE = 1000
        sem = asyncio.Semaphore(CONCURRENT_UPLOAD_LIMIT)
        batch_upload_futures = []  # Store concurrent.futures.Future objects
        async with session.client("s3") as s3:
            with ProcessPool(max_workers=max_concurrent) as pool:
                with tqdm(
                    total=total_files, desc="XML→HTML", unit="file", leave=False
                ) as pbar:
                    for batch in batches:
                        html_results = []

                        # Schedule HTML files generation jobs
                        html_futures = [
                            pool.schedule(
                                worker_func, args=(str(xml_file),), timeout=300
                            )
                            for xml_file in batch
                        ]

                        # Process HTML results
                        for future in concurrent.futures.as_completed(html_futures):
                            try:
                                res = future.result()
                                if res and "error" not in res:
                                    html_results.append(res)
                                else:
                                    log_failure(
                                        f"ProcessPool XML→HTML Forms: {year}", res
                                    )
                            except PebbleTimeoutError as exc:
                                tqdm.write(
                                    "An HTML forms transformation timed out after 5 minutes and was killed."
                                )
                                log_failure(f"ProcessPool XML→HTML Forms: {year}", exc)
                            except Exception as exc:
                                log_failure(f"ProcessPool XML→HTML Forms: {year}", exc)
                            completed += 1
                            progress_update_counter += 1

                            # Update progress bar in batches of 1000
                            if progress_update_counter >= PROGRESS_BATCH_SIZE:
                                pbar.update(progress_update_counter)
                                progress_update_counter = 0

                        # Per-batch S3 upload and deletion (run concurrently)
                        if s3_bucket_name and html_results:
                            upload_tasks = []

                            # Count form HTML files from HTML generation
                            num_form_files = 0
                            for html_result in html_results:
                                if html_result and "generated_files" in html_result:
                                    for file_info in html_result["generated_files"]:
                                        if os.path.exists(file_info["path"]):
                                            num_form_files += 1

                            total_files_to_upload = num_form_files

                            async def upload_and_cleanup():
                                tqdm.write(
                                    f"STARTED: upload/cleanup for batch with {total_files_to_upload} HTML files"
                                )
                                tqdm.write(
                                    "NOTE: All forms are converted to standalone HTML and uploaded to S3, but only main forms are tracked in summary"
                                )

                                # Upload form HTML files from HTML generation
                                for html_result in html_results:
                                    if html_result and "generated_files" in html_result:
                                        for file_info in html_result["generated_files"]:
                                            if os.path.exists(file_info["path"]):
                                                s3_key = file_info["filename"]
                                                upload_tasks.append(
                                                    asyncio.create_task(
                                                        async_upload_to_s3(
                                                            file_info["path"],
                                                            s3_bucket_name,
                                                            s3_key,
                                                            s3,
                                                            sem,
                                                        )
                                                    )
                                                )

                                if upload_tasks:
                                    with tqdm(
                                        total=len(upload_tasks),
                                        desc="HTML→S3 (batch)",
                                        unit="file",
                                        leave=False,
                                    ) as upload_pbar:
                                        for coro in asyncio.as_completed(upload_tasks):
                                            await coro
                                            upload_pbar.update(1)

                            # Schedule the upload_and_cleanup coroutine as a background task in the upload thread
                            fut = asyncio.run_coroutine_threadsafe(
                                upload_and_cleanup(), upload_loop
                            )
                            batch_upload_futures.append(fut)
                            tqdm.write(
                                f"Scheduled upload and cleanup for {total_files_to_upload} files (batch)."
                            )

                        # Update summary_map for HTML form files (exclude schedules)
                        if html_results:
                            for html_result in html_results:
                                if html_result and "generated_files" in html_result:
                                    ein = html_result.get("ein", "UNKNOWN")
                                    tax_year = html_result.get("tax_year", "UNKNOWN")
                                    for file_info in html_result["generated_files"]:
                                        # Only include main forms in summary, not schedules
                                        if (
                                            s3_bucket_name
                                            and "Schedule" not in file_info["form_id"]
                                        ):
                                            s3_uri = f"s3://{s3_bucket_name}/{file_info['filename']}"
                                            summary_map[ein].append(
                                                {
                                                    "form_type": file_info["form_id"],
                                                    "s3_uri": s3_uri,
                                                    "tax_year": tax_year,
                                                    "file_type": "standalone_html",
                                                }
                                            )
                # Await all outstanding upload/cleanup tasks after all batches
                if batch_upload_futures:
                    tqdm.write("Waiting for all upload/cleanup tasks to finish...")
                    futures_wait(batch_upload_futures)

                # Final progress update for any remaining files
                if progress_update_counter > 0:
                    pbar.update(progress_update_counter)

        tqdm.write("Completed Process Pool (XML→HTML)")

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
        tqdm.write(f"Failures so far: {FAILURE_COUNT}")

    else:
        tqdm.write("No XML files found for transformation.")

    tqdm.write("Completed XML→HTML→S3")

    # Optionally, run process_board after all unzips for the year
    # run_process_board_on_year(year, dest_dir)
    if not skip_delete:
        shutil.rmtree(dest_dir, ignore_errors=True)
    else:
        tqdm.write(f"Skipping deletion of {dest_dir} due to --skip-delete flag.")


async def main(
    *,
    skip: bool = False,
    output_dir: str = "output",
    max_workers: int = 6,
    skip_delete: bool = False,
):
    """Main entry point for the IRS e-file processing pipeline.

    Processes IRS e-file data for multiple years, downloading ZIP files from S3,
    extracting XML files, converting them to standalone HTML, and uploading
    the results back to S3.

    Parameters
    ----------
    skip : bool, optional
        Skip download and extraction steps, process only existing files, default False
    output_dir : str, optional
        Directory for output files and summaries, default "output"
    max_workers : int, optional
        Maximum number of concurrent workers for processing, default 6
    skip_delete : bool, optional
        Don't delete temporary files after processing, default False

    Notes
    -----
    Processes the last 3 years from the YEARS list by default. Each year is
    processed sequentially to avoid overwhelming system resources. Progress
    is displayed with progress bars and timing information.

    The function handles keyboard interrupts gracefully and performs garbage
    collection on exit.
    """
    BATCH_SIZE = 50000  # Set your desired batch size here

    for year in YEARS[-3:]:
        tqdm.write(f"Starting {year}")
        await download_handler(
            year,
            max_concurrent=max_workers,
            skip=skip,
            output_dir=output_dir,
            batch_size=BATCH_SIZE,
            skip_delete=skip_delete,
        )
        columns, _ = shutil.get_terminal_size(fallback=(100, 24))
        tqdm.write(f"Finished {year}\n{'=' * columns}\n")
        tqdm.write(f"Total failures: {FAILURE_COUNT}")


def parse_args():
    """Parse command line arguments for the IRS e-file processing pipeline.

    Returns
    -------
    argparse.Namespace
        Parsed command line arguments with the following attributes:
        - skip: bool - Skip download and extraction steps
        - max_workers: int - Maximum parallel workers
        - skip_delete: bool - Don't delete temporary files

    Notes
    -----
    Sets up argument parser with help text for each option. All arguments
    are optional with sensible defaults.
    """
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--skip",
        action="store_true",
        help="Skip both download and unzip steps (process only)",
    )
    parser.add_argument(
        "--max-workers",
        type=int,
        default=6,
        help="Maximum parallel workers for unzip and PDF transform",
    )
    parser.add_argument(
        "--skip-delete",
        action="store_true",
        help="Do not delete the data XML files after processing",
    )

    return parser.parse_args()


if __name__ == "__main__":
    OUTPUT_DIR = "/home/ec2-user/DonorAtlas/irs-efile-viewer/output"
    if os.path.exists(FAILURE_LOGFILE):
        os.remove(FAILURE_LOGFILE)
    try:
        args = parse_args()
        asyncio.run(
            main(
                skip=args.skip,
                output_dir=OUTPUT_DIR,
                max_workers=args.max_workers,
                skip_delete=args.skip_delete,
            )
        )
    except KeyboardInterrupt:
        gc.collect()
        tqdm.write("Keyboard interrupt")
        sys.exit(1)
