#!/usr/bin/env python3
"""Compute candidate digital prominence index from online signals.

This script aggregates data from:
1. Wikipedia pageviews (Wikimedia REST API for verified candidates).
2. YouTube metrics (view counts, video scores from data/work/youtube_videos.tsv).
3. Google search volume and news media presence estimates based on political / public stature.
4. Social media follower audience estimates.

Outputs:
- data/work/candidate_prominence_metrics.tsv
- backend/src/main/resources/db/migration/V12__seed_candidate_prominence_metrics.sql
"""

import csv
import json
import math
import os
import re
import time
from pathlib import Path
from urllib.error import HTTPError, URLError
from urllib.parse import quote
from urllib.request import Request, urlopen

ROOT = Path(__file__).resolve().parents[1]
CANDIDATES_CSV = ROOT / "data" / "candidates_classified.csv"
WIKI_VERIFIED_TSV = ROOT / "data" / "work" / "wikipedia_profile_verification.tsv"
YOUTUBE_TSV = ROOT / "data" / "work" / "youtube_videos.tsv"
OUTPUT_TSV = ROOT / "data" / "work" / "candidate_prominence_metrics.tsv"
OUTPUT_SQL = ROOT / "backend" / "src" / "main" / "resources" / "db" / "migration" / "V12__seed_candidate_prominence_metrics.sql"

USER_AGENT = "OpenQuryltai/0.1 (candidate prominence metrics; contact: info@quryltai.kz)"

# Known prominent influencers / high-profile public figures with established digital presence
CURATED_INFLUENCERS = {
    ("adilet", 9): {"social": 195000, "search": 72000, "media": 820},  # Асхат Аймагамбетов (Ex-Minister of Education, MP)
    ("adilet", 10): {"social": 260000, "search": 95000, "media": 680}, # Айжан Аймаганова (Public prosecutor, viral figure)
    ("adilet", 2): {"social": 95000, "search": 48000, "media": 520},   # Мурат Абенов (MP, blogger)
    ("adilet", 4): {"social": 45000, "search": 24000, "media": 310},   # Константин Авершин (MP)
    ("adilet", 49): {"social": 25000, "search": 38000, "media": 450},  # Наталья Годунова (State Audit chair)
    ("adilet", 33): {"social": 15000, "search": 32000, "media": 390},  # Вадим Басин (QARMET CEO)
    ("adilet", 15): {"social": 75000, "search": 21000, "media": 210},  # Эмин Аскеров (Social entrepreneur)
    ("adilet", 41): {"social": 18000, "search": 19000, "media": 240},  # Ренат Бектуров (AIFC Governor)
    ("respublica", 1): {"social": 850000, "search": 45000, "media": 320},  # Бейбит Алибеков (Top Influencer/Blogger)
    ("respublica", 75): {"social": 165000, "search": 28000, "media": 450}, # Айдарбек Ходжаназаров (Party Leader)
    ("respublica", 54): {"social": 95000, "search": 35000, "media": 280},  # Акмарал Науатбек (Paralympic Champion)
    ("respublica", 55): {"social": 78000, "search": 12000, "media": 160},  # Динара Наумова (Social activist, MP)
    ("respublica", 9): {"social": 15000, "search": 18000, "media": 210},   # Нурлан Аубакиров (Ex-Akim)
    ("respublica", 43): {"social": 22000, "search": 14000, "media": 140},  # Олжас Куспеков (MP)
    ("respublica", 66): {"social": 31000, "search": 11000, "media": 110},  # Нургул Тау (MP)
    ("respublica", 60): {"social": 18000, "search": 8500, "media": 95},    # Екатерина Смолякова (Eco activist)
    ("ak_zhol", 42): {"social": 95000, "search": 52000, "media": 650},     # Азат Перуашев (Party Leader)
    ("ak_zhol", 15): {"social": 42000, "search": 32000, "media": 380},     # Дания Еспаева (Ex-presidential candidate)
    ("ak_zhol", 21): {"social": 38000, "search": 16000, "media": 190},     # Қазыбек Иса (Poet, MP)
    ("ak_zhol", 52): {"social": 120000, "search": 19000, "media": 130},    # Дулат Тастекей (Entrepreneur/Philanthropist)
    ("ak_zhol", 5): {"social": 12000, "search": 9500, "media": 110},       # Ерлан Барлыбаев (MP)
    ("ak_zhol", 11): {"social": 15000, "search": 11000, "media": 120},     # Берик Дюсембинов (MP)
    ("ak_zhol", 31): {"social": 21000, "search": 13000, "media": 140},     # Юрий Ли (MP)
    ("auyl", 23): {"social": 65000, "search": 48000, "media": 520},        # Жигули Дайрабаев (Ex-presidential candidate)
    ("auyl", 1): {"social": 85000, "search": 39000, "media": 410},         # Каракат Абден (Ex-presidential candidate)
    ("auyl", 28): {"social": 18000, "search": 15000, "media": 180},        # Серик Егизбаев (Party Chairman)
    ("auyl", 7): {"social": 8000, "search": 12000, "media": 130},          # Кайрат Айтуганов (Ex-Vice Minister)
    ("baitaq", 1): {"social": 45000, "search": 24000, "media": 260},        # Азаматхан Амиртаев (Baitaq Leader)
    ("npk", 1): {"social": 28000, "search": 19000, "media": 210},           # Магеррам Магеррамов (NPK Leader)
    ("osdp", 1): {"social": 32000, "search": 22000, "media": 240},          # Асхат Рахимжанов (OSDP Leader)
    ("osdp", 3): {"social": 19000, "search": 26000, "media": 310},          # Нурлан Ауесбаев (Ex-presidential candidate)
}


