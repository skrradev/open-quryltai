package kz.quryltai.backend.service;

import java.math.BigDecimal;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.SequencedSet;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import kz.quryltai.backend.dto.CodeLabelDto;
import kz.quryltai.backend.dto.PartyDto;
import kz.quryltai.backend.dto.ProgramComparisonDto;
import kz.quryltai.backend.dto.ProgramMeasurementDto;
import kz.quryltai.backend.dto.ProgramStatementTypeDto;
import kz.quryltai.backend.dto.ProgramTopicDto;
import kz.quryltai.backend.model.PartyData;
import kz.quryltai.backend.model.ProgramMeasurementData;
import kz.quryltai.backend.repository.ProgramMeasurementRepository;
import kz.quryltai.backend.repository.ReferenceRepository;
import lombok.RequiredArgsConstructor;

/**
 * Serves the programme content analysis.
 *
 * <p>What it measures is attention — how much room a party gives a topic — never
 * its position on that topic. Two parties with the same T06 share may propose
 * opposite things.
 */
@Service
@RequiredArgsConstructor
public class ProgramMeasurementService {

    private static final String TOPIC = "program-topic";
    private static final String STATEMENT_TYPE = "program-statement-type";

    private final ProgramMeasurementRepository repository;
    private final ReferenceRepository references;
    private final LocalizationService localization;

    public Optional<ProgramMeasurementDto> forParty(String partyId) {
        Map<String, String> names = partyNames();
        return repository.findByParty(partyId).map(data -> toDto(data, names));
    }

    public ProgramComparisonDto comparison() {
        List<ProgramMeasurementData> measurements = repository.findAll();
        Map<String, String> names = partyNames();

        // The axis lists come from the data rather than from a constant, so a code
        // that no party used never appears as an empty row, and a code added to the
        // codebook later needs no change here.
        SequencedSet<String> topics = new LinkedHashSet<>();
        SequencedSet<String> types = new LinkedHashSet<>();
        for (ProgramMeasurementData measurement : measurements) {
            measurement.topics().forEach(topic -> topics.add(topic.topicCode()));
            measurement.statementTypes().forEach(type -> types.add(type.statementType()));
        }

        return new ProgramComparisonDto(
                measurements.stream().map(data -> toDto(data, names)).toList(),
                topics.stream().sorted().map(code -> localization.label(TOPIC, code)).toList(),
                types.stream().map(code -> localization.label(STATEMENT_TYPE, code)).toList(),
                true);
    }

    private ProgramMeasurementDto toDto(ProgramMeasurementData data, Map<String, String> names) {
        return new ProgramMeasurementDto(
                new PartyDto(data.partyId(), names.getOrDefault(data.partyId(), data.partyId())),
                data.unitsTotal(),
                data.denominator(),
                data.codebookVersion(),
                data.topics().stream()
                        .map(topic -> new ProgramTopicDto(
                                localization.label(TOPIC, topic.topicCode()),
                                topic.unitCount(),
                                topic.pilotVerified(),
                                // Stays null for unpiloted codes. Sending 0 instead would
                                // be read as "the party never mentions it", which is a
                                // different and false claim.
                                toDouble(topic.share())))
                        .toList(),
                data.statementTypes().stream()
                        .map(type -> new ProgramStatementTypeDto(
                                localization.label(STATEMENT_TYPE, type.statementType()),
                                type.unitCount(),
                                toDouble(type.share())))
                        .toList());
    }

    private Map<String, String> partyNames() {
        return references.findParties(localization.currentLanguage()).stream()
                .collect(Collectors.toMap(PartyData::id, PartyData::name,
                        (first, second) -> first, LinkedHashMap::new));
    }

    private Double toDouble(BigDecimal value) {
        return value == null ? null : value.doubleValue();
    }
}
