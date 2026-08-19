package kz.quryltai.backend.dto;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.Pattern;

public record CandidateSourceQuery(
        @Pattern(regexp = "MEDIA_MENTION|INTERVIEW|PROFILE|OFFICIAL_RECORD|OTHER")
        String type,
        @Min(0)
        Integer page,
        @Min(1) @Max(100)
        Integer size) {

    public CandidateSourceQuery {
        type = type == null || type.isBlank() ? null : type;
        page = page == null ? 0 : page;
        size = size == null ? 20 : size;
    }
}
