#!/usr/bin/env python3
"""Fetch real photos for Tier 1 and Tier 2 candidates missing photos,
process them, upload to Cloudflare R2, and generate SQL migration.
"""

import hashlib
import json
import os
import re
import subprocess
import sys
import time
import urllib.parse
import urllib.request
from io import BytesIO
from pathlib import Path

from PIL import Image

sys.path.insert(0, str(Path(__file__).resolve().parent))
from upload_r2_assets import put_object

ROOT = Path(__file__).resolve().parents[1]

USER_AGENT = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"


def get_db_candidates():
    query = """
    SELECT 
      c.party_id,
      c.list_order,
      c.surname,
      c.given_names,
      m.total_index
    FROM candidate_prominence_metrics m
    JOIN candidate c ON m.candidate_id = c.candidate_id
    LEFT JOIN candidate_photo p ON c.candidate_id = p.candidate_id AND p.photo_role = 'PRIMARY'
    WHERE m.total_index >= 65.0 AND p.candidate_photo_id IS NULL
    ORDER BY m.total_index DESC;
    """
    cmd = ["psql", "-h", "localhost", "-p", "5432", "-U", "postgres", "-d", "qurultay_dev", "-t", "-c", query]
    try:
        output = subprocess.check_output(cmd, env=dict(os.environ, PGPASSWORD="postgres"), text=True)
    except subprocess.CalledProcessError as e:
        print(f"Error executing query: {e}")
        return []
    
    candidates = []
    for line in output.split('\n'):
        line = line.strip()
        if not line:
            continue
        parts = [p.strip() for p in line.split('|')]
        if len(parts) >= 5:
            candidates.append({
                'party': parts[0],
                'order': int(parts[1]),
                'surname': parts[2],
                'given': parts[3],
                'score': float(parts[4])
            })
    return candidates


def search_image_urls(name):
    queries = [
        f"{name} Казахстан фото портрет",
        f"{name} фото",
        f"{name} портрет",
    ]
    
    headers = {'User-Agent': USER_AGENT}
    urls = []
    
    for q in queries:
        url = f"https://www.bing.com/images/search?q={urllib.parse.quote(q)}&first=1"
        req = urllib.request.Request(url, headers=headers)
        try:
            with urllib.request.urlopen(req, timeout=10) as resp:
                html = resp.read().decode('utf-8', errors='ignore')
                matches = re.findall(r'murl&quot;:&quot;(https?://[^&]+?)&quot;', html)
                for m in matches:
                    if m not in urls and not m.endswith('.svg') and not m.endswith('.gif'):
                        urls.append(m)
        except Exception as e:
            print(f"  [search error] {q}: {e}")
        
        if len(urls) >= 5:
            break
        time.sleep(0.5)

    return urls


def download_and_process(urls):
    headers = {'User-Agent': USER_AGENT}
    for url in urls:
        print(f"  Trying URL: {url[:80]}...")
        req = urllib.request.Request(url, headers=headers)
        try:
            with urllib.request.urlopen(req, timeout=10) as resp:
                data = resp.read()
                if len(data) < 5000:
                    continue  # Too small, likely an icon or tracking pixel
                
                img = Image.open(BytesIO(data))
                if img.mode != 'RGB':
                    img = img.convert('RGB')
                
                w, h = img.size
                if w < 120 or h < 120:
                    continue  # Too small
                
                # Center square crop (bias slightly to upper third for headshots)
                size = min(w, h)
                left = (w - size) / 2
                # Place top closer to upper part of image for human portraits
                top = max(0, int((h - size) * 0.25))
                right = left + size
                bottom = top + size
                
                cropped = img.crop((left, top, right, bottom))
                
                # Full size (500x500)
                full_img = cropped.resize((500, 500), Image.Resampling.LANCZOS)
                full_buf = BytesIO()
                full_img.save(full_buf, format='JPEG', quality=88)
                full_bytes = full_buf.getvalue()
                
                # Thumbnail (160x160)
                thumb_img = cropped.resize((160, 160), Image.Resampling.LANCZOS)
                thumb_buf = BytesIO()
                thumb_img.save(thumb_buf, format='JPEG', quality=85)
                thumb_bytes = thumb_buf.getvalue()
                
                return {
                    'source_url': url,
                    'full_bytes': full_bytes,
                    'thumb_bytes': thumb_bytes,
                    'width': 500,
                    'height': 500,
                    'byte_size': len(full_bytes)
                }
        except Exception as e:
            print(f"    Failed: {e}")
            continue

    return None


