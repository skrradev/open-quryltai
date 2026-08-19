package kz.quryltai.backend.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Set;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;

import com.fasterxml.jackson.databind.ObjectMapper;

import kz.quryltai.backend.config.ContentImportProperties;
import kz.quryltai.backend.repository.ContentImportRepository;

class ContentManifestServiceTests {

    @TempDir
    private Path directory;

    @Test
    void acceptsAnEmptyManifestInDryRunMode() throws IOException {
        Files.writeString(directory.resolve("manifest.json"), """
                {
                  "content": [],
                  "sources": [],
                  "candidateSources": [],
                  "sourceLocalizations": []
                }
                """);
        ContentImportRepository repository = mock(ContentImportRepository.class);
        when(repository.findCandidateIds()).thenReturn(Set.of((short) 1));
        var service = new ContentManifestService(
                new ObjectMapper(),
                new ContentImportProperties(true, true, directory.toString(), ""),
                repository);

        var result = service.loadAndValidate();

        assertThat(result.sourceRevision()).isEqualTo("dry-run");
        assertThat(result.content()).isEmpty();
        assertThat(result.sources()).isEmpty();
    }

    @Test
    void rejectsMarkdownPathsOutsideTheManagedDirectory() throws IOException {
        Files.writeString(directory.resolve("manifest.json"), """
                {
                  "content": [{
                    "candidateId": 1,
                    "language": "kk",
                    "sectionType": "OVERVIEW",
                    "title": "Шолу",
                    "bodyFile": "../outside.md",
                    "sortOrder": 0,
                    "reviewStatus": "DRAFT",
                    "reviewedAt": null,
                    "active": true
                  }],
                  "sources": [],
                  "candidateSources": [],
                  "sourceLocalizations": []
                }
                """);
        ContentImportRepository repository = mock(ContentImportRepository.class);
        when(repository.findCandidateIds()).thenReturn(Set.of((short) 1));
        var service = new ContentManifestService(
                new ObjectMapper(),
                new ContentImportProperties(true, true, directory.toString(), ""),
                repository);

        assertThatThrownBy(service::loadAndValidate)
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessageContaining("must stay inside the content directory");
    }
}
