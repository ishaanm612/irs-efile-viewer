import argparse
import boto3
from tqdm import tqdm


def clear_bucket(bucket_name, prefix=None):
    s3 = boto3.resource("s3")
    bucket = s3.Bucket(bucket_name)
    if prefix:
        objects = bucket.objects.filter(Prefix=prefix)
    else:
        objects = bucket.objects.all()
    to_delete = [{"Key": obj.key} for obj in objects]
    if not to_delete:
        print("Bucket is already empty.")
        return
    # S3 delete_objects can only delete up to 1000 objects at a time
    for i in tqdm(range(0, len(to_delete), 1000), desc="Deleting objects"):
        chunk = to_delete[i : i + 1000]
        bucket.delete_objects(Delete={"Objects": chunk})


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Clear all objects from an S3 bucket.")
    parser.add_argument("bucket", help="Name of the S3 bucket to clear")
    parser.add_argument(
        "--prefix", help="Only clear objects with this prefix", default=None
    )
    args = parser.parse_args()
    clear_bucket(args.bucket, args.prefix)
