#!/usr/bin/env python3
"""Dependency-free image helpers shared by the asset scripts.

Only the standard library is used: there is no Pillow in this project, and the
resizing tool is `sips`, which neither reports dimensions in a parsable way nor
removes metadata. Hence the small parsers and the segment-level stripper here.
"""


def jpeg_size(data):
    """Return (width, height) from the first JPEG SOF marker."""
    index = 2
    while index < len(data) - 9:
        if data[index] != 0xFF:
            index += 1
            continue
        marker = data[index + 1]
        if 0xC0 <= marker <= 0xCF and marker not in {0xC4, 0xC8, 0xCC}:
            return (data[index + 7] << 8) | data[index + 8], (data[index + 5] << 8) | data[index + 6]
        index += 2 + ((data[index + 2] << 8) | data[index + 3])
    raise ValueError("no JPEG SOF marker")


def webp_size(data):
    """Return (width, height) for a lossy, lossless or extended WebP."""
    if data[12:16] == b"VP8 ":
        start = data.index(b"\x9d\x01\x2a")
        return (int.from_bytes(data[start + 3:start + 5], "little") & 0x3FFF,
                int.from_bytes(data[start + 5:start + 7], "little") & 0x3FFF)
    if data[12:16] == b"VP8X":
        return (int.from_bytes(data[24:27], "little") + 1,
                int.from_bytes(data[27:30], "little") + 1)
    bits = int.from_bytes(data[21:25], "little")
    return (bits & 0x3FFF) + 1, ((bits >> 14) & 0x3FFF) + 1


def png_size(data):
    if data[:8] != b"\x89PNG\r\n\x1a\n":
        raise ValueError("not a PNG")
    return int.from_bytes(data[16:20], "big"), int.from_bytes(data[20:24], "big")


def image_size(data):
    """Dispatch on magic bytes. Returns (width, height)."""
    if data[:2] == b"\xff\xd8":
        return jpeg_size(data)
    if data[:4] == b"RIFF" and data[8:12] == b"WEBP":
        return webp_size(data)
    if data[:8] == b"\x89PNG\r\n\x1a\n":
        return png_size(data)
    raise ValueError("unrecognised image format")


def _is_metadata_marker(marker):
    """APPn other than APP0/JFIF, plus COM. Covers EXIF, XMP and Photoshop IRB."""
    return (0xE1 <= marker <= 0xEF) or marker == 0xFE


def has_jpeg_metadata(data):
    index = 2
    while index < len(data) - 4:
        if data[index] != 0xFF:
            index += 1
            continue
        marker = data[index + 1]
        if marker == 0xDA:  # start of scan
            return False
        if _is_metadata_marker(marker):
            return True
        index += 2 + ((data[index + 2] << 8) | data[index + 3])
    return False


def strip_jpeg_metadata(data):
    """Drop every APPn but APP0/JFIF, and every COM segment.

    `sips` both preserves source metadata through a resize and adds its own, so
    anything derived from a third-party original has to be cleaned explicitly.
    """
    if data[:2] != b"\xff\xd8":
        raise ValueError("not a JPEG")
    out = bytearray(data[:2])
    index = 2
    while index < len(data):
        if data[index] != 0xFF:
            out.extend(data[index:])
            break
        marker = data[index + 1]
        if marker == 0xDA:  # start of scan: copy the compressed data verbatim
            out.extend(data[index:])
            break
        length = (data[index + 2] << 8) | data[index + 3]
        if not _is_metadata_marker(marker):
            out.extend(data[index:index + 2 + length])
        index += 2 + length
    result = bytes(out)
    if has_jpeg_metadata(result):
        raise RuntimeError("metadata survived stripping")
    return result
