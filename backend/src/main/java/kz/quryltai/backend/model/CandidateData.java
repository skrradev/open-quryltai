package kz.quryltai.backend.model;

import java.math.BigDecimal;

public record CandidateData(
        short candidateId,
        short listOrder,
        String surname,
        String givenNames,
        short birthYear,
        String gender,
        String position,
        String residenceRaw,
        String partyId,
        String partyName,
        String placeId,
        String placeType,
        String placeName,
        String sector,
        String employerType,
        boolean partyInsider,
        String seniority,
        boolean incumbent,
        String photoKey,
        String photoThumbnailKey,
        Short photoWidth,
        Short photoHeight) {
}
