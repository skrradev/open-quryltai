package kz.quryltai.backend.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;

import kz.quryltai.backend.service.ContentImportService;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
@ConditionalOnProperty(name = "content.import.enabled", havingValue = "true")
public class ContentImportRunner implements ApplicationRunner {

    private static final Logger LOGGER = LoggerFactory.getLogger(ContentImportRunner.class);

    private final ContentImportService service;

    @Override
    public void run(ApplicationArguments arguments) {
        var result = service.run();
        LOGGER.info(
                "Content import completed: dryRun={}, content={}, sources={}, candidateSources={}, localizations={}",
                result.dryRun(),
                result.contentCount(),
                result.sourceCount(),
                result.candidateSourceCount(),
                result.sourceLocalizationCount());
    }
}
