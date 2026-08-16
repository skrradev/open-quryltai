import { useQuery } from '@tanstack/react-query'
import { useTranslation } from 'react-i18next'

import { CandidateTable, candidateQueries } from '@/entities/candidate'
import {
  CandidateFilters,
  useCandidateListParams,
} from '@/features/candidate-filters'
import { CandidatePagination } from '@/features/candidate-pagination'
import { useRouteLanguage } from '@/shared/lib/use-route-language'
import { Button } from '@/shared/ui/button'
import { Skeleton } from '@/shared/ui/skeleton'

const skeletons = Array.from({ length: 12 }, (_, index) => index)

function CandidateListSkeleton() {
  return (
    <div aria-hidden="true" className="overflow-hidden rounded-xl border">
      <div className="flex gap-6 bg-muted/50 p-4">
        {[0, 1, 2, 3, 4].map((item) => (
          <Skeleton className="h-4 w-28" key={item} />
        ))}
      </div>
      {skeletons.map((index) => (
        <div className="grid grid-cols-[3rem_14rem_10rem_7rem_1fr] gap-6 border-t p-4" key={index}>
          <Skeleton className="h-4 w-8" />
          <Skeleton className="h-4 w-48" />
          <Skeleton className="h-5 w-28 rounded-full" />
          <Skeleton className="h-4 w-16" />
          <Skeleton className="h-4 w-full" />
        </div>
      ))}
    </div>
  )
}

export function CandidateListPage() {
  const { t } = useTranslation()
  const language = useRouteLanguage()
  const { hasCustomParams, params, resetParams, updateParams } =
    useCandidateListParams()
  const candidatesQuery = useQuery(candidateQueries.list(language, params))

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

      <CandidateFilters
        hasCustomParams={hasCustomParams}
        language={language}
        onReset={resetParams}
        onUpdate={updateParams}
        params={params}
      />

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
        <>
          <CandidateTable
            candidates={candidatesQuery.data.items}
            language={language}
          />
          <CandidatePagination
            disabled={candidatesQuery.isFetching}
            onPageChange={(page) => updateParams({ page }, { resetPage: false })}
            onPageSizeChange={(size) => updateParams({ page: 0, size })}
            page={candidatesQuery.data.page}
            size={candidatesQuery.data.size}
            totalPages={candidatesQuery.data.totalPages}
          />
        </>
      )}
    </main>
  )
}
