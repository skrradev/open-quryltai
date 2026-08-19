package kz.quryltai.backend.dto;

/**
 * Geography of declared residences, not electoral support or constituency
 * representation. The three cities are Astana, Almaty and Shymkent.
 */
public record PartyGeographyStatsDto(
        String partyId,
        String partyName,
        int totalCandidates,
        int republicanCityCount,
        double republicanCityPct,
        int distinctResidencePlaceCount) {
}
