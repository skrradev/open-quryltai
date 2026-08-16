package kz.quryltai.backend.repository;

import static kz.quryltai.backend.jooq.tables.Candidate.CANDIDATE;
import static kz.quryltai.backend.jooq.tables.PoliticalParty.POLITICAL_PARTY;
import static org.jooq.impl.DSL.avg;
import static org.jooq.impl.DSL.count;
import static org.jooq.impl.DSL.inline;
import static org.jooq.impl.DSL.when;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

import org.jooq.DSLContext;
import org.jooq.Field;
import org.springframework.stereotype.Repository;

import kz.quryltai.backend.model.CategoryCountData;
import kz.quryltai.backend.model.Language;
import kz.quryltai.backend.model.PartyCountData;
import kz.quryltai.backend.model.StatisticsData;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class StatisticsRepository {

    private static final int ELECTION_YEAR = 2026;

    private final DSLContext dsl;

    public StatisticsData statistics(Language language) {
        Field<Integer> age = inline(ELECTION_YEAR).minus(CANDIDATE.BIRTH_YEAR.cast(Integer.class));
        Field<BigDecimal> averageAgeField = avg(age);
        BigDecimal averageAge = dsl.select(averageAgeField)
                .from(CANDIDATE)
                .fetchOne(averageAgeField);

        return new StatisticsData(
                dsl.fetchCount(CANDIDATE),
                dsl.fetchCount(POLITICAL_PARTY),
                averageAge == null ? 0 : averageAge.setScale(1, RoundingMode.HALF_UP).doubleValue(),
                dsl.fetchCount(CANDIDATE, CANDIDATE.IS_INCUMBENT.isTrue()),
                parties(language),
                categories(CANDIDATE.GENDER),
                ageGroups(age),
                categories(CANDIDATE.SECTOR));
    }

    private List<PartyCountData> parties(Language language) {
        Field<String> partyName = language.isRussian()
                ? POLITICAL_PARTY.NAME_RU
                : POLITICAL_PARTY.NAME_KK;
        Field<Integer> candidateCount = count();

        return dsl.select(POLITICAL_PARTY.PARTY_ID, partyName, candidateCount)
                .from(POLITICAL_PARTY)
                .leftJoin(CANDIDATE).on(CANDIDATE.PARTY_ID.eq(POLITICAL_PARTY.PARTY_ID))
                .groupBy(POLITICAL_PARTY.PARTY_ID, partyName, POLITICAL_PARTY.DISPLAY_ORDER)
                .orderBy(POLITICAL_PARTY.DISPLAY_ORDER)
                .fetch(record -> new PartyCountData(
                        record.get(POLITICAL_PARTY.PARTY_ID),
                        record.get(partyName),
                        record.get(candidateCount)));
    }

    private List<CategoryCountData> categories(Field<String> category) {
        Field<Integer> candidateCount = count();

        return dsl.select(category, candidateCount)
                .from(CANDIDATE)
                .groupBy(category)
                .orderBy(candidateCount.desc(), category.asc())
                .fetch(record -> new CategoryCountData(
                        record.get(category),
                        record.get(candidateCount)));
    }

    private List<CategoryCountData> ageGroups(Field<Integer> age) {
        Field<String> ageGroup = when(age.lt(inline(30)), inline("UNDER_30"))
                .when(age.le(inline(39)), inline("AGE_30_39"))
                .when(age.le(inline(49)), inline("AGE_40_49"))
                .when(age.le(inline(59)), inline("AGE_50_59"))
                .otherwise(inline("AGE_60_PLUS"));
        Field<Integer> candidateCount = count();

        return dsl.select(ageGroup, candidateCount)
                .from(CANDIDATE)
                .groupBy(ageGroup)
                .fetch(record -> new CategoryCountData(
                        record.get(ageGroup),
                        record.get(candidateCount)));
    }
}
