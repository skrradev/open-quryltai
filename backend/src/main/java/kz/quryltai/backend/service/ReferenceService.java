package kz.quryltai.backend.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kz.quryltai.backend.dto.PartyDto;
import kz.quryltai.backend.dto.PlaceDto;
import kz.quryltai.backend.repository.ReferenceRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReferenceService {

    private final ReferenceRepository repository;
    private final LocalizationService localization;

    public List<PartyDto> parties() {
        return repository.findParties(localization.currentLanguage()).stream()
                .map(party -> new PartyDto(party.id(), party.name()))
                .toList();
    }

    public List<PlaceDto> places() {
        return repository.findPlaces(localization.currentLanguage()).stream()
                .map(place -> new PlaceDto(
                        place.id(),
                        place.name(),
                        localization.label("place-type", place.type()),
                        place.parentRegionId()))
                .toList();
    }
}
