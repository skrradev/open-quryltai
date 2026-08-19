# Quryltai backend

Spring Boot 3.5 application running on Java 25 with Gradle, jOOQ, Flyway, and PostgreSQL.

## Run locally

```sh
cp .env.example .env
# Set your PostgreSQL credentials in .env.
./gradlew bootRun
```

`DATABASE_URL`, `DATABASE_USERNAME`, and `DATABASE_PASSWORD` are required. Flyway
applies the schema and reference data migrations when the application starts.

`GET /api/health` verifies application and database connectivity.

## Candidate editorial content

Flyway owns the editorial schema. Reviewed Markdown and source records live under
`../data/content` and are loaded with an idempotent, transactional deploy task:

```sh
# Validation only (default)
./gradlew importContent

# Import an approved Git revision
./gradlew importContent -PcontentDryRun=false -PcontentSourceRevision=<git-commit>
```

Public endpoints expose only active, published records in the requested locale:

- `GET /api/candidates/{candidateId}/content`
- `GET /api/candidates/{candidateId}/sources?type=MEDIA_MENTION&page=0&size=20`

Russian editorial text is never used as a fallback for Kazakh.