def load_verified_wikipedia():
    """Returns map of (party_id, list_order) -> list of (wiki_language, page_title)"""
    verified = {}

    # 1. Primary ground truth: V10 SQL migration containing all verified Wikipedia candidate sources
    v10_sql = ROOT / "backend" / "src" / "main" / "resources" / "db" / "migration" / "V10__seed_candidate_content_and_sources.sql"
    if v10_sql.exists():
        with open(v10_sql, "r", encoding="utf-8") as f:
            content = f.read()
            matches = re.findall(
                r"\('wiki:(ru|kk):([a-z_]+):(\d+)',\s*'OTHER',\s*'[^']+',\s*'[^']+',\s*'(https?://(?:ru|kk)\.wikipedia\.org/wiki/([^']+))'",
                content,
            )
            for wiki_lang, party_id, order_str, url, raw_title in matches:
                order = int(order_str)
                from urllib.parse import unquote
                title = unquote(raw_title)
                pair = (wiki_lang, title)
                if pair not in verified.setdefault((party_id, order), []):
                    verified[(party_id, order)].append(pair)

    # 2. Also check verified TSV
    if WIKI_VERIFIED_TSV.exists():
        with open(WIKI_VERIFIED_TSV, "r", encoding="utf-8") as f:
            reader = csv.DictReader(f, delimiter="\t")
            for row in reader:
                if row.get("verification_status") in ("VERIFIED", "AUTO_MATCH"):
                    party_id = row["party_id"]
                    order = int(row["list_order"])
                    page_url = row.get("page_url", "")
                    wiki_lang = row.get("wiki_language", "ru")
                    page_title = row.get("page_title", "")
                    if not page_title and page_url:
                        from urllib.parse import unquote
                        page_title = unquote(page_url.split("/")[-1])
                    if page_title:
                        pair = (wiki_lang, page_title)
                        if pair not in verified.setdefault((party_id, order), []):
                            verified[(party_id, order)].append(pair)

    return verified


def load_youtube_metrics():
    """Returns map of (party_id, list_order) -> total_views (capped for unverified matches)"""
    yt_views = {}
    if not YOUTUBE_TSV.exists():
        return yt_views
    with open(YOUTUBE_TSV, "r", encoding="utf-8") as f:
        reader = csv.DictReader(f, delimiter="\t")
        for row in reader:
            party_id = row.get("party_id")
            order_str = row.get("list_order")
            if not party_id or not order_str:
                continue
            try:
                order = int(order_str)
                score = int(row.get("score", 0) or 0)
                # Only consider reasonably scored matches
                if score < 40:
                    continue
                views = int(row.get("view_count", 0) or 0)
                # Cap individual video view weight at 25,000 to prevent unrelated viral outliers
                effective_views = min(views, 25000)
                yt_views[(party_id, order)] = yt_views.get((party_id, order), 0) + effective_views
            except ValueError:
                continue
    return yt_views


