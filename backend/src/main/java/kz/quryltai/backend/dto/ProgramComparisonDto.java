package kz.quryltai.backend.dto;

import java.util.List;

/**
 * The comparative view for the home page.
 *
 * @param measuresAttention states in the payload itself what the numbers mean, so
 *                          a client cannot render them as a party ranking without
 *                          having been told otherwise
 */
public record ProgramComparisonDto(
        List<ProgramMeasurementDto> parties,
        List<CodeLabelDto> topics,
        List<CodeLabelDto> statementTypes,
        boolean measuresAttention) {
}
