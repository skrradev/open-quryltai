#!/usr/bin/env python3
"""Generate the candidate_photo seed migration from what is actually in R2.

The bucket is the source of truth for which portraits exist; the research TSVs
supply provenance and rights for each object, joined on r2_key. Every one of the
214 objects currently in `candidates/` resolves to a TSV row, so a missing join
is treated as an error rather than skipped silently.

Rows are emitted as DRAFT with rights_cleared = FALSE: no collected portrait has
an explicit free-use licence, and V5's ck_candidate_photo_rights_gate requires
clearance to be an explicit act. candidate_id is resolved through
uq_candidate_party_order, because V3 lets the identity column generate itself.

Object bytes are cached under data/work/photos/_bucket_cache so re-runs are free.

    python3 scripts/generate_candidate_photo_seed.py --limit 5   # smoke test
    python3 scripts/generate_candidate_photo_seed.py
"""

import argparse
import csv
import glob
import hashlib
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from imagetools import image_size
from upload_r2_assets import ASSET_PREFIX, get_object, list_objects

ROOT = Path(__file__).resolve().parents[1]
WORK = ROOT / "data" / "work"
CACHE = WORK / "photos" / "_bucket_cache"
MIGRATIONS = ROOT / "backend" / "src" / "main" / "resources" / "db" / "migration"
OUTPUT = MIGRATIONS / "V6__seed_candidate_photo.sql"
SOURCE_REVISION = "photos-2026-08-17"

MAIN_KEY = re.compile(rf"^{ASSET_PREFIX}/(?P<party>[a-z_]+)/(?P<order>\d+)\.(?P<ext>jpg|jpeg|png|webp)$")
ALT_KEY = re.compile(rf"^{ASSET_PREFIX}/(?P<party>[a-z_]+)/(?P<order>\d+)/"
                     r"(?P<variant>parliament|npk-team|wikimedia)\.(?P<ext>jpg|jpeg|png|webp)$")
# Same precedence as make_candidate_thumbnails.py: a few respublica candidates
# have both .jpg and .png, and two PRIMARY rows would break uq_candidate_photo_role.
EXT_PRECEDENCE = ("png", "webp", "jpg", "jpeg")
CONTENT_TYPES = {"jpg": "image/jpeg", "jpeg": "image/jpeg", "png": "image/png", "webp": "image/webp"}
ROLE_BY_VARIANT = {"parliament": "PARLIAMENT", "npk-team": "PARTY_TEAM",
                   "wikimedia": "WIKIMEDIA"}
SOURCE_KIND_BY_DATASET = {
    "senate_incumbent_profiles.tsv": "SENATE",
    "parliament_incumbent_profiles.tsv": "MAZHILIS",
    "parliament_primary_photo_promotions.tsv": "MAZHILIS",
    "verified_candidate_biographies.tsv": "WIKIMEDIA",
}
URL_COLUMNS = ("photo_source_url", "avatar_source_url", "official_source_url", "profile_url")
DEFAULT_RIGHTS = {
    "PARTY_SITE": "Official party website; no separate image license declaration found.",
    "MAZHILIS": "Official Mazhilis directory; no separate image license declaration found.",
    "SENATE": "Official Senate directory; no separate image license declaration found.",
    "WIKIMEDIA": "Wikimedia; free/public-domain license verified at collection time.",
    "OTHER": "Source recorded; no license declaration found.",
}


def build_metadata_index():
    """Map every r2_key mentioned in the TSVs to (dataset_name, row)."""
    index = {}
    for path in sorted(glob.glob(str(WORK / "*.tsv"))):
        name = Path(path).name
        with open(path, encoding="utf-8", newline="") as handle:
            reader = csv.reader(handle, delimiter="\t")
            try:
                header = next(reader)
            except StopIteration:
                continue
        columns = [column for column in ("r2_key", "primary_r2_key") if column in header]
        if not columns:
            continue
        with open(path, encoding="utf-8", newline="") as handle:
            for row in csv.DictReader(handle, delimiter="\t"):
                for column in columns:
                    key = (row.get(column) or "").strip()
                    if key:
                        index.setdefault(key, (name, row))
    return index


def cached_bytes(key):
    target = CACHE / key.replace("/", "__")
    if target.exists():
        return target.read_bytes()
    data = get_object(key)
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_bytes(data)
    return data


def source_url_of(row):
    for column in URL_COLUMNS:
        value = (row.get(column) or "").strip()
        if value:
            return value
    raise ValueError("no source URL column populated")


