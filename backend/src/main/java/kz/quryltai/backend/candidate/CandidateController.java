package kz.quryltai.backend.candidate;

import java.util.List;
import java.util.Locale;

import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import kz.quryltai.backend.candidate.CandidateRepository.CandidateFilter;
import kz.quryltai.backend.candidate.CandidateRepository.CandidateRow;

@RestController
@RequestMapping("/api/candidates")
public class CandidateController {

    private final CandidateRepository repository;
    private final MessageSource messages;

    public CandidateController(CandidateRepository repository, MessageSource messages) {
        this.repository = repository;
        this.messages = messages;
    }

    @GetMapping
    public PageResponse<CandidateView> candidates(
            @RequestHeader(name = "Accept-Language", required = false) String language,
            @RequestParam(required = false) String partyId,
            @RequestParam(required = false) String placeId,
            @RequestParam(required = false) String placeType,
            @RequestParam(required = false) String sector,
            @RequestParam(required = false) String employerType,
            @RequestParam(required = false) String gender,
            @RequestParam(required = false) Boolean partyInsider,
            @RequestParam(required = false) Boolean incumbent,
            @RequestParam(required = false) String search,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "24") int size,
            @RequestParam(defaultValue = "party") String sort,
            @RequestParam(defaultValue = "asc") String direction) {
        if (page < 0 || size < 1 || size > 100) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "page must be >= 0 and size must be between 1 and 100");
        }
        Locale locale = locale(language);
        CandidateFilter filter = new CandidateFilter(
                partyId, placeId, placeType, sector, employerType, gender,
                partyInsider, incumbent, search, page, size, sort, direction);
        var result = repository.findAll(filter, isRussian(locale));
        List<CandidateView> items = result.items().stream().map(row -> view(row, locale)).toList();
        int totalPages = result.total() == 0 ? 0 : (int) ((result.total() + size - 1) / size);
        return new PageResponse<>(items, page, size, result.total(), totalPages);
    }

    @GetMapping("/{candidateId}")
    public CandidateView candidate(
            @PathVariable short candidateId,
            @RequestHeader(name = "Accept-Language", required = false) String language) {
        Locale locale = locale(language);
        return repository.findById(candidateId, isRussian(locale))
                .map(row -> view(row, locale))
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "candidate not found"));
    }

    private CandidateView view(CandidateRow row, Locale locale) {
        return new CandidateView(
                row.candidateId(), row.listOrder(), row.surname(), row.givenNames(),
                row.surname() + " " + row.givenNames(), row.birthYear(),
                code("gender", row.gender(), locale), row.position(), row.residenceRaw(),
                new PartyView(row.partyId(), row.partyName()),
                new PlaceView(row.placeId(), row.placeName(),
                        code("place-type", row.placeType(), locale)),
                code("sector", row.sector(), locale),
                code("employer-type", row.employerType(), locale),
                row.partyInsider(), code("seniority", row.seniority(), locale),
                row.incumbent());
    }

    private CodeLabel code(String group, String code, Locale locale) {
        return new CodeLabel(code, messages.getMessage(group + "." + code, null, locale));
    }

    static Locale locale(String language) {
        return language != null && language.toLowerCase().startsWith("ru")
                ? Locale.forLanguageTag("ru")
                : Locale.forLanguageTag("kk");
    }

    static boolean isRussian(Locale locale) {
        return "ru".equals(locale.getLanguage());
    }

    public record PageResponse<T>(
            List<T> items, int page, int size, long totalItems, int totalPages) {
    }

    public record CandidateView(
            short candidateId,
            short listOrder,
            String surname,
            String givenNames,
            String fullName,
            short birthYear,
            CodeLabel gender,
            String position,
            String residenceRaw,
            PartyView party,
            PlaceView place,
            CodeLabel sector,
            CodeLabel employerType,
            boolean partyInsider,
            CodeLabel seniority,
            boolean incumbent) {
    }

    public record CodeLabel(String code, String label) {
    }

    public record PartyView(String id, String name) {
    }

    public record PlaceView(String id, String name, CodeLabel type) {
    }
}
