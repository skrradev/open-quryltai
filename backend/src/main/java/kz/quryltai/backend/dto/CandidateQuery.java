package kz.quryltai.backend.dto;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.Pattern;

public record CandidateQuery(
        String partyId,
        String placeId,
        String placeType,
        String sector,
        String employerType,
        String gender,
        Boolean partyInsider,
        Boolean incumbent,
        String search,
        @Min(0) Integer page,
        @Min(1) @Max(100) Integer size,
        @Pattern(regexp = "party|name|birthYear|listOrder") String sort,
        @Pattern(regexp = "(?i)asc|desc") String direction) {

    public CandidateQuery {
        page = page == null ? 0 : page;
        size = size == null ? 24 : size;
        sort = sort == null || sort.isBlank() ? "party" : sort;
        direction = direction == null || direction.isBlank() ? "asc" : direction;
    }
}
