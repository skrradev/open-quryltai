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
