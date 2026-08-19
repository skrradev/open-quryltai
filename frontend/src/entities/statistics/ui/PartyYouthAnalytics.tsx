import { useTranslation } from 'react-i18next'

import type { PartyYouthStats } from '@/entities/statistics/model/statistics'
import { PartyLogo } from '@/entities/party/ui/PartyLogo'
import { Card, CardContent, CardHeader, CardTitle } from '@/shared/ui/card'
import { MetricExplainer } from '@/shared/ui/metric-explainer'

interface Props {
  data: PartyYouthStats[]
}

/**
 * Young candidates and where parties place them.
 *
 * The honest headline here is a null result — youth sits evenly across the list,
 * unlike women — so the section carries its substance in the counts: how many
 * each party fields, and how far down the first one appears.
 */
export function PartyYouthAnalytics({ data }: Props) {
  const { t } = useTranslation()
  if (data.length === 0) {
    return null
  }

  const totalCandidates = data.reduce((acc, p) => acc + p.totalCandidates, 0)
  const totalYouth = data.reduce((acc, p) => acc + p.youthTotal, 0)
  const totalTop10 = data.reduce((acc, p) => acc + p.youthTop10, 0)
  const totalTop10Seats = data.reduce((acc, p) => acc + p.top10Size, 0)
  const partiesWithoutYouthInTop10 = data.filter((p) => p.youthTop10 === 0).length

  const byShare = [...data].sort((a, b) => b.youthPct - a.youthPct)
  const maxShare = Math.max(...byShare.map((p) => p.youthPct))

  return (
    <div className="space-y-6">
      <div className="max-w-3xl">
        <h2 className="text-2xl font-semibold tracking-tight sm:text-3xl">
          {t('analytics.youth.title')}
        </h2>
        <p className="mt-2 text-sm text-muted-foreground sm:text-base">
          {t('analytics.youth.description')}
        </p>
      </div>

      <div className="grid grid-cols-2 gap-4 lg:grid-cols-3">
        <Card className="bg-muted/40">
          <CardContent className="p-4 sm:p-5">
            <div className="text-xs font-medium text-muted-foreground">
              {t('analytics.youth.kpi.share')}
            </div>
            <div className="mt-2 flex items-baseline gap-2">
              <span className="text-2xl font-bold sm:text-3xl">
                {((totalYouth / totalCandidates) * 100).toFixed(1)}%
              </span>
              <span className="text-xs text-muted-foreground">
                ({totalYouth} / {totalCandidates})
              </span>
            </div>
          </CardContent>
        </Card>

        <Card className="bg-muted/40">
          <CardContent className="p-4 sm:p-5">
            <div className="text-xs font-medium text-muted-foreground">
              {t('analytics.youth.kpi.inTop10')}
            </div>
            <div className="mt-2 flex items-baseline gap-2">
              <span className="text-2xl font-bold sm:text-3xl">{totalTop10}</span>
              <span className="text-xs text-muted-foreground">
                {t('analytics.youth.kpi.ofSeats', { seats: totalTop10Seats })}
              </span>
            </div>
          </CardContent>
        </Card>

        <Card className="bg-muted/40">
          <CardContent className="p-4 sm:p-5">
            <div className="text-xs font-medium text-muted-foreground">
              {t('analytics.youth.kpi.partiesWithNone')}
            </div>
            <div className="mt-2 flex items-baseline gap-2">
              <span className="text-2xl font-bold sm:text-3xl">
                {partiesWithoutYouthInTop10}
              </span>
              <span className="text-xs text-muted-foreground">
                {t('analytics.youth.kpi.ofParties', { parties: data.length })}
              </span>
            </div>
          </CardContent>
        </Card>
      </div>

      <Card>
        <CardHeader>
          <CardTitle className="flex items-start justify-between gap-2 text-lg">
            <span>{t('analytics.youth.byPartyTitle')}</span>
            <MetricExplainer
              className="shrink-0"
              title={t('analytics.youth.guide.title')}
              summary={t('analytics.youth.guide.summary')}
              points={[
                t('analytics.youth.guide.p1'),
                t('analytics.youth.guide.p2'),
                t('analytics.youth.guide.p3'),
              ]}
              caveat={t('analytics.youth.guide.caveat')}
            />
          </CardTitle>
        </CardHeader>
        <CardContent className="space-y-3">
          {byShare.map((party) => (
            <div className="flex items-center gap-3" key={party.partyId}>
              <div className="flex w-32 shrink-0 items-center gap-2 text-sm">
                <PartyLogo className="h-4 w-4" partyId={party.partyId} />
                <span className="truncate">{party.partyName}</span>
              </div>
              <div className="flex flex-1 items-center gap-3">
                <div className="h-4 flex-1 overflow-hidden rounded-sm bg-muted">
                  <div
                    className="h-full rounded-sm bg-sky-600 dark:bg-sky-500"
                    style={{ width: `${(party.youthPct / maxShare) * 100}%` }}
                  />
                </div>
                {/* The count is not decoration: four candidates and twenty-four
                    produce comparable percentages off very different evidence. */}
                <span className="w-28 shrink-0 text-xs tabular-nums text-muted-foreground">
                  {party.youthPct}% · {party.youthTotal}/{party.totalCandidates}
                </span>
                <span className="w-32 shrink-0 text-xs text-muted-foreground">
                  {party.firstYouthRank > 0
                    ? t('analytics.youth.firstAt', { rank: party.firstYouthRank })
                    : t('analytics.youth.none')}
                </span>
              </div>
            </div>
          ))}
        </CardContent>
      </Card>
    </div>
  )
}
