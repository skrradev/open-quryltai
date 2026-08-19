#!/usr/bin/env python3
"""Collect Respublica's public API bios and mirror official candidate portraits.

The Respublica API is an official party source. Only profiles confidently matched
to a candidate in data/candidates_classified.csv are exported/uploaded.
"""

import argparse
import csv
import difflib
import json
import re
import time
from pathlib import Path
from urllib.request import Request, urlopen

from upload_r2_assets import ASSET_PREFIX, put_object

ROOT = Path(__file__).resolve().parents[1]
CANDIDATES = ROOT / "data" / "candidates_classified.csv"
OUTPUT = ROOT / "data" / "work" / "respublica_candidate_profiles.tsv"
REVIEW_OUTPUT = ROOT / "data" / "work" / "respublica_official_profiles_review.tsv"
API = "https://api.respublica-partiyasy.kz/api/v1"
SITE = "https://respublica-partiyasy.kz"
USER_AGENT = "OpenQuryltai/0.1 (official Respublica profile collection)"
FIELDS = (
    "party_id", "list_order", "candidate_name", "official_name_ru", "official_name_kk",
    "source_type", "official_source_url", "role_ru", "role_kk", "biography_ru",
    "biography_kk", "photo_source_url", "facebook_url", "instagram_url", "match_score",
    "match_margin", "match_status", "photo_status", "r2_key", "public_photo_url",
    "asset_rights_note", "collected_at",
)
TRANSLITERATION = str.maketrans({
    "а": "a", "ә": "a", "б": "b", "в": "v", "г": "g", "ғ": "g", "д": "d",
    "е": "e", "ё": "e", "ж": "zh", "з": "z", "и": "i", "й": "i", "і": "i",
    "к": "k", "қ": "k", "л": "l", "м": "m", "н": "n", "ң": "n", "о": "o",
    "ө": "o", "п": "p", "р": "r", "с": "s", "т": "t", "у": "u", "ұ": "u",
    "ү": "u", "ф": "f", "х": "h", "һ": "h", "ц": "ts", "ч": "ch", "ш": "sh",
    "щ": "sh", "ъ": "", "ы": "y", "ь": "", "э": "e", "ю": "yu", "я": "ya",
})


def request_json(url):
    request = Request(url, headers={"User-Agent": USER_AGENT})
    with urlopen(request, timeout=30) as response:
        return json.load(response)


def download(url):
    request = Request(url, headers={"User-Agent": USER_AGENT})
    with urlopen(request, timeout=60) as response:
        return response.read(), response.headers.get_content_type()


def tokens(value):
    return re.findall(r"[a-z]+", value.casefold().translate(TRANSLITERATION))


def similarity(left, right):
    return difflib.SequenceMatcher(a=left, b=right).ratio()


def candidate_score(name, candidate):
    source = tokens(name)
    target = tokens(f"{candidate['surname']} {candidate['given_names']}")
    if len(source) < 2 or len(target) < 2:
        return 0.0
    # Official fraction names often contain just surname + given name, while
    # candidate data contains a patronymic. Compare all name components safely.
    parts = [similarity(source[0], target[0]), similarity(source[1], target[1])]
    if len(source) > 2 and len(target) > 2:
        parts.append(similarity(source[2], target[2]))
    return (0.60 * parts[0]) + (0.30 * parts[1]) + (0.10 * (parts[2] if len(parts) > 2 else 1.0))


def best_match(name, candidates):
    ranked = sorted(((candidate_score(name, candidate), candidate) for candidate in candidates), reverse=True, key=lambda item: item[0])
    score, candidate = ranked[0]
    runner_up = ranked[1][0] if len(ranked) > 1 else 0.0
    margin = score - runner_up
    status = "MATCHED" if score >= 0.84 and margin >= 0.04 else "NEEDS_REVIEW"
    return candidate, score, margin, status


def absolute(path, base):
    return path if path.startswith("http") else f"{base}{path}"


def clean_html(value):
    return re.sub(r"\s+", " ", re.sub(r"<br\s*/?>", "\n", value or "", flags=re.I)).strip()


def extension(content_type):
    return {"image/jpeg": "jpg", "image/png": "png", "image/webp": "webp"}.get(content_type)


