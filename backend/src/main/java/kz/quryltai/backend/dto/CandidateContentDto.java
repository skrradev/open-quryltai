package kz.quryltai.backend.dto;

import java.time.OffsetDateTime;

public record CandidateContentDto(
        String sectionType,
        String title,
        String bodyMarkdown,
        short sortOrder,
        OffsetDateTime reviewedAt) {
}
