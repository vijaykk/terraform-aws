import json
import urllib.parse
import boto3
import logging

log = logging.getLogger()
log.setLevel(logging.INFO)
s3 = boto3.client('s3')

def handler(event, context):
    detail = event.get("detail", {})
    bucket = (detail.get("bucket") or {}).get("name")
    key = (detail.get("object") or {}).get("key")

    if key:
        key = urllib.parse.unquote_plus(key)

    size = (detail.get("object") or {}).get("size")

    if size is None and bucket and key:
        try:
            head = s3.head_object(Bucket=bucket, Key=key)
            size = head.get("ContentLength")
        except Exception as ex:
            log.error(f"HEAD failed for s3://{bucket}/{key}: {ex}")

    log.info(json.dumps({
        "source": "eventbridge.s3",
        "bucket": bucket,
        "key": key,
        "size": size
    }))
    return {"ok": True}
