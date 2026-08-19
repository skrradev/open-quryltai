package kz.quryltai.backend.model;

import java.util.List;

/**
 * A party's programme measurement.
 *
 * <p>{@code denominator} travels with every share deliberately. It is the count
 * of substantive units — the divisor — and it is itself an annotation decision,
 * so a share shown without it hides the most uncertain part of the method.
 */
public record ProgramMeasurementData(
        String partyId,
        int unitsTotal,
        int denominator,
        String codebookVersion,
        List<ProgramTopicData> topics,
        List<ProgramStatementTypeData> statementTypes) {
}
