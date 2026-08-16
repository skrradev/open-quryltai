package kz.quryltai.backend.candidate;

import static kz.quryltai.backend.jooq.tables.Candidate.CANDIDATE;
import static kz.quryltai.backend.jooq.tables.Place.PLACE;
import static kz.quryltai.backend.jooq.tables.PoliticalParty.POLITICAL_PARTY;
import static org.jooq.impl.DSL.concat;
import static org.jooq.impl.DSL.inline;
import static org.jooq.impl.DSL.lower;
import static org.jooq.impl.DSL.noCondition;

import java.util.List;
import java.util.Optional;

import org.jooq.Condition;
import org.jooq.DSLContext;
import org.jooq.Field;
import org.jooq.Record;
import org.jooq.SortField;
import org.springframework.stereotype.Repository;

@Repository
public class CandidateRepository {

    private final DSLContext dsl;

    public CandidateRepository(DSLContext dsl) {
        this.dsl = dsl;
    }

    public CandidatePage findAll(CandidateFilter filter, boolean russian) {
        Condition condition = filters(filter);
        int total = dsl.fetchCount(
                dsl.selectOne()
                        .from(CANDIDATE)
                        .join(POLITICAL_PARTY).on(POLITICAL_PARTY.PARTY_ID.eq(CANDIDATE.PARTY_ID))
                        .join(PLACE).on(PLACE.PLACE_ID.eq(CANDIDATE.PLACE_ID))
                        .where(condition));

        List<CandidateRow> items = select(russian)
                .where(condition)
                .orderBy(orderBy(filter))
                .limit(filter.size())
                .offset((long) filter.page() * filter.size())
                .fetch(record -> mapRow(record, russian));
        return new CandidatePage(items, total);
    }

    public Optional<CandidateRow> findById(short candidateId, boolean russian) {
        return select(russian)
                .where(CANDIDATE.CANDIDATE_ID.eq(candidateId))
                .fetchOptional(record -> mapRow(record, russian));
    }

    private org.jooq.SelectJoinStep<? extends Record> select(boolean russian) {
        Field<String> position = russian ? CANDIDATE.POSITION_RU : CANDIDATE.POSITION_KK;
        Field<String> partyName = russian ? POLITICAL_PARTY.NAME_RU : POLITICAL_PARTY.NAME_KK;
        Field<String> placeName = russian ? PLACE.NAME_RU : PLACE.NAME_KK;
        return dsl.select(
                        CANDIDATE.CANDIDATE_ID,
                        CANDIDATE.LIST_ORDER,
                        CANDIDATE.SURNAME,
                        CANDIDATE.GIVEN_NAMES,
                        CANDIDATE.BIRTH_YEAR,
                        CANDIDATE.GENDER,
                        position,
                        CANDIDATE.RESIDENCE_RAW,
                        CANDIDATE.PARTY_ID,
                        partyName,
                        CANDIDATE.PLACE_ID,
                        PLACE.PLACE_TYPE,
                        placeName,
                        CANDIDATE.SECTOR,
                        CANDIDATE.EMPLOYER_TYPE,
                        CANDIDATE.IS_PARTY_INSIDER,
                        CANDIDATE.SENIORITY,
                        CANDIDATE.IS_INCUMBENT)
                .from(CANDIDATE)
                .join(POLITICAL_PARTY).on(POLITICAL_PARTY.PARTY_ID.eq(CANDIDATE.PARTY_ID))
                .join(PLACE).on(PLACE.PLACE_ID.eq(CANDIDATE.PLACE_ID));
    }

