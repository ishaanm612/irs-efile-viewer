from collections import defaultdict
import os
import asyncio
import aioboto3
import json
from tqdm import tqdm
from pathlib import Path

HTML_DIR = "output/html"  # Change as needed
S3_BUCKET = os.environ.get("S3_BUCKET_NAME", "da-990-returns")
SUMMARY_JSON = "output/2022_summary.json"
CONCURRENT_UPLOADS = 256  # Tune as needed


async def async_upload_to_s3(file_path, s3_bucket, s3_key, s3, sem, pbar):
    async with sem:
        try:
            await s3.upload_file(file_path, s3_bucket, s3_key)
            s3_uri = f"s3://{s3_bucket}/{s3_key}"
        except Exception as e:
            tqdm.write(f"Failed to upload {file_path}: {e}")
            s3_uri = None
        pbar.update(1)
        return file_path, s3_key, s3_uri


async def main():
    html_files = [str(p) for p in Path(HTML_DIR).rglob("*.html")]
    if not html_files:
        print("No HTML files found.")
        return

    session = aioboto3.Session()
    async with session.client("s3") as s3:
        file_map = defaultdict(list)
        sem = asyncio.Semaphore(CONCURRENT_UPLOADS)

        with tqdm(total=len(html_files), desc="HTML→S3", unit="file") as pbar:
            upload_coros = [
                async_upload_to_s3(
                    file_path, S3_BUCKET, os.path.basename(file_path), s3, sem, pbar
                )
                for file_path in html_files
            ]
            results = await asyncio.gather(*upload_coros)
    tqdm.write(f"Uploaded {len(results)} files to S3. Starting summary processing.")

    for file_path, s3_key, s3_uri in tqdm(
        results, desc="Processing upload results", unit="file"
    ):
        if s3_uri:
            name = s3_key.split(".")[0]
            ein, tax_year, form_type = name.split("_")
            file_map[ein].append(
                {
                    "s3_uri": s3_uri,
                    "tax_year": tax_year,
                    "form_type": form_type,
                }
            )

    with open(SUMMARY_JSON, "w", encoding="utf-8") as f:
        json.dump(file_map, f, indent=2)
    print(f"Summary written to {SUMMARY_JSON}")


if __name__ == "__main__":
    asyncio.run(main())
