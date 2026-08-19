package kz.quryltai.backend.model;

import java.time.OffsetDateTime;
import java.util.List;

public record PreparedContentImport(
        List<ContentRow> content,
        List<SourceRow> sources,
        List<CandidateSourceRow> candidateSources,
        List<SourceLocalizationRow> sourceLocalizations,
        String sourceRevision) {

    public record ContentRow(
            short candidateId,
            String language,
            String sectionType,
            String title,
            String bodyMarkdown,
            short sortOrder,
            String reviewStatus,
            OffsetDateTime reviewedAt,
            String contentHash,
            boolean active) {
    }

    public record SourceRow(
            String sourceKey,
            String sourceType,
            String publisher,
            String title,
            String originalUrl,
            String canonicalUrl,
            String language,
            OffsetDateTime publishedAt,
            OffsetDateTime retrievedAt,
            String archivedUrl,
            String contentHash,
            boolean active) {
    }

    public record CandidateSourceRow(
            short candidateId,
            String sourceKey,
            String relationshipType,
            boolean primarySubject,
            short sortOrder,
            OffsetDateTime verifiedAt,
            String reviewStatus,
            OffsetDateTime reviewedAt,
            String contentHash,
            boolean active) {
    }

    public record SourceLocalizationRow(
            short candidateId,
            String sourceKey,
            String language,
            String summary,
            String reviewStatus,
            OffsetDateTime reviewedAt,
            String contentHash,
            boolean active) {
    }
}
