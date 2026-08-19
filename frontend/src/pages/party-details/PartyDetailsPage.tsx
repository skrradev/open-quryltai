import { useQuery } from '@tanstack/react-query'
import {
  ArrowLeft,
  BadgeCheck,
  CalendarDays,
  ExternalLink,
  FileText,
  Network,
  RotateCcw,
  Users,
  type LucideIcon,
} from 'lucide-react'
import { useTranslation } from 'react-i18next'
import { Link, useParams } from 'react-router'
import {
  Bar,
  BarChart,
  CartesianGrid,
  Cell,
  Pie,
  PieChart,
  ResponsiveContainer,
  Tooltip,
  XAxis,
  YAxis,
} from 'recharts'

import { CandidateTable, candidateQueries } from '@/entities/candidate'
import {
  PARTY_BRANDING,
  PartyLogo,
  partyQueries,
  type PartyStatisticsCategory,
} from '@/entities/party'
import {
  PARTY_PROGRAM_SOURCES,
  ProgramMethodologyModal,
  ProgramProfile,
  programQueries,
} from '@/entities/program'
import {
  CandidateFilters,
  useCandidateListParams,
} from '@/features/candidate-filters'
import { CandidatePagination } from '@/features/candidate-pagination'
import { ApiError } from '@/shared/api/client'
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

const CHART_COLORS = [
  'var(--color-chart-1)',
  'var(--color-chart-2)',
  'var(--color-chart-3)',
]

interface SummaryCardProps {
  icon: LucideIcon
  label: string
  value: string | number
}

function SummaryCard({ icon: Icon, label, value }: SummaryCardProps) {
  return (
    <Card>
      <CardContent className="flex items-center gap-4">
        <span className="flex size-11 shrink-0 items-center justify-center rounded-xl bg-primary text-primary-foreground">
          <Icon aria-hidden="true" className="size-5" />
        </span>
        <div>
          <p className="text-2xl font-semibold tracking-tight sm:text-3xl">{value}</p>
          <p className="text-sm text-muted-foreground">{label}</p>
        </div>
      </CardContent>
    </Card>
  )
}

function AccessibleValues({ values }: { values: PartyStatisticsCategory[] }) {
  return (
    <ul className="sr-only">
      {values.map(({ category, count }) => (
        <li key={category.code}>{category.label}: {count}</li>
      ))}
    </ul>
  )
}

function CountTooltip({
  active,
  payload,
}: {
  active?: boolean
  payload?: Array<{ payload?: { label?: string }; value?: number }>
}) {
  if (!active || !payload?.[0]) {
    return null
  }

  return (
    <div className="rounded-lg border bg-background px-3 py-2 text-sm shadow-md">
      <p className="font-medium">{payload[0].payload?.label}</p>
      <p className="text-muted-foreground">{payload[0].value}</p>
    </div>
  )
}

function PartyDetailsSkeleton() {
  return (
    <div aria-hidden="true" className="grid gap-6">
      <Skeleton className="h-12 w-2/3" />
      <div className="grid gap-4 sm:grid-cols-2 xl:grid-cols-4">
        {[0, 1, 2, 3].map((item) => (
          <Card className="p-4" key={item}><Skeleton className="h-16 w-full" /></Card>
        ))}
      </div>
      <div className="grid gap-4 lg:grid-cols-2">
        {[0, 1, 2].map((item) => (
          <Card className="p-4" key={item}><Skeleton className="h-72 w-full" /></Card>
        ))}
      </div>
    </div>
  )
}

