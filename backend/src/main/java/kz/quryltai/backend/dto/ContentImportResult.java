package kz.quryltai.backend.dto;

public record ContentImportResult(
        boolean dryRun,
        int contentCount,
        int sourceCount,
        int candidateSourceCount,
        int sourceLocalizationCount) {
}
