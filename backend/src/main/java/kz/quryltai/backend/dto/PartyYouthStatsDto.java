package kz.quryltai.backend.dto;

/**
 * Young candidates on a party list.
 *
 * <p>Counts travel beside every share because the numbers are small — parties
 * field between four and twenty-four candidates under 35, so a third of a list
 * can be three people. A share alone would claim more precision than the data
 * has.
 */
public record PartyYouthStatsDto(
        String partyId,
        String partyName,
        int totalCandidates,
        int youthTotal,
        double youthPct,
        int youthTop10,
        int top10Size,
        int youthTopThird,
        int topThirdSize,
        int youthMidThird,
        int midThirdSize,
        int youthTailThird,
        int tailThirdSize,
        /** Position of the first candidate under 35, or 0 when the list has none. */
        int firstYouthRank) {
}
