package kz.quryltai.backend.repository;

import static kz.quryltai.backend.jooq.tables.Candidate.CANDIDATE;
import static kz.quryltai.backend.jooq.tables.CandidatePhoto.CANDIDATE_PHOTO;
import static kz.quryltai.backend.jooq.tables.PoliticalParty.POLITICAL_PARTY;
import static org.jooq.impl.DSL.avg;
import static org.jooq.impl.DSL.concat;
import static org.jooq.impl.DSL.count;
import static org.jooq.impl.DSL.inline;
import static org.jooq.impl.DSL.noCondition;
import static org.jooq.impl.DSL.sum;
import static org.jooq.impl.DSL.val;
import static org.jooq.impl.DSL.when;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.jooq.Condition;
import org.jooq.DSLContext;
import org.jooq.Field;
import org.springframework.stereotype.Repository;

import kz.quryltai.backend.dto.PartyGenderStatsDto;
import kz.quryltai.backend.dto.PartyCadreStatsDto;
import kz.quryltai.backend.dto.PartyGeographyStatsDto;
import kz.quryltai.backend.dto.PartyYouthStatsDto;
import kz.quryltai.backend.model.CategoryCountData;
import kz.quryltai.backend.model.Language;
import kz.quryltai.backend.model.PartyCountData;
import kz.quryltai.backend.model.PartyStatisticsData;
import kz.quryltai.backend.model.StatisticsData;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class StatisticsRepository {

    private static final int ELECTION_YEAR = 2026;
    /** Under-35 is the youth band used across the site's metrics. */
    private static final int YOUTH_MAX_AGE = 35;
    private static final List<String> REPUBLICAN_CITY_PLACE_IDS = List.of("astana", "almaty", "shymkent");

    private final DSLContext dsl;

    public StatisticsData statistics(Language language) {
        Field<Integer> age = inline(ELECTION_YEAR).minus(CANDIDATE.BIRTH_YEAR.cast(Integer.class));
        BigDecimal averageAge = averageAge(age, noCondition());

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

    public Optional<PartyStatisticsData> partyStatistics(String partyId, Language language) {
        Field<String> partyName = language.isRussian()
                ? POLITICAL_PARTY.NAME_RU
                : POLITICAL_PARTY.NAME_KK;

        return dsl.select(POLITICAL_PARTY.PARTY_ID, partyName)
                .from(POLITICAL_PARTY)
                .where(POLITICAL_PARTY.PARTY_ID.eq(partyId))
                .fetchOptional(record -> {
                    Condition partyCondition = CANDIDATE.PARTY_ID.eq(partyId);
                    Field<Integer> age = inline(ELECTION_YEAR)
                            .minus(CANDIDATE.BIRTH_YEAR.cast(Integer.class));
                    BigDecimal averageAge = averageAge(age, partyCondition);

                    return new PartyStatisticsData(
                            record.get(POLITICAL_PARTY.PARTY_ID),
                            record.get(partyName),
                            dsl.fetchCount(CANDIDATE, partyCondition),
                            averageAge == null
                                    ? 0
                                    : averageAge.setScale(1, RoundingMode.HALF_UP).doubleValue(),
                            dsl.fetchCount(CANDIDATE, partyCondition.and(CANDIDATE.IS_INCUMBENT.isTrue())),
                            dsl.fetchCount(CANDIDATE, partyCondition.and(CANDIDATE.IS_PARTY_INSIDER.isTrue())),
                            categories(CANDIDATE.GENDER, partyCondition),
                            ageGroups(age, partyCondition),
                            categories(CANDIDATE.SECTOR, partyCondition));
                });
    }

    private List<PartyCountData> parties(Language language) {
        // Chart axis: the short name. "Общенациональная социал-демократическая
        // партия" is 46 characters and was clipped mid-word wherever it appeared.
        Field<String> partyName = language.isRussian()
                ? POLITICAL_PARTY.SHORT_NAME_RU
                : POLITICAL_PARTY.SHORT_NAME_KK;
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
        return categories(category, noCondition());
    }

    private List<CategoryCountData> categories(Field<String> category, Condition condition) {
        Field<Integer> candidateCount = count();

        return dsl.select(category, candidateCount)
                .from(CANDIDATE)
                .where(condition)
                .groupBy(category)
                .orderBy(candidateCount.desc(), category.asc())
                .fetch(record -> new CategoryCountData(
                        record.get(category),
                        record.get(candidateCount)));
    }

    private List<CategoryCountData> ageGroups(Field<Integer> age) {
        return ageGroups(age, noCondition());
    }

    private List<CategoryCountData> ageGroups(Field<Integer> age, Condition condition) {
        Field<String> ageGroup = when(age.lt(inline(30)), inline("UNDER_30"))
                .when(age.le(inline(39)), inline("AGE_30_39"))
                .when(age.le(inline(49)), inline("AGE_40_49"))
                .when(age.le(inline(59)), inline("AGE_50_59"))
                .otherwise(inline("AGE_60_PLUS"));
        Field<Integer> candidateCount = count();

        return dsl.select(ageGroup, candidateCount)
                .from(CANDIDATE)
                .where(condition)
                .groupBy(ageGroup)
                .fetch(record -> new CategoryCountData(
                        record.get(ageGroup),
                        record.get(candidateCount)));
    }

    private BigDecimal averageAge(Field<Integer> age, Condition condition) {
        Field<BigDecimal> averageAge = avg(age);

        return dsl.select(averageAge)
                .from(CANDIDATE)
                .where(condition)
                .fetchOne(averageAge);
    }

    public List<PartyGenderStatsDto> genderStatistics(Language language) {
        Field<String> partyName = language.isRussian()
                ? POLITICAL_PARTY.SHORT_NAME_RU
                : POLITICAL_PARTY.SHORT_NAME_KK;

        var parties = dsl.select(
                POLITICAL_PARTY.PARTY_ID,
                partyName)
                .from(POLITICAL_PARTY)
                .orderBy(POLITICAL_PARTY.PARTY_ID)
                .fetch();

        List<PartyGenderStatsDto> result = new ArrayList<>();

        for (var p : parties) {
            String partyId = p.get(POLITICAL_PARTY.PARTY_ID);
            String pName = p.get(partyName);

            var candidates = dsl.select(
                    CANDIDATE.GENDER,
                    CANDIDATE.LIST_ORDER)
                    .from(CANDIDATE)
                    .where(CANDIDATE.PARTY_ID.eq(partyId))
                    .orderBy(CANDIDATE.LIST_ORDER.asc())
                    .fetch();

            int total = candidates.size();
            if (total == 0) continue;

            int womenTotal = 0;
            int womenTop10 = 0;
            int top10Total = Math.min(10, total);
            int firstWomanRank = -1;

            double sumOrderWomen = 0;
            double sumOrderMen = 0;
            int menTotal = 0;

            int tier1End = (int) Math.ceil(total / 3.0);
            int tier2End = (int) Math.ceil((2.0 * total) / 3.0);

            int t1Total = tier1End;
            int t2Total = tier2End - tier1End;
            int t3Total = total - tier2End;

            int t1Women = 0;
            int t2Women = 0;
            int t3Women = 0;

            for (var c : candidates) {
                String gender = c.get(CANDIDATE.GENDER);
                int order = c.get(CANDIDATE.LIST_ORDER);

                boolean isWoman = "F".equalsIgnoreCase(gender);
                if (isWoman) {
                    womenTotal++;
                    sumOrderWomen += order;
                    if (firstWomanRank == -1) {
                        firstWomanRank = order;
                    }
                    if (order <= 10) {
                        womenTop10++;
                    }
                    if (order <= tier1End) {
                        t1Women++;
                    } else if (order <= tier2End) {
                        t2Women++;
                    } else {
                        t3Women++;
                    }
                } else {
                    menTotal++;
                    sumOrderMen += order;
                }
            }

            double womenPct = Math.round((1000.0 * womenTotal) / total) / 10.0;
            double womenTop10Pct = Math.round((1000.0 * womenTop10) / top10Total) / 10.0;
            double womenTopThirdPct = t1Total > 0 ? Math.round((1000.0 * t1Women) / t1Total) / 10.0 : 0.0;
            double womenMidThirdPct = t2Total > 0 ? Math.round((1000.0 * t2Women) / t2Total) / 10.0 : 0.0;
            double womenTailThirdPct = t3Total > 0 ? Math.round((1000.0 * t3Women) / t3Total) / 10.0 : 0.0;

            double avgOrderWomen = womenTotal > 0 ? Math.round((10.0 * sumOrderWomen) / womenTotal) / 10.0 : 0.0;
            double avgOrderMen = menTotal > 0 ? Math.round((10.0 * sumOrderMen) / menTotal) / 10.0 : 0.0;

            result.add(new PartyGenderStatsDto(
                    partyId,
                    pName,
                    total,
                    womenTotal,
                    womenPct,
                    womenTop10,
                    womenTop10Pct,
                    womenTopThirdPct,
                    womenMidThirdPct,
                    womenTailThirdPct,
                    t1Women,
                    t1Total,
                    t2Women,
                    t2Total,
                    t3Women,
                    t3Total,
                    avgOrderWomen,
                    avgOrderMen,
                    firstWomanRank == -1 ? 0 : firstWomanRank));
        }

        return result;
    }

    /**
     * Young candidates per party, with counts beside every share.
     *
     * <p>Deliberately parallel to {@link #genderStatistics}: the youth figures are
     * what make the gender finding defensible. Women sit lower on lists than their
     * overall share predicts; if the same were true of every quota category the
     * finding would be about list mechanics rather than gender. It is not — youth
     * is flat across the bands.
     */
    public List<PartyYouthStatsDto> youthStatistics(Language language) {
        Field<String> partyName = language.isRussian()
                ? POLITICAL_PARTY.SHORT_NAME_RU
                : POLITICAL_PARTY.SHORT_NAME_KK;

        var parties = dsl.select(POLITICAL_PARTY.PARTY_ID, partyName)
                .from(POLITICAL_PARTY)
                .orderBy(POLITICAL_PARTY.DISPLAY_ORDER)
                .fetch();

        List<PartyYouthStatsDto> result = new ArrayList<>();

        for (var party : parties) {
            String partyId = party.get(POLITICAL_PARTY.PARTY_ID);

            var candidates = dsl.select(CANDIDATE.BIRTH_YEAR, CANDIDATE.LIST_ORDER)
                    .from(CANDIDATE)
                    .where(CANDIDATE.PARTY_ID.eq(partyId))
                    .orderBy(CANDIDATE.LIST_ORDER.asc())
                    .fetch();

            int total = candidates.size();
            if (total == 0) {
                continue;
            }

            // Thirds of the list. list_order is contiguous 1..N for every party,
            // so the boundaries can be derived from the count.
            int firstThirdEnd = (int) Math.ceil(total / 3.0);
            int secondThirdEnd = (int) Math.ceil((2.0 * total) / 3.0);
            int top10Size = Math.min(10, total);

            int youthTotal = 0;
            int youthTop10 = 0;
            int youthFirst = 0;
            int youthSecond = 0;
            int youthThird = 0;
            int firstYouthRank = 0;

            for (var candidate : candidates) {
                int age = ELECTION_YEAR - candidate.get(CANDIDATE.BIRTH_YEAR);
                if (age >= YOUTH_MAX_AGE) {
                    continue;
                }
                int order = candidate.get(CANDIDATE.LIST_ORDER);
                youthTotal++;
                if (firstYouthRank == 0) {
                    firstYouthRank = order;
                }
                if (order <= 10) {
                    youthTop10++;
                }
                if (order <= firstThirdEnd) {
                    youthFirst++;
                } else if (order <= secondThirdEnd) {
                    youthSecond++;
                } else {
                    youthThird++;
                }
            }

            result.add(new PartyYouthStatsDto(
                    partyId,
                    party.get(partyName),
                    total,
                    youthTotal,
                    Math.round((1000.0 * youthTotal) / total) / 10.0,
                    youthTop10,
                    top10Size,
                    youthFirst,
                    firstThirdEnd,
                    youthSecond,
                    secondThirdEnd - firstThirdEnd,
                    youthThird,
                    total - secondThirdEnd,
                    firstYouthRank));
        }

        return result;
    }

    public List<PartyCadreStatsDto> cadreStatistics(Language language) {
        Field<String> partyName = language.isRussian()
                ? POLITICAL_PARTY.SHORT_NAME_RU
                : POLITICAL_PARTY.SHORT_NAME_KK;
        var parties = dsl.select(POLITICAL_PARTY.PARTY_ID, partyName)
                .from(POLITICAL_PARTY)
                .orderBy(POLITICAL_PARTY.DISPLAY_ORDER)
                .fetch();

        List<PartyCadreStatsDto> result = new ArrayList<>();
        for (var party : parties) {
            String partyId = party.get(POLITICAL_PARTY.PARTY_ID);
            Condition inParty = CANDIDATE.PARTY_ID.eq(partyId);
            Condition stateOrQuasi = CANDIDATE.EMPLOYER_TYPE.in("STATE_BODY", "QUASI_GOVERNMENTAL");
            int total = dsl.fetchCount(CANDIDATE, inParty);
            int stateOrQuasiCount = dsl.fetchCount(CANDIDATE, inParty.and(stateOrQuasi));
            int partyApparatusCount = dsl.fetchCount(CANDIDATE, inParty.and(CANDIDATE.IS_PARTY_INSIDER.isTrue()));
            int overlapCount = dsl.fetchCount(
                    CANDIDATE, inParty.and(stateOrQuasi).and(CANDIDATE.IS_PARTY_INSIDER.isTrue()));

            result.add(new PartyCadreStatsDto(
                    partyId,
                    party.get(partyName),
                    total,
                    stateOrQuasiCount,
                    percentage(stateOrQuasiCount, total),
                    partyApparatusCount,
                    percentage(partyApparatusCount, total),
                    overlapCount));
        }
        return result;
    }

    public List<PartyGeographyStatsDto> geographyStatistics(Language language) {
        Field<String> partyName = language.isRussian()
                ? POLITICAL_PARTY.SHORT_NAME_RU
                : POLITICAL_PARTY.SHORT_NAME_KK;
        var parties = dsl.select(POLITICAL_PARTY.PARTY_ID, partyName)
                .from(POLITICAL_PARTY)
                .orderBy(POLITICAL_PARTY.DISPLAY_ORDER)
                .fetch();

        List<PartyGeographyStatsDto> result = new ArrayList<>();
        for (var party : parties) {
            String partyId = party.get(POLITICAL_PARTY.PARTY_ID);
            Condition inParty = CANDIDATE.PARTY_ID.eq(partyId);
            int total = dsl.fetchCount(CANDIDATE, inParty);
            int republicanCityCount = dsl.fetchCount(
                    CANDIDATE, inParty.and(CANDIDATE.PLACE_ID.in(REPUBLICAN_CITY_PLACE_IDS)));
            int distinctPlaces = dsl.selectDistinct(CANDIDATE.PLACE_ID)
                    .from(CANDIDATE)
                    .where(inParty)
                    .fetchSet(CANDIDATE.PLACE_ID)
                    .size();

            result.add(new PartyGeographyStatsDto(
                    partyId,
                    party.get(partyName),
                    total,
                    republicanCityCount,
                    percentage(republicanCityCount, total),
                    distinctPlaces));
        }
        return result;
    }

    private static double percentage(int numerator, int denominator) {
        return denominator == 0 ? 0.0 : Math.round((1000.0 * numerator) / denominator) / 10.0;
    }
}
