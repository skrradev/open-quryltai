package kz.quryltai.backend.dto;

public record PartyGenderStatsDto(
        String partyId,
        String partyName,
        int totalCandidates,
        int womenTotal,
        double womenPct,
        int womenTop10,
        double womenTop10Pct,
        double womenTopThirdPct,
        double womenMidThirdPct,
        double womenTailThirdPct,
        // Counts as well as shares: the corpus-level comparison against youth has
        // to be summed, and summing percentages over lists of different lengths
        // gives the wrong answer.
        int womenTopThird,
        int topThirdSize,
        int womenMidThird,
        int midThirdSize,
        int womenTailThird,
        int tailThirdSize,
        double avgOrderWomen,
        double avgOrderMen,
        int firstWomanRank) {
}
