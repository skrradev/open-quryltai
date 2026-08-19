# Candidate enrichment handoff

## Status at handoff

Two separate bodies of work live in this document; do not confuse their maturity.

1. **Candidate enrichment** (most of this file) is **research data only**. None of
   the TSV data is wired into backend tables, API DTOs, or the UI. Only
   identity-verified matches should move into product data.
2. **Programme content analysis** is **shipped**: annotated, aggregated,
   migrated, served and rendered. See "Programme content analysis" below for what
   it measures, what is contested in it, and what must not be published.

### Completed coverage

| Party | Candidates | primary photos | RU biographies | KK biographies |
|---|---:|---:|---:|---:|
| `adilet` | 186 | 35 | 1 | 1 |
| `ak_zhol` | 63 | 63 | 0 | 0 |
| `auyl` | 69 | 5 | 0 | 0 |
| `baitaq` | 47 | 47 | 46 | 10 |
| `npk` | 72 | 9 | 5 | 0 |
| `osdp` | 33 | 6 | 0 | 0 |
| `respublica` | 75 | 9 | 5 | 5 |
| **total** | **545** | **174** | **57** | **16** |

Photo counts are a **deduplicated union** over `(party_id, list_order)` across
`*_candidate_profiles.tsv`, `senate_incumbent_profiles.tsv`,
`parliament_incumbent_profiles.tsv`,
`parliament_primary_photo_promotions.tsv`, and
`verified_candidate_biographies.tsv`. An earlier version of this table
undercounted `npk` (5 instead of 9) by omitting the Parliament portraits, which
are disjoint from the 5 party-leadership rows. `respublica` stays at 9 because
its Parliament and Wikimedia photos all fall inside the 9 profile rows.

`ak_zhol` has an official Kazakh short role/position for all 63 candidates, but
not long-form biographies, therefore it is not counted in biography coverage.

## Canonical working datasets

- `adilet_candidate_profiles.tsv`: 13 Bureau of the Political Council matches
  from the official party site, all 13 net-new photos (no overlap with the 18
  Parliament portraits), plus a full RU and KK biography for chairman
  `list_order` 54. Collected by manual browser review, not by a script, so
  `match_score` and `match_margin` are empty: each row was confirmed by exact
  surname plus given name **and** a corroborating official role, not by the
  fuzzy scorer used for `respublica` and `npk`. One row to re-check before
  publishing: `list_order` 74 (Закиева Динара Болатовна), where the party site
  gives "Уполномоченный по правам ребёнка в РК" while the candidate record says
  "соучредитель Благотворительного фонда «Қасиетті жол»" — both are public
  roles of the same person, but the roles do not corroborate each other.
- `senate_incumbent_profiles.tsv`: the 4 `adilet` candidates that
  `parliament_incumbent_review.tsv` could not match. **They are Senate
  deputies, not Mazhilis deputies**, which is the whole reason the matcher
  failed: `import_parliament_incumbent_profiles.py:19` queries only
  `mazhilis.parlam.kz/api/core/deputies/by-alphabet/`, so no amount of score
  tuning would ever have found them, and the `best_deputy_guess` values in the
  review file are meaningless Mazhilis names. All 4 matched on the full
  three-part name, and each deputy's own page states "Депутат Сената Парламента
  Республики Казахстан", matching `position_ru` in the migration verbatim.
  Senate has no JSON API — `senate.parlam.kz/api/...` returns the SPA HTML
  shell — so this was collected from the rendered `/{lang}/about/deputies`
  roster (49 portraits) plus each `/{lang}/blog/<id>/biography` page.
- `osdp_candidate_profiles.tsv`: 2 confident leadership matches with official
  `osdp.kz` portrait source URLs; photos not yet downloaded.
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

## Photo schema

`V5__create_candidate_photo.sql` adds `candidate_photo`, the first place in the
schema where a portrait can live — before it, `photo`/`avatar`/`thumb`/`image`
appeared nowhere in `backend/src/main`, and `CandidateDto` had no such field.

Biographies deliberately got no new columns: they already have a home in
`candidate_content` (`section_type = 'BIOGRAPHY'`, one row per language), and
coverage is too thin to model further — 57 RU and 16 KK across 545 candidates,
and very unevenly spread. `baitaq` is 46/47 (98%) while `adilet` is 1/186.

One row per `(candidate_id, photo_role)`, roles `PRIMARY` / `PARLIAMENT` /
`PARTY_TEAM`, mirroring the three R2 key shapes. `thumb_r2_key` points at the
list-view thumbnail. Provenance and rights travel with the row:
`source_kind`, `source_url`, `embedded_author`, `embedded_copyright`,
`photo_taken`, `rights_note`.

Two guard constraints, both verified against a real Postgres 16 by applying
`V1`-`V5` in order and exercising positive and negative cases:

- `ck_candidate_photo_reviewed` — anything past `DRAFT` needs `reviewed_at`,
  matching the same rule in `candidate_content` and `candidate_source`.
- `ck_candidate_photo_rights_gate` — `PUBLISHED` requires `rights_cleared`.
  **This deliberately blocks publishing by default.** No collected portrait has
  an explicit free-use licence, and one Senate original asserted a
  photographer's copyright outright, so clearance is an explicit act rather than
  the default. Drop this constraint if that is too strict for the product.

`V5__add_candidate_source_review.sql` was folded into `V4` and deleted, since the
migrations had never been applied anywhere: `candidate_source` is now created
with `review_status`/`reviewed_at` and the filtered index directly, instead of
being created and immediately altered. The photo migration took the freed `V5`
slot. Note for anyone with a database predating this: the `V4` checksum changed.

## PNG photos converted to JPEG

PNG is a poor container for a photograph: after the 1024 px pass the 15 remaining
PNGs were the largest objects in the bucket, up to 1.3 MB each.
`scripts/convert_png_photos.py` re-encoded all 15 as JPEG at the same pixel
dimensions — **10.0 MB -> 1.9 MB (19%)**. There are now **no PNG objects left**,
and the largest photo in the bucket is 286 KB.

Unlike the resize, converting **changes the object key**, so the script also
retargets every `r2_key` / `public_photo_url` that pointed at a converted object:
29 references across `baitaq_candidate_assets.tsv`,
`baitaq_candidate_profiles.tsv`, `respublica_candidate_profiles.tsv` and
`verified_candidate_biographies.tsv`.

Four conversions collided with an existing `.jpg` — the `respublica` Wikimedia
photos. The script refuses to overwrite a colliding key unless it recognises it as
a known Wikimedia object, and relocates it first; see the section on that above.
Order matters and is enforced: Wikimedia objects move out before the converted
party photos are written into the keys they used to occupy.

`WIKIMEDIA` was added to the `photo_role` CHECK in `V5`, and the `wikimedia`
variant to the alternative-key pattern in the seed generator, the normaliser and
the pruner. Miss that last part and relocated objects silently vanish from the
seed instead of failing loudly.

## Segmenter fixes after the pilot

All defects annotator A logged while coding are fixed, and the two that were not
are recorded as known limits.

- **Stray page numbers.** Ghostscript emits the page number in reading order, so
  it lands mid-paragraph: "приоритет охраны\n21\nприроды". The rule is narrow on
  purpose — drop a line that is *nothing but this page's own number*. Әділет's
  "2,5% ЦЕЛЬ 5" and its contents entries survive, because they are not bare lines.
