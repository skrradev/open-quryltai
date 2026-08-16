import { useQuery } from '@tanstack/react-query'
import { ArrowLeft } from 'lucide-react'
import { useTranslation } from 'react-i18next'
import { Link, useLocation, useParams } from 'react-router'

import { candidateQueries, type Candidate } from '@/entities/candidate'
import { ApiError } from '@/shared/api/client'
import type { Language } from '@/shared/config/language'
import { useRouteLanguage } from '@/shared/lib/use-route-language'
import { Badge } from '@/shared/ui/badge'
import { Button } from '@/shared/ui/button'
import { Card, CardContent, CardHeader, CardTitle } from '@/shared/ui/card'
import { Skeleton } from '@/shared/ui/skeleton'

interface DetailRowProps {
  label: string
  value: string | number
}

function DetailRow({ label, value }: DetailRowProps) {
  return (
    <div className="grid gap-1 border-b py-3 last:border-b-0 sm:grid-cols-[11rem_1fr] sm:gap-4">
      <dt className="text-sm text-muted-foreground">{label}</dt>
      <dd className="text-sm font-medium sm:text-right">{value}</dd>
    </div>
  )
}

function CandidateDetailsSkeleton() {
  return (
    <div aria-hidden="true" className="grid gap-6">
      <div className="grid gap-3">
        <Skeleton className="h-5 w-28 rounded-full" />
        <Skeleton className="h-10 w-3/4" />
        <Skeleton className="h-6 w-full max-w-2xl" />
      </div>
      <div className="grid gap-4 md:grid-cols-2">
        {[0, 1, 2].map((section) => (
          <Card className={section === 2 ? 'md:col-span-2' : undefined} key={section}>
            <CardHeader>
              <Skeleton className="h-6 w-40" />
            </CardHeader>
            <CardContent className="grid gap-4">
              {[0, 1, 2].map((row) => (
                <Skeleton className="h-8 w-full" key={row} />
              ))}
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  )
}

function getReturnTo(state: unknown, language: Language): string {
  const fallback = `/${language}/candidates`

  if (typeof state !== 'object' || state === null || !('from' in state)) {
    return fallback
  }

  const from = state.from

  if (typeof from !== 'string' || !/^\/(kk|ru)\/candidates(?:\?|$)/.test(from)) {
    return fallback
  }

  return from.replace(/^\/(kk|ru)/, `/${language}`)
}

interface CandidateDetailsContentProps {
  candidate: Candidate
}

function CandidateDetailsContent({ candidate }: CandidateDetailsContentProps) {
  const { t } = useTranslation()
  const booleanLabel = (value: boolean) =>
    value ? t('common.yes') : t('common.no')

  return (
    <article className="grid gap-8">
      <header className="max-w-4xl">
        <div className="mb-4 flex flex-wrap gap-2">
          <Badge variant="secondary">{candidate.party.name}</Badge>
          <Badge variant="outline">
            {t('candidate.details.listOrder', { order: candidate.listOrder })}
          </Badge>
        </div>
        <h1 className="text-3xl font-semibold tracking-tight sm:text-5xl">
          {candidate.fullName}
        </h1>
        <p className="mt-4 text-lg leading-relaxed text-muted-foreground">
          {candidate.position}
        </p>
      </header>

      <div className="grid gap-4 md:grid-cols-2">
        <Card>
          <CardHeader>
            <CardTitle>
              <h2>{t('candidate.details.sections.basic')}</h2>
            </CardTitle>
          </CardHeader>
          <CardContent>
            <dl>
              <DetailRow
                label={t('candidate.details.fields.birthYear')}
                value={candidate.birthYear}
              />
              <DetailRow
                label={t('candidate.details.fields.gender')}
                value={candidate.gender.label}
              />
              <DetailRow
                label={t('candidate.details.fields.place')}
                value={candidate.place.name}
              />
            </dl>
          </CardContent>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle>
              <h2>{t('candidate.details.sections.political')}</h2>
            </CardTitle>
          </CardHeader>
          <CardContent>
            <dl>
              <DetailRow
                label={t('candidate.details.fields.party')}
                value={candidate.party.name}
              />
              <DetailRow
                label={t('candidate.details.fields.partyInsider')}
                value={booleanLabel(candidate.partyInsider)}
              />
              <DetailRow
                label={t('candidate.details.fields.incumbent')}
                value={booleanLabel(candidate.incumbent)}
              />
            </dl>
          </CardContent>
        </Card>

        <Card className="md:col-span-2">
          <CardHeader>
            <CardTitle>
              <h2>{t('candidate.details.sections.professional')}</h2>
            </CardTitle>
          </CardHeader>
          <CardContent>
            <dl>
              <DetailRow
                label={t('candidate.details.fields.position')}
                value={candidate.position}
              />
            </dl>
          </CardContent>
        </Card>
      </div>
    </article>
  )
}

export function CandidateDetailsPage() {
  const { candidateId } = useParams()
  const location = useLocation()
  const language = useRouteLanguage()
  const { t } = useTranslation()
  const parsedCandidateId = Number(candidateId)
  const isValidCandidateId =
    /^\d+$/.test(candidateId ?? '') &&
    Number.isInteger(parsedCandidateId) &&
    parsedCandidateId > 0 &&
    parsedCandidateId <= 32_767
  const candidateQuery = useQuery({
    ...candidateQueries.detail(language, isValidCandidateId ? parsedCandidateId : 0),
    enabled: isValidCandidateId,
    retry: (failureCount, error) =>
      !(error instanceof ApiError && error.status === 404) && failureCount < 1,
  })
  const returnTo = getReturnTo(location.state, language)
  const isNotFound =
    !isValidCandidateId ||
    (candidateQuery.error instanceof ApiError && candidateQuery.error.status === 404)

  return (
    <main className="mx-auto min-h-svh w-full max-w-6xl px-4 py-24 sm:px-6 lg:px-8">
      <Button asChild className="mb-8" variant="ghost">
        <Link to={returnTo}>
          <ArrowLeft aria-hidden="true" data-icon="inline-start" />
          {t('actions.backToCandidates')}
        </Link>
      </Button>

      {candidateQuery.isPending && isValidCandidateId && (
        <CandidateDetailsSkeleton />
      )}

      {isNotFound && (
        <section className="rounded-xl border border-dashed p-10 text-center">
          <h1 className="text-3xl font-semibold tracking-tight">
            {t('candidate.details.notFound.title')}
          </h1>
          <p className="mt-2 text-muted-foreground">
            {t('candidate.details.notFound.description')}
          </p>
        </section>
      )}

      {candidateQuery.isError && !isNotFound && (
        <section
          aria-live="assertive"
          className="rounded-xl border border-destructive/20 bg-destructive/5 p-6"
          role="alert"
        >
          <h1 className="font-semibold">{t('errors.candidate.title')}</h1>
          <p className="mt-1 text-sm text-muted-foreground">
            {t('errors.candidate.description')}
          </p>
          <Button
            className="mt-4"
            onClick={() => void candidateQuery.refetch()}
            variant="outline"
          >
            {t('actions.retry')}
          </Button>
        </section>
      )}

      {candidateQuery.data && (
        <CandidateDetailsContent candidate={candidateQuery.data} />
      )}
    </main>
  )
}
