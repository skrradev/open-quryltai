package kz.quryltai.backend.model;

import java.util.Locale;

public enum Language {
    KAZAKH,
    RUSSIAN;

    public static Language from(Locale locale) {
        return "ru".equals(locale.getLanguage()) ? RUSSIAN : KAZAKH;
    }

    public boolean isRussian() {
        return this == RUSSIAN;
    }
}
