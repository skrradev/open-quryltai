#!/usr/bin/env python3
"""Collect source biographies and reusable Wikipedia photos for verified candidates.

Only photos with a free Creative Commons or public-domain license are uploaded.
Attribution metadata is retained in the output file for display with each asset.
"""

import argparse
import csv
import html
import json
import re
import time
from pathlib import Path
from urllib.error import HTTPError
from urllib.parse import urlencode
from urllib.request import Request, urlopen

from upload_r2_assets import ASSET_PREFIX, put_object


ROOT = Path(__file__).resolve().parents[1]
INPUT = ROOT / "data" / "work" / "wikipedia_profile_verification.tsv"
OUTPUT = ROOT / "data" / "work" / "verified_candidate_biographies.tsv"
USER_AGENT = "OpenQuryltai/0.1 (candidate biography collection)"
FIELDS = (
    "party_id", "list_order", "candidate_name", "birth_year", "wiki_language",
    "wikipedia_url", "wikidata_id", "source_extract", "photo_status", "photo_source_url",
    "photo_license", "photo_author", "r2_key", "public_photo_url", "collected_at",
)


def api_get(language, params):
    request = Request(
        f"https://{language}.wikipedia.org/w/api.php?{urlencode({**params, 'format': 'json', 'formatversion': 2})}",
        headers={"User-Agent": USER_AGENT, "Accept": "application/json"},
    )
    for attempt in range(6):
        try:
            with urlopen(request, timeout=30) as response:
                return json.load(response)
        except HTTPError as error:
            if error.code != 429 or attempt == 5:
                raise
            retry_after = error.headers.get("Retry-After")
            wait = float(retry_after) if retry_after else 2 ** (attempt + 1)
            print(f"MediaWiki rate limited; retrying in {wait:.0f}s")
            time.sleep(wait)


def first_page(payload):
    pages = payload.get("query", {}).get("pages", [])
    return pages[0] if len(pages) == 1 and not pages[0].get("missing") else None


def free_license(value):
    normalized = value.casefold()
    return "creative commons" in normalized or normalized.startswith("cc ") or "public domain" in normalized or normalized.startswith("pd")


def plain_text(value):
    return re.sub(r"\s+", " ", html.unescape(re.sub(r"<[^>]+>", "", value))).strip()


def fetch_photo(language, page_id):
    page = first_page(api_get(language, {
        "action": "query", "pageids": page_id, "prop": "pageimages", "piprop": "name",
    }))
    if not page or not page.get("pageimage"):
        return None
    # pageimages returns a bare filename (for example, "Person.jpg"), while
    # imageinfo requires the File namespace.
    title = page["pageimage"]
    if not title.casefold().startswith(("file:", "файл:")):
        title = f"File:{title}"
    # A Commons image can be marked missing in the local wiki while still
    # carrying imageinfo from its shared repository, so do not use first_page
    # (which intentionally drops missing local pages) for this request.
    info_payload = api_get(language, {
        "action": "query", "titles": title, "prop": "imageinfo",
        "iiprop": "url|extmetadata", "iiurlwidth": 1200,
    })
    info_pages = (info_payload.get("query") or {}).get("pages", [])
    info_page = info_pages[0] if len(info_pages) == 1 else None
    info = info_page.get("imageinfo", []) if info_page else []
    if not info:
        return None
    image = info[0]
    metadata = image.get("extmetadata", {})
    license_name = plain_text(metadata.get("LicenseShortName", {}).get("value", ""))
    author = plain_text(metadata.get("Artist", {}).get("value", ""))
    return {
        "url": image.get("thumburl") or image.get("url"),
        "license": license_name,
        "author": author,
    }


