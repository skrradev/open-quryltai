const configuredApiBaseUrl = import.meta.env.VITE_API_BASE_URL?.trim() || '/api'

export const env = Object.freeze({
  apiBaseUrl: configuredApiBaseUrl.replace(/\/+$/, ''),
})
