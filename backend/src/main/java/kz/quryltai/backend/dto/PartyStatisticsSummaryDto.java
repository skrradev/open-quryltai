package kz.quryltai.backend.dto;

public record PartyStatisticsSummaryDto(
        int candidateCount,
        double averageAge,
        int incumbentCount,
        int partyInsiderCount) {
}
