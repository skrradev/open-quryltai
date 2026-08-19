package kz.quryltai.backend.model;

import java.math.BigDecimal;

/**
 * One topic's weight in one party's programme.
 *
 * <p>{@code share} is null when the code did not pass the two-annotator pilot —
 * T15 and T16 entered the codebook afterwards. That is not missing data: the
 * count is exact and publishable, the proportion is not. The database enforces
 * the pairing, so a null here always means "count only".
 */
public record ProgramTopicData(
        String topicCode,
        int unitCount,
        boolean pilotVerified,
        BigDecimal share) {
}
