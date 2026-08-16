import i18n from 'i18next'
import { initReactI18next } from 'react-i18next'

import {
  DEFAULT_LANGUAGE,
  isSupportedLanguage,
  SUPPORTED_LANGUAGES,
} from '@/shared/config/language'
import { kk } from '@/shared/i18n/locales/kk'
import { ru } from '@/shared/i18n/locales/ru'

const routeLanguage = window.location.pathname.split('/')[1]
const initialLanguage = isSupportedLanguage(routeLanguage)
  ? routeLanguage
  : DEFAULT_LANGUAGE

void i18n.use(initReactI18next).init({
  resources: {
    kk: { translation: kk },
    ru: { translation: ru },
  },
  lng: initialLanguage,
  fallbackLng: DEFAULT_LANGUAGE,
  supportedLngs: SUPPORTED_LANGUAGES,
  interpolation: {
    escapeValue: false,
  },
})

document.documentElement.lang = initialLanguage

export { i18n }