- **Word field codes** (`PAGEREF _Toc… \h`, `TOC \o "1-3"`) stripped from .docx.
- **Initials no longer end a sentence**, so "Академии имени Ы. Алтынсарина" stays
  one unit. Zero truncations remain.
- **Verbatim repeats inside one document** are reclassified structural; five in Ak
  Zhol came from a repeated page element and would have inflated its totals.
- `lead_in` (35) and `fragment` (10) are implemented and excluded from the
  denominator.
- `has_number` and `has_deadline` are now derived, per codebook §3.1: 293 units
  (10%) carry a number, 33 (1%) a deadline. That 1% is exactly the skew that makes
  alpha meaningless on this field, which is why §8 now bars it there.

Two things deliberately **not** fixed:

- **Words split mid-token** ("п олитики" from letter-spaced PDF text). A detector
  for it cannot distinguish a split word from a normal one-letter Russian
  preposition — my first attempt flagged 4013 cases, almost all of them "и
  адресная", "в новый". Without a dictionary this would corrupt more than it
  repairs, so it stays as a known defect.
- The Әділет contents entries ("1 Закон и Порядок 7") are still substantive-looking
  units. They are caught by the structural classifier only when upper-case.

Counts after the fixes: 3372 units, 2962 substantive. The pilot sheets were
generated from the previous text and verified to still match it unit for unit
(175/175) before these changes; the next pilot round must be drawn fresh.

## Pilot annotation: done, codebook revised

Annotator A is Claude, annotator B is **gpt-5.5, pinned as
`gpt-5.5-2026-04-23`** — the floating alias is not used, because codebook §3
requires the annotator to stay identifiable and "gpt-5.5" will mean something
else later. `scripts/annotate_pilot_gpt.py` sends the model exactly what the
human sheet carries: the codebook, the one-page instruction, nothing more. Extra
hints would make the agreement figure a measure of our prompting rather than of
the codebook. Raw responses and token usage are kept in `pilot_b_raw.jsonl`, and
the run is resumable.

**This is two models, not two humans, and it does not satisfy codebook §9.**
Agreement here says the codebook is machine-followable. Whether it is reliable
for people is a separate question that still needs a human pair before any number
from this corpus is published. A already annotated all 175 units before B was
read, so the two passes are independent in the only sense available.

Results are in `data/work/pilot/RESULTS.md`. Headline: `unit_kind` α 0.909,
`topic_primary` α 0.799 — **0.001 under the threshold, not rounded up** — and
`has_deadline` α −0.000, which turned out to be an artefact rather than a
finding: on units both called substantive there were 3 disagreements out of 140.
The coefficient collapsed because 34 structural units had a blank-versus-zero
convention gap, and because a field where one value holds 97% of cases cannot be
scored by alpha at all. `has_number` matched a plain "contains a digit" regex 93%
of the time, so both fields now leave manual annotation and are derived by script.

Codebook 1.2 adds `lead_in` and `fragment` unit kinds (both outside the
denominator), draws the T04/T09 boundary at employment, and forbids T99 for
context-dependent units — T99 was the worst field at α 0.445 because it collected
both "policy with no matching topic" and "meaning lives in the neighbouring
unit". **The 1.1 coefficients do not carry over to 1.2**; agreement must be
re-measured on a fresh sample, and the human pair §9 requires has still not run.

`scripts/score_pilot_agreement.py` computes Krippendorff's alpha per field,
one-vs-rest alpha per topic, percent agreement, the topic confusion matrix and a
line-by-line disagreement file, and reports each against the §8 thresholds fixed
before coding. It deliberately reports agreement rather than precision or recall:
neither annotator is a gold standard, and the latter wording would imply one of
them is right. Blank values are kept as their own category rather than dropped,
or the topic field would be scored only on units both annotators happened to call
substantive.

Extraction defects annotator A logged while coding, which the segmenter should
handle before the main pass:

- Page numbers land inside sentences: "охраны 21 природы", "Цифровые права 23",
  "а 7", and a lead-in reading "36 Мы предлагаем:".
- A Word field survived into the text: `PAGEREF _Toc233190662 \h`.
- Words split mid-token: "п олитики".
- An initial ends a sentence: "Академии имени Ы." truncates a unit, because the
  splitter treats "Ы." as a full stop.
- List lead-ins ("Исходя из этого МЫ будем:") become their own units, and the
  codebook has no unit_kind for them.

## Pilot sample

`scripts/make_pilot_sample.py` draws the codebook's pilot: 175 units, **25 per
party**, seed 20260818, reproducible by re-running with the same seed. Sheets and
key live in `data/work/pilot/` — gitignored, since they carry programme text.

Three deliberate choices:

- **Equal per party, not proportional.** Әділет alone is 41% of all units, so a
  proportional pilot would test the codebook mainly against one writing style.
- **Spread across position bands, not consecutive.** Neighbouring units share a
  topic and would inflate agreement.
- **One unit in six is rhetorical or structural**, so the pilot also audits the
  segmenter's mechanical `unit_kind` rather than only the human-coded fields.

Blinding is partial and labelled as such: `party_id` is withheld from the sheets,
but a programme names itself, so a unit reading "«Әділет» — политическая опора
курса" identifies its party regardless. The default cue is removed; blindness is
not claimed.

`pilot/README.md` is the annotator's one-page instruction. It says the thing that
matters most: **the `notes` column is the actual output of the pilot.** The point
is not to code 175 units, it is to find where the codebook is silent or
self-contradictory, while it can still be changed. Annotators are told to set
`unclear = 1` freely, because ambiguity suppressed at the pilot resurfaces during
the main pass when the rules are frozen.

Not yet written: the agreement scorer (Krippendorff's alpha per field and per
topic, plus a confusion matrix). It is needed only once both sheets come back,
and the thresholds it will be judged against are already fixed in codebook §8.

## Annotation codebook

`data/work/program_codebook.md` is written **before** any annotation and frozen
before it starts. It is in Russian, unlike the rest of these notes, because it is
both the annotator's working instrument and a public methods document for the
readers it has to convince — the numbers are only defensible if the rules behind
them can be read by the people the analysis is about.

The design follows the advice we sought on method, and it changed one assumption
of ours: reproducibility does not require avoiding an LLM. It requires publishing
**unit-level annotations with offsets** and an open aggregation script. A third
party fetches the document by the recorded URL, verifies the sha256, applies the
offsets and re-derives every number. The model becomes part of production rather
than part of the published claim — and the programme texts are still never
republished, only offsets and labels.

Design decisions worth not re-litigating:

- **14 broad topics, not 56.** The Manifesto Project's fine-grained scheme has
  documented reliability problems even with trained coders; we have none.
- **Topic, statement type and stance are separate fields.** "Inflation is high"
  and "we will cut inflation to 4% by 2028" must not land in the same bucket.
- **Stance is coded per narrowly-stated question, never per topic.** There is no
  single defensible "position on the economy".
- **`not_found` is a first-class result** and is shown to the reader as "no
  explicit position found in the programme" — never as neutrality or opposition.
- **Rhetorical and structural units are excluded from the denominator** and
  counted separately, so a party is not credited for headings and slogans.
- **Numerator and denominator are always shown** with any share.
- Publication thresholds are declared in advance (§8): α ≥ 0.80 to publish a
  number, 0.667-0.799 as approximate only, below that not at all, and every
  published stance additionally needs each supporting unit checked by hand.