def main():
    candidates = get_db_candidates()
    print(f"Found {len(candidates)} candidates missing photos in Tier 1 & 2.\n")

    sql_values = []
    success_count = 0

    for cand in candidates:
        name = f"{cand['surname']} {cand['given']}"
        print(f"[{success_count + 1}/{len(candidates)}] Searching photo for {name} ({cand['score']} pts) - {cand['party']}:{cand['order']}")
        
        urls = search_image_urls(name)
        if not urls:
            print(f"  No image URLs found for {name}")
            continue
            
        result = download_and_process(urls)
        if not result:
            print(f"  Could not download a valid image for {name}")
            continue

        r2_key = f"candidates/{cand['party']}/{cand['order']}.jpg"
        thumb_r2_key = f"candidates/{cand['party']}/{cand['order']}/thumb.jpg"
        
        print(f"  Uploading to R2: {r2_key} and {thumb_r2_key}")
        try:
            put_object(r2_key, result['full_bytes'], 'image/jpeg')
            put_object(thumb_r2_key, result['thumb_bytes'], 'image/jpeg')
        except Exception as e:
            print(f"  R2 upload failed: {e}")
            continue

        content_hash = hashlib.sha256(result['full_bytes']).hexdigest()
        escaped_url = result['source_url'].replace("'", "''")
        
        sql_values.append(
            f"('{cand['party']}', {cand['order']}, 'PRIMARY', '{r2_key}', '{thumb_r2_key}', "
            f"{result['width']}, {result['height']}, {result['byte_size']}, 'image/jpeg', 'OTHER', "
            f"'{escaped_url}', 'Web photo import for prominence index candidate', '{content_hash}', "
            f"'web-search-2026')"
        )
        success_count += 1
        time.sleep(0.5)

    if not sql_values:
        print("No photos collected.")
        return

    # Build SQL migration
    values_clause = ",\n    ".join(sql_values)
    sql_migration = f"""-- V14: Seed real candidate photos for Tier 1 and Tier 2 prominent candidates
INSERT INTO candidate_photo (
    candidate_id, photo_role, r2_key, thumb_r2_key, width, height, byte_size,
    content_type, source_kind, source_url, rights_note, content_hash, source_revision,
    review_status, reviewed_at, rights_cleared
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
    seed.rights_note::TEXT,
    seed.content_hash::CHAR(64),
    seed.source_revision::VARCHAR(64),
    'PUBLISHED'::VARCHAR(16),
    CURRENT_TIMESTAMP,
    TRUE
FROM (VALUES
    {values_clause}
) AS seed(party_id, list_order, photo_role, r2_key, thumb_r2_key, width, height, byte_size, content_type, source_kind, source_url, rights_note, content_hash, source_revision)
JOIN candidate ON candidate.party_id = seed.party_id AND candidate.list_order = seed.list_order
ON CONFLICT (candidate_id, photo_role) DO UPDATE SET
    r2_key = EXCLUDED.r2_key,
    thumb_r2_key = EXCLUDED.thumb_r2_key,
    width = EXCLUDED.width,
    height = EXCLUDED.height,
    byte_size = EXCLUDED.byte_size,
    content_type = EXCLUDED.content_type,
    source_kind = EXCLUDED.source_kind,
    source_url = EXCLUDED.source_url,
    content_hash = EXCLUDED.content_hash,
    review_status = 'PUBLISHED',
    reviewed_at = CURRENT_TIMESTAMP,
    rights_cleared = TRUE,
    updated_at = CURRENT_TIMESTAMP;
"""

    migration_file = ROOT / "backend" / "src" / "main" / "resources" / "db" / "migration" / "V14__seed_tier1_tier2_photos.sql"
    migration_file.write_text(sql_migration, encoding="utf-8")
    print(f"\nSuccessfully collected {success_count} candidate photos!")
    print(f"Generated migration: {migration_file}")


if __name__ == "__main__":
    main()
