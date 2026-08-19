package kz.quryltai.backend.dto;

import java.util.List;

public record PageDto<T>(
        List<T> items,
        int page,
        int size,
        long totalItems,
        int totalPages) {
}
