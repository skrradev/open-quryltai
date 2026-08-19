package kz.quryltai.backend.dto;

import java.time.OffsetDateTime;

public record CandidateSourceDto(
        String sourceKey,
        String sourceType,
        String relationshipType,
        String publisher,
        String title,
        String url,
        String language,
        OffsetDateTime publishedAt,
        String archivedUrl,
        String summary,
        short sortOrder,
        OffsetDateTime verifiedAt) {
}
