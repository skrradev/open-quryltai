import { useTranslation } from 'react-i18next'
import { Link, useParams } from 'react-router'

import { DEFAULT_LANGUAGE, isSupportedLanguage } from '@/shared/config/language'
import { Button } from '@/shared/ui/button'

export function NotFoundPage() {
  const { language } = useParams()
  const { t } = useTranslation()
  const destinationLanguage = isSupportedLanguage(language)
    ? language
    : DEFAULT_LANGUAGE

  return (
    <main className="grid min-h-svh place-items-center p-6">
      <div className="flex flex-col items-center gap-4 text-center">
        <p className="text-sm font-medium text-muted-foreground">404</p>
        <h1 className="text-4xl font-semibold tracking-tight">
          {t('errors.notFound.title')}
        </h1>
        <p className="max-w-md text-muted-foreground">
          {t('errors.notFound.description')}
        </p>
        <Button asChild>
          <Link to={`/${destinationLanguage}/candidates`}>
            {t('actions.goToCandidates')}
          </Link>
        </Button>
      </div>
    </main>
  )
}
