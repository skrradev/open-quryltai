package kz.quryltai.backend.model;

import java.util.List;

public record CandidatePage(List<CandidateData> items, long total) {
}