Costs to plan for, because they dominate: a 150-200 unit pilot with two
independent annotators, a ~1400-unit holdout, and manual verification of all 545
derived candidate classifications (`sector`, `employer_type`, `is_party_insider`).
The compute is trivial; the human validation is the project.

Not started and not to be started without an explicit decision: the standardised
questionnaire to the seven parties. That is outreach from the project to
political organisations during a campaign, not an engineering task.

## Programme texts: collected 7/7, and how

`scripts/collect_party_programs.py` collects all seven, caching them to
`data/work/programs/` — **gitignored, never committed and never loaded into the
database.** We publish counts derived from the texts and link to the source;
republishing the documents is not ours to do. `data/work/party_programs.tsv` holds
source URL, document URL, extraction method, length and sha256 per party.

| party | chars | route |
|---|---:|---|
| `adilet` | 157409 | official PDF linked from `/ru/kurultai/program` |
| `ak_zhol` | 50547 | server-rendered HTML |
| `npk` | 47484 | `/documents/program-ru.pdf` |
| `baitaq` | 38266 | `/docs/Baytaq Платформа 2026 Рус.pdf` |
| `osdp` | 34332 | `/storage/app/media/programma-rus-na-sayt.pdf` |
| `respublica` | 26987 | PDF on the **api.** host |
| `auyl` | 22303 | `/docs/programma-ru.docx` (Russian edition) |

Text extraction is `gs -sDEVICE=txtwrite`; ghostscript is the only PDF tool on
this machine — no pypdf, pdfminer or pdftotext, and `Read` needs poppler.

**Four of the seven documents are reachable only by direct URL** — nothing on the
party site links to them. That produced a wrong conclusion worth remembering:
probing NPK's site found `/api/v1/pages/program` reporting the page as published
but empty, and it was recorded as "this party has no programme". The party has a
47k-character programme; it simply is not wired to that page. **An empty page is
not evidence of an absent document.**

Three collection traps, each of which produced a plausible-looking wrong answer
before being caught:

- **Excerpt served as document.** OSDP's HTML page carries a 4k excerpt of a 34k
  programme, and adilet's `/ru/kurultai/program` renders four summary chapters —
  24k — while linking a 157k document. Adilet's page mentions образование 6 times
  against the document's 41. Either would have silently under-counted a party on
  every theme.
- **Wrong document entirely.** baitaq's Next.js payload yields 98k characters that
  read like prose but are the party charter and privacy policy (26 mentions of
  Устав, filial staffing, disciplinary procedure).
- **Wrong election.** A gov.kz PDF of baitaq's programme exists under
  `/uploads/2023/`; it mentions 2023-2025 and never 2026. The 2026 platform is a
  different document on the party's own site.

Soft 200s are the mechanism behind most of this: `auyl/program` and three of
OSDP's five candidate URLs return the homepage with status 200, so the collector
gates on length and on hits against nine topic stems rather than on status.

Programme lengths differ 7x (157k to 22k). Any thematic share must be shown with
the absolute volume beside it, or a short programme reads as heavyweight as a
detailed one.

## Party programmes are not filed with the CEC

Checked directly, because it is the obvious place to look for a single
authoritative set of programme texts: the official list of documents parties
submit — `/upload/docs/2026/perechandocpartQurul/` from the `party_docs` section
of the Kurultai banner — has nine items, and **the pre-election programme is not
one of them**. Party decision, Ministry of Justice registration copy, the list
itself, consent statements, biographical data, membership proof, disability
certificates, tax declarations, electoral deposit. Nothing else.

That is why "программ" appears zero times anywhere in the CEC's Kurultai section,
and why programme texts have to be collected from seven different party sites with
seven different extraction paths. Do not go looking on election.gov.kz again.

Three facts from that same document that bear on the metrics:

- **There is no 30% quota for women.** Women, youth and persons with disabilities
  must together make up at least 30% of a list. Women alone are 32% and under-35s
  12%, so the combined norm is met with room to spare — any wording implying a
  gender-specific quota is wrong.
- **"Политические партии самостоятельно определяют порядок размещения лиц в
  партийном списке."** List order is an explicit party decision, not a procedural
  by-product. That is what makes the position metric meaningful rather than
  incidental.
- **A list may exceed the number of mandates by at most 30%.** Әділет's 186 names
  therefore imply at least 143 Kurultai mandates, and their list sits at the legal
  ceiling. This is a legal bound, not a projection, so it is usable — unlike a
  seat forecast.

## Party comparison metrics

`scripts/compute_party_metrics.py` derives every comparative metric from
`V3__create_candidate.sql` — the CEC appendix, field for field — into
`data/work/party_metrics.json` (charts) and `party_metrics.tsv` (review).
`scripts/render_party_metrics_report.py` renders 11 charts from that JSON.

**The design constraint: every value is a count or a share of an official registry
field. No axis scores a party.** An axis a reader cannot re-derive from the
migration is an opinion wearing a chart's clothes. Deliberately absent, and both
were considered: any "realism / quality of programme" score, and anything
inferring ethnicity or language from candidate names.

Findings worth knowing before building on this:

- **Women thin out through the electable part of the list.** 27% in positions
  1-10, 29% in 11-30, 22% in 31-60. In the first ten — the seats that are actually
  won — Ak Zhol has 1 of 10, Auyl and Baitaq 2 of 10.
- **The youth control is what makes that finding stand up.** Under-35s are flat
  across the same bands (11 / 14 / 11 / 13%), so the gender pattern is not a
  generic "quota categories get buried" effect. Publish the control with the
  finding or the finding is trivially disputable.
- **Never read the 61+ band as a statement about parties in general.** Only 5 of 7
  lists reach it, and 126 of its 165 people are Әділет alone — 76%.
- **Small samples were presented as signal until the render pass caught it.** The
  tail cells are 3 to 9 people (Auyl 61+ was 89% on n=9), which coloured exactly
  like a 126-person band and drove the whole ramp to 89%. Cells under n=10 are now
  hatched, carry their n, and are excluded from the scale, which moved the peak to
  47%. Any new per-band chart must keep that rule.
- **Five of seven lists are nearly interchangeable.** Cosine similarity over
  sector composition: Respublica~Ak Zhol 0.97, Respublica~Baitaq 0.97,
  NPK~Auyl 0.96. The only real poles are Әділет and OSDP at 0.24.
- **Concentration and state dependence spread widely.** Sector HHI from 0.15
  (Әділет, most mixed) to 0.78 (OSDP, nearly single-sector). State or quasi-state
  employers: Әділет 54% against OSDP 6%. OSDP is 88% party apparatus — plausible
  for a 33-person list but worth spot-checking against the position text before
  publishing.
- **60% of all candidates live in Astana, Almaty or Shymkent**; Astana alone 41%.
  NPK 75%, OSDP lowest at 45%.
- **A photo-coverage chart was built and then removed** on request. If it ever
  comes back, it measures our collection rather than party openness, and must be
  labelled that way or it reads as an accusation.

Each chart carries a **"?" disclosure** with four fields — what it measures, how
it is computed (naming the exact registry field or formula), how to read it, and
the caveat. It is a `<details>` element wrapping the title, so it opens on click
and from the keyboard with no JavaScript: a hover-only tooltip would hide the
method from touch users, and the method is the part that makes these charts
defensible.

Two form decisions, both departures from what was first requested:

- **No spider/radar chart.** Seven overlapping polygons over thirteen axes is an
  all-pairs form, which caps at three series before the palette stops separating,
  and radar's area depends on the arbitrary order of its axes. The same data is a
  heatmap of parties x sectors with every cell labelled.
