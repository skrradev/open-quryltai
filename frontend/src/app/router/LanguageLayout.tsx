import { useEffect } from 'react'
import { useTranslation } from 'react-i18next'
import { Navigate, NavLink, Outlet, useParams } from 'react-router'

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
    return <Navigate to={`/${DEFAULT_LANGUAGE}`} replace />
  }

  return (
    <div className="min-h-svh">
      <header className="fixed inset-x-0 top-0 z-10 border-b bg-background/90 backdrop-blur-md">
        <div className="mx-auto flex h-16 max-w-7xl items-center gap-3 px-4 sm:px-6 lg:px-8">
          <NavLink className="mr-auto hidden items-center gap-2 text-base font-semibold tracking-tight sm:flex" end to={`/${language}`}>
            <img alt="" className="size-6 rounded-md" src="/favicon.svg" />
            <span>{i18n.t('app.name')}</span>
          </NavLink>
          <nav aria-label={i18n.t('navigation.label')} className="flex items-center gap-1">
            <NavLink
              className={({ isActive }) =>
                `rounded-lg px-2.5 py-2 text-sm font-medium transition-colors ${
                  isActive ? 'bg-secondary text-secondary-foreground' : 'text-muted-foreground hover:text-foreground'
                }`
              }
              end
              to={`/${language}`}
            >
              {i18n.t('navigation.overview')}
            </NavLink>
            <NavLink
              className={({ isActive }) =>
                `rounded-lg px-2.5 py-2 text-sm font-medium transition-colors ${
                  isActive ? 'bg-secondary text-secondary-foreground' : 'text-muted-foreground hover:text-foreground'
                }`
              }
              to={`/${language}/parties`}
            >
              {i18n.t('navigation.parties')}
            </NavLink>
            <NavLink
              className={({ isActive }) =>
                `rounded-lg px-2.5 py-2 text-sm font-medium transition-colors ${
                  isActive ? 'bg-secondary text-secondary-foreground' : 'text-muted-foreground hover:text-foreground'
                }`
              }
              to={`/${language}/about`}
            >
              {i18n.t('navigation.about')}
            </NavLink>
          </nav>
          <LanguageSwitcher language={language} />
        </div>
      </header>
      <Outlet />
      <footer className="border-t">
        <div className="mx-auto flex max-w-7xl flex-col gap-3 px-4 py-6 text-sm text-muted-foreground sm:flex-row sm:items-center sm:justify-between sm:px-6 lg:px-8">
          <p>{i18n.t('footer.identity')}</p>
          <div className="flex flex-wrap gap-x-5 gap-y-2">
            <a
              className="transition-colors hover:text-foreground"
              href="https://github.com/skrradev/open-quryltai"
              rel="noreferrer"
              target="_blank"
            >
              {i18n.t('footer.repository')}
            </a>
            <a
              className="transition-colors hover:text-foreground"
              href="https://www.linkedin.com/in/zhanarys-toremurat-13057019b/"
              rel="noreferrer"
              target="_blank"
            >
              {i18n.t('footer.author')}
            </a>
            <span>{i18n.t('footer.nonCampaigning')}</span>
          </div>
        </div>
      </footer>
    </div>
  )
}
