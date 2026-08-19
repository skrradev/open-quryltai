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
        boolean incumbent,
        /** Always populated when a published photo exists — list rows render this. */
        String photoThumbnailUrl,
        /**
         * Full-size portrait. Populated on the single-candidate endpoint only:
         * originals run to several MB, so a list must not be able to render them.
         */
        String photoUrl,
        Short photoWidth,
        Short photoHeight) {
}
