package kz.quryltai.backend;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

import kz.quryltai.backend.config.AssetProperties;
import kz.quryltai.backend.config.ContentImportProperties;

@SpringBootApplication
@EnableConfigurationProperties({ContentImportProperties.class, AssetProperties.class})
public class QuryltaiBackendApplication {

    public static void main(String[] args) {
        SpringApplication.run(QuryltaiBackendApplication.class, args);
    }
}
