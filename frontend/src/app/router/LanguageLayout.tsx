import { useEffect } from 'react'
import { useTranslation } from 'react-i18next'
import { Navigate, Outlet, useParams } from 'react-router'

import { LanguageSwitcher } from '@/features/language-switcher/LanguageSwitcher'
import {
  DEFAULT_LANGUAGE,
  isSupportedLanguage,
} from '@/shared/config/language'

export function LanguageLayout() {
  const { language } = useParams()
  const { i18n } = useTranslation()

  useEffect(() => {
    if (!isSupportedLanguage(language)) {
      return
    }

    document.documentElement.lang = language

    if (i18n.resolvedLanguage !== language) {
      void i18n.changeLanguage(language)
    }
  }, [i18n, language])

  if (!isSupportedLanguage(language)) {
    return <Navigate to={`/${DEFAULT_LANGUAGE}/candidates`} replace />
  }

  return (
    <div className="min-h-svh">
      <header className="fixed top-0 right-0 z-10 p-4 sm:p-6">
        <LanguageSwitcher language={language} />
      </header>
      <Outlet />
    </div>
  )
}
