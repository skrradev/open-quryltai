package kz.quryltai.backend.service;

import org.springframework.stereotype.Service;

import kz.quryltai.backend.dto.HealthDto;
import kz.quryltai.backend.repository.HealthRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class HealthService {

    private final HealthRepository repository;

    public HealthDto health() {
        if (!repository.isDatabaseAvailable()) {
            throw new IllegalStateException("Database health check failed");
        }
        return new HealthDto("ok");
    }
}
