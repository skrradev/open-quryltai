package kz.quryltai.backend.dto;

public record StatisticsSummaryDto(
        int totalCandidates,
        int totalParties,
        double averageAge,
        int incumbentCount) {
}
