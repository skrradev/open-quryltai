package kz.quryltai.backend.dto;

public record CandidateDto(
        short candidateId,
        short listOrder,
        String surname,
        String givenNames,
        String fullName,
        short birthYear,
        CodeLabelDto gender,
        String position,
        String residenceRaw,
        PartyDto party,
        CandidatePlaceDto place,
        CodeLabelDto sector,
        CodeLabelDto employerType,
        boolean partyInsider,
        CodeLabelDto seniority,
        boolean incumbent) {
}
