export const SUPPORTED_LANGUAGES = ['kk', 'ru'] as const

export type Language = (typeof SUPPORTED_LANGUAGES)[number]

export const DEFAULT_LANGUAGE: Language = 'kk'

export function isSupportedLanguage(language: string | undefined): language is Language {
  return SUPPORTED_LANGUAGES.some((supported) => supported === language)
}
