package kz.quryltai.backend.dto;

import java.util.List;

public record PartyDetailsDto(
        PartyDto party,
        PartyStatisticsSummaryDto summary,
        List<StatisticsCategoryDto> genders,
        List<StatisticsCategoryDto> ageGroups,
        List<StatisticsCategoryDto> sectors) {
}
