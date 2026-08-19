package kz.quryltai.backend.dto;

public record ProgramStatementTypeDto(
        CodeLabelDto statementType,
        int unitCount,
        double share) {
}