def profiles():
    leadership = request_json(f"{API}/party-leadership")["data"]
    for item in leadership:
        yield {
            "source_type": "PARTY_LEADERSHIP", "source_url": f"{API}/party-leadership/{item['id']}",
            "name_ru": item["full_name_ru"], "name_kk": item["full_name_kz"],
            "role_ru": item.get("post_ru", ""), "role_kk": item.get("post_kz", ""),
            "bio_ru": clean_html(item.get("biography_ru", "")), "bio_kk": clean_html(item.get("biography_kz", "")),
            "photo": absolute(item["image_path"], "https://api.respublica-partiyasy.kz") if item.get("image_path") else "",
            "facebook": "", "instagram": "",
        }
    for item in request_json(f"{API}/deputies"):
        if item.get("archived"):
            continue
        yield {
            "source_type": "PARTY_FRACTION", "source_url": f"{API}/deputies",
            "name_ru": item["full_name_ru"], "name_kk": item["full_name_kz"],
            "role_ru": clean_html(item.get("bio_ru", "")), "role_kk": clean_html(item.get("bio_kz", "")),
            "bio_ru": "", "bio_kk": "",
            "photo": absolute(item.get("img_large") or item.get("img_small", ""), SITE) if (item.get("img_large") or item.get("img_small")) else "",
            "facebook": item.get("facebook_url", ""), "instagram": item.get("instagram_url", ""),
        }


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--upload-photos", action="store_true")
    parser.add_argument("--delay", type=float, default=1.0)
    args = parser.parse_args()
    with CANDIDATES.open(encoding="utf-8", newline="") as source:
        candidates = [row for row in csv.DictReader(source) if row["party_id"] == "respublica"]

    # Leadership profiles take precedence over the shorter fraction entries.
    rows_by_order = {}
    review_rows = []
    for profile in profiles():
        candidate, score, margin, status = best_match(profile["name_ru"], candidates)
        if status != "MATCHED":
            # Do not attach an official profile to a merely similar candidate.
            # Keep it in a separate research queue for manual identity review.
            review_rows.append({
                "official_name_ru": profile["name_ru"], "official_name_kk": profile["name_kk"],
                "source_type": profile["source_type"], "official_source_url": profile["source_url"],
                "best_candidate_guess": f"{candidate['surname']} {candidate['given_names']}",
                "match_score": f"{score:.3f}", "match_margin": f"{margin:.3f}",
                "review_status": "NEEDS_IDENTITY_REVIEW",
            })
            continue
        order = candidate["order"]
        existing = rows_by_order.get(order)
        if existing and existing["source_type"] == "PARTY_LEADERSHIP":
            continue
        row = {
            "party_id": "respublica", "list_order": order,
            "candidate_name": f"{candidate['surname']} {candidate['given_names']}",
            "official_name_ru": profile["name_ru"], "official_name_kk": profile["name_kk"],
            "source_type": profile["source_type"], "official_source_url": profile["source_url"],
            "role_ru": profile["role_ru"], "role_kk": profile["role_kk"],
            "biography_ru": profile["bio_ru"], "biography_kk": profile["bio_kk"],
            "photo_source_url": profile["photo"], "facebook_url": profile["facebook"],
            "instagram_url": profile["instagram"], "match_score": f"{score:.3f}",
            "match_margin": f"{margin:.3f}", "match_status": status,
            "photo_status": "NOT_REQUESTED", "r2_key": "", "public_photo_url": "",
            "asset_rights_note": "Official Respublica party source; no separate image license declaration found.",
            "collected_at": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()),
        }
        if args.upload_photos and status == "MATCHED" and profile["photo"]:
            image, content_type = download(profile["photo"])
            suffix = extension(content_type)
            if suffix:
                key = f"{ASSET_PREFIX}/respublica/{order}.{suffix}"
                put_object(key, image, content_type)
                row.update({"photo_status": "UPLOADED", "r2_key": key, "public_photo_url": f"https://assets.open-quryltai.org/{key}"})
            else:
                row["photo_status"] = f"SKIPPED_UNSUPPORTED_TYPE:{content_type}"
        rows_by_order[order] = row
        time.sleep(args.delay)

    rows = [rows_by_order[key] for key in sorted(rows_by_order, key=int)]
    with OUTPUT.open("w", encoding="utf-8", newline="") as target:
        writer = csv.DictWriter(target, fieldnames=FIELDS, delimiter="\t")
        writer.writeheader()
        writer.writerows(rows)
    with REVIEW_OUTPUT.open("w", encoding="utf-8", newline="") as target:
        writer = csv.DictWriter(target, fieldnames=(
            "official_name_ru", "official_name_kk", "source_type", "official_source_url",
            "best_candidate_guess", "match_score", "match_margin", "review_status",
        ), delimiter="\t")
        writer.writeheader()
        writer.writerows(review_rows)
    print(f"Wrote {len(rows)} matched official Respublica profiles -> {OUTPUT}")
    print(f"Wrote {len(review_rows)} unlinked official profiles -> {REVIEW_OUTPUT}")


if __name__ == "__main__":
    main()
