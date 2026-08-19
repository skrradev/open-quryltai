#!/usr/bin/env python3
"""Promote Parliament portraits to primary candidate photos only when none existed."""

import csv
import time
from pathlib import Path
from urllib.error import HTTPError
from urllib.request import Request, urlopen

from upload_r2_assets import ASSET_PREFIX, put_object, signed_request

ROOT = Path(__file__).resolve().parents[1]
WORK = ROOT / "data" / "work"
PARLIAMENT = WORK / "parliament_incumbent_profiles.tsv"
PRIOR_DATASETS = [
    WORK / "verified_candidate_biographies.tsv",
    WORK / "baitaq_candidate_profiles.tsv",
    WORK / "respublica_candidate_profiles.tsv",
    WORK / "auyl_candidate_profiles.tsv",
    WORK / "ak_zhol_candidate_profiles.tsv",
]
OUTPUT = WORK / "parliament_primary_photo_promotions.tsv"
USER_AGENT = "OpenQuryltai/0.1 (official Parliament primary photo promotion)"


def existing_photo_keys():
    keys = set()
    for path in PRIOR_DATASETS:
        with path.open(encoding="utf-8", newline="") as source:
            for row in csv.DictReader(source, delimiter="\t"):
                if row.get("r2_key") and row.get("public_photo_url"):
                    keys.add((row["party_id"], row["list_order"]))
    return keys


def r2_exists(key):
    try:
        with urlopen(signed_request("HEAD", key), timeout=30) as response:
            return response.status == 200
    except HTTPError as error:
        if error.code == 404:
            return False
        raise


def download(url):
    with urlopen(Request(url, headers={"User-Agent": USER_AGENT}), timeout=60) as response:
        return response.read(), response.headers.get_content_type()


def main():
    with PARLIAMENT.open(encoding="utf-8", newline="") as source:
        rows = list(csv.DictReader(source, delimiter="\t"))
    fields = list(rows[0])
    for field in ("primary_photo_status", "primary_r2_key", "primary_public_photo_url"):
        if field not in fields:
            fields.append(field)
    known_photo = existing_photo_keys()
    promoted = []
    for row in rows:
        identity = (row["party_id"], row["list_order"])
        if identity in known_photo:
            row.update({"primary_photo_status": "SKIPPED_EXISTING_PHOTO", "primary_r2_key": "", "primary_public_photo_url": ""})
            continue
        key = f"{ASSET_PREFIX}/{row['party_id']}/{row['list_order']}.jpg"
        if r2_exists(key):
            row.update({"primary_photo_status": "SKIPPED_R2_OBJECT_EXISTS", "primary_r2_key": "", "primary_public_photo_url": ""})
            continue
        image, content_type = download(row["avatar_source_url"])
        if content_type != "image/jpeg":
            row.update({"primary_photo_status": f"SKIPPED_UNSUPPORTED_TYPE:{content_type}", "primary_r2_key": "", "primary_public_photo_url": ""})
            continue
        put_object(key, image, content_type)
        public_url = f"https://assets.open-quryltai.org/{key}"
        row.update({"primary_photo_status": "PROMOTED", "primary_r2_key": key, "primary_public_photo_url": public_url})
        promoted.append({
            "party_id": row["party_id"], "list_order": row["list_order"], "candidate_name": row["candidate_name"],
            "primary_r2_key": key, "primary_public_photo_url": public_url,
            "avatar_source_url": row["avatar_source_url"], "official_source_url": row["official_source_url"],
            "asset_rights_note": row["asset_rights_note"], "promoted_at": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()),
        })
        time.sleep(1)
    with PARLIAMENT.open("w", encoding="utf-8", newline="") as target:
        writer = csv.DictWriter(target, fieldnames=fields, delimiter="\t")
        writer.writeheader(); writer.writerows(rows)
    output_fields = ["party_id", "list_order", "candidate_name", "primary_r2_key", "primary_public_photo_url", "avatar_source_url", "official_source_url", "asset_rights_note", "promoted_at"]
    with OUTPUT.open("w", encoding="utf-8", newline="") as target:
        writer = csv.DictWriter(target, fieldnames=output_fields, delimiter="\t")
        writer.writeheader(); writer.writerows(promoted)
    print(f"Promoted {len(promoted)} Parliament portraits -> {OUTPUT}")


if __name__ == "__main__":
    main()
