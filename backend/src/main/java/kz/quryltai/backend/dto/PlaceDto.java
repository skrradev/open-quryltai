package kz.quryltai.backend.dto;

public record PlaceDto(String id, String name, CodeLabelDto type, String parentRegionId) {
}