- **Party brand colours are not series colours.** Four of the seven are blue or
  violet. `validate_palette.js` fails them on four checks — lightness band, chroma
  floor, CVD separation (Auyl↔NPK ΔE 4.2 under protanopia against a target of 8)
  and the normal-vision floor (Ak Zhol↔Auyl ΔE 13.3 against a floor of 15).
  Brand colours belong on the logo chips, where identity is the job. Most metrics
  are one measure across seven parties, so they are single-hue bars anyway.

## Party branding

`V7__create_party_branding_and_content.sql` adds `political_party.brand_color`
(NOT NULL, format-checked) plus three tables: `party_logo`, `party_content` and
`party_program_source`. `party_content` mirrors `candidate_content` so the review
workflow is identical. `party_program_source` holds **links** to official
programme documents — the analysis pages link out instead of reproducing
copyrighted programme text.

All 7 logos are collected and uploaded under `parties/<party_id>/logo.<ext>`
(96 KB total), recorded in `data/work/party_brand_assets.tsv` with source URL,
variant, brand colour and rights note, and uploaded by
`scripts/upload_party_logos.py`.

Three things that shaped the design:

- **Logos are language-dependent.** NPK's abbreviation changes with the language
  (НПК in Russian, ҚХП in Kazakh), so it has two logos while the other six have
  one. `party_logo` is keyed on `(party_id, language)` with `language IS NULL` as
  the fallback, enforced by two partial unique indexes — one fallback and one
  per-language row per party, never two of either. Verified: a `kk` lookup gets
  NPK's Kazakh mark and falls back correctly for the other six.
- **Parties publish white logos for dark headers.** `auyl`'s `big-logo.svg` is
  `fill="white"` and adilet's linked asset is `edilet_light.svg`; both render as
  empty squares on a light page. Colour variants existed at `edilet_dark.svg` and
  `img/logo.svg` but are **referenced nowhere on either site** — found by probing
  names. `baitaq` publishes only a white mark, so it is recorded as
  `logo_variant = LIGHT_ONLY` and the UI must place it on the brand-colour chip.
  **Never recolour a party's mark** — that misrepresents the brand.
- **Wikimedia's NPK logo is wrong.** `File:LogoKNPK.svg` is CC BY-SA 4.0, the only
  free-licensed logo available, but it is the pre-rebrand КНПК emblem with hammer
  and sickle. The party renamed to the People's Party of Kazakhstan and dropped
  communist symbolism, so using it would misstate what the party is. Rejected in
  favour of the current mark from the party's own site.

Retrieval notes for whoever extends this: `halykpartiyasy.kz`, `baytaq.kz` and
`respublica-partiyasy.kz` are **blocked by policy in the browser pane** (only
`adilet-partiyasy.kz` opens), while plain HTTP fetching works. NPK's and
Respublica's sites are Vite SPAs — NPK's logos are at `/images/logo-{kz,rus}.svg`,
listed in the JS bundle's asset paths, and Respublica has no named logo asset at
all, so its brand mark came from `apple-touch-icon`. `baitaq`'s "SVG" is a
3842x757 raster in an SVG wrapper, unwrapped to PNG on upload: 358 KB -> 37 KB.
JPEG logos are converted to PNG (flat graphics: `osdp` went 56 KB -> 32 KB).

Brand colours: `adilet` #290081, `respublica` #4A78EC, `npk` #DC0F2D,
`auyl` #085C4B, `ak_zhol` #124B8B, `baitaq` #1F7036, `osdp` #0040B0 (sampled from
the emblem, approximate). They are needed for the `LIGHT_ONLY` chip and as series
colours in the comparison charts.

## Asset storage, end state

| | at handoff | now |
|---|---:|---:|
| `candidates/` prefix | 166.2 MB | **17.6 MB** |
| largest photo | 6.22 MB | **286 KB** |
| objects over 1024 px | 87 | 0 |
| PNG objects | 15 | 0 |
| candidates with two main photos | 4 | 0 |
| byte-identical duplicate objects | 23 | 0 |

Thumbnails (168, 2.7 MB) and the published primary count (168) were unchanged by
every step. Seed is 191 rows with 191 distinct hashes.

## Oversized originals normalised

The older importers uploaded camera originals untouched, up to 5504x8256 at 6 MB
for portraits that are never displayed above ~200 px.
`scripts/normalise_bucket_photos.py` downscaled every photo object over 1024 px on
its long edge, in place under the same key, so `r2_key`, `public_photo_url` and the
thumbnails all stayed valid.

**87 objects, 105.6 MB -> 17.8 MB. The whole `candidates/` prefix went 113.5 MB ->
25.7 MB**, and it started this work at 166.2 MB. Nothing in the bucket now exceeds
1024 px, and the largest photo is 1.3 MB.

Deliberate choices:

- Format is preserved. Converting the 8 PNGs to JPEG would save much more — they
  are now the five largest objects left, 1.0-1.3 MB each against ~120 KB for a
  comparable JPEG — but it would change the object key and break every reference.
  Worth doing as a separate, referential-integrity-aware change.
- No WebP object was oversized, so `sips` being unable to write WebP cost nothing.
  The script skips and reports WebP rather than silently mangling it.
- Pre-resize bytes are copied to `data/work/photos/_bucket_originals` (106 MB,
  gitignored) before each overwrite, and the working cache is updated to the new
  bytes so the seed generator stays honest. That local copy is the **only**
  remaining copy of the originals.

Quality was spot-checked on the most extreme reduction (5504x8256 -> 682x1024) at
JPEG quality 85 before applying, and the seed regenerated: 187 rows, 187 distinct
hashes, zero rows over 1024 px, still 168 publishable primaries.

Expect the CDN to serve the old, larger bytes for up to 4 hours afterwards — see
the cache note under R2 asset conventions.

## Duplicate alternatives pruned

`parliament_primary_photo_promotions.tsv` promoted Parliament portraits by
*copying* them to the primary key rather than referencing them, so
`candidates/<party>/<order>.jpg` and `candidates/<party>/<order>/parliament.jpg`
were the same file under two keys. `content_hash` in the first seed made it
visible: 210 rows, 187 distinct hashes.

`scripts/prune_duplicate_assets.py` deleted the 23 redundant alternatives —
**166.2 MB down to 113.5 MB** across the `candidates/` prefix. It compares sha256
of the actual objects rather than trusting sizes, and refuses to delete anything it
does not already hold a local copy of under `data/work/photos/_bucket_cache`, so
the deletion stays recoverable. 19 alternatives whose bytes genuinely differ were
left alone.

The primary objects and all 168 thumbnails were untouched; the API still serves
168 published primaries, and the seed is now 187 rows with 187 distinct hashes.
The 23 affected rows in `parliament_incumbent_profiles.tsv` keep their
`primary_r2_key` but have `r2_key`/`public_photo_url` cleared and
`photo_status = PRUNED_DUPLICATE_OF_PRIMARY`, so nothing advertises a key that now
404s.

Re-run the seed generator after any pruning, or `V6` keeps rows for objects that
no longer exist.

## Photo seed

`V6__seed_candidate_photo.sql` is generated by
`scripts/generate_candidate_photo_seed.py` — **do not edit it by hand**; rerun the
generator. The bucket is the source of truth for which portraits exist, and the
research TSVs supply provenance and rights, joined on `r2_key`. All 214 objects
under `candidates/` resolve to a TSV row, so a missing join aborts the run rather
than silently dropping a photo. `baitaq` metadata lives in
`baitaq_candidate_assets.tsv`, not `baitaq_candidate_profiles.tsv`.

