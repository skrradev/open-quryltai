package kz.quryltai.backend.reference;

import static kz.quryltai.backend.jooq.tables.Place.PLACE;
import static kz.quryltai.backend.jooq.tables.PoliticalParty.POLITICAL_PARTY;

import java.util.List;
import java.util.Locale;

import org.jooq.DSLContext;
import org.jooq.Field;
import org.springframework.context.MessageSource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kz.quryltai.backend.candidate.CandidateController.CodeLabel;

@RestController
@RequestMapping("/api")
public class ReferenceController {

    private final DSLContext dsl;
    private final MessageSource messages;

    public ReferenceController(DSLContext dsl, MessageSource messages) {
        this.dsl = dsl;
        this.messages = messages;
    }

    @GetMapping("/parties")
    public List<PartyView> parties(
            @RequestHeader(name = "Accept-Language", required = false) String language) {
        Field<String> name = isRussian(language) ? POLITICAL_PARTY.NAME_RU : POLITICAL_PARTY.NAME_KK;
        return dsl.select(POLITICAL_PARTY.PARTY_ID, name)
                .from(POLITICAL_PARTY)
                .orderBy(POLITICAL_PARTY.DISPLAY_ORDER)
                .fetch(record -> new PartyView(
                        record.get(POLITICAL_PARTY.PARTY_ID), record.get(name)));
    }

    @GetMapping("/places")
    public List<PlaceView> places(
            @RequestHeader(name = "Accept-Language", required = false) String language) {
        Locale locale = locale(language);
        Field<String> name = isRussian(language) ? PLACE.NAME_RU : PLACE.NAME_KK;
        return dsl.select(PLACE.PLACE_ID, PLACE.PLACE_TYPE, name, PLACE.PARENT_REGION_ID)
                .from(PLACE)
                .orderBy(PLACE.PLACE_TYPE, name)
                .fetch(record -> {
                    String type = record.get(PLACE.PLACE_TYPE);
                    return new PlaceView(
                            record.get(PLACE.PLACE_ID),
                            record.get(name),
                            new CodeLabel(type, messages.getMessage("place-type." + type, null, locale)),
                            record.get(PLACE.PARENT_REGION_ID));
                });
    }

    private static Locale locale(String language) {
        return isRussian(language) ? Locale.forLanguageTag("ru") : Locale.forLanguageTag("kk");
    }

    private static boolean isRussian(String language) {
        return language != null && language.toLowerCase().startsWith("ru");
    }

    public record PartyView(String id, String name) {
    }

    public record PlaceView(String id, String name, CodeLabel type, String parentRegionId) {
    }
}
