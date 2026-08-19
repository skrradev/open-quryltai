#!/usr/bin/env python3
"""Import Aq Jol's official 2026 candidate list and portraits into review data."""

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
SOURCE = ROOT / "data" / "work" / "ak_zhol_official_candidates.tsv"
OUTPUT = ROOT / "data" / "work" / "ak_zhol_candidate_profiles.tsv"
REVIEW = ROOT / "data" / "work" / "ak_zhol_candidates_review.tsv"
USER_AGENT = "OpenQuryltai/0.1 (official Aq Jol candidate asset collection)"
TRANSLITERATION = str.maketrans({
    "а": "a", "ә": "a", "б": "b", "в": "v", "г": "g", "ғ": "g", "д": "d", "е": "e", "ё": "e", "ж": "zh", "з": "z", "и": "i", "й": "i", "і": "i", "к": "k", "қ": "k", "л": "l", "м": "m", "н": "n", "ң": "n", "о": "o", "ө": "o", "п": "p", "р": "r", "с": "s", "т": "t", "у": "u", "ұ": "u", "ү": "u", "ф": "f", "х": "h", "һ": "h", "ц": "ts", "ч": "ch", "ш": "sh", "щ": "sh", "ъ": "", "ы": "y", "ь": "", "э": "e", "ю": "yu", "я": "ya",
})


def tokens(value):
    return re.findall(r"[a-z]+", value.casefold().translate(TRANSLITERATION))


def similarity(a, b):
    return difflib.SequenceMatcher(a=a, b=b).ratio()


def score(name, candidate):
    source = tokens(name)
    target = tokens(f"{candidate['surname']} {candidate['given_names']}")
    if len(source) < 2 or len(target) < 2:
        return 0.0
    surname, given = similarity(source[0], target[0]), similarity(source[1], target[1])
    patronymic = similarity(source[2], target[2]) if len(source) > 2 and len(target) > 2 else 1.0
    return .55 * surname + .30 * given + .15 * patronymic


def best_match(name, candidates):
    ranked = sorted(((score(name, candidate), candidate) for candidate in candidates), reverse=True, key=lambda item:item[0])
    top, candidate = ranked[0]
    second = ranked[1][0] if len(ranked) > 1 else 0.0
    return candidate, top, top-second, "MATCHED" if top >= .84 and top-second >= .04 else "NEEDS_REVIEW"


def download(url):
    with urlopen(Request(url, headers={"User-Agent": USER_AGENT}), timeout=60) as response:
        return response.read(), response.headers.get_content_type()


def extension(content_type):
    return {"image/jpeg":"jpg", "image/png":"png", "image/webp":"webp"}.get(content_type)


def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--upload-photos',action='store_true')
    parser.add_argument('--delay',type=float,default=1)
    args=parser.parse_args()
    with CANDIDATES.open(encoding='utf-8',newline='') as f:
        candidates=[row for row in csv.DictReader(f) if row['party_id']=='ak_zhol']
    with SOURCE.open(encoding='utf-8',newline='') as f:
        source_rows=list(csv.DictReader(f,delimiter='\t'))
    matched, review = [], []
    for source in source_rows:
        name, summary = source['official_candidate_text_kk'].split(' - ', 1)
        candidate, match_score, margin, status=best_match(name,candidates)
        if status != 'MATCHED':
            review.append({'official_name_kk':name,'official_summary_kk':summary,'best_candidate_guess':f"{candidate['surname']} {candidate['given_names']}",'match_score':f'{match_score:.3f}','match_margin':f'{margin:.3f}','review_status':'NEEDS_IDENTITY_REVIEW','official_source_url':source['official_source_url']})
            continue
        row={'party_id':'ak_zhol','list_order':candidate['order'],'candidate_name':f"{candidate['surname']} {candidate['given_names']}",'official_name_kk':name,'official_summary_kk':summary,'official_source_url':source['official_source_url'],'photo_source_url':source['photo_source_url'],'match_score':f'{match_score:.3f}','match_margin':f'{margin:.3f}','match_status':status,'photo_status':'NOT_REQUESTED','r2_key':'','public_photo_url':'','asset_rights_note':'Official Aq Jol party source; no separate image license declaration found.','collected_at':time.strftime('%Y-%m-%dT%H:%M:%SZ',time.gmtime())}
        if args.upload_photos:
            image, content_type=download(row['photo_source_url'])
            suffix=extension(content_type)
            if suffix:
                key=f"{ASSET_PREFIX}/ak_zhol/{candidate['order']}.{suffix}"
                put_object(key,image,content_type)
                row.update({'photo_status':'UPLOADED','r2_key':key,'public_photo_url':f'https://assets.open-quryltai.org/{key}'})
            else: row['photo_status']=f'SKIPPED_UNSUPPORTED_TYPE:{content_type}'
        matched.append(row)
        time.sleep(args.delay)
    fields=['party_id','list_order','candidate_name','official_name_kk','official_summary_kk','official_source_url','photo_source_url','match_score','match_margin','match_status','photo_status','r2_key','public_photo_url','asset_rights_note','collected_at']
    with OUTPUT.open('w',encoding='utf-8',newline='') as f:
        writer=csv.DictWriter(f,fieldnames=fields,delimiter='\t');writer.writeheader();writer.writerows(sorted(matched,key=lambda row:int(row['list_order'])))
    with REVIEW.open('w',encoding='utf-8',newline='') as f:
        writer=csv.DictWriter(f,fieldnames=['official_name_kk','official_summary_kk','best_candidate_guess','match_score','match_margin','review_status','official_source_url'],delimiter='\t');writer.writeheader();writer.writerows(review)
    print(f'Wrote {len(matched)} matched Aq Jol candidate profiles -> {OUTPUT}')
    print(f'Wrote {len(review)} unlinked profiles -> {REVIEW}')

if __name__=='__main__': main()
