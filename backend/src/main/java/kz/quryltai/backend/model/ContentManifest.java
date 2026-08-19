package kz.quryltai.backend.model;

import java.util.List;

public record ContentManifest(
        List<ContentEntry> content,
        List<SourceEntry> sources,
        List<CandidateSourceEntry> candidateSources,
        List<SourceLocalizationEntry> sourceLocalizations) {

    public ContentManifest {
        content = content == null ? List.of() : List.copyOf(content);
        sources = sources == null ? List.of() : List.copyOf(sources);
        candidateSources = candidateSources == null ? List.of() : List.copyOf(candidateSources);
        sourceLocalizations = sourceLocalizations == null
                ? List.of()
                : List.copyOf(sourceLocalizations);
    }

    public record ContentEntry(
            short candidateId,
            String language,
            String sectionType,
            String title,
            String bodyFile,
            short sortOrder,
            String reviewStatus,
            String reviewedAt,
            Boolean active) {
    }

    public record SourceEntry(
            String sourceKey,
            String sourceType,
            String publisher,
            String title,
            String originalUrl,
            String canonicalUrl,
            String language,
            String publishedAt,
            String retrievedAt,
            String archivedUrl,
            Boolean active) {
    }

    public record CandidateSourceEntry(
            short candidateId,
            String sourceKey,
            String relationshipType,
            boolean primarySubject,
            short sortOrder,
            String verifiedAt,
            String reviewStatus,
            String reviewedAt,
            Boolean active) {
    }

    public record SourceLocalizationEntry(
            short candidateId,
            String sourceKey,
            String language,
            String summaryFile,
            String reviewStatus,
            String reviewedAt,
            Boolean active) {
    }
}
