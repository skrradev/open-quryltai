import { useQuery } from '@tanstack/react-query'
import { ArrowRight } from 'lucide-react'
import { useTranslation } from 'react-i18next'
import { Link } from 'react-router'

import { PARTY_BRANDING, PartyLogo } from '@/entities/party'
import { statisticsQueries } from '@/entities/statistics'
import { useRouteLanguage } from '@/shared/lib/use-route-language'
import { Button } from '@/shared/ui/button'
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from '@/shared/ui/card'
import { Skeleton } from '@/shared/ui/skeleton'

export function PartyListPage() {
  const { t } = useTranslation()
  const language = useRouteLanguage()
  const statisticsQuery = useQuery(statisticsQueries.detail(language))

  return (
    <main className="mx-auto min-h-svh w-full max-w-7xl px-4 py-24 sm:px-6 lg:px-8">
      <header className="mb-8 max-w-3xl">
        <p className="mb-2 text-sm font-semibold tracking-wide text-muted-foreground uppercase">
          {t('app.name')} · 2026
        </p>
        <h1 className="text-4xl font-semibold tracking-tight sm:text-5xl">
          {t('party.list.title')}
        </h1>
        <p className="mt-3 text-base text-muted-foreground sm:text-lg">
          {t('party.list.description')}
        </p>
      </header>

      {statisticsQuery.isPending && (
        <div aria-hidden="true" className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {Array.from({ length: 7 }, (_, index) => (
            <Card className="p-4" key={index}>
              <Skeleton className="h-32 w-full" />
            </Card>
          ))}
        </div>
      )}

      {statisticsQuery.isError && (
        <section
          aria-live="assertive"
          className="rounded-xl border border-destructive/20 bg-destructive/5 p-6"
          role="alert"
        >
          <h2 className="font-semibold">{t('errors.parties.title')}</h2>
          <p className="mt-1 text-sm text-muted-foreground">
            {t('errors.parties.description')}
          </p>
          <Button
            className="mt-4"
            onClick={() => void statisticsQuery.refetch()}
            variant="outline"
          >
            {t('actions.retry')}
          </Button>
        </section>
      )}

      {statisticsQuery.data && (
        <section
          aria-label={t('party.list.title')}
          className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3"
        >
          {statisticsQuery.data.parties.map(({ party, count }) => (
            <Card className="transition-all hover:border-primary/40 hover:shadow-xs" key={party.id}>
              <CardHeader>
                <div className="mb-3 flex items-center justify-between">
                  <PartyLogo partyId={party.id} size="md" />
                  <span
                    className="size-2.5 rounded-full"
                    style={{
                      backgroundColor: PARTY_BRANDING[party.id]?.brandColor ?? 'var(--primary)',
                    }}
                  />
                </div>
                <CardTitle>
                  <h2 className="text-xl font-semibold">{party.name}</h2>
                </CardTitle>
                <CardDescription>
                  {t('party.list.candidateCount', { count })}
                </CardDescription>
              </CardHeader>
              <CardContent>
                <Button asChild variant="outline">
                  <Link to={`/${language}/parties/${party.id}`}>
                    {t('actions.viewParty')}
                    <ArrowRight aria-hidden="true" data-icon="inline-end" />
                  </Link>
                </Button>
              </CardContent>
            </Card>
          ))}
        </section>
      )}
    </main>
  )
}
