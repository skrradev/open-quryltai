package kz.quryltai.backend.model;

import java.math.BigDecimal;

public record ProgramStatementTypeData(
        String statementType,
        int unitCount,
        BigDecimal share) {
}