export function PartyDetailsPage() {
  const { partyId = '' } = useParams()
  const { t } = useTranslation()
  const language = useRouteLanguage()
  const validPartyId = /^[a-z][a-z0-9_]*$/.test(partyId)
  const partyQuery = useQuery({
    ...partyQueries.detail(language, validPartyId ? partyId : 'invalid'),
    enabled: validPartyId,
    retry: (failureCount, error) =>
      !(error instanceof ApiError && error.status === 404) && failureCount < 1,
  })
  const programQuery = useQuery({
    ...programQueries.party(language, validPartyId ? partyId : 'invalid'),
    enabled: validPartyId,
    // A party without a measured programme is a normal state, not an error:
    // the page still renders everything else.
    retry: false,
  })
  const { hasCustomParams, params, resetParams, updateParams } = useCandidateListParams(
    validPartyId ? { partyId } : undefined
  )
  const candidatesQuery = useQuery({
    ...candidateQueries.list(language, params),
    enabled: validPartyId,
  })
  const numberFormatter = new Intl.NumberFormat(language === 'kk' ? 'kk-KZ' : 'ru-RU', {
    maximumFractionDigits: 1,
  })
  const isNotFound =
    !validPartyId ||
    (partyQuery.error instanceof ApiError && partyQuery.error.status === 404)

  return (
    <main className="mx-auto min-h-svh w-full max-w-7xl px-4 py-24 sm:px-6 lg:px-8">
      <Button asChild className="mb-8" variant="ghost">
        <Link to={`/${language}/parties`}>
          <ArrowLeft aria-hidden="true" data-icon="inline-start" />
          {t('actions.backToParties')}
        </Link>
      </Button>

      {partyQuery.isPending && validPartyId && <PartyDetailsSkeleton />}

      {isNotFound && (
        <section className="rounded-xl border border-dashed p-10 text-center">
          <h1 className="text-3xl font-semibold tracking-tight">
            {t('party.details.notFound.title')}
          </h1>
          <p className="mt-2 text-muted-foreground">
            {t('party.details.notFound.description')}
          </p>
        </section>
      )}

      {partyQuery.isError && !isNotFound && (
        <section
          aria-live="assertive"
          className="rounded-xl border border-destructive/20 bg-destructive/5 p-6"
          role="alert"
        >
          <h1 className="font-semibold">{t('errors.party.title')}</h1>
          <p className="mt-1 text-sm text-muted-foreground">
            {t('errors.party.description')}
          </p>
          <Button className="mt-4" onClick={() => void partyQuery.refetch()} variant="outline">
            {t('actions.retry')}
          </Button>
        </section>
      )}

      {partyQuery.data && (
        <article className="space-y-8 min-w-0 w-full">
          <header className="flex flex-col items-start justify-between gap-5 sm:flex-row sm:items-center border-b border-border/50 pb-6">
            <div className="flex items-center gap-4 sm:gap-6 min-w-0 flex-1">
              <PartyLogo partyId={partyQuery.data.party.id} size="xl" />
              <div className="min-w-0 flex-1">
                <div className="flex items-center gap-2 mb-1">
                  <span
                    className="inline-block size-2.5 rounded-full shrink-0"
                    style={{
                      backgroundColor:
                        PARTY_BRANDING[partyQuery.data.party.id]?.brandColor ?? 'var(--primary)',
                    }}
                  />
                  <p className="text-xs font-semibold tracking-wider text-muted-foreground uppercase">
                    {t('party.details.eyebrow')} · 2026
                  </p>
                </div>
                <h1 className="text-2xl sm:text-3xl lg:text-4xl font-semibold tracking-tight">
                  {partyQuery.data.party.name}
                </h1>
              </div>
            </div>
            <Button asChild className="shrink-0" size="lg">
              <a href="#party-candidates">
                {t('actions.viewCandidates')}
                <Users aria-hidden="true" data-icon="inline-end" />
              </a>
            </Button>
          </header>

          <section
            aria-label={t('party.details.summary.title')}
            className="grid gap-4 sm:grid-cols-2 xl:grid-cols-4"
          >
            <SummaryCard
              icon={Users}
              label={t('party.details.summary.candidates')}
              value={partyQuery.data.summary.candidateCount}
            />
            <SummaryCard
              icon={CalendarDays}
              label={t('party.details.summary.averageAge')}
              value={numberFormatter.format(partyQuery.data.summary.averageAge)}
            />
            <SummaryCard
              icon={BadgeCheck}
              label={t('party.details.summary.incumbents')}
              value={partyQuery.data.summary.incumbentCount}
            />
            <SummaryCard
              icon={Network}
              label={t('party.details.summary.insiders')}
              value={partyQuery.data.summary.partyInsiderCount}
            />
          </section>

          <section className="grid gap-4 lg:grid-cols-2">
            <Card>
              <CardHeader>
                <CardTitle><h2>{t('party.details.charts.gender.title')}</h2></CardTitle>
                <CardDescription>{t('party.details.charts.gender.description')}</CardDescription>
              </CardHeader>
              <CardContent>
                <ResponsiveContainer height={280} width="100%">
                  <PieChart accessibilityLayer>
                    <Pie
                      data={partyQuery.data.genders.map(({ category, count }) => ({
                        label: category.label,
                        value: count,
                      }))}
                      dataKey="value"
                      innerRadius={62}
                      nameKey="label"
                      outerRadius={100}
                      paddingAngle={3}
                    >
                      {partyQuery.data.genders.map(({ category }, index) => (
                        <Cell fill={CHART_COLORS[index]} key={category.code} />
                      ))}
                    </Pie>
                    <Tooltip content={<CountTooltip />} />
                  </PieChart>
                </ResponsiveContainer>
                <div className="flex flex-wrap justify-center gap-4">
                  {partyQuery.data.genders.map(({ category, count }, index) => (
                    <div className="flex items-center gap-2 text-sm" key={category.code}>
                      <span
                        aria-hidden="true"
                        className="size-2.5 rounded-full"
                        style={{ backgroundColor: CHART_COLORS[index] }}
                      />
                      <span>{category.label}</span>
                      <span className="font-semibold">{count}</span>
                    </div>
                  ))}
                </div>
                <AccessibleValues values={partyQuery.data.genders} />
              </CardContent>
            </Card>

            <Card>
              <CardHeader>
                <CardTitle><h2>{t('party.details.charts.age.title')}</h2></CardTitle>
                <CardDescription>{t('party.details.charts.age.description')}</CardDescription>
              </CardHeader>
              <CardContent>
                <ResponsiveContainer height={330} width="100%">
                  <BarChart
                    accessibilityLayer
                    data={partyQuery.data.ageGroups.map(({ category, count }) => ({
                      label: category.label,
                      value: count,
                    }))}
                  >
                    <CartesianGrid vertical={false} strokeDasharray="3 3" />
                    <XAxis dataKey="label" fontSize={12} tickLine={false} />
                    <YAxis allowDecimals={false} width={34} />
                    <Tooltip content={<CountTooltip />} cursor={{ fill: 'var(--color-muted)' }} />
                    <Bar dataKey="value" fill="var(--color-chart-2)" radius={[5, 5, 0, 0]} />
                  </BarChart>
                </ResponsiveContainer>
                <AccessibleValues values={partyQuery.data.ageGroups} />
              </CardContent>
            </Card>

            <Card className="lg:col-span-2">
              <CardHeader>
                <CardTitle><h2>{t('party.details.charts.sectors.title')}</h2></CardTitle>
                <CardDescription>{t('party.details.charts.sectors.description')}</CardDescription>
              </CardHeader>
              <CardContent>
                <ResponsiveContainer
                  height={Math.max(220, partyQuery.data.sectors.length * 36 + 40)}
                  width="100%"
                >
                  <BarChart
                    accessibilityLayer
                    data={partyQuery.data.sectors.map(({ category, count }) => ({
                      label: category.label,
                      value: count,
                    }))}
                    layout="vertical"
                    margin={{ left: 8, right: 16 }}
                  >
                    <CartesianGrid horizontal={false} strokeDasharray="3 3" />
                    <XAxis allowDecimals={false} type="number" />
                    <YAxis
                      dataKey="label"
                      fontSize={12}
                      interval={0}
                      tickLine={false}
                      type="category"
                      width={190}
                    />
                    <Tooltip content={<CountTooltip />} cursor={{ fill: 'var(--color-muted)' }} />
                    <Bar dataKey="value" fill="var(--color-chart-3)" radius={[0, 5, 5, 0]} />
                  </BarChart>
                </ResponsiveContainer>
                <AccessibleValues values={partyQuery.data.sectors} />
              </CardContent>
            </Card>
          </section>

          {programQuery.data && (
            <section aria-labelledby="party-program-heading" className="space-y-4">
              <Card>
                <CardHeader className="flex flex-col gap-3 sm:flex-row sm:items-start sm:justify-between">
                  <div>
                    <CardTitle id="party-program-heading">
                      {t('program.profile.title')}
                    </CardTitle>
                    <CardDescription>{t('program.description')}</CardDescription>
                  </div>
                  <div className="flex flex-wrap items-center gap-2">
                    {partyId && PARTY_PROGRAM_SOURCES[partyId] && (
                      <Button asChild size="sm" variant="outline">
                        <a
                          href={
                            PARTY_PROGRAM_SOURCES[partyId].documentUrl ||
                            PARTY_PROGRAM_SOURCES[partyId].sourceUrl
                          }
                          rel="noreferrer"
                          target="_blank"
                        >
                          <FileText className="size-3.5" data-icon="inline-start" />
                          <span>
                            {language === 'kk'
                              ? `Ресми бағдарлама (${PARTY_PROGRAM_SOURCES[partyId].format})`
                              : `Оригинал программы (${PARTY_PROGRAM_SOURCES[partyId].format})`}
                          </span>
                          <ExternalLink className="size-3 text-muted-foreground ml-1" />
                        </a>
                      </Button>
                    )}
                    <ProgramMethodologyModal className="shrink-0 self-start" mode="all" />
                  </div>
                </CardHeader>
                <CardContent>
                  <ProgramProfile measurement={programQuery.data} />
                </CardContent>
              </Card>
            </section>
          )}

          {/* Party Candidates List & Search */}
          <section
            aria-labelledby="party-candidates-heading"
            className="space-y-6 pt-6 border-t min-w-0 w-full"
            id="party-candidates"
          >
            <div className="flex flex-col gap-1 sm:flex-row sm:items-end sm:justify-between">
              <div>
                <p className="text-xs font-semibold tracking-wider text-muted-foreground uppercase">
                  {t('candidate.list.title')} · {partyQuery.data.party.name}
                </p>
                <h2 className="text-2xl font-semibold tracking-tight sm:text-3xl" id="party-candidates-heading">
                  {t('party.details.candidatesSectionTitle')}
                </h2>
                <p className="text-sm text-muted-foreground mt-1">
                  {t('candidate.list.total', {
                    count: candidatesQuery.data?.totalItems ?? partyQuery.data.summary.candidateCount,
                  })}
                </p>
              </div>
            </div>

            <CandidateFilters
              hasCustomParams={hasCustomParams}
              hidePartyFilter
              language={language}
              onReset={resetParams}
              onUpdate={updateParams}
              params={params}
            />

            {candidatesQuery.isPending && (
              <div className="overflow-hidden rounded-xl border bg-card p-6 space-y-4">
                <Skeleton className="h-10 w-full" />
                <Skeleton className="h-10 w-full" />
                <Skeleton className="h-10 w-full" />
                <Skeleton className="h-10 w-full" />
              </div>
            )}

            {candidatesQuery.isError && (
              <section className="rounded-xl border border-destructive/20 bg-destructive/5 p-6" role="alert">
                <h3 className="font-semibold text-sm">{t('errors.candidates.title')}</h3>
                <p className="mt-1 text-xs text-muted-foreground">{t('errors.candidates.description')}</p>
                <Button className="mt-4" onClick={() => void candidatesQuery.refetch()} size="sm" variant="outline">
                  {t('actions.retry')}
                </Button>
              </section>
            )}

            {candidatesQuery.data?.items.length === 0 && (
              <div className="rounded-xl border border-dashed p-10 text-center bg-card">
                <h3 className="font-semibold text-sm">{t('candidate.list.empty.title')}</h3>
                <p className="mt-1 text-xs text-muted-foreground">{t('candidate.list.empty.description')}</p>
                {hasCustomParams && (
                  <Button className="mt-4" onClick={resetParams} size="sm" variant="outline">
                    <RotateCcw className="size-3.5" data-icon="inline-start" />
                    {t('filters.reset')}
                  </Button>
                )}
              </div>
            )}

            {candidatesQuery.data && candidatesQuery.data.items.length > 0 && (
              <div className="space-y-4">
                <CandidateTable candidates={candidatesQuery.data.items} language={language} />
                <CandidatePagination
                  disabled={candidatesQuery.isPlaceholderData}
                  onPageChange={(page) => updateParams({ page })}
                  onPageSizeChange={(size) => updateParams({ size })}
                  page={candidatesQuery.data.page}
                  size={candidatesQuery.data.size}
                  totalPages={candidatesQuery.data.totalPages}
                />
              </div>
            )}
          </section>
        </article>
      )}
    </main>
  )
}
