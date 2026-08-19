package kz.quryltai.backend.dto;

import java.util.List;

/**
 * @param denominator the substantive-unit count every share is computed against;
 *                    sent with the shares so the UI can always show both
 */
public record ProgramMeasurementDto(
        PartyDto party,
        int unitsTotal,
        int denominator,
        String codebookVersion,
        List<ProgramTopicDto> topics,
        List<ProgramStatementTypeDto> statementTypes) {
}
