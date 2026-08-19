package kz.quryltai.backend.dto;

/**
 * @param share null when the code did not pass the pilot — render the count and
 *              omit the proportion rather than showing a zero.
 */
public record ProgramTopicDto(
        CodeLabelDto topic,
        int unitCount,
        boolean pilotVerified,
        Double share) {
}
