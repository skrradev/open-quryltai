import { MapPinned } from 'lucide-react'
import { useTranslation } from 'react-i18next'

import { PartyLogo } from '@/entities/party'
import type { PartyGeographyStats } from '@/entities/statistics'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/shared/ui/card'
import { MetricExplainer } from '@/shared/ui/metric-explainer'

interface Props {
  data: PartyGeographyStats[]
}

export function PartyGeographyAnalytics({ data }: Props) {
  const { t } = useTranslation()
  if (data.length === 0) {
    return null
  }

  const maxPlaces = Math.max(...data.map((party) => party.distinctResidencePlaceCount))

  return (
    <section aria-labelledby="geography-analytics-heading" className="space-y-6">
      <div className="max-w-3xl">
        <div className="flex items-center gap-2 text-primary font-semibold text-sm tracking-wide uppercase">
          <MapPinned className="size-4" />
          <span>{t('analytics.geography.eyebrow')}</span>
        </div>
        <h2 className="mt-1 text-2xl font-semibold tracking-tight sm:text-3xl" id="geography-analytics-heading">
          {t('analytics.geography.title')}
        </h2>
        <p className="mt-2 text-sm text-muted-foreground sm:text-base">
          {t('analytics.geography.description')}
        </p>
      </div>

      <Card>
        <CardHeader>
          <CardTitle className="flex items-start justify-between gap-3 text-lg">
            <span>{t('analytics.geography.chartTitle')}</span>
            <MetricExplainer
              className="shrink-0"
              title={t('analytics.geography.guide.title')}
              summary={t('analytics.geography.guide.summary')}
              points={[
                t('analytics.geography.guide.p1'),
                t('analytics.geography.guide.p2'),
                t('analytics.geography.guide.p3'),
              ]}
              caveat={t('analytics.geography.guide.caveat')}
            />
          </CardTitle>
          <CardDescription>{t('analytics.geography.chartDescription')}</CardDescription>
        </CardHeader>
        <CardContent className="space-y-5">
          <div className="hidden grid-cols-[10rem_1fr_8rem] gap-6 text-xs font-medium text-muted-foreground sm:grid">
            <span />
            <span>{t('analytics.geography.metroShare')}</span>
            <span className="text-right">{t('analytics.geography.differentPlaces')}</span>
          </div>
          {data.map((party) => (
            <div className="grid gap-3 rounded-lg border p-3 sm:grid-cols-[10rem_1fr_8rem] sm:items-center sm:gap-6 sm:border-0 sm:p-0" key={party.partyId}>
              <div className="flex min-w-0 items-center gap-2 text-sm font-medium">
                <PartyLogo className="size-4 shrink-0" partyId={party.partyId} />
                <span className="truncate">{party.partyName}</span>
              </div>
              <div>
                <p className="mb-1 text-xs text-muted-foreground sm:hidden">{t('analytics.geography.metroShare')}</p>
                <div className="flex items-center gap-3">
                  <div className="h-3 flex-1 overflow-hidden rounded-sm bg-muted">
                    <div className="h-full rounded-sm bg-teal-600 dark:bg-teal-500" style={{ width: `${party.republicanCityPct}%` }} />
                  </div>
                  <span className="w-24 shrink-0 text-right text-xs tabular-nums text-muted-foreground">
                    {party.republicanCityPct}% · {party.republicanCityCount}/{party.totalCandidates}
                  </span>
                </div>
              </div>
              <div className="flex items-baseline justify-between gap-3 sm:block sm:text-right">
                <p className="text-xs text-muted-foreground sm:hidden">{t('analytics.geography.differentPlaces')}</p>
                <p className="text-lg font-semibold tabular-nums">
                  {party.distinctResidencePlaceCount}
                  <span className="ml-1 text-xs font-normal text-muted-foreground">/ {maxPlaces}</span>
                </p>
              </div>
            </div>
          ))}
        </CardContent>
      </Card>
    </section>
  )
}