`source_kind` is derived from which dataset supplied the row: `SENATE`,
`MAZHILIS` (both Parliament datasets), `WIKIMEDIA`, otherwise `PARTY_SITE`.

The committed `V6` was generated with `--publish`, on an explicit instruction to
publish every photo: all 210 rows are `PUBLISHED` with `rights_cleared = TRUE`
and `reviewed_at` set, so the list query returns a thumbnail for all 168
candidates that have one. **Clearance was a decision, not a finding** —
`embedded_copyright` still records that `candidates/adilet/94.jpg` carries
`BOLATKHAN_SERIKBAY`'s asserted copyright, and none of the other sources declare
a free-use licence either.

Without `--publish` the generator emits `DRAFT` with `rights_cleared = FALSE`,
which is still the default. The gate in `V5` was **not** dropped, so any future
photo batch stays unpublished until someone clears it deliberately.

Two things the generator has to get right, both learned the hard way:

- The duplicate-extension candidates (`respublica` 43/55/60/66) would produce two
  `PRIMARY` rows and violate `uq_candidate_photo_role`, so it applies the same
  `EXT_PRECEDENCE` as the thumbnail script.
- Every column is cast explicitly in the `SELECT`. An all-`NULL` column inside
  `VALUES` is inferred as `text`, and `text` into a `DATE` column fails with
  "column photo_taken is of type date but expression is of type text".

Object bytes are downloaded to compute `content_hash` (sha256) and exact
dimensions, and cached under `data/work/photos/_bucket_cache` (gitignored) so
reruns are free.

A caveat about doing seeds as migrations: once `V6` is applied anywhere,
regenerating it changes its checksum. Later photo batches need `V7`, `V8`, … or
an application-level import instead.

## Photo API

`GET /api/candidates` returns `photoThumbnailUrl` and leaves `photoUrl`,
`photoWidth` and `photoHeight` null. `GET /api/candidates/{id}` returns all four.
The split is deliberate: the originals run to several MB, so a list response
should not even be able to point a client at them.

The database stores R2 object keys, not URLs. `AssetProperties`
(`assets.base-url`, overridable with `ASSETS_BASE_URL`, default
`https://assets.open-quryltai.org`) turns a key into a URL at serialisation time,
so the CDN host can change without a data migration.

The repository `LEFT JOIN`s `candidate_photo` on `photo_role = 'PRIMARY' AND
active AND review_status = 'PUBLISHED'`. Left, because most candidates still have
no photo and must not vanish from the list, and the role plus status filter means
unpublished rows are invisible to the API without any extra service logic.
`uq_candidate_photo_role` guarantees at most one matching row, so the join cannot
multiply results — verified: totals stay 545 / 186 / 75.

`candidate_photo` had to be added to the jOOQ `includes` in `build.gradle`.
Codegen reads the migration SQL through `DDLDatabase`, so it needs no live
database — but it does need that list updated, or `CANDIDATE_PHOTO` never exists.

Three tests in `QuryltaiBackendApplicationTests` lock the contract: list serves
thumbnails and never a full photo URL, details serve the full photo with its
dimensions, and a candidate without a photo still appears with null URLs.

Note for anyone running the suite: the 12 pre-existing tests are `@SpringBootTest`
integration tests and fail with "Failed to load ApplicationContext" unless
`DATABASE_URL`, `DATABASE_USERNAME` and `DATABASE_PASSWORD` are set. That is the
environment, not a regression. Flyway applies `V1`-`V6` into whatever database
those point at.

## Photo UI

`CandidateAvatar` (`entities/candidate/ui`) is a 40 px round avatar for list rows.
It falls back to initials, which is the **common** case rather than an edge case —
only 174 of 545 candidates have a photo — so the fallback is styled to look
deliberate instead of broken, and an `onError` handler falls back too if a CDN
fetch fails. It is `aria-hidden`: the candidate's name always sits right next to
it, so announcing the image would just duplicate the name.

The avatar went **into the existing name cell**, not a new column. The table is
already `min-w-6xl` and adding a column would push it wider, while the avatar
belongs with the name anyway.

`CandidateDetailsPage` renders the full portrait in the header, beside the name on
`sm` and up and stacked below it on mobile. `width` and `height` come from the
API's `photoWidth`/`photoHeight` so the box is reserved before the image loads.
The header renders no placeholder at all when a candidate has no photo, rather
than an empty frame.

Translations: `candidate.details.photoAlt` in `ru.ts` and `kk.ts`. Note both
locale files are alphabetically ordered — keep new keys in place.

Verified in a browser against the real API and CDN: the adilet list page showed 7
thumbnails and 17 initial fallbacks across 24 rows, matching the data exactly;
the details page served `adilet/54.webp` (the original, not the thumbnail) with
`819x1024`; a candidate without a photo rendered no image; mobile stacked with no
horizontal overflow. `tsc`, `oxlint` and `pnpm build` are clean.

One trap when checking this in a browser: the SPA drifts back to the list between
separate tool calls, so a screenshot and a later DOM query can describe different
pages. Read the heading and the image in a **single** evaluation before concluding
that a portrait does not match its name.

## Gotcha: the assets domain 403s any non-browser User-Agent

