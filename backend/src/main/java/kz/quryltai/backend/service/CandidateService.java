package kz.quryltai.backend.service;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import kz.quryltai.backend.dto.CandidateDto;
import kz.quryltai.backend.dto.CandidatePlaceDto;
import kz.quryltai.backend.dto.CandidateQuery;
import kz.quryltai.backend.dto.PageDto;
import kz.quryltai.backend.dto.PartyDto;
import kz.quryltai.backend.model.CandidateData;
import kz.quryltai.backend.model.CandidateFilter;
import kz.quryltai.backend.repository.CandidateRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CandidateService {

    private final CandidateRepository repository;
    private final LocalizationService localization;

    public PageDto<CandidateDto> findAll(CandidateQuery query) {
        CandidateFilter filter = new CandidateFilter(
                query.partyId(),
                query.placeId(),
                query.placeType(),
                query.sector(),
                query.employerType(),
                query.gender(),
                query.partyInsider(),
                query.incumbent(),
                query.search(),
                query.page(),
                query.size(),
                query.sort(),
                query.direction());
        var result = repository.findAll(filter, localization.currentLanguage());
        List<CandidateDto> items = result.items().stream()
                .map(this::toDto)
                .toList();
        int totalPages = result.total() == 0
                ? 0
                : (int) ((result.total() + filter.size() - 1) / filter.size());
        return new PageDto<>(items, filter.page(), filter.size(), result.total(), totalPages);
    }

    public CandidateDto findById(short candidateId) {
        return repository.findById(candidateId, localization.currentLanguage())
                .map(this::toDto)
                .orElseThrow(() -> new ResponseStatusException(
                        HttpStatus.NOT_FOUND, "candidate not found"));
    }

    private CandidateDto toDto(CandidateData candidate) {
        return new CandidateDto(
                candidate.candidateId(),
                candidate.listOrder(),
                candidate.surname(),
                candidate.givenNames(),
                candidate.surname() + " " + candidate.givenNames(),
                candidate.birthYear(),
                localization.label("gender", candidate.gender()),
                candidate.position(),
                candidate.residenceRaw(),
                new PartyDto(candidate.partyId(), candidate.partyName()),
                new CandidatePlaceDto(
                        candidate.placeId(),
                        candidate.placeName(),
                        localization.label("place-type", candidate.placeType())),
                localization.label("sector", candidate.sector()),
                localization.label("employer-type", candidate.employerType()),
                candidate.partyInsider(),
                localization.label("seniority", candidate.seniority()),
                candidate.incumbent());
    }

}
