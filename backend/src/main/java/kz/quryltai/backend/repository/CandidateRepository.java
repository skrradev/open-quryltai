package kz.quryltai.backend.repository;

import static kz.quryltai.backend.jooq.tables.Candidate.CANDIDATE;
import static kz.quryltai.backend.jooq.tables.CandidatePhoto.CANDIDATE_PHOTO;
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

import kz.quryltai.backend.model.CandidateData;
import kz.quryltai.backend.model.CandidateFilter;
import kz.quryltai.backend.model.CandidatePage;
import kz.quryltai.backend.model.Language;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class CandidateRepository {

    private static final String PRIMARY_ROLE = "PRIMARY";
    private static final String PUBLISHED_STATUS = "PUBLISHED";

    private final DSLContext dsl;

    public boolean exists(short candidateId) {
        return dsl.fetchExists(
                dsl.selectOne()
                        .from(CANDIDATE)
                        .where(CANDIDATE.CANDIDATE_ID.eq(candidateId)));
    }

    public CandidatePage findAll(CandidateFilter filter, Language language) {
        Condition condition = filters(filter);
        int total = dsl.fetchCount(
                dsl.selectOne()
                        .from(CANDIDATE)
                        .join(POLITICAL_PARTY).on(POLITICAL_PARTY.PARTY_ID.eq(CANDIDATE.PARTY_ID))
                        .join(PLACE).on(PLACE.PLACE_ID.eq(CANDIDATE.PLACE_ID))
                        .where(condition));

        List<CandidateData> items = select(language)
                .where(condition)
                .orderBy(orderBy(filter))
                .limit(filter.size())
                .offset((long) filter.page() * filter.size())
                .fetch(record -> map(record, language));
        return new CandidatePage(items, total);
    }

    public Optional<CandidateData> findById(short candidateId, Language language) {
        return select(language)
                .where(CANDIDATE.CANDIDATE_ID.eq(candidateId))
                .fetchOptional(record -> map(record, language));
    }

    private org.jooq.SelectJoinStep<? extends Record> select(Language language) {
        Field<String> position = language.isRussian() ? CANDIDATE.POSITION_RU : CANDIDATE.POSITION_KK;
        Field<String> partyName = language.isRussian() ? POLITICAL_PARTY.NAME_RU : POLITICAL_PARTY.NAME_KK;
        Field<String> placeName = language.isRussian() ? PLACE.NAME_RU : PLACE.NAME_KK;
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
                        CANDIDATE.IS_INCUMBENT,
                        CANDIDATE_PHOTO.R2_KEY,
                        CANDIDATE_PHOTO.THUMB_R2_KEY,
                        CANDIDATE_PHOTO.WIDTH,
                        CANDIDATE_PHOTO.HEIGHT)
                .from(CANDIDATE)
                .join(POLITICAL_PARTY).on(POLITICAL_PARTY.PARTY_ID.eq(CANDIDATE.PARTY_ID))
                .join(PLACE).on(PLACE.PLACE_ID.eq(CANDIDATE.PLACE_ID))
                // Left join: most candidates still have no photo, and they must
                // not disappear from the list. Unpublished rows are invisible here.
                .leftJoin(CANDIDATE_PHOTO).on(publishedPrimaryPhoto());
    }

    private static Condition publishedPrimaryPhoto() {
        return CANDIDATE_PHOTO.CANDIDATE_ID.eq(CANDIDATE.CANDIDATE_ID)
                .and(CANDIDATE_PHOTO.PHOTO_ROLE.eq(PRIMARY_ROLE))
                .and(CANDIDATE_PHOTO.ACTIVE.isTrue())
                .and(CANDIDATE_PHOTO.REVIEW_STATUS.eq(PUBLISHED_STATUS));
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

    private static CandidateData map(Record record, Language language) {
        return new CandidateData(
                record.get(CANDIDATE.CANDIDATE_ID),
                record.get(CANDIDATE.LIST_ORDER),
                record.get(CANDIDATE.SURNAME),
                record.get(CANDIDATE.GIVEN_NAMES),
                record.get(CANDIDATE.BIRTH_YEAR),
                record.get(CANDIDATE.GENDER),
                record.get(language.isRussian() ? CANDIDATE.POSITION_RU : CANDIDATE.POSITION_KK),
                record.get(CANDIDATE.RESIDENCE_RAW),
                record.get(CANDIDATE.PARTY_ID),
                record.get(language.isRussian() ? POLITICAL_PARTY.NAME_RU : POLITICAL_PARTY.NAME_KK),
                record.get(CANDIDATE.PLACE_ID),
                record.get(PLACE.PLACE_TYPE),
                record.get(language.isRussian() ? PLACE.NAME_RU : PLACE.NAME_KK),
                record.get(CANDIDATE.SECTOR),
                record.get(CANDIDATE.EMPLOYER_TYPE),
                record.get(CANDIDATE.IS_PARTY_INSIDER),
                record.get(CANDIDATE.SENIORITY),
                record.get(CANDIDATE.IS_INCUMBENT),
                record.get(CANDIDATE_PHOTO.R2_KEY),
                record.get(CANDIDATE_PHOTO.THUMB_R2_KEY),
                record.get(CANDIDATE_PHOTO.WIDTH),
                record.get(CANDIDATE_PHOTO.HEIGHT));
    }
}
