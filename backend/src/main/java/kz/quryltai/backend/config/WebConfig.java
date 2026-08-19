package kz.quryltai.backend.config;

import java.util.List;
import java.util.Locale;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.i18n.AcceptHeaderLocaleResolver;

@Configuration
public class WebConfig {

    public static final Locale KAZAKH = Locale.forLanguageTag("kk");
    public static final Locale RUSSIAN = Locale.forLanguageTag("ru");

    @Bean
    LocaleResolver localeResolver() {
        AcceptHeaderLocaleResolver resolver = new AcceptHeaderLocaleResolver();
        resolver.setSupportedLocales(List.of(KAZAKH, RUSSIAN));
        resolver.setDefaultLocale(KAZAKH);
        return resolver;
    }
}
