package kz.quryltai.backend.service;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import kz.quryltai.backend.dto.CandidateContentDto;
import kz.quryltai.backend.dto.CandidateSourceDto;
import kz.quryltai.backend.dto.CandidateSourceQuery;
import kz.quryltai.backend.dto.PageDto;
import kz.quryltai.backend.repository.CandidateContentRepository;
import kz.quryltai.backend.repository.CandidateRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CandidateContentService {

    private final CandidateContentRepository contentRepository;
    private final CandidateRepository candidateRepository;
    private final LocalizationService localization;

    public List<CandidateContentDto> findContent(short candidateId) {
        requireCandidate(candidateId);
        return contentRepository.findPublishedContent(candidateId, localization.currentLanguage());
    }

    public PageDto<CandidateSourceDto> findSources(short candidateId, CandidateSourceQuery query) {
        requireCandidate(candidateId);
        var result = contentRepository.findSources(
                candidateId,
                localization.currentLanguage(),
                query.type(),
                query.page(),
                query.size());
        int totalPages = result.total() == 0
                ? 0
                : (int) ((result.total() + query.size() - 1) / query.size());
        return new PageDto<>(result.items(), query.page(), query.size(), result.total(), totalPages);
    }

    private void requireCandidate(short candidateId) {
        if (!candidateRepository.exists(candidateId)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "candidate not found");
        }
    }
}
