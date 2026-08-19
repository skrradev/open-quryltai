package kz.quryltai.backend.repository;

import static kz.quryltai.backend.jooq.tables.Candidate.CANDIDATE;
import static kz.quryltai.backend.jooq.tables.CandidateContent.CANDIDATE_CONTENT;
import static kz.quryltai.backend.jooq.tables.CandidateSource.CANDIDATE_SOURCE;
import static kz.quryltai.backend.jooq.tables.CandidateSourceLocalization.CANDIDATE_SOURCE_LOCALIZATION;
import static kz.quryltai.backend.jooq.tables.Source.SOURCE;

import java.time.OffsetDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kz.quryltai.backend.dto.ContentImportResult;
import kz.quryltai.backend.model.PreparedContentImport;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ContentImportRepository {

    private final DSLContext dsl;

    public Set<Short> findCandidateIds() {
        return Set.copyOf(dsl.select(CANDIDATE.CANDIDATE_ID).from(CANDIDATE).fetch(CANDIDATE.CANDIDATE_ID));
    }

    @Transactional
    public ContentImportResult importAll(PreparedContentImport data) {
        OffsetDateTime now = OffsetDateTime.now();

        for (var row : data.content()) {
            dsl.insertInto(CANDIDATE_CONTENT)
                    .set(CANDIDATE_CONTENT.CANDIDATE_ID, row.candidateId())
                    .set(CANDIDATE_CONTENT.LANGUAGE, row.language())
                    .set(CANDIDATE_CONTENT.SECTION_TYPE, row.sectionType())
                    .set(CANDIDATE_CONTENT.TITLE, row.title())
                    .set(CANDIDATE_CONTENT.BODY_MARKDOWN, row.bodyMarkdown())
                    .set(CANDIDATE_CONTENT.SORT_ORDER, row.sortOrder())
                    .set(CANDIDATE_CONTENT.REVIEW_STATUS, row.reviewStatus())
                    .set(CANDIDATE_CONTENT.REVIEWED_AT, row.reviewedAt())
                    .set(CANDIDATE_CONTENT.CONTENT_HASH, row.contentHash())
                    .set(CANDIDATE_CONTENT.SOURCE_REVISION, data.sourceRevision())
                    .set(CANDIDATE_CONTENT.ACTIVE, row.active())
                    .set(CANDIDATE_CONTENT.UPDATED_AT, now)
                    .onConflict(
                            CANDIDATE_CONTENT.CANDIDATE_ID,
                            CANDIDATE_CONTENT.LANGUAGE,
                            CANDIDATE_CONTENT.SECTION_TYPE)
                    .doUpdate()
                    .set(CANDIDATE_CONTENT.TITLE, row.title())
                    .set(CANDIDATE_CONTENT.BODY_MARKDOWN, row.bodyMarkdown())
                    .set(CANDIDATE_CONTENT.SORT_ORDER, row.sortOrder())
                    .set(CANDIDATE_CONTENT.REVIEW_STATUS, row.reviewStatus())
                    .set(CANDIDATE_CONTENT.REVIEWED_AT, row.reviewedAt())
                    .set(CANDIDATE_CONTENT.CONTENT_HASH, row.contentHash())
                    .set(CANDIDATE_CONTENT.SOURCE_REVISION, data.sourceRevision())
                    .set(CANDIDATE_CONTENT.ACTIVE, row.active())
                    .set(CANDIDATE_CONTENT.UPDATED_AT, now)
                    .where(CANDIDATE_CONTENT.CONTENT_HASH.ne(row.contentHash())
                            .or(CANDIDATE_CONTENT.SOURCE_REVISION.ne(data.sourceRevision())))
                    .execute();
        }

        Map<String, Long> sourceIds = new HashMap<>();
        for (var row : data.sources()) {
            Long sourceId = dsl.insertInto(SOURCE)
                    .set(SOURCE.SOURCE_KEY, row.sourceKey())
                    .set(SOURCE.SOURCE_TYPE, row.sourceType())
                    .set(SOURCE.PUBLISHER, row.publisher())
                    .set(SOURCE.TITLE, row.title())
                    .set(SOURCE.ORIGINAL_URL, row.originalUrl())
                    .set(SOURCE.CANONICAL_URL, row.canonicalUrl())
                    .set(SOURCE.LANGUAGE, row.language())
                    .set(SOURCE.PUBLISHED_AT, row.publishedAt())
                    .set(SOURCE.RETRIEVED_AT, row.retrievedAt())
                    .set(SOURCE.ARCHIVED_URL, row.archivedUrl())
                    .set(SOURCE.CONTENT_HASH, row.contentHash())
                    .set(SOURCE.SOURCE_REVISION, data.sourceRevision())
                    .set(SOURCE.ACTIVE, row.active())
                    .set(SOURCE.UPDATED_AT, now)
                    .onConflict(SOURCE.SOURCE_KEY)
                    .doUpdate()
                    .set(SOURCE.SOURCE_TYPE, row.sourceType())
                    .set(SOURCE.PUBLISHER, row.publisher())
                    .set(SOURCE.TITLE, row.title())
                    .set(SOURCE.ORIGINAL_URL, row.originalUrl())
                    .set(SOURCE.CANONICAL_URL, row.canonicalUrl())
                    .set(SOURCE.LANGUAGE, row.language())
                    .set(SOURCE.PUBLISHED_AT, row.publishedAt())
                    .set(SOURCE.RETRIEVED_AT, row.retrievedAt())
                    .set(SOURCE.ARCHIVED_URL, row.archivedUrl())
                    .set(SOURCE.CONTENT_HASH, row.contentHash())
                    .set(SOURCE.SOURCE_REVISION, data.sourceRevision())
                    .set(SOURCE.ACTIVE, row.active())
                    .set(SOURCE.UPDATED_AT, now)
                    .where(SOURCE.CONTENT_HASH.ne(row.contentHash())
                            .or(SOURCE.SOURCE_REVISION.ne(data.sourceRevision())))
                    .returningResult(SOURCE.SOURCE_ID)
                    .fetchOptional(SOURCE.SOURCE_ID)
                    .orElseGet(() -> dsl.select(SOURCE.SOURCE_ID)
                            .from(SOURCE)
                            .where(SOURCE.SOURCE_KEY.eq(row.sourceKey()))
                            .fetchSingle(SOURCE.SOURCE_ID));
            sourceIds.put(row.sourceKey(), sourceId);
        }

        for (var row : data.candidateSources()) {
            Long sourceId = sourceIds.get(row.sourceKey());
            dsl.insertInto(CANDIDATE_SOURCE)
                    .set(CANDIDATE_SOURCE.CANDIDATE_ID, row.candidateId())
                    .set(CANDIDATE_SOURCE.SOURCE_ID, sourceId)
                    .set(CANDIDATE_SOURCE.RELATIONSHIP_TYPE, row.relationshipType())
                    .set(CANDIDATE_SOURCE.IS_PRIMARY_SUBJECT, row.primarySubject())
                    .set(CANDIDATE_SOURCE.SORT_ORDER, row.sortOrder())
                    .set(CANDIDATE_SOURCE.VERIFIED_AT, row.verifiedAt())
                    .set(CANDIDATE_SOURCE.REVIEW_STATUS, row.reviewStatus())
                    .set(CANDIDATE_SOURCE.REVIEWED_AT, row.reviewedAt())
                    .set(CANDIDATE_SOURCE.CONTENT_HASH, row.contentHash())
                    .set(CANDIDATE_SOURCE.SOURCE_REVISION, data.sourceRevision())
                    .set(CANDIDATE_SOURCE.ACTIVE, row.active())
                    .set(CANDIDATE_SOURCE.UPDATED_AT, now)
                    .onConflict(CANDIDATE_SOURCE.CANDIDATE_ID, CANDIDATE_SOURCE.SOURCE_ID)
                    .doUpdate()
                    .set(CANDIDATE_SOURCE.RELATIONSHIP_TYPE, row.relationshipType())
                    .set(CANDIDATE_SOURCE.IS_PRIMARY_SUBJECT, row.primarySubject())
                    .set(CANDIDATE_SOURCE.SORT_ORDER, row.sortOrder())
                    .set(CANDIDATE_SOURCE.VERIFIED_AT, row.verifiedAt())
                    .set(CANDIDATE_SOURCE.REVIEW_STATUS, row.reviewStatus())
                    .set(CANDIDATE_SOURCE.REVIEWED_AT, row.reviewedAt())
                    .set(CANDIDATE_SOURCE.CONTENT_HASH, row.contentHash())
                    .set(CANDIDATE_SOURCE.SOURCE_REVISION, data.sourceRevision())
                    .set(CANDIDATE_SOURCE.ACTIVE, row.active())
                    .set(CANDIDATE_SOURCE.UPDATED_AT, now)
                    .where(CANDIDATE_SOURCE.CONTENT_HASH.ne(row.contentHash())
                            .or(CANDIDATE_SOURCE.SOURCE_REVISION.ne(data.sourceRevision())))
                    .execute();
        }

        for (var row : data.sourceLocalizations()) {
            Long sourceId = sourceIds.get(row.sourceKey());
            dsl.insertInto(CANDIDATE_SOURCE_LOCALIZATION)
                    .set(CANDIDATE_SOURCE_LOCALIZATION.CANDIDATE_ID, row.candidateId())
                    .set(CANDIDATE_SOURCE_LOCALIZATION.SOURCE_ID, sourceId)
                    .set(CANDIDATE_SOURCE_LOCALIZATION.LANGUAGE, row.language())
                    .set(CANDIDATE_SOURCE_LOCALIZATION.SUMMARY, row.summary())
                    .set(CANDIDATE_SOURCE_LOCALIZATION.REVIEW_STATUS, row.reviewStatus())
                    .set(CANDIDATE_SOURCE_LOCALIZATION.REVIEWED_AT, row.reviewedAt())
                    .set(CANDIDATE_SOURCE_LOCALIZATION.CONTENT_HASH, row.contentHash())
                    .set(CANDIDATE_SOURCE_LOCALIZATION.SOURCE_REVISION, data.sourceRevision())
                    .set(CANDIDATE_SOURCE_LOCALIZATION.ACTIVE, row.active())
                    .set(CANDIDATE_SOURCE_LOCALIZATION.UPDATED_AT, now)
                    .onConflict(
                            CANDIDATE_SOURCE_LOCALIZATION.CANDIDATE_ID,
                            CANDIDATE_SOURCE_LOCALIZATION.SOURCE_ID,
                            CANDIDATE_SOURCE_LOCALIZATION.LANGUAGE)
                    .doUpdate()
                    .set(CANDIDATE_SOURCE_LOCALIZATION.SUMMARY, row.summary())
                    .set(CANDIDATE_SOURCE_LOCALIZATION.REVIEW_STATUS, row.reviewStatus())
                    .set(CANDIDATE_SOURCE_LOCALIZATION.REVIEWED_AT, row.reviewedAt())
                    .set(CANDIDATE_SOURCE_LOCALIZATION.CONTENT_HASH, row.contentHash())
                    .set(CANDIDATE_SOURCE_LOCALIZATION.SOURCE_REVISION, data.sourceRevision())
                    .set(CANDIDATE_SOURCE_LOCALIZATION.ACTIVE, row.active())
                    .set(CANDIDATE_SOURCE_LOCALIZATION.UPDATED_AT, now)
                    .where(CANDIDATE_SOURCE_LOCALIZATION.CONTENT_HASH.ne(row.contentHash())
                            .or(CANDIDATE_SOURCE_LOCALIZATION.SOURCE_REVISION.ne(data.sourceRevision())))
                    .execute();
        }

        return new ContentImportResult(
                false,
                data.content().size(),
                data.sources().size(),
                data.candidateSources().size(),
                data.sourceLocalizations().size());
    }
}
