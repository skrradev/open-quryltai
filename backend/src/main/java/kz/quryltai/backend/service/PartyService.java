package kz.quryltai.backend.service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import kz.quryltai.backend.dto.PartyDetailsDto;
import kz.quryltai.backend.dto.PartyDto;
import kz.quryltai.backend.dto.PartyStatisticsSummaryDto;
import kz.quryltai.backend.dto.StatisticsCategoryDto;
import kz.quryltai.backend.model.CategoryCountData;
import kz.quryltai.backend.repository.StatisticsRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PartyService {

    private static final List<String> GENDERS = List.of("M", "F");
    private static final List<String> AGE_GROUPS = List.of(
            "UNDER_30", "AGE_30_39", "AGE_40_49", "AGE_50_59", "AGE_60_PLUS");

    private final StatisticsRepository repository;
    private final LocalizationService localization;

    public PartyDetailsDto findById(String partyId) {
        var data = repository.partyStatistics(partyId, localization.currentLanguage())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));

        return new PartyDetailsDto(
                new PartyDto(data.partyId(), data.partyName()),
                new PartyStatisticsSummaryDto(
                        data.candidateCount(),
                        data.averageAge(),
                        data.incumbentCount(),
                        data.partyInsiderCount()),
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