def sql_text(value):
    if value is None or value == "":
        return "NULL"
    return "'" + str(value).replace("'", "''") + "'"


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--limit", type=int, help="process only the first N objects (smoke test)")
    parser.add_argument("--publish", action="store_true",
                        help="emit rows as PUBLISHED with rights_cleared = TRUE. Default is DRAFT, "
                             "which keeps ck_candidate_photo_rights_gate's clearance explicit; pass "
                             "this only when rights really have been signed off.")
    args = parser.parse_args()

    index = build_metadata_index()
    objects = dict(list_objects(f"{ASSET_PREFIX}/"))
    thumbs = {key for key in objects if key.endswith("/thumb.jpg")}

    # Group PRIMARY candidates so the extension collision is resolved explicitly.
    primaries = {}
    others = []
    for key in sorted(objects):
        match = MAIN_KEY.match(key)
        if match:
            slot = (match.group("party"), match.group("order"))
            primaries.setdefault(slot, []).append((EXT_PRECEDENCE.index(match.group("ext")), key, match))
            continue
        match = ALT_KEY.match(key)
        if match:
            others.append((key, match, ROLE_BY_VARIANT[match.group("variant")]))

    planned = []
    for slot, found in sorted(primaries.items(), key=lambda item: (item[0][0], int(item[0][1]))):
        found.sort()
        _, key, match = found[0]
        planned.append((key, match, "PRIMARY"))
    planned.extend(others)
    if args.limit:
        planned = planned[:args.limit]

    rows = []
    for position, (key, match, role) in enumerate(planned, start=1):
        if key not in index:
            raise SystemExit(f"no TSV metadata for {key}")
        dataset, record = index[key]
        data = cached_bytes(key)
        width, height = image_size(data)
        source_kind = SOURCE_KIND_BY_DATASET.get(dataset, "PARTY_SITE")
        thumb = f"{ASSET_PREFIX}/{match.group('party')}/{match.group('order')}/thumb.jpg"
        rows.append(dict(
            party=match.group("party"), order=int(match.group("order")), role=role,
            r2_key=key,
            thumb=thumb if (role == "PRIMARY" and thumb in thumbs) else None,
            width=width, height=height, byte_size=len(data),
            content_type=CONTENT_TYPES[match.group("ext")],
            source_kind=source_kind,
            source_url=source_url_of(record),
            embedded_author=(record.get("embedded_author") or "").strip() or None,
            embedded_copyright=(record.get("embedded_copyright") or "").strip() or None,
            photo_taken=(record.get("photo_taken") or "").strip() or None,
            rights_note=(record.get("asset_rights_note") or "").strip() or DEFAULT_RIGHTS[source_kind],
            content_hash=hashlib.sha256(data).hexdigest(),
        ))
        print(f"[{position}/{len(planned)}] {key} {width}x{height} {len(data) / 1024:.0f} KB {source_kind}")

    values = []
    for entry in rows:
        values.append("    (" + ", ".join((
            sql_text(entry["party"]), str(entry["order"]), sql_text(entry["role"]),
            sql_text(entry["r2_key"]), sql_text(entry["thumb"]), str(entry["width"]),
            str(entry["height"]), str(entry["byte_size"]), sql_text(entry["content_type"]),
            sql_text(entry["source_kind"]), sql_text(entry["source_url"]),
            sql_text(entry["embedded_author"]), sql_text(entry["embedded_copyright"]),
            sql_text(entry["photo_taken"]), sql_text(entry["rights_note"]),
            sql_text(entry["content_hash"]), sql_text(SOURCE_REVISION),
        )) + ")")

    if args.publish:
        review_header = ("-- Rows are PUBLISHED with rights_cleared = TRUE, on an explicit instruction\n"
                         "-- to publish every photo. Note that embedded_copyright is still recorded\n"
                         "-- where a source asserted one — clearance was a decision, not a finding.")
        review_columns = ",\n    review_status, reviewed_at, rights_cleared"
        review_values = ",\n    'PUBLISHED'::VARCHAR(16),\n    CURRENT_TIMESTAMP,\n    TRUE"
    else:
        review_header = ("-- Rows land as DRAFT with rights_cleared = FALSE: publishing requires an\n"
                         "-- explicit rights clearance, per ck_candidate_photo_rights_gate in V5.")
        review_columns = ""
        review_values = ""

    body = f"""-- Generated by scripts/generate_candidate_photo_seed.py — do not edit by hand.
-- {len(rows)} portraits currently in R2 under candidates/.
{review_header}
-- candidate_id is resolved through uq_candidate_party_order, since V3 lets the
-- identity column generate itself.

INSERT INTO candidate_photo (
    candidate_id, photo_role, r2_key, thumb_r2_key, width, height, byte_size,
    content_type, source_kind, source_url, embedded_author, embedded_copyright,
    photo_taken, rights_note, content_hash, source_revision{review_columns}
)
SELECT
    candidate.candidate_id,
    seed.photo_role::VARCHAR(24),
    seed.r2_key::VARCHAR(512),
    seed.thumb_r2_key::VARCHAR(512),
    seed.width::SMALLINT,
    seed.height::SMALLINT,
    seed.byte_size::INTEGER,
    seed.content_type::VARCHAR(32),
    seed.source_kind::VARCHAR(24),
    seed.source_url::VARCHAR(2048),
    seed.embedded_author::TEXT,
    seed.embedded_copyright::TEXT,
    -- Explicit: an all-NULL column in VALUES is inferred as text, not date.
    seed.photo_taken::DATE,
    seed.rights_note::TEXT,
    seed.content_hash::CHAR(64),
    seed.source_revision::VARCHAR(64){review_values}
FROM (VALUES
{',\n'.join(values)}
) AS seed (
    party_id, list_order, photo_role, r2_key, thumb_r2_key, width, height,
    byte_size, content_type, source_kind, source_url, embedded_author,
    embedded_copyright, photo_taken, rights_note, content_hash, source_revision
)
JOIN candidate
    ON candidate.party_id = seed.party_id::VARCHAR(32)
   AND candidate.list_order = seed.list_order::SMALLINT;
"""
    OUTPUT.write_text(body, encoding="utf-8")
    by_role = {}
    for entry in rows:
        by_role[entry["role"]] = by_role.get(entry["role"], 0) + 1
    print(f"\nwrote {OUTPUT.relative_to(ROOT)}: {len(rows)} rows {by_role}")


if __name__ == "__main__":
    main()
