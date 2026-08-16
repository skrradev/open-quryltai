# Candidate enrichment handoff

## Status at handoff

The enrichment work is **research data only**. None of the TSV data is wired into
backend tables, API DTOs, or the UI. Only identity-verified matches should move
into product data.

### Completed coverage

| Party | Candidates | primary photos | RU biographies | KK biographies |
|---|---:|---:|---:|---:|
| `adilet` | 186 | 18 | 0 | 0 |
| `ak_zhol` | 63 | 63 | 0 | 0 |
| `auyl` | 69 | 5 | 0 | 0 |
| `baitaq` | 47 | 47 | 46 | 10 |
| `npk` | 72 | 5 | 5 | 0 |
| `osdp` | 33 | 4 | 0 | 0 |
| `respublica` | 75 | 9 | 5 | 5 |
| **total** | **545** | **151** | **51** | **15** |

`ak_zhol` has an official Kazakh short role/position for all 63 candidates, but
not long-form biographies, therefore it is not counted in biography coverage.

## Canonical working datasets

- `baitaq_candidate_profiles.tsv`: 47 official party profiles; 47 photos; 46 RU
  biographies and 10 KK biographies.
- `ak_zhol_candidate_profiles.tsv`: all 63 official candidate cards and their
  cleaned primary portraits. `official_summary_kk` is a verified short role,
  not a full biography.
- `respublica_candidate_profiles.tsv`: 9 confident official leadership/fraction
  matches; 5 long biographies in RU and KK.
- `auyl_candidate_profiles.tsv`: 5 confident current-fraction matches with
  official party portraits and links to Parliament biographies.
- `npk_candidate_profiles.tsv`: 5 confident leadership matches, each with a
  detailed official Russian biography.
- `parliament_incumbent_profiles.tsv`: 37 current Mazhilis matches, with
  official committee/fraction/position and social links.
- `parliament_primary_photo_promotions.tsv`: 23 Parliament portraits promoted
  to primary photos only because no previously collected primary photo existed.
- `verified_candidate_biographies.tsv`: prior strict Wikipedia verification
  research and Wikimedia photo metadata.
- `youtube_videos.tsv`: proposal queue only; no videos are product-verified.

## R2 asset conventions

- Main candidate photo: `candidates/<party_id>/<list_order>.<ext>`.
- Official Parliament alternative: `candidates/<party_id>/<list_order>/parliament.<ext>`.
- Official leadership alternative: `candidates/npk/<list_order>/npk-team.<ext>`.
- All R2 credentials are local `.env` secrets and must never be committed or
  printed. Bucket is supplied at runtime as `CLOUDFLARE_R2_BUCKET=assets-quryltai`.
- For "Ak Zhol", original framed campaign cards were replaced by cropped primary
  portraits at `candidates/ak_zhol/<list_order>.jpg`. The CDN may still have
  stale cached cards for non-query URLs. A Cloudflare cache purge for
  `/candidates/ak_zhol/*` is still needed. No Cloudflare API token is in `.env`.

## Safety and identity rules

1. Never attach a profile/photo based on a name alone. Require full name and a
   Kazakhstan political/professional context, or a first-party source.
2. Keep ambiguous records in `*_review.tsv`; do not publish them.
3. Official photos have source attribution but generally no explicit free-use
   license. Preserve source URL and rights note.
4. Wikimedia photos are only uploaded when a free/public-domain license was
   verified.
5. Do not restart mass Google searching: it previously returned an unusual
   traffic/CAPTCHA page. Use official sites, public APIs, Parliament, MediaWiki,
   and manual browser review instead.

## Current review queues

- `respublica_official_profiles_review.tsv`: 19 official Respublica profiles not
  safely linked to this candidate list.
- `auyl_deputies_review.tsv`: 3 current faction deputies not in the 2026 list.
- `parliament_incumbent_review.tsv`: 4 `is_incumbent` rows not confidently
  matched to the current Mazhilis API.
- `npk_team_review.tsv`: 2 official NPK team members not in the party list.

## Recommended next work

1. Discover an official photo/profile catalogue for `osdp` (33), then `adilet`
   (186). These have the largest remaining photo gaps after `auyl`.
2. For the remaining `auyl` candidates, use regional party branches, maslikhat,
   employer, and akimat sources; the party site has only the current 8-member
   Mazhilis fraction and no full candidate directory.
3. Create a database migration after `V4` for biographies, sources, photos,
   social links, and review status. `V4__create_candidate_external_profile.sql`
   was already untracked before this work; inspect it before changing it.
4. Add backend/API/UI support only for verified records; do not import raw TSV
   suggestions directly.
5. Prepare neutral Russian and Kazakh biographies from the same fact set.

## Verification commands

```sh
python3 -m py_compile scripts/*.py
CLOUDFLARE_R2_BUCKET=assets-quryltai python3 scripts/import_parliament_incumbent_profiles.py --delay 0
```

The second command refreshes research output from the official Mazhilis API but
does not upload unless `--upload-photos` is added.
