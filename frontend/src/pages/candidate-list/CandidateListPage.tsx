import { useQuery } from '@tanstack/react-query'
import { useTranslation } from 'react-i18next'

import { CandidateCard, candidateQueries } from '@/entities/candidate'
import { useRouteLanguage } from '@/shared/lib/use-route-language'
import { Button } from '@/shared/ui/button'
import { Card } from '@/shared/ui/card'
import { Skeleton } from '@/shared/ui/skeleton'

const skeletons = Array.from({ length: 12 }, (_, index) => index)

function CandidateListSkeleton() {
  return (
    <div
      aria-hidden="true"
      className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3"
    >
      {skeletons.map((index) => (
        <Card className="gap-4 p-4" key={index}>
          <Skeleton className="h-5 w-28 rounded-full" />
          <div className="grid gap-2">
            <Skeleton className="h-6 w-4/5" />
            <Skeleton className="h-4 w-32" />
          </div>
          <div className="grid gap-2 pt-2">
            <Skeleton className="h-4 w-full" />
            <Skeleton className="h-4 w-11/12" />
            <Skeleton className="h-4 w-2/3" />
          </div>
        </Card>
      ))}
    </div>
  )
}

export function CandidateListPage() {
  const { t } = useTranslation()
  const language = useRouteLanguage()
  const candidatesQuery = useQuery(candidateQueries.list(language))

  return (
    <main className="mx-auto min-h-svh w-full max-w-7xl px-4 py-24 sm:px-6 lg:px-8">
      <header className="mb-8 max-w-3xl">
        <p className="mb-2 text-sm font-semibold tracking-wide text-muted-foreground uppercase">
          {t('app.name')} · 2026
        </p>
        <h1 className="text-4xl font-semibold tracking-tight sm:text-5xl">
          {t('candidate.list.title')}
        </h1>
        <p className="mt-3 text-base text-muted-foreground sm:text-lg">
          {t('candidate.list.description')}
        </p>
        {candidatesQuery.data && (
          <p className="mt-4 text-sm font-medium">
            {t('candidate.list.total', {
              count: candidatesQuery.data.totalItems,
            })}
          </p>
        )}
      </header>

      {candidatesQuery.isPending && <CandidateListSkeleton />}

      {candidatesQuery.isError && (
        <section
          aria-live="assertive"
          className="rounded-xl border border-destructive/20 bg-destructive/5 p-6"
          role="alert"
        >
          <h2 className="font-semibold">{t('errors.candidates.title')}</h2>
          <p className="mt-1 text-sm text-muted-foreground">
            {t('errors.candidates.description')}
          </p>
          <Button
            className="mt-4"
            onClick={() => void candidatesQuery.refetch()}
            variant="outline"
          >
            {t('actions.retry')}
          </Button>
        </section>
      )}

      {candidatesQuery.data?.items.length === 0 && (
        <section className="rounded-xl border border-dashed p-10 text-center">
          <h2 className="font-semibold">{t('candidate.list.empty.title')}</h2>
          <p className="mt-1 text-sm text-muted-foreground">
            {t('candidate.list.empty.description')}
          </p>
        </section>
      )}

      {candidatesQuery.data && candidatesQuery.data.items.length > 0 && (
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {candidatesQuery.data.items.map((candidate) => (
            <CandidateCard
              candidate={candidate}
              key={candidate.candidateId}
              language={language}
            />
          ))}
        </div>
      )}
    </main>
  )
}
