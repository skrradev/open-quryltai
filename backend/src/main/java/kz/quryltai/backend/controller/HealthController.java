package kz.quryltai.backend.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kz.quryltai.backend.dto.HealthDto;
import kz.quryltai.backend.service.HealthService;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/health")
@RequiredArgsConstructor
public class HealthController {

    private final HealthService service;

    @GetMapping
    public HealthDto health() {
        return service.health();
    }
}
