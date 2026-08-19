# Candidate editorial content

This directory is the reviewed, Git-managed source of truth for candidate narrative
content and source links. `manifest.json` is intentionally empty until verified source
material and independently reviewed Kazakh/Russian wording are available.

The importer never deletes rows merely because they are absent from the manifest. Set
`active` explicitly to `false` to withdraw a managed record.

## Workflow

From `backend/`:

```sh
# Validate files, references, timestamps, URLs and candidate IDs without writing.
./gradlew importContent

# Import after review. Use the Git commit that contains the approved content.
./gradlew importContent -PcontentDryRun=false -PcontentSourceRevision=<git-commit>
```

The entire import is transactional. Every manifest item must include `active: true` or
`active: false`; omission is rejected. `REVIEWED` and `PUBLISHED` records require an
ISO-8601 `reviewedAt` timestamp with an offset. All timestamps use the same format, for
example `2026-08-17T12:00:00+05:00`.

## Manifest records

- `content`: `candidateId`, `language` (`kk` or `ru`), `sectionType`, localized
  `title`, `bodyFile`, `sortOrder`, `reviewStatus`, `reviewedAt`, `active`.
- `sources`: stable lowercase `sourceKey`, `sourceType`, `publisher`, original-language
  `title`, `originalUrl`, normalized `canonicalUrl`, source `language`, `publishedAt`,
  `retrievedAt`, optional `archivedUrl`, `active`.
- `candidateSources`: `candidateId`, `sourceKey`, `relationshipType`, `primarySubject`,
  `sortOrder`, `verifiedAt`, `reviewStatus`, `reviewedAt`, `active`.
- `sourceLocalizations`: `candidateId`, `sourceKey`, `language`, `summaryFile`,
  `reviewStatus`, `reviewedAt`, `active`.

Markdown file paths are relative to this directory and cannot escape it. Kazakh and
Russian publication status is independent: a published Russian summary is never
returned as a Kazakh fallback.
