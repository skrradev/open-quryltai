#!/usr/bin/env python3
"""Normalise and upload the party logos collected in party_brand_assets.tsv.

Keys follow the candidate convention: language-neutral logos go to
`parties/<party_id>/logo.<ext>`, language-specific ones to
`parties/<party_id>/logo-<lang>.<ext>`. NPK is the only party that needs the
latter today — its abbreviation changes with the language (NPK / QHP) — but the
shape has to exist or the Kazakh site would show a Russian wordmark.

SVGs pass through untouched: they are already tiny and vector. The one exception
is baitaq, whose "SVG" is a 3842x757 raster in an SVG wrapper — there was never
any vector to preserve, so it is unwrapped to PNG and downscaled, which is both
smaller and honest about what it is. Rasters are capped at LOGO_MAX_EDGE.

The TSV is rewritten with r2_key and public_photo_url.

    python3 scripts/upload_party_logos.py --dry-run
    python3 scripts/upload_party_logos.py
"""

import argparse
import base64
import csv
import hashlib
import re
import subprocess
import sys
import tempfile
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from imagetools import has_jpeg_metadata, image_size, strip_jpeg_metadata
from upload_r2_assets import put_object

ROOT = Path(__file__).resolve().parents[1]
WORK = ROOT / "data" / "work"
ASSETS = WORK / "party_brand_assets.tsv"
PUBLIC_BASE = "https://assets.open-quryltai.org"
PARTY_PREFIX = "parties"
LOGO_MAX_EDGE = 512
QUALITY = 88
CONTENT_TYPES = {".svg": "image/svg+xml", ".png": "image/png",
                 ".jpg": "image/jpeg", ".jpeg": "image/jpeg", ".webp": "image/webp"}


def unwrap_svg_raster(data):
    """Return the embedded raster of an SVG that is really just a wrapper."""
    text = data.decode("utf-8", errors="replace")
    match = re.search(r'href="data:image/(png|jpeg|jpg);base64,([A-Za-z0-9+/=]+)"', text)
    if not match:
        return None, None
    return base64.b64decode(match.group(2)), (".png" if match.group(1) == "png" else ".jpg")


def to_png(data, workdir):
    source = workdir / "in.jpg"
    target = workdir / "in.png"
    source.write_bytes(data)
    subprocess.run(["sips", "-s", "format", "png", str(source), "--out", str(target)],
                   check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    result = target.read_bytes()
    source.unlink()
    target.unlink()
    return result


def downscale(data, suffix, workdir):
    width, height = image_size(data)
    if max(width, height) <= LOGO_MAX_EDGE:
        return data
    source = workdir / f"in{suffix}"
    target = workdir / f"out{suffix}"
    source.write_bytes(data)
    command = ["sips", "-Z", str(LOGO_MAX_EDGE)]
    if suffix in {".jpg", ".jpeg"}:
        command += ["-s", "format", "jpeg", "-s", "formatOptions", str(QUALITY)]
    command += [str(source), "--out", str(target)]
    subprocess.run(command, check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    result = target.read_bytes()
    if suffix in {".jpg", ".jpeg"} and has_jpeg_metadata(result):
        result = strip_jpeg_metadata(result)
    source.unlink()
    target.unlink()
    return result


def prepare(row, workdir):
    """Return (bytes, suffix, note) ready for upload."""
    path = ROOT / row["local_photo_path" if "local_photo_path" in row else "local_file"]
    data = path.read_bytes()
    suffix = path.suffix.lower()
    notes = []
    if suffix == ".svg":
        raster, raster_suffix = unwrap_svg_raster(data)
        if raster is None:
            return data, suffix, "vector, unchanged"
        data, suffix = raster, raster_suffix
        notes.append(f"unwrapped raster from SVG ({image_size(data)[0]}x{image_size(data)[1]})")
    if suffix in {".jpg", ".jpeg"}:
        # Logos are flat graphics, so lossless beats JPEG on both size and
        # artefacts, and PNG leaves room for a transparent replacement later.
        data, suffix = to_png(data, workdir), ".png"
        notes.append("converted JPEG to PNG")
    before = len(data)
    data = downscale(data, suffix, workdir)
    if len(data) != before:
        notes.append(f"downscaled to {image_size(data)[0]}x{image_size(data)[1]}")
    return data, suffix, ", ".join(notes) or "unchanged"


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--dry-run", action="store_true")
    args = parser.parse_args()

    with ASSETS.open(encoding="utf-8", newline="") as handle:
        reader = csv.DictReader(handle, delimiter="\t")
        fields = list(reader.fieldnames)
        rows = list(reader)
    for column in ("r2_key", "public_url", "width", "height", "byte_size", "content_hash"):
        if column not in fields:
            fields.append(column)

    planned = []
    with tempfile.TemporaryDirectory() as raw:
        workdir = Path(raw)
        for row in rows:
            data, suffix, note = prepare(row, workdir)
            language = (row.get("language") or "").strip()
            name = f"logo-{language}{suffix}" if language else f"logo{suffix}"
            key = f"{PARTY_PREFIX}/{row['party_id']}/{name}"
            width = height = None
            if suffix != ".svg":
                width, height = image_size(data)
            planned.append(dict(row=row, key=key, data=data, suffix=suffix, note=note,
                                width=width, height=height))
            size = f"{width}x{height}" if width else "vector"
            print(f"  {key:36} {size:>10} {len(data) / 1024:7.1f} KB  {note}")

        total = sum(len(item["data"]) for item in planned)
        print(f"\n{len(planned)} logos, {total / 1024:.0f} KB total")
        if args.dry_run:
            print("dry run: nothing uploaded")
            return

        for item in planned:
            put_object(item["key"], item["data"], CONTENT_TYPES[item["suffix"]])
            item["row"].update(
                r2_key=item["key"],
                public_url=f"{PUBLIC_BASE}/{item['key']}",
                width="" if item["width"] is None else str(item["width"]),
                height="" if item["height"] is None else str(item["height"]),
                byte_size=str(len(item["data"])),
                content_hash=hashlib.sha256(item["data"]).hexdigest())
            print(f"uploaded {item['key']}")

    with ASSETS.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields, delimiter="\t", lineterminator="\n")
        writer.writeheader()
        writer.writerows(rows)
    print(f"rewrote {ASSETS.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
