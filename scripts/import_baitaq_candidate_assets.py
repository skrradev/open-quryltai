#!/usr/bin/env python3
"""Match Baitaq's official candidate pages to the local list and mirror portraits.

Only high-confidence name matches are uploaded. Every mirrored photo retains its
official party source URL and is marked as an official-party asset with no
separate license declaration.
"""

import argparse
import csv
import difflib
import re
import time
from pathlib import Path
from urllib.request import Request, urlopen

from upload_r2_assets import ASSET_PREFIX, put_object


ROOT = Path(__file__).resolve().parents[1]
CANDIDATES = ROOT / "data" / "candidates_classified.csv"
PROFILES = ROOT / "data" / "work" / "baitaq_official_profiles.tsv"
OUTPUT = ROOT / "data" / "work" / "baitaq_candidate_assets.tsv"
USER_AGENT = "OpenQuryltai/0.1 (official party candidate asset collection)"
FIELDS = (
    "party_id", "list_order", "candidate_name", "official_name", "profile_url",
    "biography_kk", "photo_source_url", "match_score", "match_margin", "match_status",
    "photo_status", "r2_key", "public_photo_url", "asset_rights_note", "collected_at",
)

TRANSLITERATION = str.maketrans({
    "а": "a", "ә": "a", "б": "b", "в": "v", "г": "g", "ғ": "g", "д": "d",
    "е": "e", "ё": "e", "ж": "zh", "з": "z", "и": "i", "й": "i", "і": "i",
    "к": "k", "қ": "k", "л": "l", "м": "m", "н": "n", "ң": "n", "о": "o",
    "ө": "o", "п": "p", "р": "r", "с": "s", "т": "t", "у": "u", "ұ": "u",
    "ү": "u", "ф": "f", "х": "h", "һ": "h", "ц": "ts", "ч": "ch", "ш": "sh",
    "щ": "sh", "ъ": "", "ы": "y", "ь": "", "э": "e", "ю": "yu", "я": "ya",
})


def tokens(value):
    return re.findall(r"[a-z]+", value.casefold().translate(TRANSLITERATION))


def ratio(left, right):
    return difflib.SequenceMatcher(a=left, b=right).ratio()


def candidate_score(profile_name, candidate):
    profile_tokens = tokens(profile_name)
    candidate_tokens = tokens(f"{candidate['surname']} {candidate['given_names']}")
    if len(profile_tokens) < 2 or len(candidate_tokens) < 2:
        return 0.0

    def score_ordered(candidate_variant):
        surname = ratio(profile_tokens[0], candidate_variant[0])
        given = ratio(profile_tokens[1], candidate_variant[1])
        middle = ratio(profile_tokens[2], candidate_variant[2]) if len(profile_tokens) > 2 and len(candidate_variant) > 2 else 1.0
        return 0.55 * surname + 0.30 * given + 0.15 * middle

    # Most profiles use "Surname Given", but short Kazakh names such as
    # "Алма Қараш" may be published in given-name-first order.
    return max(score_ordered(candidate_tokens), score_ordered(candidate_tokens[1:] + candidate_tokens[:1]))


def match_profile(profile, candidates):
    ranked = sorted(((candidate_score(profile["profile_name"], candidate), candidate) for candidate in candidates), reverse=True, key=lambda item: item[0])
    score, candidate = ranked[0]
    runner_up = ranked[1][0] if len(ranked) > 1 else 0.0
    margin = score - runner_up
    status = "MATCHED" if score >= 0.84 and margin >= 0.04 else "NEEDS_REVIEW"
    return candidate, score, margin, status


def download(url):
    request = Request(url, headers={"User-Agent": USER_AGENT})
    with urlopen(request, timeout=60) as response:
        return response.read(), response.headers.get_content_type()


def extension(content_type):
    return {"image/jpeg": "jpg", "image/png": "png", "image/webp": "webp"}.get(content_type)


def load_candidates():
    with CANDIDATES.open(encoding="utf-8", newline="") as source:
        return [row for row in csv.DictReader(source) if row["party_id"] == "baitaq"]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--upload-photos", action="store_true")
    parser.add_argument("--delay", type=float, default=1.0)
    args = parser.parse_args()
    candidates = load_candidates()
    with PROFILES.open(encoding="utf-8", newline="") as source:
        profiles = list(csv.DictReader(source, delimiter="\t"))

    rows = []
    for profile in profiles:
        candidate, score, margin, status = match_profile(profile, candidates)
        row = {
            "party_id": "baitaq", "list_order": candidate["order"],
            "candidate_name": f"{candidate['surname']} {candidate['given_names']}",
            "official_name": profile["profile_name"], "profile_url": profile["profile_url"],
            "biography_kk": profile["biography_kk"], "photo_source_url": profile["photo_source_url"],
            "match_score": f"{score:.3f}", "match_margin": f"{margin:.3f}", "match_status": status,
            "photo_status": "NOT_REQUESTED", "r2_key": "", "public_photo_url": "",
            "asset_rights_note": "Official Baitaq party source; no separate license declaration found.",
            "collected_at": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()),
        }
        if args.upload_photos and status == "MATCHED":
            image, content_type = download(profile["photo_source_url"])
            suffix = extension(content_type)
            if suffix:
                key = f"{ASSET_PREFIX}/baitaq/{candidate['order']}.{suffix}"
                put_object(key, image, content_type)
                row.update({
                    "photo_status": "UPLOADED", "r2_key": key,
                    "public_photo_url": f"https://assets.open-quryltai.org/{key}",
                })
            else:
                row["photo_status"] = f"SKIPPED_UNSUPPORTED_TYPE:{content_type}"
        elif status != "MATCHED":
            row["photo_status"] = "SKIPPED_NAME_REVIEW"
        rows.append(row)
        time.sleep(args.delay)

    with OUTPUT.open("w", encoding="utf-8", newline="") as target:
        writer = csv.DictWriter(target, fieldnames=FIELDS, delimiter="\t")
        writer.writeheader()
        writer.writerows(rows)
    print(f"Wrote {len(rows)} Baitaq rows -> {OUTPUT}")


if __name__ == "__main__":
    main()
