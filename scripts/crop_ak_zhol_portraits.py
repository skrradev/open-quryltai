#!/usr/bin/env python3
"""Extract clean portraits from Aq Jol's official 2026 campaign cards.

The party published all portraits inside one 1000×563 campaign-card template.
This script preserves those original cards in R2 and writes a tighter, clean
portrait to candidates/ak_zhol/<list_order>/portrait.jpg by default. With
--replace-original, it overwrites the earlier framed asset at
candidates/ak_zhol/<list_order>.jpg and removes the duplicate portrait key.
It rejects images whose dimensions/aspect ratio do not match the verified
template instead of blindly producing a bad crop.

Uses macOS `sips`, so it needs no third-party Python image package.
"""

import argparse
import csv
import shutil
import subprocess
import tempfile
import time
from pathlib import Path
from urllib.request import Request, urlopen

from upload_r2_assets import ASSET_PREFIX, delete_object, put_object

ROOT = Path(__file__).resolve().parents[1]
PROFILES = ROOT / "data" / "work" / "ak_zhol_candidate_profiles.tsv"
USER_AGENT = "OpenQuryltai/0.1 (Aq Jol portrait extraction)"
EXPECTED_WIDTH = 1000
EXPECTED_HEIGHT = 563
# Verified against three cards sampled from the official candidate-list article.
# A 12 px inset removes the blue campaign-card frame around the portrait area.
CROP_LEFT = 0.636
CROP_TOP = 0.155
CROP_WIDTH = 0.316
CROP_HEIGHT = 0.622


def download(url, destination):
    request = Request(url, headers={"User-Agent": USER_AGENT})
    with urlopen(request, timeout=60) as response:
        destination.write_bytes(response.read())


def dimensions(path):
    result = subprocess.run(
        ["sips", "-g", "pixelWidth", "-g", "pixelHeight", str(path)],
        check=True, capture_output=True, text=True,
    )
    values = {}
    for line in result.stdout.splitlines():
        if ":" in line:
            key, value = line.strip().split(":", 1)
            if key in {"pixelWidth", "pixelHeight"}:
                values[key] = int(value.strip())
    return values["pixelWidth"], values["pixelHeight"]


def crop(source, destination, width, height):
    crop_width = round(width * CROP_WIDTH)
    crop_height = round(height * CROP_HEIGHT)
    offset_x = round(width * CROP_LEFT)
    offset_y = round(height * CROP_TOP)
    subprocess.run(
        [
            "sips", "-c", str(crop_height), str(crop_width),
            "--cropOffset", str(offset_y), str(offset_x),
            str(source), "--out", str(destination),
        ],
        check=True, capture_output=True, text=True,
    )
    return crop_width, crop_height, offset_x, offset_y


def valid_template(width, height):
    # Scale proportionally, but reject cards that do not resemble the reviewed
    # 1000×563 Aq Jol template. A different campaign layout must be reviewed.
    return abs((width / height) - (EXPECTED_WIDTH / EXPECTED_HEIGHT)) < 0.01 and width >= 800


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--upload", action="store_true", help="Upload extracted portraits to R2")
    parser.add_argument("--replace-original", action="store_true", help="Replace framed R2 cards with portraits; requires --upload")
    parser.add_argument("--delay", type=float, default=1.0)
    args = parser.parse_args()
    if args.replace_original and not args.upload:
        parser.error("--replace-original requires --upload")
    if not shutil.which("sips"):
        raise SystemExit("macOS sips is required but not found")

    with PROFILES.open(encoding="utf-8", newline="") as source:
        rows = list(csv.DictReader(source, delimiter="\t"))
    fields = list(rows[0])
    for field in ("portrait_crop_status", "portrait_r2_key", "portrait_public_url", "portrait_crop_box"):
        if field not in fields:
            fields.append(field)

    successes = skipped = 0
    with tempfile.TemporaryDirectory(prefix="ak-zhol-portraits-") as temp:
        temp_path = Path(temp)
        for row in rows:
            source_path = temp_path / f"{row['list_order']}-source"
            portrait_path = temp_path / f"{row['list_order']}-portrait.jpg"
            try:
                download(row["photo_source_url"], source_path)
                width, height = dimensions(source_path)
                if not valid_template(width, height):
                    row.update({
                        "portrait_crop_status": f"SKIPPED_UNEXPECTED_TEMPLATE:{width}x{height}",
                        "portrait_r2_key": "", "portrait_public_url": "", "portrait_crop_box": "",
                    })
                    skipped += 1
                    continue
                crop_width, crop_height, offset_x, offset_y = crop(source_path, portrait_path, width, height)
                portrait_key = f"{ASSET_PREFIX}/ak_zhol/{row['list_order']}/portrait.jpg"
                key = row["r2_key"] if args.replace_original else portrait_key
                row.update({
                    "portrait_crop_status": "CROPPED" if not args.upload else ("REPLACED_ORIGINAL" if args.replace_original else "UPLOADED"),
                    "portrait_r2_key": portrait_key if args.upload and not args.replace_original else "",
                    "portrait_public_url": f"https://assets.open-quryltai.org/{portrait_key}" if args.upload and not args.replace_original else "",
                    "portrait_crop_box": f"x={offset_x},y={offset_y},width={crop_width},height={crop_height}",
                })
                if args.upload:
                    put_object(key, portrait_path.read_bytes(), "image/jpeg")
                    if args.replace_original:
                        delete_object(portrait_key)
                        row["photo_status"] = "CROPPED_AND_UPLOADED"
                successes += 1
            except Exception as error:
                row.update({
                    "portrait_crop_status": f"ERROR:{type(error).__name__}",
                    "portrait_r2_key": "", "portrait_public_url": "", "portrait_crop_box": "",
                })
                skipped += 1
            finally:
                source_path.unlink(missing_ok=True)
                portrait_path.unlink(missing_ok=True)
                time.sleep(args.delay)

    with PROFILES.open("w", encoding="utf-8", newline="") as target:
        writer = csv.DictWriter(target, fieldnames=fields, delimiter="\t")
        writer.writeheader()
        writer.writerows(rows)
    print(f"Cropped/uploaded={successes}; skipped/errors={skipped}; updated={PROFILES}")


if __name__ == "__main__":
    main()
