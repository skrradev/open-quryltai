package kz.quryltai.backend.model;

import java.util.List;

import kz.quryltai.backend.dto.CandidateSourceDto;

public record CandidateSourcePage(List<CandidateSourceDto> items, long total) {
}
