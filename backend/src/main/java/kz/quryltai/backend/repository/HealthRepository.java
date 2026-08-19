package kz.quryltai.backend.repository;

import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class HealthRepository {

    private final DSLContext dsl;

    public boolean isDatabaseAvailable() {
        Integer result = dsl.selectOne().fetchOne(0, Integer.class);
        return result != null && result == 1;
    }
}
