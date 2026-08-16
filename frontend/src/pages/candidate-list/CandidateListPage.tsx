import { useTranslation } from 'react-i18next'

import { Badge } from '@/shared/ui/badge'

export function CandidateListPage() {
  const { t } = useTranslation()

  return (
    <main className="grid min-h-svh place-items-center p-6">
      <div className="flex flex-col items-center gap-4 text-center">
        <Badge variant="secondary">2026</Badge>
        <p className="text-sm font-medium text-muted-foreground">{t('app.name')}</p>
        <h1 className="text-4xl font-semibold tracking-tight">
          {t('candidate.list.title')}
        </h1>
      </div>
    </main>
  )
}
