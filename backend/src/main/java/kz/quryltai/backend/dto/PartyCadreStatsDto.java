package kz.quryltai.backend.dto;

/**
 * Two independent classifications of the job a candidate declared in the
 * election register. They are deliberately not rendered as a 100% composition:
 * a candidate can satisfy both conditions.
 */
public record PartyCadreStatsDto(
        String partyId,
        String partyName,
        int totalCandidates,
        int stateOrQuasiCount,
        double stateOrQuasiPct,
        int partyApparatusCount,
        double partyApparatusPct,
        int overlapCount) {
}
