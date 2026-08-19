import { BriefcaseBusiness } from 'lucide-react'
import { useTranslation } from 'react-i18next'

import { PartyLogo } from '@/entities/party'
import type { PartyCadreStats } from '@/entities/statistics'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/shared/ui/card'
import { MetricExplainer } from '@/shared/ui/metric-explainer'

interface Props {
  data: PartyCadreStats[]
}

export function PartyCadreAnalytics({ data }: Props) {
  const { t } = useTranslation()
  if (data.length === 0) {
    return null
  }

  const stateLeader = [...data].sort((a, b) => b.stateOrQuasiPct - a.stateOrQuasiPct)[0]
  const partyLeader = [...data].sort((a, b) => b.partyApparatusPct - a.partyApparatusPct)[0]

  return (
    <section aria-labelledby="cadre-analytics-heading" className="space-y-6">
      <div className="max-w-3xl">
        <div className="flex items-center gap-2 text-primary font-semibold text-sm tracking-wide uppercase">
          <BriefcaseBusiness className="size-4" />
          <span>{t('analytics.cadre.eyebrow')}</span>
        </div>
        <h2 className="mt-1 text-2xl font-semibold tracking-tight sm:text-3xl" id="cadre-analytics-heading">
          {t('analytics.cadre.title')}
        </h2>
        <p className="mt-2 text-sm text-muted-foreground sm:text-base">
          {t('analytics.cadre.description')}
        </p>
      </div>

      <div className="grid gap-4 sm:grid-cols-2">
        <Card className="bg-muted/40">
          <CardContent className="p-4 sm:p-5">
            <p className="text-xs font-medium text-muted-foreground">
              {t('analytics.cadre.kpi.stateLeader')}
            </p>
            <div className="mt-2 flex items-center gap-2">
              <PartyLogo className="size-5" partyId={stateLeader.partyId} />
              <span className="text-lg font-bold">{stateLeader.partyName}</span>
              <span className="text-lg font-bold text-primary">{stateLeader.stateOrQuasiPct}%</span>
            </div>
          </CardContent>
        </Card>
        <Card className="bg-muted/40">
          <CardContent className="p-4 sm:p-5">
            <p className="text-xs font-medium text-muted-foreground">
              {t('analytics.cadre.kpi.apparatusLeader')}
            </p>
            <div className="mt-2 flex items-center gap-2">
              <PartyLogo className="size-5" partyId={partyLeader.partyId} />
              <span className="text-lg font-bold">{partyLeader.partyName}</span>
              <span className="text-lg font-bold text-primary">{partyLeader.partyApparatusPct}%</span>
            </div>
          </CardContent>
        </Card>
      </div>

      <Card>
        <CardHeader>
          <CardTitle className="flex items-start justify-between gap-3 text-lg">
            <span>{t('analytics.cadre.chartTitle')}</span>
            <MetricExplainer
              className="shrink-0"
              title={t('analytics.cadre.guide.title')}
              summary={t('analytics.cadre.guide.summary')}
              points={[
                t('analytics.cadre.guide.p1'),
                t('analytics.cadre.guide.p2'),
                t('analytics.cadre.guide.p3'),
              ]}
              caveat={t('analytics.cadre.guide.caveat')}
            />
          </CardTitle>
          <CardDescription>{t('analytics.cadre.chartDescription')}</CardDescription>
        </CardHeader>
        <CardContent className="space-y-5">
          <div className="grid gap-2 text-xs font-medium text-muted-foreground sm:grid-cols-[10rem_1fr_1fr] sm:gap-6">
            <span className="hidden sm:block" />
            <span>{t('analytics.cadre.stateOrQuasi')}</span>
            <span>{t('analytics.cadre.partyApparatus')}</span>
          </div>
          {data.map((party) => (
            <div className="grid gap-3 sm:grid-cols-[10rem_1fr_1fr] sm:gap-6" key={party.partyId}>
              <div className="flex min-w-0 items-center gap-2 text-sm font-medium">
                <PartyLogo className="size-4 shrink-0" partyId={party.partyId} />
                <span className="truncate">{party.partyName}</span>
              </div>
              <MetricBar
                count={party.stateOrQuasiCount}
                percentage={party.stateOrQuasiPct}
                total={party.totalCandidates}
                tone="bg-sky-600 dark:bg-sky-500"
              />
              <MetricBar
                count={party.partyApparatusCount}
                percentage={party.partyApparatusPct}
                total={party.totalCandidates}
                tone="bg-violet-600 dark:bg-violet-500"
              />
            </div>
          ))}
        </CardContent>
      </Card>
    </section>
  )
}

function MetricBar({
  count,
  percentage,
  total,
  tone,
}: {
  count: number
  percentage: number
  total: number
  tone: string
}) {
  return (
    <div className="flex items-center gap-3">
      <div className="h-3 flex-1 overflow-hidden rounded-sm bg-muted">
        <div className={`h-full rounded-sm ${tone}`} style={{ width: `${percentage}%` }} />
      </div>
      <span className="w-24 shrink-0 text-right text-xs tabular-nums text-muted-foreground">
        {percentage}% · {count}/{total}
      </span>
    </div>
  )
}
