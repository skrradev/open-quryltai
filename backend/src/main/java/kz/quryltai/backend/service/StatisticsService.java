package kz.quryltai.backend.service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import kz.quryltai.backend.dto.PartyDto;
import kz.quryltai.backend.dto.StatisticsCategoryDto;
import kz.quryltai.backend.dto.StatisticsDto;
import kz.quryltai.backend.dto.StatisticsPartyDto;
import kz.quryltai.backend.dto.StatisticsSummaryDto;
import kz.quryltai.backend.model.CategoryCountData;
import kz.quryltai.backend.repository.StatisticsRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StatisticsService {

    private static final List<String> GENDERS = List.of("M", "F");
    private static final List<String> AGE_GROUPS = List.of(
            "UNDER_30", "AGE_30_39", "AGE_40_49", "AGE_50_59", "AGE_60_PLUS");

    private final StatisticsRepository repository;
    private final LocalizationService localization;

    public StatisticsDto statistics() {
        var data = repository.statistics(localization.currentLanguage());

        return new StatisticsDto(
                new StatisticsSummaryDto(
                        data.totalCandidates(),
                        data.totalParties(),
                        data.averageAge(),
                        data.incumbentCount()),
                        data.parties().stream()
                        .map(party -> new StatisticsPartyDto(
                                new PartyDto(party.id(), party.name()),
                                party.count()))
                        .toList(),
                orderedCategories("gender", GENDERS, data.genders()),
                orderedCategories("age-group", AGE_GROUPS, data.ageGroups()),
                categories("sector", data.sectors()));
    }

    private List<StatisticsCategoryDto> orderedCategories(
            String labelGroup,
            List<String> order,
            List<CategoryCountData> categories) {
        Map<String, Integer> counts = categories.stream()
                .collect(Collectors.toMap(
                        CategoryCountData::code,
                        CategoryCountData::count));

        return order.stream()
                .map(code -> new StatisticsCategoryDto(
                        localization.label(labelGroup, code),
                        counts.getOrDefault(code, 0)))
                .toList();
    }

    private List<StatisticsCategoryDto> categories(
            String labelGroup,
            List<CategoryCountData> categories) {
        return categories.stream()
                .map(category -> new StatisticsCategoryDto(
                        localization.label(labelGroup, category.code()),
                        category.count()))
                .toList();
    }
}
