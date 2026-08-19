package kz.quryltai.backend.repository;

import static kz.quryltai.backend.jooq.tables.CandidateSource.CANDIDATE_SOURCE;
import static kz.quryltai.backend.jooq.tables.CandidateSourceLocalization.CANDIDATE_SOURCE_LOCALIZATION;
import static kz.quryltai.backend.jooq.tables.Source.SOURCE;
import static org.assertj.core.api.Assertions.assertThat;

import java.time.OffsetDateTime;

import org.jooq.DSLContext;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import kz.quryltai.backend.model.Language;

@SpringBootTest
class CandidateContentRepositoryTests {

    @Autowired
    private DSLContext dsl;

    @Autowired
    private CandidateContentRepository repository;

    @Test
    @Transactional
    void sourceRequiresPublishedLocalizationInTheRequestedLanguage() {
        OffsetDateTime now = OffsetDateTime.now();
        String hash = "0".repeat(64);
        Long sourceId = dsl.insertInto(SOURCE)
                .set(SOURCE.SOURCE_KEY, "test-review-gate")
                .set(SOURCE.SOURCE_TYPE, "NEWS")
                .set(SOURCE.PUBLISHER, "Test publisher")
                .set(SOURCE.TITLE, "Test source")
                .set(SOURCE.ORIGINAL_URL, "https://example.com/quryltai-review-gate")
                .set(SOURCE.CANONICAL_URL, "https://example.com/quryltai-review-gate")
                .set(SOURCE.LANGUAGE, "ru")
                .set(SOURCE.RETRIEVED_AT, now)
                .set(SOURCE.CONTENT_HASH, hash)
                .set(SOURCE.SOURCE_REVISION, "test")
                .set(SOURCE.ACTIVE, true)
                .returningResult(SOURCE.SOURCE_ID)
                .fetchSingle(SOURCE.SOURCE_ID);

        dsl.insertInto(CANDIDATE_SOURCE)
                .set(CANDIDATE_SOURCE.CANDIDATE_ID, (short) 1)
                .set(CANDIDATE_SOURCE.SOURCE_ID, sourceId)
                .set(CANDIDATE_SOURCE.RELATIONSHIP_TYPE, "MEDIA_MENTION")
                .set(CANDIDATE_SOURCE.IS_PRIMARY_SUBJECT, true)
                .set(CANDIDATE_SOURCE.SORT_ORDER, (short) 0)
                .set(CANDIDATE_SOURCE.VERIFIED_AT, now)
                .set(CANDIDATE_SOURCE.REVIEW_STATUS, "PUBLISHED")
                .set(CANDIDATE_SOURCE.REVIEWED_AT, now)
                .set(CANDIDATE_SOURCE.CONTENT_HASH, hash)
                .set(CANDIDATE_SOURCE.SOURCE_REVISION, "test")
                .set(CANDIDATE_SOURCE.ACTIVE, true)
                .execute();

        dsl.insertInto(CANDIDATE_SOURCE_LOCALIZATION)
                .set(CANDIDATE_SOURCE_LOCALIZATION.CANDIDATE_ID, (short) 1)
                .set(CANDIDATE_SOURCE_LOCALIZATION.SOURCE_ID, sourceId)
                .set(CANDIDATE_SOURCE_LOCALIZATION.LANGUAGE, "ru")
                .set(CANDIDATE_SOURCE_LOCALIZATION.SUMMARY, "Test summary")
                .set(CANDIDATE_SOURCE_LOCALIZATION.REVIEW_STATUS, "DRAFT")
                .set(CANDIDATE_SOURCE_LOCALIZATION.CONTENT_HASH, hash)
                .set(CANDIDATE_SOURCE_LOCALIZATION.SOURCE_REVISION, "test")
                .set(CANDIDATE_SOURCE_LOCALIZATION.ACTIVE, true)
                .execute();

        assertThat(repository.findSources((short) 1, Language.RUSSIAN, "MEDIA_MENTION", 0, 100).items())
                .noneMatch(source -> source.sourceKey().equals("test-review-gate"));

        dsl.update(CANDIDATE_SOURCE_LOCALIZATION)
                .set(CANDIDATE_SOURCE_LOCALIZATION.REVIEW_STATUS, "PUBLISHED")
                .set(CANDIDATE_SOURCE_LOCALIZATION.REVIEWED_AT, now)
                .where(CANDIDATE_SOURCE_LOCALIZATION.CANDIDATE_ID.eq((short) 1))
                .and(CANDIDATE_SOURCE_LOCALIZATION.SOURCE_ID.eq(sourceId))
                .and(CANDIDATE_SOURCE_LOCALIZATION.LANGUAGE.eq("ru"))
                .execute();

        assertThat(repository.findSources((short) 1, Language.RUSSIAN, "MEDIA_MENTION", 0, 100).items())
                .anyMatch(source -> source.sourceKey().equals("test-review-gate")
                        && source.summary().equals("Test summary"));
        assertThat(repository.findSources((short) 1, Language.KAZAKH, "MEDIA_MENTION", 0, 100).items())
                .noneMatch(source -> source.sourceKey().equals("test-review-gate"));
    }
}
