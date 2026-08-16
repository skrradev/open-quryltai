import { useQuery } from '@tanstack/react-query'
import {
  BadgeCheck,
  CalendarDays,
  Landmark,
  Users,
  type LucideIcon,
} from 'lucide-react'
import { useTranslation } from 'react-i18next'
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

import {
  statisticsQueries,
  type StatisticsCategory,
} from '@/entities/statistics'
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
  'var(--color-chart-4)',
  'var(--color-chart-5)',
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
          <p className="text-2xl font-semibold tracking-tight sm:text-3xl">
            {value}
          </p>
          <p className="text-sm text-muted-foreground">{label}</p>
        </div>
      </CardContent>
    </Card>
  )
}

function AccessibleValues({ values }: { values: StatisticsCategory[] }) {
  return (
    <ul className="sr-only">
      {values.map(({ category, count }) => (
        <li key={category.code}>
          {category.label}: {count}
        </li>
      ))}
    </ul>
  )
}

function DashboardSkeleton() {
  return (
    <div aria-hidden="true" className="grid gap-6">
      <div className="grid gap-4 sm:grid-cols-2 xl:grid-cols-4">
        {[0, 1, 2, 3].map((item) => (
          <Card className="p-4" key={item}>
            <Skeleton className="h-16 w-full" />
          </Card>
        ))}
      </div>
      <div className="grid gap-4 lg:grid-cols-2">
        {[0, 1, 2, 3].map((item) => (
          <Card className="p-4" key={item}>
            <Skeleton className="h-72 w-full" />
          </Card>
        ))}
      </div>
    </div>
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

export function StatisticsPage() {
  const { t } = useTranslation()
  const language = useRouteLanguage()
  const statisticsQuery = useQuery(statisticsQueries.detail(language))
  const numberFormatter = new Intl.NumberFormat(language === 'kk' ? 'kk-KZ' : 'ru-RU', {
    maximumFractionDigits: 1,
  })

  return (
    <main className="mx-auto min-h-svh w-full max-w-7xl px-4 py-24 sm:px-6 lg:px-8">
      <header className="mb-8 max-w-3xl">
        <p className="mb-2 text-sm font-semibold tracking-wide text-muted-foreground uppercase">
          {t('app.name')} · 2026
        </p>
        <h1 className="text-4xl font-semibold tracking-tight sm:text-5xl">
          {t('statistics.title')}
        </h1>
        <p className="mt-3 text-base text-muted-foreground sm:text-lg">
          {t('statistics.description')}
        </p>
      </header>

      {statisticsQuery.isPending && <DashboardSkeleton />}

      {statisticsQuery.isError && (
        <section
          aria-live="assertive"
          className="rounded-xl border border-destructive/20 bg-destructive/5 p-6"
          role="alert"
        >
          <h2 className="font-semibold">{t('errors.statistics.title')}</h2>
          <p className="mt-1 text-sm text-muted-foreground">
            {t('errors.statistics.description')}
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
        <div className="grid gap-6">
          <section
            aria-label={t('statistics.summary.title')}
            className="grid gap-4 sm:grid-cols-2 xl:grid-cols-4"
          >
            <SummaryCard
              icon={Users}
              label={t('statistics.summary.candidates')}
              value={numberFormatter.format(statisticsQuery.data.summary.totalCandidates)}
            />
            <SummaryCard
              icon={Landmark}
              label={t('statistics.summary.parties')}
              value={statisticsQuery.data.summary.totalParties}
            />
            <SummaryCard
              icon={CalendarDays}
              label={t('statistics.summary.averageAge')}
              value={numberFormatter.format(statisticsQuery.data.summary.averageAge)}
            />
            <SummaryCard
              icon={BadgeCheck}
              label={t('statistics.summary.incumbents')}
              value={numberFormatter.format(statisticsQuery.data.summary.incumbentCount)}
            />
          </section>

          <section className="grid gap-4 lg:grid-cols-5">
            <Card className="lg:col-span-3">
              <CardHeader>
                <CardTitle><h2>{t('statistics.charts.parties.title')}</h2></CardTitle>
                <CardDescription>{t('statistics.charts.parties.description')}</CardDescription>
              </CardHeader>
              <CardContent>
                <ResponsiveContainer height={330} width="100%">
                  <BarChart
                    accessibilityLayer
                    data={statisticsQuery.data.parties.map(({ party, count }) => ({
                      label: party.name,
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
                      width={145}
                    />
                    <Tooltip content={<CountTooltip />} cursor={{ fill: 'var(--color-muted)' }} />
                    <Bar dataKey="value" fill="var(--color-chart-1)" radius={[0, 5, 5, 0]} />
                  </BarChart>
                </ResponsiveContainer>
                <ul className="sr-only">
                  {statisticsQuery.data.parties.map(({ party, count }) => (
                    <li key={party.id}>{party.name}: {count}</li>
                  ))}
                </ul>
              </CardContent>
            </Card>

            <Card className="lg:col-span-2">
              <CardHeader>
                <CardTitle><h2>{t('statistics.charts.gender.title')}</h2></CardTitle>
                <CardDescription>{t('statistics.charts.gender.description')}</CardDescription>
              </CardHeader>
              <CardContent>
                <ResponsiveContainer height={260} width="100%">
                  <PieChart accessibilityLayer>
                    <Pie
                      data={statisticsQuery.data.genders.map(({ category, count }) => ({
                        label: category.label,
                        value: count,
                      }))}
                      dataKey="value"
                      innerRadius={65}
                      nameKey="label"
                      outerRadius={100}
                      paddingAngle={3}
                    >
                      {statisticsQuery.data.genders.map(({ category }, index) => (
                        <Cell fill={CHART_COLORS[index]} key={category.code} />
                      ))}
                    </Pie>
                    <Tooltip content={<CountTooltip />} />
                  </PieChart>
                </ResponsiveContainer>
                <div className="flex flex-wrap justify-center gap-4">
                  {statisticsQuery.data.genders.map(({ category, count }, index) => (
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
                <AccessibleValues values={statisticsQuery.data.genders} />
              </CardContent>
            </Card>
          </section>

          <section className="grid gap-4 lg:grid-cols-2">
            <Card className="self-start">
              <CardHeader>
                <CardTitle><h2>{t('statistics.charts.age.title')}</h2></CardTitle>
                <CardDescription>{t('statistics.charts.age.description')}</CardDescription>
              </CardHeader>
              <CardContent>
                <ResponsiveContainer height={330} width="100%">
                  <BarChart
                    accessibilityLayer
                    data={statisticsQuery.data.ageGroups.map(({ category, count }) => ({
                      label: category.label,
                      value: count,
                    }))}
                    margin={{ left: 0, right: 8 }}
                  >
                    <CartesianGrid vertical={false} strokeDasharray="3 3" />
                    <XAxis dataKey="label" fontSize={12} tickLine={false} />
                    <YAxis allowDecimals={false} width={34} />
                    <Tooltip content={<CountTooltip />} cursor={{ fill: 'var(--color-muted)' }} />
                    <Bar dataKey="value" fill="var(--color-chart-2)" radius={[5, 5, 0, 0]} />
                  </BarChart>
                </ResponsiveContainer>
                <AccessibleValues values={statisticsQuery.data.ageGroups} />
              </CardContent>
            </Card>

            <Card>
              <CardHeader>
                <CardTitle><h2>{t('statistics.charts.sectors.title')}</h2></CardTitle>
                <CardDescription>{t('statistics.charts.sectors.description')}</CardDescription>
              </CardHeader>
              <CardContent>
                <ResponsiveContainer height={500} width="100%">
                  <BarChart
                    accessibilityLayer
                    data={statisticsQuery.data.sectors.map(({ category, count }) => ({
                      label: category.label,
                      value: count,
                    }))}
                    layout="vertical"
                    margin={{ left: 8, right: 12 }}
                  >
                    <CartesianGrid horizontal={false} strokeDasharray="3 3" />
                    <XAxis allowDecimals={false} type="number" />
                    <YAxis
                      dataKey="label"
                      fontSize={11}
                      interval={0}
                      tickLine={false}
                      type="category"
                      width={150}
                    />
                    <Tooltip content={<CountTooltip />} cursor={{ fill: 'var(--color-muted)' }} />
                    <Bar dataKey="value" fill="var(--color-chart-3)" radius={[0, 5, 5, 0]} />
                  </BarChart>
                </ResponsiveContainer>
                <AccessibleValues values={statisticsQuery.data.sectors} />
              </CardContent>
            </Card>
          </section>
        </div>
      )}
    </main>
  )
}