def download(url):
    request = Request(url, headers={"User-Agent": USER_AGENT})
    for attempt in range(6):
        try:
            with urlopen(request, timeout=60) as response:
                content_type = response.headers.get_content_type()
                return response.read(), content_type
        except HTTPError as error:
            if error.code != 429 or attempt == 5:
                raise
            retry_after = error.headers.get("Retry-After")
            wait = float(retry_after) if retry_after else 2 ** (attempt + 1)
            print(f"Wikimedia image rate limited; retrying in {wait:.0f}s")
            time.sleep(wait)
    raise RuntimeError("Wikimedia image download retries exhausted")


def extension(content_type):
    return {"image/jpeg": "jpg", "image/png": "png", "image/webp": "webp"}.get(content_type)


def load_completed():
    if not OUTPUT.exists():
        return set(), []
    with OUTPUT.open(encoding="utf-8", newline="") as source:
        rows = list(csv.DictReader(source, delimiter="\t"))
    return {(row["party_id"], row["list_order"]) for row in rows}, rows


def write_rows(rows):
    temporary = OUTPUT.with_suffix(".tmp")
    with temporary.open("w", encoding="utf-8", newline="") as target:
        writer = csv.DictWriter(target, fieldnames=FIELDS, delimiter="\t")
        writer.writeheader()
        writer.writerows(rows)
    temporary.replace(OUTPUT)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--limit", type=int)
    parser.add_argument("--resume", action="store_true")
    parser.add_argument("--upload-photos", action="store_true")
    parser.add_argument("--delay", type=float, default=0.25)
    args = parser.parse_args()

    with INPUT.open(encoding="utf-8", newline="") as source:
        candidates = [row for row in csv.DictReader(source, delimiter="\t") if row["verification_status"] == "VERIFIED"]
    candidates.sort(key=lambda row: (row["party_id"], int(row["list_order"])))
    if args.limit is not None:
        candidates = candidates[:args.limit]
    completed, rows = load_completed() if args.resume else (set(), [])
    processed = 0

    for candidate in candidates:
        key = (candidate["party_id"], candidate["list_order"])
        if key in completed:
            continue
        collected_at = time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime())
        photo = fetch_photo(candidate["wiki_language"], candidate["page_id"])
        output = {
            "party_id": candidate["party_id"], "list_order": candidate["list_order"],
            "candidate_name": candidate["candidate_name"], "birth_year": candidate["birth_year"],
            "wiki_language": candidate["wiki_language"], "wikipedia_url": candidate["page_url"],
            "wikidata_id": candidate["wikidata_id"], "source_extract": candidate["current_extract"],
            "photo_status": "NO_PHOTO", "photo_source_url": "", "photo_license": "",
            "photo_author": "", "r2_key": "", "public_photo_url": "", "collected_at": collected_at,
        }
        if photo:
            output.update({
                "photo_source_url": photo["url"], "photo_license": photo["license"],
                "photo_author": photo["author"],
            })
            if not free_license(photo["license"]):
                output["photo_status"] = "SKIPPED_NONFREE_LICENSE"
            elif not args.upload_photos:
                output["photo_status"] = "FREE_LICENSE_NOT_UPLOADED"
            else:
                image, content_type = download(photo["url"])
                suffix = extension(content_type)
                if not suffix:
                    output["photo_status"] = f"SKIPPED_UNSUPPORTED_TYPE:{content_type}"
                else:
                    r2_key = f"{ASSET_PREFIX}/{candidate['party_id']}/{candidate['list_order']}.{suffix}"
                    put_object(r2_key, image, content_type)
                    output.update({
                        "photo_status": "UPLOADED", "r2_key": r2_key,
                        "public_photo_url": f"https://assets.open-quryltai.org/{r2_key}",
                    })

        rows.append(output)
        completed.add(key)
        processed += 1
        write_rows(rows)
        print(f"{candidate['candidate_name']}: {output['photo_status']}")
        time.sleep(args.delay)

    print(f"Wrote {len(rows)} verified biography rows from {processed} candidates -> {OUTPUT}")


if __name__ == "__main__":
    main()
