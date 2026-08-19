package kz.quryltai.backend.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kz.quryltai.backend.dto.PartyDto;
import kz.quryltai.backend.dto.PlaceDto;
import kz.quryltai.backend.service.ReferenceService;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class ReferenceController {

    private final ReferenceService service;

    @GetMapping("/parties")
    public List<PartyDto> parties() {
        return service.parties();
    }

    @GetMapping("/places")
    public List<PlaceDto> places() {
        return service.places();
    }
}
