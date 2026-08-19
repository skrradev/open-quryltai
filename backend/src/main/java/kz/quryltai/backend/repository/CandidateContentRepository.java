package kz.quryltai.backend.repository;

import static kz.quryltai.backend.jooq.tables.CandidateContent.CANDIDATE_CONTENT;
import static kz.quryltai.backend.jooq.tables.CandidateSource.CANDIDATE_SOURCE;
import static kz.quryltai.backend.jooq.tables.CandidateSourceLocalization.CANDIDATE_SOURCE_LOCALIZATION;
import static kz.quryltai.backend.jooq.tables.Source.SOURCE;

import java.util.List;

import org.jooq.Condition;
import org.jooq.DSLContext;
import org.jooq.impl.DSL;
import org.springframework.stereotype.Repository;

import kz.quryltai.backend.dto.CandidateContentDto;
import kz.quryltai.backend.dto.CandidateSourceDto;
import kz.quryltai.backend.model.CandidateSourcePage;
import kz.quryltai.backend.model.Language;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class CandidateContentRepository {

    private final DSLContext dsl;

    public List<CandidateContentDto> findPublishedContent(short candidateId, Language language) {
        return dsl.select(
                        CANDIDATE_CONTENT.SECTION_TYPE,
                        CANDIDATE_CONTENT.TITLE,
                        CANDIDATE_CONTENT.BODY_MARKDOWN,
                        CANDIDATE_CONTENT.SORT_ORDER,
                        CANDIDATE_CONTENT.REVIEWED_AT)
                .from(CANDIDATE_CONTENT)
                .where(CANDIDATE_CONTENT.CANDIDATE_ID.eq(candidateId))
                .and(CANDIDATE_CONTENT.LANGUAGE.eq(language.code()))
                .and(CANDIDATE_CONTENT.REVIEW_STATUS.eq("PUBLISHED"))
                .and(CANDIDATE_CONTENT.ACTIVE.isTrue())
                .orderBy(CANDIDATE_CONTENT.SORT_ORDER, CANDIDATE_CONTENT.CANDIDATE_CONTENT_ID)
                .fetch(record -> new CandidateContentDto(
                        record.get(CANDIDATE_CONTENT.SECTION_TYPE),
                        record.get(CANDIDATE_CONTENT.TITLE),
                        record.get(CANDIDATE_CONTENT.BODY_MARKDOWN),
                        record.get(CANDIDATE_CONTENT.SORT_ORDER),
                        record.get(CANDIDATE_CONTENT.REVIEWED_AT)));
    }

    public CandidateSourcePage findSources(
            short candidateId,
            Language language,
            String relationshipType,
            int page,
            int size) {
        Condition condition = CANDIDATE_SOURCE.CANDIDATE_ID.eq(candidateId)
                .and(relationshipType != null && !relationshipType.isBlank()
                        ? CANDIDATE_SOURCE.RELATIONSHIP_TYPE.eq(relationshipType)
                        : DSL.noCondition())
                .and(CANDIDATE_SOURCE.REVIEW_STATUS.eq("PUBLISHED"))
                .and(CANDIDATE_SOURCE.ACTIVE.isTrue())
                .and(SOURCE.ACTIVE.isTrue());
        Condition localized = CANDIDATE_SOURCE_LOCALIZATION.LANGUAGE.eq(language.code())
                .and(CANDIDATE_SOURCE_LOCALIZATION.REVIEW_STATUS.eq("PUBLISHED"))
                .and(CANDIDATE_SOURCE_LOCALIZATION.ACTIVE.isTrue());

        long total = dsl.fetchCount(
                dsl.selectOne()
                        .from(CANDIDATE_SOURCE)
                        .join(SOURCE).on(SOURCE.SOURCE_ID.eq(CANDIDATE_SOURCE.SOURCE_ID))
                        .join(CANDIDATE_SOURCE_LOCALIZATION)
                            .on(CANDIDATE_SOURCE_LOCALIZATION.CANDIDATE_ID.eq(CANDIDATE_SOURCE.CANDIDATE_ID))
                            .and(CANDIDATE_SOURCE_LOCALIZATION.SOURCE_ID.eq(CANDIDATE_SOURCE.SOURCE_ID))
                        .where(condition)
                        .and(localized));

        List<CandidateSourceDto> items = dsl.select(
                        SOURCE.SOURCE_KEY,
                        SOURCE.SOURCE_TYPE,
                        CANDIDATE_SOURCE.RELATIONSHIP_TYPE,
                        SOURCE.PUBLISHER,
                        SOURCE.TITLE,
                        SOURCE.CANONICAL_URL,
                        SOURCE.LANGUAGE,
                        SOURCE.PUBLISHED_AT,
                        SOURCE.ARCHIVED_URL,
                        CANDIDATE_SOURCE_LOCALIZATION.SUMMARY,
                        CANDIDATE_SOURCE.SORT_ORDER,
                        CANDIDATE_SOURCE.VERIFIED_AT)
                .from(CANDIDATE_SOURCE)
                .join(SOURCE).on(SOURCE.SOURCE_ID.eq(CANDIDATE_SOURCE.SOURCE_ID))
                .join(CANDIDATE_SOURCE_LOCALIZATION)
                    .on(CANDIDATE_SOURCE_LOCALIZATION.CANDIDATE_ID.eq(CANDIDATE_SOURCE.CANDIDATE_ID))
                    .and(CANDIDATE_SOURCE_LOCALIZATION.SOURCE_ID.eq(CANDIDATE_SOURCE.SOURCE_ID))
                .where(condition)
                .and(localized)
                .orderBy(
                        CANDIDATE_SOURCE.SORT_ORDER,
                        SOURCE.PUBLISHED_AT.desc().nullsLast(),
                        SOURCE.SOURCE_ID)
                .limit(size)
                .offset((long) page * size)
                .fetch(record -> new CandidateSourceDto(
                        record.get(SOURCE.SOURCE_KEY),
                        record.get(SOURCE.SOURCE_TYPE),
                        record.get(CANDIDATE_SOURCE.RELATIONSHIP_TYPE),
                        record.get(SOURCE.PUBLISHER),
                        record.get(SOURCE.TITLE),
                        record.get(SOURCE.CANONICAL_URL),
                        record.get(SOURCE.LANGUAGE),
                        record.get(SOURCE.PUBLISHED_AT),
                        record.get(SOURCE.ARCHIVED_URL),
                        record.get(CANDIDATE_SOURCE_LOCALIZATION.SUMMARY),
                        record.get(CANDIDATE_SOURCE.SORT_ORDER),
                        record.get(CANDIDATE_SOURCE.VERIFIED_AT)));

        return new CandidateSourcePage(items, total);
    }
}
