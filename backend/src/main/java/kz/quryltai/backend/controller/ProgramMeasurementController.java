package kz.quryltai.backend.controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import kz.quryltai.backend.dto.ProgramComparisonDto;
import kz.quryltai.backend.dto.ProgramMeasurementDto;
import kz.quryltai.backend.service.ProgramMeasurementService;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/programs")
@RequiredArgsConstructor
public class ProgramMeasurementController {

    private final ProgramMeasurementService service;

    /** Every party side by side — the comparative view the home page renders. */
    @GetMapping("/comparison")
    public ProgramComparisonDto comparison() {
        return service.comparison();
    }

    /** One party's own profile, for its page. */
    @GetMapping("/{partyId:[a-z][a-z0-9_]*}")
    public ProgramMeasurementDto party(@PathVariable String partyId) {
        return service.forParty(partyId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }
}
