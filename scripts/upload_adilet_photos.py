#!/usr/bin/env python3
"""Normalise and upload the researched `adilet` candidate portraits to R2.

Two sources feed this: the party site portraits recorded in
data/work/adilet_candidate_profiles.tsv (WebP) and the Senate directory
portraits in data/work/senate_incumbent_profiles.tsv (JPEG). Both TSVs are
rewritten in place with r2_key, public_photo_url and photo_status=UPLOADED.

Normalisation, applied only where needed:
  * long edge capped at MAX_EDGE via sips, preserving aspect ratio;
  * every JPEG APPn (except APP0/JFIF) and COM segment dropped, because sips
    keeps EXIF through a resize and these files carry camera, photographer and
    capture-date metadata.

Credentials come from the root .env through upload_r2_assets.dotenv_value and
are never printed.

    python3 scripts/upload_adilet_photos.py --dry-run
    python3 scripts/upload_adilet_photos.py
"""

import argparse
import csv
import subprocess
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from imagetools import has_jpeg_metadata, image_size, strip_jpeg_metadata
from upload_r2_assets import ASSET_PREFIX, put_object

ROOT = Path(__file__).resolve().parents[1]
WORK = ROOT / "data" / "work"
STAGE = WORK / "photos" / "_upload"
PUBLIC_BASE = "https://assets.open-quryltai.org"
MAX_EDGE = 1024
CONTENT_TYPES = {".webp": "image/webp", ".jpg": "image/jpeg", ".png": "image/png"}
SOURCES = ("adilet_candidate_profiles.tsv", "senate_incumbent_profiles.tsv")


def dimensions(path):
    return image_size(path.read_bytes())


def normalise(source, target):
    """Resize if oversized, strip JPEG metadata. Returns a note for the log."""
    width, height = dimensions(source)
    notes = []
    staged = source
    if max(width, height) > MAX_EDGE:
        target.parent.mkdir(parents=True, exist_ok=True)
        subprocess.run(["sips", "-Z", str(MAX_EDGE), str(source), "--out", str(target)],
                       check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        notes.append(f"resized {width}x{height}")
        staged = target
    data = staged.read_bytes()
    if staged.suffix == ".jpg" and has_jpeg_metadata(data):
        data = strip_jpeg_metadata(data)
        notes.append("stripped EXIF")
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_bytes(data)
    if staged.suffix == ".jpg" and has_jpeg_metadata(target.read_bytes()):
        raise RuntimeError(f"{target.name}: metadata survived stripping")
    return notes or ["unchanged"]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--dry-run", action="store_true", help="normalise and report, upload nothing")
    args = parser.parse_args()

    sheets = []
    planned = []
    for name in SOURCES:
        path = WORK / name
        with path.open(encoding="utf-8", newline="") as handle:
            reader = csv.DictReader(handle, delimiter="\t")
            fields = reader.fieldnames
            rows = list(reader)
        sheets.append((path, fields, rows))
        for row in rows:
            local = ROOT / row["local_photo_path"]
            if not local.exists():
                raise SystemExit(f"missing {local}")
            suffix = local.suffix
            staged = STAGE / row["party_id"] / f"{row['list_order']}{suffix}"
            notes = normalise(local, staged)
            width, height = dimensions(staged)
            planned.append(dict(row=row, staged=staged, suffix=suffix, notes=notes,
                                key=f"{ASSET_PREFIX}/{row['party_id']}/{row['list_order']}{suffix}",
                                dim=f"{width}x{height}", kb=staged.stat().st_size / 1024))

    for item in sorted(planned, key=lambda entry: int(entry["row"]["list_order"])):
        print(f"{item['key']:34} {item['dim']:>10} {item['kb']:7.0f} KB  {', '.join(item['notes'])}")
    print(f"{len(planned)} objects, {sum(item['kb'] for item in planned) / 1024:.1f} MB total")
    if args.dry_run:
        print("dry run: nothing uploaded")
        return

    for item in planned:
        put_object(item["key"], item["staged"].read_bytes(), CONTENT_TYPES[item["suffix"]])
        item["row"].update(photo_status="UPLOADED", r2_key=item["key"],
                           public_photo_url=f"{PUBLIC_BASE}/{item['key']}")
        print(f"uploaded {item['key']}")

    for path, fields, rows in sheets:
        with path.open("w", encoding="utf-8", newline="") as handle:
            writer = csv.DictWriter(handle, fieldnames=fields, delimiter="\t", lineterminator="\n")
            writer.writeheader()
            writer.writerows(rows)
        print(f"rewrote {path.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
