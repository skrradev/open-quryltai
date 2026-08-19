package kz.quryltai.backend.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kz.quryltai.backend.dto.PartyDetailsDto;
import kz.quryltai.backend.service.PartyService;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/parties")
@RequiredArgsConstructor
public class PartyController {

    private final PartyService service;

    @GetMapping("/{partyId:[a-z][a-z0-9_]*}")
    public PartyDetailsDto party(@PathVariable String partyId) {
        return service.findById(partyId);
    }
}