    private static Condition filters(CandidateFilter filter) {
        Condition condition = noCondition();
        condition = andEquals(condition, CANDIDATE.PARTY_ID, filter.partyId());
        condition = andEquals(condition, CANDIDATE.PLACE_ID, filter.placeId());
        condition = andEquals(condition, PLACE.PLACE_TYPE, filter.placeType());
        condition = andEquals(condition, CANDIDATE.SECTOR, filter.sector());
        condition = andEquals(condition, CANDIDATE.EMPLOYER_TYPE, filter.employerType());
        condition = andEquals(condition, CANDIDATE.GENDER, filter.gender());
        if (filter.partyInsider() != null) {
            condition = condition.and(CANDIDATE.IS_PARTY_INSIDER.eq(filter.partyInsider()));
        }
        if (filter.incumbent() != null) {
            condition = condition.and(CANDIDATE.IS_INCUMBENT.eq(filter.incumbent()));
        }
        if (hasText(filter.search())) {
            Field<String> searchable = lower(concat(
                    CANDIDATE.SURNAME, inline(" "), CANDIDATE.GIVEN_NAMES, inline(" "),
                    CANDIDATE.POSITION_KK, inline(" "), CANDIDATE.POSITION_RU));
            condition = condition.and(searchable.like("%" + filter.search().strip().toLowerCase() + "%"));
        }
        return condition;
    }

    private static Condition andEquals(Condition condition, Field<String> field, String value) {
        return hasText(value) ? condition.and(field.eq(value)) : condition;
    }

    private static boolean hasText(String value) {
        return value != null && !value.isBlank();
    }

    private static SortField<?>[] orderBy(CandidateFilter filter) {
        boolean descending = "desc".equalsIgnoreCase(filter.direction());
        return switch (filter.sort()) {
            case "name" -> new SortField<?>[] {
                    descending ? CANDIDATE.SURNAME.desc() : CANDIDATE.SURNAME.asc(),
                    descending ? CANDIDATE.GIVEN_NAMES.desc() : CANDIDATE.GIVEN_NAMES.asc()
            };
            case "birthYear" -> new SortField<?>[] {
                    descending ? CANDIDATE.BIRTH_YEAR.desc() : CANDIDATE.BIRTH_YEAR.asc(),
                    CANDIDATE.CANDIDATE_ID.asc()
            };
            case "listOrder" -> new SortField<?>[] {
                    descending ? CANDIDATE.LIST_ORDER.desc() : CANDIDATE.LIST_ORDER.asc(),
                    CANDIDATE.CANDIDATE_ID.asc()
            };
            default -> new SortField<?>[] {
                    POLITICAL_PARTY.DISPLAY_ORDER.asc(), CANDIDATE.LIST_ORDER.asc()
            };
        };
    }

    private static CandidateRow mapRow(Record record, boolean russian) {
        return new CandidateRow(
                record.get(CANDIDATE.CANDIDATE_ID),
                record.get(CANDIDATE.LIST_ORDER),
                record.get(CANDIDATE.SURNAME),
                record.get(CANDIDATE.GIVEN_NAMES),
                record.get(CANDIDATE.BIRTH_YEAR),
                record.get(CANDIDATE.GENDER),
                record.get(russian ? CANDIDATE.POSITION_RU : CANDIDATE.POSITION_KK),
                record.get(CANDIDATE.RESIDENCE_RAW),
                record.get(CANDIDATE.PARTY_ID),
                record.get(russian ? POLITICAL_PARTY.NAME_RU : POLITICAL_PARTY.NAME_KK),
                record.get(CANDIDATE.PLACE_ID),
                record.get(PLACE.PLACE_TYPE),
                record.get(russian ? PLACE.NAME_RU : PLACE.NAME_KK),
                record.get(CANDIDATE.SECTOR),
                record.get(CANDIDATE.EMPLOYER_TYPE),
                record.get(CANDIDATE.IS_PARTY_INSIDER),
                record.get(CANDIDATE.SENIORITY),
                record.get(CANDIDATE.IS_INCUMBENT));
    }

    public record CandidateFilter(
            String partyId,
            String placeId,
            String placeType,
            String sector,
            String employerType,
            String gender,
            Boolean partyInsider,
            Boolean incumbent,
            String search,
            int page,
            int size,
            String sort,
            String direction) {
    }

    public record CandidatePage(List<CandidateRow> items, long total) {
    }

    public record CandidateRow(
            short candidateId,
            short listOrder,
            String surname,
            String givenNames,
            short birthYear,
            String gender,
            String position,
            String residenceRaw,
            String partyId,
            String partyName,
            String placeId,
            String placeType,
            String placeName,
            String sector,
            String employerType,
            boolean partyInsider,
            String seniority,
            boolean incumbent) {
    }
}
