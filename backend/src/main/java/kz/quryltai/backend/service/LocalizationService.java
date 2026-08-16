package kz.quryltai.backend.service;

import java.util.Locale;

import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import kz.quryltai.backend.dto.CodeLabelDto;
import kz.quryltai.backend.model.Language;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LocalizationService {

    private final MessageSource messages;

    public Locale currentLocale() {
        return LocaleContextHolder.getLocale();
    }

    public Language currentLanguage() {
        return Language.from(currentLocale());
    }

    public CodeLabelDto label(String group, String code) {
        return new CodeLabelDto(
                code,
                messages.getMessage(group + "." + code, null, currentLocale()));
    }
}
