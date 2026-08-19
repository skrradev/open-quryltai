package kz.quryltai.backend;

import static kz.quryltai.backend.jooq.tables.Candidate.CANDIDATE;
import static kz.quryltai.backend.jooq.tables.PoliticalParty.POLITICAL_PARTY;
import static org.assertj.core.api.Assertions.assertThat;

import org.jooq.DSLContext;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class QuryltaiBackendApplicationTests {

    @LocalServerPort
    private int port;

    @Autowired
    private TestRestTemplate restTemplate;

    @Autowired
    private DSLContext dsl;

    @Test
    void healthEndpointChecksTheDatabase() {
        ResponseEntity<String> response = restTemplate.getForEntity(
                "http://localhost:" + port + "/api/health", String.class);

        assertThat(response.getStatusCode().is2xxSuccessful()).isTrue();
        assertThat(response.getBody()).contains("\"status\":\"ok\"");
    }

    @Test
    void flywaySeedsThePoliticalParties() {
        int partyCount = dsl.fetchCount(POLITICAL_PARTY);

        assertThat(partyCount).isEqualTo(7);
    }

    @Test
    void candidateListIsPaginatedAndDefaultsToKazakh() {
        ResponseEntity<String> response = restTemplate.getForEntity(
                "http://localhost:" + port + "/api/candidates?size=2", String.class);

        assertThat(response.getStatusCode().is2xxSuccessful()).isTrue();
        assertThat(response.getBody())
                .contains("\"totalItems\":545")
                .contains("\"label\":\"Ер\"")
                .contains("\"name\":\"Әділет\"");
    }

    @Test
    void candidateListServesThumbnailsAndNeverTheFullPhoto() {
        ResponseEntity<String> response = restTemplate.getForEntity(
                "http://localhost:" + port + "/api/candidates?partyId=ak_zhol&size=100", String.class);

        assertThat(response.getStatusCode().is2xxSuccessful()).isTrue();
        assertThat(response.getBody())
                .contains("/candidates/ak_zhol/1/thumb.jpg")
                // Originals run to several MB, so a list must not be able to render them.
                .contains("\"photoUrl\":null")
                .doesNotContain("\"photoUrl\":\"http");
    }

    @Test
    void candidateDetailsServeTheFullPhotoWithItsDimensions() {
        short candidateId = dsl.select(CANDIDATE.CANDIDATE_ID)
                .from(CANDIDATE)
                .where(CANDIDATE.PARTY_ID.eq("adilet"))
                .and(CANDIDATE.LIST_ORDER.eq((short) 54))
                .fetchOne(CANDIDATE.CANDIDATE_ID);

        ResponseEntity<String> response = restTemplate.getForEntity(
                "http://localhost:" + port + "/api/candidates/" + candidateId, String.class);

        assertThat(response.getStatusCode().is2xxSuccessful()).isTrue();
        assertThat(response.getBody())
                .contains("\"photoUrl\":\"https://assets.open-quryltai.org/candidates/adilet/54.webp\"")
                .contains("\"photoThumbnailUrl\":\"https://assets.open-quryltai.org/candidates/adilet/54/thumb.jpg\"")
                .contains("\"photoWidth\":819")
                .contains("\"photoHeight\":1024");
    }

    @Test
    void candidatesWithoutAPhotoStayInTheListWithNullUrls() {
        short candidateId = dsl.select(CANDIDATE.CANDIDATE_ID)
                .from(CANDIDATE)
                .where(CANDIDATE.PARTY_ID.eq("adilet"))
                .and(CANDIDATE.LIST_ORDER.eq((short) 151))
                .fetchOne(CANDIDATE.CANDIDATE_ID);

        ResponseEntity<String> response = restTemplate.getForEntity(
                "http://localhost:" + port + "/api/candidates/" + candidateId, String.class);

        assertThat(response.getStatusCode().is2xxSuccessful()).isTrue();
        assertThat(response.getBody())
                .contains("\"photoThumbnailUrl\":null")
                .contains("\"photoUrl\":null");
    }

    @Test
    void candidateQueryIsValidated() {
        ResponseEntity<String> response = restTemplate.getForEntity(
                "http://localhost:" + port + "/api/candidates?size=101", String.class);

        assertThat(response.getStatusCode().is4xxClientError()).isTrue();
    }

    @Test
    void candidateEditorialEndpointsReturnLocalizedPublicShapes() {
        HttpHeaders headers = new HttpHeaders();
        headers.set(HttpHeaders.ACCEPT_LANGUAGE, "ru");

        ResponseEntity<String> content = restTemplate.exchange(
                "http://localhost:" + port + "/api/candidates/1/content",
                HttpMethod.GET,
                new HttpEntity<>(headers),
                String.class);
        ResponseEntity<String> sources = restTemplate.exchange(
                "http://localhost:" + port + "/api/candidates/1/sources?type=MEDIA_MENTION&page=0&size=20",
                HttpMethod.GET,
                new HttpEntity<>(headers),
                String.class);

        assertThat(content.getStatusCode().is2xxSuccessful()).isTrue();
        assertThat(content.getBody()).startsWith("[");
        assertThat(sources.getStatusCode().is2xxSuccessful()).isTrue();
        assertThat(sources.getBody())
                .contains("\"page\":0")
                .contains("\"size\":20")
                .contains("\"totalItems\"");
    }

    @Test
    void candidateSourcesValidateRelationshipType() {
        ResponseEntity<String> response = restTemplate.getForEntity(
                "http://localhost:" + port + "/api/candidates/1/sources?type=UNREVIEWED",
                String.class);

        assertThat(response.getStatusCode().is4xxClientError()).isTrue();
    }

    @Test
    void referenceEndpointsSupportRussian() {
        HttpHeaders headers = new HttpHeaders();
        headers.set(HttpHeaders.ACCEPT_LANGUAGE, "ru");
        ResponseEntity<String> response = restTemplate.exchange(
                "http://localhost:" + port + "/api/places",
                HttpMethod.GET,
                new HttpEntity<>(headers),
                String.class);

        assertThat(response.getStatusCode().is2xxSuccessful()).isTrue();
        assertThat(response.getBody())
                .contains("\"id\":\"oral\"")
                .contains("\"name\":\"Уральск\"")
                .contains("\"label\":\"Город\"");
    }

    @Test
    void statisticsAreAggregatedAndLocalized() {
        HttpHeaders headers = new HttpHeaders();
        headers.set(HttpHeaders.ACCEPT_LANGUAGE, "ru");
        ResponseEntity<String> response = restTemplate.exchange(
                "http://localhost:" + port + "/api/statistics",
                HttpMethod.GET,
                new HttpEntity<>(headers),
                String.class);

        assertThat(response.getStatusCode().is2xxSuccessful()).isTrue();
        assertThat(response.getBody())
                .contains("\"totalCandidates\":545")
                .contains("\"totalParties\":7")
                .contains("\"incumbentCount\":41")
                .contains("\"label\":\"30–39 лет\"")
                .contains("\"label\":\"Бизнес\"");
    }

    @Test
    void partyStatisticsAreAggregatedAndLocalized() {
        HttpHeaders headers = new HttpHeaders();
        headers.set(HttpHeaders.ACCEPT_LANGUAGE, "ru");
        ResponseEntity<String> response = restTemplate.exchange(
                "http://localhost:" + port + "/api/parties/respublica",
                HttpMethod.GET,
                new HttpEntity<>(headers),
                String.class);

        assertThat(response.getStatusCode().is2xxSuccessful()).isTrue();
        assertThat(response.getBody())
                .contains("\"party\":{\"id\":\"respublica\",\"name\":\"Respublica\"}")
                .contains("\"candidateCount\":75")
                .contains("\"label\":\"Мужчина\"")
                .contains("\"label\":\"30–39 лет\"");
    }
}
