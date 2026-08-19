package kz.quryltai.backend.service;

import org.springframework.stereotype.Service;

import kz.quryltai.backend.config.ContentImportProperties;
import kz.quryltai.backend.dto.ContentImportResult;
import kz.quryltai.backend.repository.ContentImportRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ContentImportService {

    private final ContentManifestService manifestService;
    private final ContentImportRepository repository;
    private final ContentImportProperties properties;

    public ContentImportResult run() {
        var data = manifestService.loadAndValidate();
        if (properties.dryRun()) {
            return new ContentImportResult(
                    true,
                    data.content().size(),
                    data.sources().size(),
                    data.candidateSources().size(),
                    data.sourceLocalizations().size());
        }
        return repository.importAll(data);
    }
}
