package kz.quryltai.backend.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kz.quryltai.backend.dto.PartyGenderStatsDto;
import kz.quryltai.backend.dto.PartyCadreStatsDto;
import kz.quryltai.backend.dto.PartyGeographyStatsDto;
import kz.quryltai.backend.dto.PartyYouthStatsDto;
import kz.quryltai.backend.dto.StatisticsDto;
import kz.quryltai.backend.service.StatisticsService;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/statistics")
@RequiredArgsConstructor
public class StatisticsController {

    private final StatisticsService service;

    @GetMapping
    public StatisticsDto statistics() {
        return service.statistics();
    }


    @GetMapping("/youth")
    public List<PartyYouthStatsDto> youthStatistics() {
        return service.youthStatistics();
    }

    @GetMapping("/gender")
    public List<PartyGenderStatsDto> genderStatistics() {
        return service.genderStatistics();
    }

    @GetMapping("/cadre")
    public List<PartyCadreStatsDto> cadreStatistics() {
        return service.cadreStatistics();
    }

    @GetMapping("/geography")
    public List<PartyGeographyStatsDto> geographyStatistics() {
        return service.geographyStatistics();
    }
}
