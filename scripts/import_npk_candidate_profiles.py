#!/usr/bin/env python3
"""Match official NPK team biographies and portraits to the candidate list."""

import argparse
import csv
import difflib
import json
import re
import time
from pathlib import Path
from urllib.request import Request, urlopen

from upload_r2_assets import ASSET_PREFIX, put_object

ROOT=Path(__file__).resolve().parents[1]
CANDIDATES=ROOT/'data'/'candidates_classified.csv'
OUTPUT=ROOT/'data'/'work'/'npk_candidate_profiles.tsv'
REVIEW=ROOT/'data'/'work'/'npk_team_review.tsv'
API='https://halykpartiyasy.kz/api/v1/team'
SITE='https://halykpartiyasy.kz'
USER_AGENT='OpenQuryltai/0.1 (official NPK profile collection)'
TRANSLITERATION=str.maketrans({"а":"a","ә":"a","б":"b","в":"v","г":"g","ғ":"g","д":"d","е":"e","ё":"e","ж":"zh","з":"z","и":"i","й":"i","і":"i","к":"k","қ":"k","л":"l","м":"m","н":"n","ң":"n","о":"o","ө":"o","п":"p","р":"r","с":"s","т":"t","у":"u","ұ":"u","ү":"u","ф":"f","х":"h","һ":"h","ц":"ts","ч":"ch","ш":"sh","щ":"sh","ъ":"","ы":"y","ь":"","э":"e","ю":"yu","я":"ya"})


def words(value): return re.findall(r'[a-z]+',value.casefold().translate(TRANSLITERATION))
def score(name,candidate):
    official,local=words(name),words(f"{candidate['surname']} {candidate['given_names']}")
    if len(official)<2 or len(local)<2:return 0
    ratio=difflib.SequenceMatcher
    surname=ratio(a=official[0],b=local[0]).ratio(); given=ratio(a=official[1],b=local[1]).ratio()
    patronymic=ratio(a=official[2],b=local[2]).ratio() if len(official)>2 and len(local)>2 else 1
    return .55*surname+.30*given+.15*patronymic

def match(name,candidates):
    ranked=sorted(((score(name,c),c) for c in candidates),reverse=True,key=lambda row:row[0])
    top,candidate=ranked[0]; margin=top-(ranked[1][0] if len(ranked)>1 else 0)
    return candidate,top,margin,'MATCHED' if top>=.84 and margin>=.04 else 'NEEDS_REVIEW'

def download(url):
    with urlopen(Request(url,headers={'User-Agent':USER_AGENT}),timeout=60) as response:return response.read(),response.headers.get_content_type()

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--upload-photos',action='store_true');parser.add_argument('--delay',type=float,default=1);args=parser.parse_args()
    with CANDIDATES.open(encoding='utf-8',newline='') as f:candidates=[r for r in csv.DictReader(f) if r['party_id']=='npk']
    with urlopen(Request(API,headers={'User-Agent':USER_AGENT}),timeout=60) as r:team=json.load(r)
    rows,review=[],[]
    for member in team:
        candidate,match_score,margin,status=match(member['name'],candidates)
        if status!='MATCHED':
            review.append({'official_name':member['name'],'official_position':member.get('position',''),'best_candidate_guess':f"{candidate['surname']} {candidate['given_names']}",'match_score':f'{match_score:.3f}','match_margin':f'{margin:.3f}','review_status':'NEEDS_IDENTITY_REVIEW','official_source_url':API});continue
        photo=SITE+member['photoUrl'] if member.get('photoUrl','').startswith('/') else member.get('photoUrl','')
        row={'party_id':'npk','list_order':candidate['order'],'candidate_name':f"{candidate['surname']} {candidate['given_names']}",'official_name':member['name'],'official_position':member.get('position',''),'official_summary_ru':member.get('bio',''),'biography_ru':member.get('fullBio',''),'official_source_url':API,'photo_source_url':photo,'match_score':f'{match_score:.3f}','match_margin':f'{margin:.3f}','match_status':status,'photo_status':'NOT_REQUESTED','r2_key':'','public_photo_url':'','asset_rights_note':'Official NPK party source; no separate image license declaration found.','collected_at':time.strftime('%Y-%m-%dT%H:%M:%SZ',time.gmtime())}
        if args.upload_photos and photo:
            image,content_type=download(photo); suffix={'image/jpeg':'jpg','image/png':'png','image/webp':'webp'}.get(content_type)
            if suffix:
                key=f"{ASSET_PREFIX}/npk/{candidate['order']}/npk-team.{suffix}";put_object(key,image,content_type);row.update({'photo_status':'UPLOADED','r2_key':key,'public_photo_url':f'https://assets.open-quryltai.org/{key}'})
            else:row['photo_status']=f'SKIPPED_UNSUPPORTED_TYPE:{content_type}'
        rows.append(row);time.sleep(args.delay)
    fields=['party_id','list_order','candidate_name','official_name','official_position','official_summary_ru','biography_ru','official_source_url','photo_source_url','match_score','match_margin','match_status','photo_status','r2_key','public_photo_url','asset_rights_note','collected_at']
    with OUTPUT.open('w',encoding='utf-8',newline='') as f:w=csv.DictWriter(f,fieldnames=fields,delimiter='\t');w.writeheader();w.writerows(sorted(rows,key=lambda r:int(r['list_order'])))
    with REVIEW.open('w',encoding='utf-8',newline='') as f:w=csv.DictWriter(f,fieldnames=['official_name','official_position','best_candidate_guess','match_score','match_margin','review_status','official_source_url'],delimiter='\t');w.writeheader();w.writerows(review)
    print(f'Wrote {len(rows)} matched NPK profiles -> {OUTPUT}');print(f'Wrote {len(review)} unlinked NPK team profiles -> {REVIEW}')
if __name__=='__main__':main()
