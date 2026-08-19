package kz.quryltai.backend.config;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "content.import")
public record ContentImportProperties(
        boolean enabled,
        boolean dryRun,
        String directory,
        String sourceRevision) {
}
