#!/usr/bin/env python3
"""Match current parliamentary candidates to the official Mazhilis directory."""

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
OUTPUT = ROOT / "data" / "work" / "parliament_incumbent_profiles.tsv"
REVIEW = ROOT / "data" / "work" / "parliament_incumbent_review.tsv"
API = "https://mazhilis.parlam.kz/api/core/deputies/by-alphabet/"
USER_AGENT = "OpenQuryltai/0.1 (official Parliament profile collection)"
TRANSLITERATION = str.maketrans({
    "а":"a","ә":"a","б":"b","в":"v","г":"g","ғ":"g","д":"d","е":"e","ё":"e","ж":"zh","з":"z","и":"i","й":"i","і":"i","к":"k","қ":"k","л":"l","м":"m","н":"n","ң":"n","о":"o","ө":"o","п":"p","р":"r","с":"s","т":"t","у":"u","ұ":"u","ү":"u","ф":"f","х":"h","һ":"h","ц":"ts","ч":"ch","ш":"sh","щ":"sh","ъ":"","ы":"y","ь":"","э":"e","ю":"yu","я":"ya",
})


def words(value):
    return re.findall(r"[a-z]+", value.casefold().translate(TRANSLITERATION))


def score(deputy, candidate):
    official = words(f"{deputy['last_name']} {deputy['first_name']} {deputy['patronymic']}")
    local = words(f"{candidate['surname']} {candidate['given_names']}")
    if len(official) < 2 or len(local) < 2:
        return 0.0
    similarity = difflib.SequenceMatcher
    surname = similarity(a=official[0], b=local[0]).ratio()
    given = similarity(a=official[1], b=local[1]).ratio()
    patronymic = similarity(a=official[2], b=local[2]).ratio() if len(official) > 2 and len(local) > 2 else 1.0
    return .55 * surname + .30 * given + .15 * patronymic


def best_match(candidate, deputies):
    ranked = sorted(((score(deputy, candidate), deputy) for deputy in deputies), reverse=True, key=lambda row: row[0])
    top, deputy = ranked[0]
    runner_up = ranked[1][0] if len(ranked) > 1 else 0
    return deputy, top, top-runner_up, "MATCHED" if top >= .84 and top-runner_up >= .04 else "NEEDS_REVIEW"


def download(url):
    with urlopen(Request(url, headers={"User-Agent":USER_AGENT}), timeout=60) as response:
        return response.read(), response.headers.get_content_type()


def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--upload-photos',action='store_true')
    parser.add_argument('--delay',type=float,default=1)
    args=parser.parse_args()
    with CANDIDATES.open(encoding='utf-8',newline='') as f:
        candidates=[row for row in csv.DictReader(f) if row['is_incumbent'].casefold()=='true']
    with urlopen(Request(API,headers={'User-Agent':USER_AGENT}),timeout=60) as response:
        groups=json.load(response)
    deputies=[deputy for group in groups for deputy in group['deputies'] if deputy.get('is_active')]
    rows,review=[],[]
    for candidate in candidates:
        deputy,match_score,margin,status=best_match(candidate,deputies)
        if status!='MATCHED':
            review.append({'party_id':candidate['party_id'],'list_order':candidate['order'],'candidate_name':f"{candidate['surname']} {candidate['given_names']}",'best_deputy_guess':f"{deputy['last_name']} {deputy['first_name']} {deputy['patronymic']}",'match_score':f'{match_score:.3f}','match_margin':f'{margin:.3f}','review_status':'NEEDS_IDENTITY_REVIEW'})
            continue
        avatar=deputy.get('avatar_url','').replace('http://','https://')
        party=(deputy.get('party') or {}).get('name','')
        committee=(deputy.get('committee') or {}).get('name','')
        row={'party_id':candidate['party_id'],'list_order':candidate['order'],'candidate_name':f"{candidate['surname']} {candidate['given_names']}",'parliament_deputy_id':deputy['id'],'official_name':f"{deputy['last_name']} {deputy['first_name']} {deputy['patronymic']}",'party_fraction':party,'committee':committee,'region':(deputy.get('region') or {}).get('name',''),'official_position':deputy.get('position',''),'official_source_url':API,'avatar_source_url':avatar,'facebook_url':deputy.get('facebook_link') or '','instagram_url':deputy.get('instagram_link') or '','youtube_url':deputy.get('youtube_link') or '','match_score':f'{match_score:.3f}','match_margin':f'{margin:.3f}','match_status':status,'photo_status':'NOT_REQUESTED','r2_key':'','public_photo_url':'','asset_rights_note':'Official Mazhilis directory source; no separate image license declaration found.','collected_at':time.strftime('%Y-%m-%dT%H:%M:%SZ',time.gmtime())}
        if args.upload_photos and avatar:
            image,content_type=download(avatar)
            suffix={'image/jpeg':'jpg','image/png':'png','image/webp':'webp'}.get(content_type)
            if suffix:
                key=f"{ASSET_PREFIX}/{candidate['party_id']}/{candidate['order']}/parliament.{suffix}"
                put_object(key,image,content_type)
                row.update({'photo_status':'UPLOADED','r2_key':key,'public_photo_url':f'https://assets.open-quryltai.org/{key}'})
            else: row['photo_status']=f'SKIPPED_UNSUPPORTED_TYPE:{content_type}'
        rows.append(row);time.sleep(args.delay)
    fields=['party_id','list_order','candidate_name','parliament_deputy_id','official_name','party_fraction','committee','region','official_position','official_source_url','avatar_source_url','facebook_url','instagram_url','youtube_url','match_score','match_margin','match_status','photo_status','r2_key','public_photo_url','asset_rights_note','collected_at']
    with OUTPUT.open('w',encoding='utf-8',newline='') as f:
        writer=csv.DictWriter(f,fieldnames=fields,delimiter='\t');writer.writeheader();writer.writerows(sorted(rows,key=lambda row:(row['party_id'],int(row['list_order']))))
    with REVIEW.open('w',encoding='utf-8',newline='') as f:
        writer=csv.DictWriter(f,fieldnames=['party_id','list_order','candidate_name','best_deputy_guess','match_score','match_margin','review_status'],delimiter='\t');writer.writeheader();writer.writerows(review)
    print(f'Wrote {len(rows)} matched incumbents -> {OUTPUT}')
    print(f'Wrote {len(review)} review rows -> {REVIEW}')

if __name__=='__main__': main()
