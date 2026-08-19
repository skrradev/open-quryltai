package kz.quryltai.backend.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;
import kz.quryltai.backend.dto.CandidateDto;
import kz.quryltai.backend.dto.CandidateContentDto;
import kz.quryltai.backend.dto.CandidateQuery;
import kz.quryltai.backend.dto.CandidateSourceDto;
import kz.quryltai.backend.dto.CandidateSourceQuery;
import kz.quryltai.backend.dto.PageDto;
import kz.quryltai.backend.service.CandidateContentService;
import kz.quryltai.backend.service.CandidateService;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/candidates")
@RequiredArgsConstructor
public class CandidateController {

    private final CandidateService service;
    private final CandidateContentService contentService;

    @GetMapping
    public PageDto<CandidateDto> candidates(
            @Valid @ModelAttribute CandidateQuery query) {
        return service.findAll(query);
    }

    @GetMapping("/{candidateId}")
    public CandidateDto candidate(@PathVariable short candidateId) {
        return service.findById(candidateId);
    }

    @GetMapping("/{candidateId}/content")
    public List<CandidateContentDto> content(@PathVariable short candidateId) {
        return contentService.findContent(candidateId);
    }

    @GetMapping("/{candidateId}/sources")
    public PageDto<CandidateSourceDto> sources(
            @PathVariable short candidateId,
            @Valid @ModelAttribute CandidateSourceQuery query) {
        return contentService.findSources(candidateId, query);
    }
}
