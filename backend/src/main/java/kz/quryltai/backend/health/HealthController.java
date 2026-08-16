package kz.quryltai.backend.health;

import org.jooq.DSLContext;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/health")
public class HealthController {

    private final DSLContext dsl;

    public HealthController(DSLContext dsl) {
        this.dsl = dsl;
    }

    @GetMapping
    public HealthResponse health() {
        Integer databaseCheck = dsl.selectOne().fetchOne(0, Integer.class);
        if (databaseCheck == null || databaseCheck != 1) {
            throw new IllegalStateException("Database health check failed");
        }
        return new HealthResponse("ok");
    }

    public record HealthResponse(String status) {
    }
}
