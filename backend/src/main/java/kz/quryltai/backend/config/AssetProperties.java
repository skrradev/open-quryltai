package kz.quryltai.backend.config;

import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * Public base URL for candidate assets. The database stores R2 object keys, not
 * URLs, so that the CDN host can change without a data migration.
 */
@ConfigurationProperties(prefix = "assets")
public record AssetProperties(String baseUrl) {

    public String url(String objectKey) {
        if (objectKey == null || objectKey.isBlank()) {
            return null;
        }
        return baseUrl.replaceAll("/+$", "") + "/" + objectKey;
    }
}
