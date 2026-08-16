package kz.quryltai.backend.model;

import java.util.List;

public record StatisticsData(
        int totalCandidates,
        int totalParties,
        double averageAge,
        int incumbentCount,
        List<PartyCountData> parties,
        List<CategoryCountData> genders,
        List<CategoryCountData> ageGroups,
        List<CategoryCountData> sectors) {
}
