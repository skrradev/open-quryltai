package kz.quryltai.backend.service;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.OffsetDateTime;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Pattern;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

import kz.quryltai.backend.config.ContentImportProperties;
import kz.quryltai.backend.model.ContentManifest;
import kz.quryltai.backend.model.PreparedContentImport;
import kz.quryltai.backend.repository.ContentImportRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ContentManifestService {

    private static final Set<String> LANGUAGES = Set.of("kk", "ru");
    private static final Set<String> SECTION_TYPES = Set.of(
            "OVERVIEW", "BIOGRAPHY", "EDUCATION", "CAREER",
            "PUBLIC_ACTIVITY", "POLICY_POSITION", "OTHER");
    private static final Set<String> SOURCE_TYPES = Set.of(
            "OFFICIAL", "NEWS", "INTERVIEW", "FACT_CHECK", "REPORT", "SOCIAL_MEDIA", "OTHER");
    private static final Set<String> RELATIONSHIP_TYPES = Set.of(
            "MEDIA_MENTION", "INTERVIEW", "PROFILE", "OFFICIAL_RECORD", "OTHER");
    private static final Set<String> REVIEW_STATUSES = Set.of("DRAFT", "REVIEWED", "PUBLISHED");
    private static final Pattern SOURCE_KEY = Pattern.compile("[a-z0-9][a-z0-9._-]{0,127}");
    private static final Pattern SOURCE_LANGUAGE = Pattern.compile("[a-z]{2,3}(?:-[A-Z]{2})?");
    private static final Pattern REVISION = Pattern.compile("[A-Za-z0-9._/-]{1,64}");

    private final ObjectMapper objectMapper;
    private final ContentImportProperties properties;
    private final ContentImportRepository repository;

    public PreparedContentImport loadAndValidate() {
        Path root = Path.of(properties.directory()).toAbsolutePath().normalize();
        Path manifestPath = root.resolve("manifest.json");
        ContentManifest manifest;
        try {
            manifest = objectMapper.readValue(manifestPath.toFile(), ContentManifest.class);
        } catch (IOException exception) {
            throw new IllegalArgumentException("Cannot read content manifest: " + manifestPath, exception);
        }

        List<String> errors = new ArrayList<>();
        String revision = validateRevision(errors);
        Set<Short> knownCandidateIds = repository.findCandidateIds();
        Set<String> sourceKeys = new HashSet<>();
        Set<String> canonicalUrls = new HashSet<>();
        Set<String> contentKeys = new HashSet<>();
        Set<String> associationKeys = new HashSet<>();
        Set<String> localizationKeys = new HashSet<>();

        List<PreparedContentImport.ContentRow> content = new ArrayList<>();
        for (int index = 0; index < manifest.content().size(); index++) {
            var entry = manifest.content().get(index);
            String location = "content[" + index + "]";
            validateCandidate(entry.candidateId(), knownCandidateIds, location, errors);
            validateEnum(entry.language(), LANGUAGES, location + ".language", errors);
            validateEnum(entry.sectionType(), SECTION_TYPES, location + ".sectionType", errors);
            validateText(entry.title(), location + ".title", errors);
            validateSortOrder(entry.sortOrder(), location, errors);
            validateEnum(entry.reviewStatus(), REVIEW_STATUSES, location + ".reviewStatus", errors);
            OffsetDateTime reviewedAt = parseReviewDate(entry.reviewStatus(), entry.reviewedAt(), location, errors);
            boolean active = requireActive(entry.active(), location, errors);
            String body = readMarkdown(root, entry.bodyFile(), location + ".bodyFile", errors);
            String key = entry.candidateId() + "|" + entry.language() + "|" + entry.sectionType();
            requireUnique(contentKeys, key, location, errors);
            content.add(new PreparedContentImport.ContentRow(
                    entry.candidateId(), entry.language(), entry.sectionType(), entry.title(), body,
                    entry.sortOrder(), entry.reviewStatus(), reviewedAt, hashObject(List.of(entry, body)), active));
        }

        List<PreparedContentImport.SourceRow> sources = new ArrayList<>();
        for (int index = 0; index < manifest.sources().size(); index++) {
            var entry = manifest.sources().get(index);
            String location = "sources[" + index + "]";
            if (entry.sourceKey() == null || !SOURCE_KEY.matcher(entry.sourceKey()).matches()) {
                errors.add(location + ".sourceKey must use lowercase letters, numbers, dot, dash or underscore");
            }
            requireUnique(sourceKeys, entry.sourceKey(), location + ".sourceKey", errors);
            validateEnum(entry.sourceType(), SOURCE_TYPES, location + ".sourceType", errors);
            validateText(entry.publisher(), location + ".publisher", errors);
            validateText(entry.title(), location + ".title", errors);
            String originalUrl = normalizeUrl(entry.originalUrl(), location + ".originalUrl", errors);
            String canonicalUrl = normalizeUrl(entry.canonicalUrl(), location + ".canonicalUrl", errors);
            requireUnique(canonicalUrls, canonicalUrl, location + ".canonicalUrl", errors);
            if (entry.language() == null || !SOURCE_LANGUAGE.matcher(entry.language()).matches()) {
                errors.add(location + ".language must be a language tag such as kk, ru or en");
            }
            OffsetDateTime publishedAt = parseOptionalDate(entry.publishedAt(), location + ".publishedAt", errors);
            OffsetDateTime retrievedAt = parseRequiredDate(entry.retrievedAt(), location + ".retrievedAt", errors);
            String archivedUrl = entry.archivedUrl() == null || entry.archivedUrl().isBlank()
                    ? null
                    : normalizeUrl(entry.archivedUrl(), location + ".archivedUrl", errors);
            boolean active = requireActive(entry.active(), location, errors);
            String hash = hashObject(entry);
            sources.add(new PreparedContentImport.SourceRow(
                    entry.sourceKey(), entry.sourceType(), entry.publisher(), entry.title(), originalUrl,
                    canonicalUrl, entry.language(), publishedAt, retrievedAt, archivedUrl, hash, active));
        }

        List<PreparedContentImport.CandidateSourceRow> candidateSources = new ArrayList<>();
        for (int index = 0; index < manifest.candidateSources().size(); index++) {
            var entry = manifest.candidateSources().get(index);
            String location = "candidateSources[" + index + "]";
            validateCandidate(entry.candidateId(), knownCandidateIds, location, errors);
            validateSourceReference(entry.sourceKey(), sourceKeys, location, errors);
            validateEnum(entry.relationshipType(), RELATIONSHIP_TYPES, location + ".relationshipType", errors);
            validateSortOrder(entry.sortOrder(), location, errors);
            OffsetDateTime verifiedAt = parseRequiredDate(entry.verifiedAt(), location + ".verifiedAt", errors);
            validateEnum(entry.reviewStatus(), REVIEW_STATUSES, location + ".reviewStatus", errors);
            OffsetDateTime reviewedAt = parseReviewDate(entry.reviewStatus(), entry.reviewedAt(), location, errors);
            boolean active = requireActive(entry.active(), location, errors);
            String key = entry.candidateId() + "|" + entry.sourceKey();
            requireUnique(associationKeys, key, location, errors);
            candidateSources.add(new PreparedContentImport.CandidateSourceRow(
                    entry.candidateId(), entry.sourceKey(), entry.relationshipType(), entry.primarySubject(),
                    entry.sortOrder(), verifiedAt, entry.reviewStatus(), reviewedAt, hashObject(entry), active));
        }

        List<PreparedContentImport.SourceLocalizationRow> localizations = new ArrayList<>();
        for (int index = 0; index < manifest.sourceLocalizations().size(); index++) {
            var entry = manifest.sourceLocalizations().get(index);
            String location = "sourceLocalizations[" + index + "]";
            validateCandidate(entry.candidateId(), knownCandidateIds, location, errors);
            validateSourceReference(entry.sourceKey(), sourceKeys, location, errors);
            validateEnum(entry.language(), LANGUAGES, location + ".language", errors);
            validateEnum(entry.reviewStatus(), REVIEW_STATUSES, location + ".reviewStatus", errors);
            OffsetDateTime reviewedAt = parseReviewDate(entry.reviewStatus(), entry.reviewedAt(), location, errors);
            boolean active = requireActive(entry.active(), location, errors);
            String associationKey = entry.candidateId() + "|" + entry.sourceKey();
            if (!associationKeys.contains(associationKey)) {
                errors.add(location + " has no matching candidateSources entry");
            }
            String key = associationKey + "|" + entry.language();
            requireUnique(localizationKeys, key, location, errors);
            String summary = readMarkdown(root, entry.summaryFile(), location + ".summaryFile", errors);
            localizations.add(new PreparedContentImport.SourceLocalizationRow(
                    entry.candidateId(), entry.sourceKey(), entry.language(), summary,
                    entry.reviewStatus(), reviewedAt, hashObject(List.of(entry, summary)), active));
        }

        if (!errors.isEmpty()) {
            throw new IllegalArgumentException("Content manifest validation failed:\n- " + String.join("\n- ", errors));
        }
        return new PreparedContentImport(content, sources, candidateSources, localizations, revision);
    }

    private String validateRevision(List<String> errors) {
        String revision = properties.sourceRevision();
        if ((revision == null || revision.isBlank()) && properties.dryRun()) {
            return "dry-run";
        }
        if (revision == null || !REVISION.matcher(revision).matches()) {
            errors.add("content.import.source-revision is required and must be at most 64 safe characters");
            return "invalid";
        }
        return revision;
    }

    private static void validateCandidate(
            short candidateId, Set<Short> knownCandidateIds, String location, List<String> errors) {
        if (!knownCandidateIds.contains(candidateId)) {
            errors.add(location + ".candidateId does not exist: " + candidateId);
        }
    }

    private static void validateSourceReference(
            String sourceKey, Set<String> sourceKeys, String location, List<String> errors) {
        if (!sourceKeys.contains(sourceKey)) {
            errors.add(location + ".sourceKey is not declared in sources: " + sourceKey);
        }
    }

    private static void validateEnum(String value, Set<String> allowed, String location, List<String> errors) {
        if (!allowed.contains(value)) {
            errors.add(location + " must be one of " + allowed);
        }
    }

    private static void validateText(String value, String location, List<String> errors) {
        if (value == null || value.isBlank()) {
            errors.add(location + " must not be blank");
        }
    }

    private static void requireUnique(
            Set<String> values, String value, String location, List<String> errors) {
        if (value != null && !values.add(value)) {
            errors.add(location + " is duplicated: " + value);
        }
    }

    private static void validateSortOrder(short sortOrder, String location, List<String> errors) {
        if (sortOrder < 0) {
            errors.add(location + ".sortOrder must be zero or greater");
        }
    }

    private static boolean requireActive(Boolean active, String location, List<String> errors) {
        if (active == null) {
            errors.add(location + ".active must be explicitly true or false");
            return false;
        }
        return active;
    }

    private static OffsetDateTime parseReviewDate(
            String status, String value, String location, List<String> errors) {
        OffsetDateTime parsed = parseOptionalDate(value, location + ".reviewedAt", errors);
        if (status != null && !"DRAFT".equals(status) && parsed == null) {
            errors.add(location + ".reviewedAt is required for REVIEWED and PUBLISHED records");
        }
        return parsed;
    }

    private static OffsetDateTime parseRequiredDate(String value, String location, List<String> errors) {
        OffsetDateTime parsed = parseOptionalDate(value, location, errors);
        if (parsed == null) {
            errors.add(location + " is required");
        }
        return parsed;
    }

    private static OffsetDateTime parseOptionalDate(String value, String location, List<String> errors) {
        if (value == null || value.isBlank()) {
            return null;
        }
        try {
            return OffsetDateTime.parse(value);
        } catch (DateTimeParseException exception) {
            errors.add(location + " must be an ISO-8601 timestamp with an offset");
            return null;
        }
    }

    private static String readMarkdown(Path root, String relative, String location, List<String> errors) {
        if (relative == null || relative.isBlank()) {
            errors.add(location + " is required");
            return "";
        }
        Path path = root.resolve(relative).normalize();
        if (!path.startsWith(root)) {
            errors.add(location + " must stay inside the content directory");
            return "";
        }
        try {
            String markdown = Files.readString(path, StandardCharsets.UTF_8).replace("\r\n", "\n");
            if (markdown.isBlank()) {
                errors.add(location + " must reference non-blank Markdown");
            }
            return markdown;
        } catch (IOException exception) {
            errors.add(location + " cannot be read: " + relative);
            return "";
        }
    }

    private static String normalizeUrl(String value, String location, List<String> errors) {
        if (value == null || value.isBlank()) {
            errors.add(location + " is required");
            return "";
        }
        try {
            URI uri = new URI(value).normalize();
            String scheme = uri.getScheme() == null ? "" : uri.getScheme().toLowerCase(Locale.ROOT);
            String host = uri.getHost() == null ? "" : uri.getHost().toLowerCase(Locale.ROOT);
            if (!("http".equals(scheme) || "https".equals(scheme)) || host.isBlank() || uri.getUserInfo() != null) {
                throw new URISyntaxException(value, "URL must be an absolute HTTP(S) URL without user info");
            }
            int port = uri.getPort();
            if (("http".equals(scheme) && port == 80) || ("https".equals(scheme) && port == 443)) {
                port = -1;
            }
            String path = uri.getRawPath() == null || uri.getRawPath().isBlank() ? "/" : uri.getRawPath();
            return new URI(scheme, null, host, port, path, uri.getRawQuery(), null).toASCIIString();
        } catch (URISyntaxException exception) {
            errors.add(location + " is not a valid HTTP(S) URL");
            return value;
        }
    }

    private String hashObject(Object value) {
        try {
            return sha256(new String(objectMapper.writeValueAsBytes(value), StandardCharsets.UTF_8));
        } catch (IOException exception) {
            throw new IllegalStateException("Cannot hash content manifest record", exception);
        }
    }

    private static String sha256(String value) {
        try {
            return java.util.HexFormat.of().formatHex(
                    MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8)));
        } catch (NoSuchAlgorithmException exception) {
            throw new IllegalStateException("SHA-256 is not available", exception);
        }
    }
}
