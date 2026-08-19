package kz.quryltai.backend.repository;

import static kz.quryltai.backend.jooq.tables.PartyProgramMeasurement.PARTY_PROGRAM_MEASUREMENT;
import static kz.quryltai.backend.jooq.tables.PartyProgramStatementType.PARTY_PROGRAM_STATEMENT_TYPE;
import static kz.quryltai.backend.jooq.tables.PartyProgramTopic.PARTY_PROGRAM_TOPIC;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;

import kz.quryltai.backend.model.ProgramMeasurementData;
import kz.quryltai.backend.model.ProgramStatementTypeData;
import kz.quryltai.backend.model.ProgramTopicData;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ProgramMeasurementRepository {

    private final DSLContext dsl;

    public Optional<ProgramMeasurementData> findByParty(String partyId) {
        return dsl.selectFrom(PARTY_PROGRAM_MEASUREMENT)
                .where(PARTY_PROGRAM_MEASUREMENT.PARTY_ID.eq(partyId))
                .fetchOptional()
                .map(row -> new ProgramMeasurementData(
                        row.getPartyId(),
                        row.getUnitsTotal(),
                        row.getDenominator(),
                        row.getCodebookVersion(),
                        topics(List.of(partyId)).getOrDefault(partyId, List.of()),
                        statementTypes(List.of(partyId)).getOrDefault(partyId, List.of())));
    }

    /**
     * Every party's measurement, for the comparative view.
     *
     * <p>Three queries rather than one join: joining topics and statement types in a
     * single statement multiplies their rows against each other, and the two lists
     * would then have to be de-duplicated in Java.
     */
    public List<ProgramMeasurementData> findAll() {
        List<String> parties = dsl.select(PARTY_PROGRAM_MEASUREMENT.PARTY_ID)
                .from(PARTY_PROGRAM_MEASUREMENT)
                .orderBy(PARTY_PROGRAM_MEASUREMENT.DENOMINATOR.desc())
                .fetch(PARTY_PROGRAM_MEASUREMENT.PARTY_ID);
        if (parties.isEmpty()) {
            return List.of();
        }

        Map<String, List<ProgramTopicData>> topics = topics(parties);
        Map<String, List<ProgramStatementTypeData>> types = statementTypes(parties);

        return dsl.selectFrom(PARTY_PROGRAM_MEASUREMENT)
                .where(PARTY_PROGRAM_MEASUREMENT.PARTY_ID.in(parties))
                .orderBy(PARTY_PROGRAM_MEASUREMENT.DENOMINATOR.desc())
                .fetch(row -> new ProgramMeasurementData(
                        row.getPartyId(),
                        row.getUnitsTotal(),
                        row.getDenominator(),
                        row.getCodebookVersion(),
                        topics.getOrDefault(row.getPartyId(), List.of()),
                        types.getOrDefault(row.getPartyId(), List.of())));
    }

    private Map<String, List<ProgramTopicData>> topics(List<String> parties) {
        return dsl.selectFrom(PARTY_PROGRAM_TOPIC)
                .where(PARTY_PROGRAM_TOPIC.PARTY_ID.in(parties))
                .orderBy(PARTY_PROGRAM_TOPIC.UNIT_COUNT.desc(),
                        PARTY_PROGRAM_TOPIC.TOPIC_CODE.asc())
                .fetch()
                .stream()
                .collect(Collectors.groupingBy(
                        row -> row.getPartyId(),
                        Collectors.mapping(row -> new ProgramTopicData(
                                row.getTopicCode(),
                                row.getUnitCount(),
                                row.getPilotVerified(),
                                row.getShare()),
                                Collectors.toList())));
    }

    private Map<String, List<ProgramStatementTypeData>> statementTypes(List<String> parties) {
        return dsl.selectFrom(PARTY_PROGRAM_STATEMENT_TYPE)
                .where(PARTY_PROGRAM_STATEMENT_TYPE.PARTY_ID.in(parties))
                .orderBy(PARTY_PROGRAM_STATEMENT_TYPE.UNIT_COUNT.desc())
                .fetch()
                .stream()
                .collect(Collectors.groupingBy(
                        row -> row.getPartyId(),
                        Collectors.mapping(row -> new ProgramStatementTypeData(
                                row.getStatementType(),
                                row.getUnitCount(),
                                row.getShare()),
                                Collectors.toList())));
    }
}
