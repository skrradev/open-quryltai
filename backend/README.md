# Quryltai backend

Spring Boot 3.5 application running on Java 25, Gradle, JDBC Template, and Flyway.

## Run locally

```sh
./gradlew bootRun
```

The default database is in-memory H2. To use PostgreSQL, set `DATABASE_URL`,
`DATABASE_USERNAME`, and `DATABASE_PASSWORD` before running the application.

`GET /api/health` verifies application and database connectivity.
