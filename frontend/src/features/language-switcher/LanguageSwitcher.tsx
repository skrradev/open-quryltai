import { useTranslation } from 'react-i18next'
import { Link, useLocation } from 'react-router'

import { SUPPORTED_LANGUAGES, type Language } from '@/shared/config/language'
import { Button } from '@/shared/ui/button'

const languageLabels: Record<Language, string> = {
  kk: 'ҚАЗ',
  ru: 'РУС',
}

interface LanguageSwitcherProps {
  language: Language
}

export function LanguageSwitcher({ language }: LanguageSwitcherProps) {
  const { t } = useTranslation()
  const location = useLocation()

  return (
    <nav
      aria-label={t('language.selectorLabel')}
      className="flex rounded-lg border bg-background p-1 shadow-xs"
    >
      {SUPPORTED_LANGUAGES.map((targetLanguage) => {
        const pathname = location.pathname.replace(
          /^\/(kk|ru)(?=\/|$)/,
          `/${targetLanguage}`,
        )
        const isActive = targetLanguage === language

        return (
          <Button
            asChild
            key={targetLanguage}
            size="sm"
            variant={isActive ? 'secondary' : 'ghost'}
          >
            <Link
              aria-current={isActive ? 'page' : undefined}
              aria-label={t('language.switchTo', {
                language: t(`language.names.${targetLanguage}`),
              })}
              to={{ pathname, search: location.search, hash: location.hash }}
            >
              {languageLabels[targetLanguage]}
            </Link>
          </Button>
        )
      })}
    </nav>
  )
}