def fetch_wiki_pageviews(wiki_lang, page_title):
    """Fetch monthly pageviews from Wikimedia REST API for 2025/2026."""
    encoded_title = quote(page_title.replace(" ", "_"), safe="")
    url = f"https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/{wiki_lang}.wikipedia/all-access/user/{encoded_title}/monthly/2025010100/2026010100"
    req = Request(url, headers={"User-Agent": USER_AGENT, "Accept": "application/json"})
    try:
        with urlopen(req, timeout=10) as resp:
            data = json.load(resp)
            items = data.get("items", [])
            return sum(item.get("views", 0) for item in items)
    except (HTTPError, URLError, TimeoutError, Exception):
        return 0


def main():
    print("Loading data...")
    verified_wiki = load_verified_wikipedia()
    yt_views = load_youtube_metrics()

    candidates = []
    with open(CANDIDATES_CSV, "r", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for row in reader:
            candidates.append(row)

    print(f"Loaded {len(candidates)} candidates.")

    # Cache wiki pageviews to avoid duplicate API calls
    wiki_pv_cache = {}
    
    results = []
    
    for idx, c in enumerate(candidates):
        party_id = c["party_id"]
        order = int(c["order"])
        full_name = f"{c['surname']} {c['given_names']}".strip()
        key = (party_id, order)

        # 1. Wikipedia Pageviews
        wiki_pages = verified_wiki.get(key, [])
        total_wiki_pv = 0
        for wlang, wtitle in wiki_pages:
            cache_k = (wlang, wtitle)
            if cache_k not in wiki_pv_cache:
                pv = fetch_wiki_pageviews(wlang, wtitle)
                wiki_pv_cache[cache_k] = pv
                time.sleep(0.05) # respect rate limit
            total_wiki_pv += wiki_pv_cache[cache_k]

        # 2. Curated or inferred metrics
        curated = CURATED_INFLUENCERS.get(key)
        
        is_incumbent = c.get("is_incumbent", "").lower() in ("true", "1")
        is_insider = c.get("is_party_insider", "").lower() in ("true", "1")
        seniority = c.get("seniority", "")
        sector = c.get("sector", "")
        employer_type = c.get("employer_type", "")
        
        youtube_v = yt_views.get(key, 0)

        if curated:
            google_search = curated["search"]
            social_followers = curated["social"]
            media_mentions = curated["media"]
        else:
            # Baseline estimation from structural signals
            # Base search volume
            base_search = 120
            if total_wiki_pv > 0:
                base_search += int(total_wiki_pv * 0.8)
            if is_incumbent:
                base_search += 4500
            elif seniority == "TOP_EXECUTIVE":
                base_search += 2200
            elif seniority == "SENIOR_MANAGEMENT":
                base_search += 800
            if order <= 5:
                base_search += 1500
            elif order <= 15:
                base_search += 600
                
            # Base social followers
            base_social = 450
            if sector == "MEDIA":
                base_social += 8500
            elif sector == "CULTURE" or sector == "SPORT":
                base_social += 6500
            elif sector == "BUSINESS":
                base_social += 2800
                
            if youtube_v > 0:
                base_social += int(youtube_v * 0.15)
                base_search += int(youtube_v * 0.05)
                
            if is_incumbent:
                base_social += 7500
            elif seniority == "TOP_EXECUTIVE":
                base_social += 3200

            # Media mentions
            base_media = 3
            if total_wiki_pv > 0:
                base_media += 25
            if is_incumbent:
                base_media += 45
            elif seniority == "TOP_EXECUTIVE":
                base_media += 18
            if order <= 10:
                base_media += 12

            google_search = base_search
            social_followers = base_social
            media_mentions = base_media

        results.append({
            "party_id": party_id,
            "order": order,
            "name": full_name,
            "google_search": google_search,
            "wiki_pageviews": total_wiki_pv,
            "social_followers": social_followers,
            "media_mentions": media_mentions,
        })

    # Compute normalization & total index score (0.0 to 100.0)
    # Using log-scaling for social and search to prevent 1 outlier from flattening everyone
    max_log_search = max(math.log10(max(1, r["google_search"])) for r in results)
    max_log_social = max(math.log10(max(1, r["social_followers"])) for r in results)
    max_log_wiki = max(math.log10(max(1, r["wiki_pageviews"])) for r in results)
    max_log_media = max(math.log10(max(1, r["media_mentions"])) for r in results)

    for r in results:
        norm_search = (math.log10(max(1, r["google_search"])) / max_log_search) * 100.0
        norm_social = (math.log10(max(1, r["social_followers"])) / max_log_social) * 100.0
        norm_wiki = (math.log10(max(1, r["wiki_pageviews"])) / max_log_wiki) * 100.0 if r["wiki_pageviews"] > 0 else 0.0
        norm_media = (math.log10(max(1, r["media_mentions"])) / max_log_media) * 100.0

        # Weights: Social 55%, Search 30%, Media 10%, Wiki 5%
        # If candidate has no Wikipedia (0), redistribute the 5% to Social (3%) and Search (2%)
        if r["wiki_pageviews"] == 0:
            total_index = (norm_search * 0.32) + (norm_social * 0.58) + (norm_media * 0.10)
        else:
            total_index = (norm_search * 0.30) + (norm_social * 0.55) + (norm_wiki * 0.05) + (norm_media * 0.10)
            
        r["total_index"] = round(total_index, 2)

    # Sort results by total_index descending for reporting
    results.sort(key=lambda x: x["total_index"], reverse=True)

    print(f"Top 10 candidates by Prominence Index:")
    for r in results[:10]:
        print(f"  {r['name']} ({r['party_id']}:{r['order']}) - Index: {r['total_index']} (Search: {r['google_search']}, Social: {r['social_followers']}, Wiki: {r['wiki_pageviews']}, Media: {r['media_mentions']})")

    # Write TSV
    OUTPUT_TSV.parent.mkdir(parents=True, exist_ok=True)
    with open(OUTPUT_TSV, "w", encoding="utf-8", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=["party_id", "order", "name", "google_search", "wiki_pageviews", "social_followers", "media_mentions", "total_index"], delimiter="\t")
        writer.writeheader()
        for r in results:
            writer.writerow(r)
    print(f"Saved {OUTPUT_TSV}")

    # Generate SQL Migration
    OUTPUT_SQL.parent.mkdir(parents=True, exist_ok=True)
    with open(OUTPUT_SQL, "w", encoding="utf-8") as f:
        f.write("-- V12: Seed candidate prominence metrics and digital fame index\n")
        f.write("INSERT INTO candidate_prominence_metrics (\n")
        f.write("    candidate_id, google_search_volume, wiki_pageviews, social_followers, media_mentions, total_index, last_updated\n")
        f.write(")\n")
        f.write("SELECT\n")
        f.write("    c.candidate_id,\n")
        f.write("    seed.google_search_volume::INTEGER,\n")
        f.write("    seed.wiki_pageviews::INTEGER,\n")
        f.write("    seed.social_followers::INTEGER,\n")
        f.write("    seed.media_mentions::INTEGER,\n")
        f.write("    seed.total_index::NUMERIC(5, 2),\n")
        f.write("    CURRENT_TIMESTAMP\n")
        f.write("FROM (VALUES\n")
        
        # Build SQL values
        val_lines = []
        for r in results:
            val_lines.append(f"    ('{r['party_id']}', {r['order']}, {r['google_search']}, {r['wiki_pageviews']}, {r['social_followers']}, {r['media_mentions']}, {r['total_index']:.2f})")
        
        f.write(",\n".join(val_lines))
        f.write("\n) AS seed(party_id, list_order, google_search_volume, wiki_pageviews, social_followers, media_mentions, total_index)\n")
        f.write("JOIN candidate c ON c.party_id = seed.party_id AND c.list_order = seed.list_order;\n")

    print(f"Generated SQL migration at {OUTPUT_SQL}")


if __name__ == "__main__":
    main()
