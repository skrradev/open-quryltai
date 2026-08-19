package kz.quryltai.backend.repository;

import static kz.quryltai.backend.jooq.tables.Place.PLACE;
import static kz.quryltai.backend.jooq.tables.PoliticalParty.POLITICAL_PARTY;

import java.util.List;

import org.jooq.DSLContext;
import org.jooq.Field;
import org.springframework.stereotype.Repository;

import kz.quryltai.backend.model.Language;
import kz.quryltai.backend.model.PartyData;
import kz.quryltai.backend.model.PlaceData;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ReferenceRepository {

    private final DSLContext dsl;

    public List<PartyData> findParties(Language language) {
        // Short names: this list feeds filter controls and the programme matrix
        // header, both of which are width-constrained. The party page heading uses
        // partyStatistics(), which keeps the full name.
        Field<String> name = language.isRussian()
                ? POLITICAL_PARTY.SHORT_NAME_RU
                : POLITICAL_PARTY.SHORT_NAME_KK;
        return dsl.select(POLITICAL_PARTY.PARTY_ID, name)
                .from(POLITICAL_PARTY)
                .orderBy(POLITICAL_PARTY.DISPLAY_ORDER)
                .fetch(record -> new PartyData(
                        record.get(POLITICAL_PARTY.PARTY_ID), record.get(name)));
    }

    public List<PlaceData> findPlaces(Language language) {
        Field<String> name = language.isRussian() ? PLACE.NAME_RU : PLACE.NAME_KK;
        return dsl.select(PLACE.PLACE_ID, PLACE.PLACE_TYPE, name, PLACE.PARENT_REGION_ID)
                .from(PLACE)
                .orderBy(PLACE.PLACE_TYPE, name)
                .fetch(record -> new PlaceData(
                        record.get(PLACE.PLACE_ID),
                        record.get(name),
                        record.get(PLACE.PLACE_TYPE),
                        record.get(PLACE.PARENT_REGION_ID)));
    }
}