`https://assets.open-quryltai.org` is **publicly readable and working**. But
Cloudflare in front of it rejects clients whose User-Agent does not look like a
browser, with `403` and a body of exactly `error code: 1010` ("banned based on
your browser's signature"). The default `Python-urllib/3.x` User-Agent trips it,
so a plain `urllib.request.urlopen(url)` check reports 403 for every object and
looks exactly like a permissions failure. It is not one.

Send a browser User-Agent and the same URLs return 200. Verified across all 17
new `adilet` objects plus pre-existing `candidates/respublica/16.jpg`,
`candidates/ak_zhol/1.jpg` and `candidates/adilet/141.jpg`. The repo's importers
already pass a `USER_AGENT` header for this reason — reuse it in any new
verification script rather than calling `urlopen` bare.

Do **not** conclude from a bare-`urllib` 403 that R2 public access is
misconfigured; that diagnosis was made and retracted during this work.

## R2 asset conventions

- Main candidate photo: `candidates/<party_id>/<list_order>.<ext>`.
- **List-view thumbnail: `candidates/<party_id>/<list_order>/thumb.jpg`.**
  Built for all 168 candidates that have a main photo, by
  `scripts/make_candidate_thumbnails.py`. Long edge 320 px, JPEG quality 70,
  average 16 KB, largest 31 KB, 2.7 MB for the whole set against 73.9 MB of
  originals (3.6%). Never upscaled: a source already within 320 px is only
  re-encoded.
  Thumbnails are **always `.jpg` whatever the source format** — originals are a
  mix of WebP, JPEG and PNG — so a client can build the URL from `party_id` and
  `list_order` alone, with no per-record extension lookup:
  `https://assets.open-quryltai.org/candidates/<party_id>/<list_order>/thumb.jpg`.
  The script is idempotent (existing thumbnails are skipped; `--force` rebuilds)
  and resumable, and takes `--dry-run`, `--party`, `--max-edge`, `--quality`.
- Official Parliament alternative: `candidates/<party_id>/<list_order>/parliament.<ext>`.
  Alternatives are deliberately **not** thumbnailed: a list shows one avatar per
  candidate, and that is the main photo.
- Official leadership alternative: `candidates/npk/<list_order>/npk-team.<ext>`.
- All 17 researched `adilet` portraits are now **uploaded** at
  `candidates/adilet/<list_order>.<ext>` — 13 WebP from the party site, 4 JPEG
  from the Senate — via `scripts/upload_adilet_photos.py`, which normalises then
  uploads and rewrites both TSVs with `photo_status=UPLOADED`, `r2_key` and
  `public_photo_url`. Run it with `--dry-run` to see the plan without uploading.
  Total 0.9 MB for 17 objects, down from 7.2 MB of originals.
  `data/work/photos/` (originals and the `_upload/` staging copies) stays
  gitignored.
- Normalisation applied on upload: long edge capped at 1024 px via `sips`, and
  every JPEG `APPn` (except `APP0`/JFIF) plus `COM` segment dropped. Note that
  `sips` **keeps EXIF through a resize**, so stripping has to be done separately;
  the script does it at the segment level and re-verifies afterwards. Only one
  file needed resizing: Senate `list_order` 94 went 3719x4782 / 6.3 MB ->
  796x1024 / 112 KB. The originals are kept locally — 94 is a good crop source,
  40 (354x472) is not.
- **The Senate source for `list_order` 94 asserted third-party copyright.** Its
  original EXIF carried `Copyright: BOLATKHAN_SERIKBAY`, so for that file the
  usual "no license declaration found" note was wrong — a claim exists and it is
  not permissive. It was **uploaded anyway, on explicit instruction, with the
  claim unresolved**; see item 8 under recommended next work. Files 40 and 126
  named a photographer in EXIF `Artist` (`ERKEBULAN`) without a formal copyright
  field; 46 had no EXIF at all. `senate_incumbent_profiles.tsv` preserves all of
  this per row in `embedded_author`, `embedded_copyright` and `photo_taken`, since
  the uploaded copies no longer carry it. Stripping the tag removes the metadata,
  not the underlying rights question.
- EXIF also dated these portraits to 2019 (40), 2022 (126) and 2024 (94) — they
  are archival parliamentary photos, not 2026 campaign material. Checked for
  location leakage before upload: the GPS IFD in 40 and 126 held only
  `GPSVersionID` and **no coordinates**.
- `adilet-partiyasy.kz` serves its media as `Content-Type:
  application/octet-stream`, not `image/webp`. The existing importers key their
  file suffix off the content type, so a naive reuse of
  `import_npk_candidate_profiles.py` would record
  `SKIPPED_UNSUPPORTED_TYPE:application/octet-stream`. Detect WebP from the
  `RIFF....WEBP` magic bytes instead.
- All R2 credentials are local `.env` secrets and must never be committed or
  printed. Bucket is supplied at runtime as `CLOUDFLARE_R2_BUCKET=assets-quryltai`.
- For "Ak Zhol", original framed campaign cards were replaced by cropped primary
  portraits at `candidates/ak_zhol/<list_order>.jpg`.
- **Overwriting an object does not update the CDN.** `assets.open-quryltai.org`
  sends `cache-control: max-age=14400`, so for up to 4 hours after a rewrite the
  edge keeps serving the previous bytes: `cf-cache-status: HIT` with the old
  `content-length`, while a signed GET against the bucket returns the new object.
  Appending any query string (`?v=<timestamp>`) bypasses the cache and proves
  which version the bucket holds. This self-heals, but a purge is the only way to
  make it immediate, and no Cloudflare API token is in `.env`. This is what the
  older Ak Zhol note was really describing.

## Candidate roster provenance

Appendix 2 of CEC decision 41/72 (21 July 2026) is the origin of the `adilet`
rows in `V3__create_candidate.sql`: it carries exactly the same fields
(`birth_year`, `position_ru`, `residence_raw`). Diffed the official appendix 1
against the migration: **186 against 186, one-to-one**, and `list_order`
equals the CEC alphabetical position for every candidate.

Four names differ from the CEC spelling only by transliteration — same people,
same positions, same alphabetical slot. Worth normalising if the CEC spelling
should be canonical:

| `list_order` | in migration | in CEC appendix |
|---:|---|---|
| 86 | Карин Ерлан Тынымбай**ұ**лы | Карин Ерлан Тынымбай**у**лы |
| 106 | Медеуова Дана **Теміртайқызы** | Медеуова Дана **Темиртаевна** |
| 164 | Тойлыбаева **Гулнар** Кожагуловна | Тойлыбаева **Гульнар** Кожагуловна |
| 183 | Шерма**ғ**анбет Мейрамбек Зинабдинұлы | Шерма**г**анбет Мейрамбек Зинабдинұлы |

## Two sources, one key slot (`respublica` 43/55/60/66) — resolved

Four `respublica` candidates had an object under **two extensions at once**, both
matching `candidates/<party>/<order>.<ext>`. They were **not duplicates** — that
assumption was made during cleanup and disproved before anything was deleted:

| candidate | `.png` (party site) | `.jpg` (Wikimedia) |
|---|---|---|
| `respublica` 43 | 595x839, 518 KB | 1280x1707, 374 KB |
| `respublica` 55 | 429 KB | 23 KB |
| `respublica` 60 | 432 KB | 396 KB |
| `respublica` 66 | 379 KB | 361 KB |

Different bytes, different dimensions, different photographs of the same person —
`respublica` 43 is a studio portrait on the party site and a candid at an event on
Wikimedia. The `.png` comes from `respublica_candidate_profiles.tsv`, the `.jpg`
from `verified_candidate_biographies.tsv`.

**Resolved by decision: the party photo is `PRIMARY`.** It now owns
`candidates/respublica/<order>.jpg`, and the Wikimedia photo moved to
`candidates/respublica/<order>/wikimedia.jpg` under a new `WIKIMEDIA` role, so
neither is lost and neither competes for the primary key slot. No candidate has
more than one main-photo object any more, so the object-count (172) versus
candidate-count (168) discrepancy is gone, and `EXT_PRECEDENCE` no longer decides
anything — there are no competing extensions left.

Worth remembering if the rights position is ever revisited: those four Wikimedia
photos are the only images in the project with a **verified free licence**, and
they are now the non-primary variant.

## Senate cross-check (closed)

The Senate roster has been cross-checked against **all 545 candidates**, not
just `adilet`, and it is exhausted: the 4 rows in
`senate_incumbent_profiles.tsv` are everything there is. Verified two
independent ways, which agree:

1. All 49 senators from `/{lang}/about/deputies` matched by surname against all
   545 candidates, with Kazakh letters folded to their Russian counterparts
   (`ә→а`, `қ→к`, `ғ→г`, `ө→о`, `ұ/ү→у`, `і→и`, `ң→н`, `һ→х`). Four full-name
   matches, all already collected.
2. Only 4 of the 545 candidates have a position mentioning the Senate at all,
   and they are the same four.

Three surname-only collisions came up and are **not** the same people — do not
let a future looser matcher attach these portraits:

| Candidate | Senator with same surname |
|---|---|
| `adilet` 132 Рахметова Айзада Нурлановна, 1991, maslikhat chair | Рахметова Асем Калашбаевна |
| `ak_zhol` 11 Дюсембинов Берик Салимжанович, 1971 | Дюсембинов Султан Мырзабекович |
| `respublica` 30 Жунусов Олжас Файзуллаевич, 1982, college director | Жунусов Талгат Турлыбекович |

Related check, also clean: 41 candidates have a position mentioning the
Mazhilis while `parliament_incumbent_profiles.tsv` holds 37. The 4-row
difference is correct, not a matcher miss — none of them is a sitting deputy:
`ak_zhol` 11 is VII convocation (previous), and `auyl` 61, `auyl` 68 and
`baitaq` 20 are Mazhilis **apparatus staff**, not deputies. Conversely every
one of the 37 rows does mention the Mazhilis, so there are no false positives.

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

## Programme content analysis

All seven 2026 programmes were segmented into units and hand-coded. The result is
in the product: `V8`/`V9`, `/api/programs/*`, the comparison on the home page and
a per-party profile on each party page.

**What it measures: attention** — how much room a party gives a topic. Never its
position on that topic, never the quality of the programme. Two parties with the
same T06 share may propose opposite things. Every published share carries its
denominator for this reason.

### Where everything is

| Artefact | Path |
|---|---|
| Codebook (frozen at 1.7 during coding) | `data/work/program_codebook.md` |
| Precedents П-01…П-15 | `data/work/annotation_precedents.md` |
| Per-unit annotations, 7 files | `data/work/annotations/*.tsv` |
| Aggregate (source for seed and report) | `data/work/program_topic_metrics.json` |
| Rare-topic census (T15/T16) | `data/work/rare_topic_census.tsv`, `..._decisions.tsv` |
| Standalone report | `data/work/program_report.html` |
| Schema and seed | `backend/.../V8__…sql`, `V9__…sql` |
| Regenerate the seed | `scripts/generate_program_measurement_seed.py` |

Corpus: 3247 units, denominator 2833. Programme texts live in
`data/work/programs/` and are **gitignored — never commit or publish them**. We
publish counts and offsets, and link to the source.

### Reliability, and exactly how far it goes

Two annotators coded a 175-unit pilot: Krippendorff alpha **0.827** (topic) and
**0.852** (statement type). One annotator then coded the whole corpus. That
sequence is standard content analysis, not a shortcut — but it means:

- **T15 and T16 have no agreement at all.** They entered the codebook after the
  pilot. Publish their counts, never a share. This is enforced in the schema:
  `party_program_topic.share` is NULL with a CHECK tying it to `pilot_verified`,
  the API passes the null through, and the UI renders a count with an asterisk.
  Do not "fix" a null into a zero anywhere along that path.
- The second annotator was **gpt-5.5, and the budget for it is gone**. Re-running
  a pilot needs either restored credits or a human pair.

### Contested calls — the honest list

These are judgements, not measurements. A second coder could differ on any of
them, and several move published numbers.

1. **П-14, the boundary between a slogan and a statement.** Reclassified 19 units
   retroactively and cut `auyl`'s rhetorical share from 11% to 2%, changing its
   denominator from 128 to 144 and therefore every one of its shares. The
   previous 7× spread between parties was an artefact of an inconsistent rule,
   not a fact about them. This boundary is the single most load-bearing judgement
   in the corpus: `rhetorical` is excluded from the denominator.
2. **П-15, civil protection.** `npk` and `adilet` have blocks on floods, fires and
   emergency readiness. No topic covers them, so they went to T13. Measured
   rather than assumed: **9 units in the whole corpus** — 7 of npk's 22 T13 units
   and 2 of adilet's 27; the other five parties have none. It moves npk's T13
   share from 3.7% to 5.4% and adilet's by 0.16 points. The label already reads
   "внешняя политика **и безопасность**" / "сыртқы саясат **және қауіпсіздік**",
   which covers civil protection honestly. Splitting the code would be tidier but
   is not urgent, and removing T13 would be worse than leaving it: for five of
   seven parties it is pure foreign policy.
   *(An earlier revision of this handoff called this "the most misleading thing on
   the site" and said T13 must not be labelled international affairs. Both were
   overstated — written before the units were counted, and the label never said
   that.)*
3. **П-04, water quota allocation** → T07. A genuine codebook gap: §4 splits water
   into irrigation (T07), quality (T06) and transboundary rivers (T13), and
   allocation fits none.
4. **П-07, code the statement not the section.** A price-cap measure inside a
   healthcare chapter is T04. Without this rule the shares would measure each
   programme's table of contents.
5. **П-10, duplicates inside one programme.** `baitaq` 0145/0235 and `adilet`
   0654/1176 are near-verbatim repeats in different chapters. Both are counted;
   they inflate T08 and T07 slightly. If more turn up, this needs a rule.
6. **`adilet`'s flat profile is a denominator artefact.** Its denominator is three
   times the next party's, so its shares are mechanically smoother. Breadth and
   diffuseness are indistinguishable by share. Say so wherever it is shown.
7. **Heatmap, not a radar.** A spider chart was requested; 17 topics × 7 parties
   is an unreadable web, so the comparison is a heatmap on one sequential hue.
   If a radar is still wanted, the only readable form is small multiples — one
   party per chart, with the corpus average as a grey reference outline.
8. **Kazakh topic labels and UI strings were reviewed and corrected** in
   `messages_kk.properties` and `frontend/src/shared/i18n/locales/kk.ts`.

### Needs verification

- **`gradlew test` fails** — Flyway checksum mismatch on V4 and V5 against the
  local `qurultay` database. Pre-existing and not caused by this work: the
  migrations were renumbered after being applied (DB V5 is "add candidate source
  review", repo V5 is "create candidate photo"). Needs `flyway repair` plus V6–V9,
  or a recreated database. Credentials are not in the repo.
- **Segmentation defects are marked in the annotations but not fixed.** Goal
  markers stuck to text in `adilet` ("77лет ЦЕЛЬ 2", "1млн", "30%"), page numbers
  in `npk` ("2 Новые геополитические…"), merged headings in `baitaq` ("Воздух В
  Өскемене…"). Fixing means re-segmenting, which renumbers every `unit_id` — the
  annotations must then be migrated by text hash, the technique already proven in
  `census_rare_topics.py`. Do not attempt it without that step.
- **30 units (1.0%) remain truncated or misclassified as substantive**, mostly
  unnumbered headings in `osdp` and `ak_zhol`. Left deliberately: further rules
  would start guessing, and 1% does not move any share visibly.
- **The site was verified live in light mode only**, at 1280×900, in Russian and
  Kazakh. Dark mode was checked in the standalone report but **not on the site**.
- **`annotations/*.tsv` notes contain short quoted fragments** of the programmes —
  a few words each, as coding rationale. Fine as fair quotation; worth knowing if
  the rights position is ever questioned.

### Must be cleaned up

- **`/tmp/quryltai-dev-env.sh` holds the database password** (mode 600, outside
  the repo). Delete it when done: `rm -f /tmp/quryltai-dev-env.sh`.
- **Two databases now exist.** `qurultay` is stale (V1–V5, renumbered migrations);
  `qurultay_dev` is fresh with all nine applied and is what the running stack
  uses. Decide which is canonical and drop the other. Nothing in either is
  hand-entered — both are fully reproducible from migrations.
- **A backend started with `gradlew bootRun` may still be running** on port 8080,
  logging to `/tmp/quryltai-backend.log`. Stop it before starting another.
- `data/work/program_report.html` duplicates what the site now shows. Keep it as
  an offline artefact or delete it; it is not referenced by the product.

### Running it locally

```sh
docker exec postgres psql -U postgres -Atc "CREATE DATABASE qurultay_dev;"   # once
export DATABASE_URL='jdbc:postgresql://localhost:5432/qurultay_dev'
export DATABASE_USERNAME='postgres' DATABASE_PASSWORD='<from the postgres container>'
cd backend && ./gradlew bootRun          # applies V1–V9 on start
# frontend proxies /api to :8080
pnpm --prefix frontend dev
```

### Verification commands

```sh
python3 scripts/annotate_party.py adilet --check    # 1346/1346, 0 problems
python3 scripts/aggregate_annotations.py            # 3247 units, denominator 2833
python3 scripts/census_rare_topics.py --apply       # T15=7, T16=2, no undecided
cd backend && ./gradlew jooqCodegen compileJava
curl -s localhost:8080/api/programs/adilet -H 'Accept-Language: ru' | grep -o '"share":null' | wc -l   # 2
```

The last one is the important one: it proves the ban on unpiloted shares survives
the whole path from the CHECK constraint to the JSON.


## Current review queues

- `respublica_official_profiles_review.tsv`: 19 official Respublica profiles not
  safely linked to this candidate list.
- `auyl_deputies_review.tsv`: 3 current faction deputies not in the 2026 list.
- `parliament_incumbent_review.tsv`: **empty — all 4 rows now `RESOLVED`.** They
  were Senate deputies; see `senate_incumbent_profiles.tsv`. A `resolution`
  column was added to record why.
- `npk_team_review.tsv`: 2 official NPK team members not in the party list.

## Recommended next work

**Programme analysis first — it is shipped, so its defects are public.**

1. **Decide the fate of the two databases.** `qurultay` is stale and makes
   `gradlew test` fail; `qurultay_dev` is what runs. Until this is settled the
   test suite stays red and nobody can tell a real regression from the known one.
2. **Optionally split T13** into foreign policy and civil protection. Affects 9
   units (7 npk, 2 adilet) and shifts one party's share by 1.7 points, so this is
   tidiness rather than a correction. The existing label already covers both.
3. **Kazakh topic labels and UI strings were reviewed and corrected**
   (`messages_kk.properties` and `frontend/src/shared/i18n/locales/kk.ts`).
   Fixed typos (e.g. `Тақырыпаттар`), corrected legal terminology (e.g.
   `Тұрмыстық және гендерлік зорлық-зомбылық`, `Құқық және құқықтық тәртіп`),
   and refined UI descriptions.
4. **Check the site in dark mode.** The palette was validated and the standalone
   report was checked, but the live pages were not.
5. **Fix the segmentation defects** (stuck goal markers, page numbers, merged
   headings) — but only together with migrating the annotations by text hash, or
   the whole corpus detaches from its labels.
6. **If a second annotator becomes available**, re-run the pilot to cover T15/T16
   and lift the ban on their shares, and spot-check ~150 random units of the main
   corpus. That is the only way to convert "one careful coder" into a measured
   claim.

**Candidate enrichment (unchanged from before):**

7. Optionally teach `import_parliament_incumbent_profiles.py` about the Senate,
   for reproducibility only — **there is nothing left to gain from that source.**
   See "Senate cross-check" below.
8. Close the remaining `adilet` gap (151 of 186 still without a photo).
   **The CEC is ruled out as a photo source — do not re-check it.** The official
   registry is CEC decision 41/72 of 21 July 2026, reachable from
   `/rus/banners/index.php?section=itogi_registracii&ID=10194`, and it consists
   of two `.docx` attachments under `/upload/docs/2026/Prilozheniye/`.
   Neither archive contains a `word/media/` entry, i.e. zero embedded images:
   appendix 1 is a plain alphabetical list of the 186 names and appendix 2 adds
   only birth year, position, and city of residence. The same holds for the
   other six parties, which are listed on the same page.
   The official site also has **no candidate directory** — `sitemap.xml` lists
   24 routes per language and none of them is a candidate list, and the only
   portrait catalogue is `/{lang}/leadership` (13 people, already collected).
   Two leads remain:
   - `GET /api/kurultai/candidates` answers `404 {"detail": "Кандидаты
     недоступны"}` — a deliberate "unavailable" message rather than a missing
     route, so re-probe it around and after the 23 August 2026 vote.
   - Otherwise fall back to per-candidate official sources (employer, akimat,
     maslikhat), as planned for `auyl`.
9. Do **not** trust `GET /api/leadership` on `adilet-partiyasy.kz`. It returns 4
   stub records with invented names (`Айгүл Серікқызы`, `Бауыржан Нұрлан`,
   `Дана Әбенова`, `Ерлан Қанатұлы`), no photos, and none of them appear on the
   rendered page or in the candidate list. Only the server-rendered HTML at
   `/{lang}/leadership` and `/{lang}/chairman` is a usable source on that site.
10. Close the remaining `osdp` gap (27 of 33); `osdp.kz` has only a leadership
   page, and unresolved leads are queued in `osdp_photo_review.tsv`.
11. For the remaining `auyl` candidates, use regional party branches, maslikhat,
   employer, and akimat sources; the party site has only the current 8-member
   Mazhilis fraction and no full candidate directory.
12. Nothing outstanding on asset storage. If more photos are added, run
   `normalise_bucket_photos.py` and then `generate_candidate_photo_seed.py` again.
13. Decide which photo should be `PRIMARY` for `respublica` 43/55/60/66 — see
   "Two sources, one key slot" below. This is a rights decision, not cleanup.
14. Optional: crop thumbnails to the face rather than scaling the whole frame.
   Several `baitaq` sources are press photos with the subject small in a wide
   shot (11 in front of a building, 13 in front of a party press wall); they are
   correct portraits but read poorly at 52 px. `crop_ak_zhol_portraits.py` is
   the precedent.
15. Revisit whether the 13 party-site portraits need cropping: they carry the
   party's decorative purple gradient background, unlike the neutral Parliament
   and Senate portraits, so the grid will look mixed. Compare with the
   `ak_zhol` precedent (`crop_ak_zhol_portraits.py`). They are uploaded as-is.
16. Resolve the embedded copyright claim on `candidates/adilet/94.jpg`
   (`BOLATKHAN_SERIKBAY`). It was uploaded on explicit instruction with the
   claim unresolved; the rights note in `senate_incumbent_profiles.tsv` records
   it.
17. Revisit the rights position if it ever matters commercially: all 210 photos
   are published with `rights_cleared = TRUE`, but no source declared a free-use
   licence and one asserts a photographer's copyright. The claims are preserved
   in `embedded_author` / `embedded_copyright` should any of them need answering.
18. Social links (`facebook_url`, `instagram_url`, `youtube_url` in the
   Parliament and Respublica datasets) still have no home in the schema.
19. Photos are rendered; what is left is judgement calls on presentation. The
   `baitaq` press photos sit small in a wide frame and read poorly at 40 px, and
   the `adilet` party portraits carry a purple gradient background next to the
   neutral Parliament and Senate ones, so the avatar column looks mixed.
20. Add backend/API/UI support only for verified records; do not import raw TSV
   suggestions directly.
21. Prepare neutral Russian and Kazakh biographies from the same fact set.

## Verification commands

```sh
python3 -m py_compile scripts/*.py
CLOUDFLARE_R2_BUCKET=assets-quryltai python3 scripts/import_parliament_incumbent_profiles.py --delay 0
```

The second command refreshes research output from the official Mazhilis API but
does not upload unless `--upload-photos` is added.
