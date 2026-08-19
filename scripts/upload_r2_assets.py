#!/usr/bin/env python3
"""Upload public candidate assets to Cloudflare R2 with AWS Signature V4.

The script reads credentials from the root .env but never prints them.
Examples:
    python scripts/upload_r2_assets.py --init-prefixes
"""

import argparse
import datetime as dt
import hashlib
import hmac
import os
from pathlib import Path
from urllib.error import HTTPError, URLError
from urllib.parse import quote, urlsplit
from urllib.request import Request, urlopen


ROOT = Path(__file__).resolve().parents[1]
CANDIDATES = ROOT / "data" / "candidates_classified.csv"
ASSET_PREFIX = "candidates"


def dotenv_value(name):
    environment_value = os.environ.get(name)
    if environment_value:
        return environment_value
    for raw in (ROOT / ".env").read_text(encoding="utf-8").splitlines():
        line = raw.strip()
        if not line or line.startswith("#") or "=" not in line:
            continue
        key, value = line.split("=", 1)
        if key.strip().removeprefix("export ").strip() == name:
            value = value.strip()
            return value[1:-1] if len(value) >= 2 and value[:1] in {"'", '"'} and value[-1:] == value[:1] else value
    raise SystemExit(f"{name} is missing from .env")


def sign(key, value):
    return hmac.new(key, value.encode("utf-8"), hashlib.sha256).digest()


def signed_request(method, object_key, body=b"", content_type="application/octet-stream", query=None):
    """Sign an R2 request. `query` is an optional dict for operations such as
    ListObjectsV2, whose parameters must take part in the SigV4 signature."""
    endpoint = dotenv_value("CLOUDFLARE_R2_ENDPOINT").rstrip("/")
    bucket = dotenv_value("CLOUDFLARE_R2_BUCKET")
    access_key = dotenv_value("CLOUDFLARE_R2_ACCESS_KEY_ID")
    secret_key = dotenv_value("CLOUDFLARE_R2_SECRET_ACCESS_KEY")
    parsed = urlsplit(endpoint)
    host = parsed.netloc
    base_path = parsed.path.rstrip("/")
    canonical_uri = quote(f"{base_path}/{bucket}/{object_key}", safe="/-_.~")
    canonical_query = "&".join(
        f"{quote(key, safe='-_.~')}={quote(str(value), safe='-_.~')}"
        for key, value in sorted((query or {}).items())
    )
    url = f"{parsed.scheme}://{host}{canonical_uri}" + (f"?{canonical_query}" if canonical_query else "")
    now = dt.datetime.now(dt.timezone.utc)
    amz_date = now.strftime("%Y%m%dT%H%M%SZ")
    date_stamp = now.strftime("%Y%m%d")
    payload_hash = hashlib.sha256(body).hexdigest()
    canonical_headers = (
        f"host:{host}\n"
        f"x-amz-content-sha256:{payload_hash}\n"
        f"x-amz-date:{amz_date}\n"
    )
    signed_headers = "host;x-amz-content-sha256;x-amz-date"
    canonical_request = "\n".join((method, canonical_uri, canonical_query, canonical_headers, signed_headers, payload_hash))
    scope = f"{date_stamp}/auto/s3/aws4_request"
    string_to_sign = "\n".join((
        "AWS4-HMAC-SHA256", amz_date, scope,
        hashlib.sha256(canonical_request.encode("utf-8")).hexdigest(),
    ))
    k_date = sign(("AWS4" + secret_key).encode("utf-8"), date_stamp)
    k_region = sign(k_date, "auto")
    k_service = sign(k_region, "s3")
    k_signing = sign(k_service, "aws4_request")
    signature = hmac.new(k_signing, string_to_sign.encode("utf-8"), hashlib.sha256).hexdigest()
    authorization = (
        f"AWS4-HMAC-SHA256 Credential={access_key}/{scope}, "
        f"SignedHeaders={signed_headers}, Signature={signature}"
    )
    headers = {
        "Host": host,
        "Content-Type": content_type,
        "x-amz-content-sha256": payload_hash,
        "x-amz-date": amz_date,
        "Authorization": authorization,
    }
    return Request(url, data=body if method in {"PUT", "POST"} else None, method=method, headers=headers)


def put_object(object_key, body=b"", content_type="application/octet-stream"):
    try:
        with urlopen(signed_request("PUT", object_key, body, content_type), timeout=30) as response:
            if response.status not in {200, 201}:
                raise RuntimeError(f"unexpected R2 status {response.status}")
    except HTTPError as error:
        raise RuntimeError(f"R2 upload failed ({error.code}): {error.reason}") from error
    except URLError as error:
        raise RuntimeError(f"R2 connection failed: {error.reason}") from error


def get_object(object_key, timeout=180):
    try:
        with urlopen(signed_request("GET", object_key), timeout=timeout) as response:
            return response.read()
    except HTTPError as error:
        raise RuntimeError(f"R2 download failed ({error.code}): {error.reason}") from error
    except URLError as error:
        raise RuntimeError(f"R2 connection failed: {error.reason}") from error


def list_objects(prefix=""):
    """Yield (key, size) for every object under `prefix`, following pagination."""
    import xml.etree.ElementTree as ElementTree

    namespace = "{http://s3.amazonaws.com/doc/2006-03-01/}"
    token = None
    while True:
        query = {"list-type": "2", "prefix": prefix, "max-keys": "1000"}
        if token:
            query["continuation-token"] = token
        try:
            with urlopen(signed_request("GET", "", query=query), timeout=60) as response:
                document = ElementTree.fromstring(response.read())
        except HTTPError as error:
            raise RuntimeError(f"R2 list failed ({error.code}): {error.reason}") from error
        except URLError as error:
            raise RuntimeError(f"R2 connection failed: {error.reason}") from error
        for item in document.findall(f"{namespace}Contents"):
            yield item.findtext(f"{namespace}Key"), int(item.findtext(f"{namespace}Size"))
        if document.findtext(f"{namespace}IsTruncated") != "true":
            return
        token = document.findtext(f"{namespace}NextContinuationToken")


def delete_object(object_key):
    try:
        with urlopen(signed_request("DELETE", object_key), timeout=30) as response:
            if response.status not in {200, 204}:
                raise RuntimeError(f"unexpected R2 status {response.status}")
    except HTTPError as error:
        raise RuntimeError(f"R2 delete failed ({error.code}): {error.reason}") from error
    except URLError as error:
        raise RuntimeError(f"R2 connection failed: {error.reason}") from error


def init_prefixes():
    import csv
    with CANDIDATES.open(encoding="utf-8", newline="") as source:
        parties = sorted({row["party_id"] for row in csv.DictReader(source)})
    for party in parties:
        key = f"{ASSET_PREFIX}/{party}/.keep"
        put_object(key)
        print(f"created {key}")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--init-prefixes", action="store_true")
    args = parser.parse_args()
    if not args.init_prefixes:
        parser.error("select an operation, e.g. --init-prefixes")
    init_prefixes()


if __name__ == "__main__":
    main()
