package kz.quryltai.backend.dto;

import java.util.List;

public record StatisticsDto(
        StatisticsSummaryDto summary,
        List<StatisticsPartyDto> parties,
        List<StatisticsCategoryDto> genders,
        List<StatisticsCategoryDto> ageGroups,
        List<StatisticsCategoryDto> sectors) {
}
