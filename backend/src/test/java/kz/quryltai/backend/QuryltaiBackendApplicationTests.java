package kz.quryltai.backend;

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
    void candidateQueryIsValidated() {
        ResponseEntity<String> response = restTemplate.getForEntity(
                "http://localhost:" + port + "/api/candidates?size=101", String.class);

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
