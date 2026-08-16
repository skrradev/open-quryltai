package kz.quryltai.backend.model;

import java.util.List;

public record PartyStatisticsData(
        String partyId,
        String partyName,
        int candidateCount,
        double averageAge,
        int incumbentCount,
        int partyInsiderCount,
        List<CategoryCountData> genders,
        List<CategoryCountData> ageGroups,
        List<CategoryCountData> sectors) {
}
