package kz.quryltai.backend.model;

public record CandidateFilter(
        String partyId,
        String placeId,
        String placeType,
        String sector,
        String employerType,
        String gender,
        Boolean partyInsider,
        Boolean incumbent,
        String search,
        int page,
        int size,
        String sort,
        String direction) {
}
