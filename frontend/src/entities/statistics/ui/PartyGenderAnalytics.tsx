import {
  Users2,
  Scale,
  TrendingDown,
  Sparkles,
} from 'lucide-react'
import { useTranslation } from 'react-i18next'

import { MetricExplainer } from '@/shared/ui/metric-explainer'
import {
  Bar,
  BarChart,
  CartesianGrid,
  Legend,
  ResponsiveContainer,
  Tooltip,
  XAxis,
  YAxis,
} from 'recharts'

import { PartyLogo } from '@/entities/party'
import type { PartyGenderStats, PartyYouthStats } from '@/entities/statistics'
import { Badge } from '@/shared/ui/badge'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/shared/ui/card'

interface PartyGenderAnalyticsProps {
  data: PartyGenderStats[]
  /**
   * Youth figures, used as the control beneath the tiers chart. Without them the
   * claim that women sit lower is answerable with "every quota category does";
   * with them it is not, because youth is flat across the same bands.
   */
  youth?: PartyYouthStats[]
}


/**
 * Corpus-level share for a band, summed from counts rather than averaged from
 * percentages — the thirds differ in size between parties, so averaging their
 * percentages would weight a 33-name list like a 186-name one.
 */
function bandShare<T>(rows: T[], countKey: keyof T, sizeKey: keyof T): string {
  const count = rows.reduce((acc, row) => acc + Number(row[countKey] ?? 0), 0)
  const size = rows.reduce((acc, row) => acc + Number(row[sizeKey] ?? 0), 0)
  return size > 0 ? ((count / size) * 100).toFixed(1) : '0.0'
}

export function PartyGenderAnalytics({ data, youth }: PartyGenderAnalyticsProps) {
  const { t } = useTranslation()

  if (!data || data.length === 0) {
    return null
  }

  // 1. Chart 1 Data: Glass Ceiling (Overall % vs Top-10 %)
  const glassCeilingData = data.map((party) => ({
    partyId: party.partyId,
    name: party.partyName,
    overallPct: party.womenPct,
    top10Pct: party.womenTop10Pct,
    diff: Number((party.womenTop10Pct - party.womenPct).toFixed(1)),
  }))

  // 2. Chart 2 Data: Distribution across 3 list tiers (Top, Mid, Tail)
  const tiersData = data.map((party) => ({
    partyId: party.partyId,
    name: party.partyName,
    topThird: party.womenTopThirdPct,
    midThird: party.womenMidThirdPct,
    tailThird: party.womenTailThirdPct,
  }))

  // Aggregate totals
  const totalCandidates = data.reduce((acc, p) => acc + p.totalCandidates, 0)
  const totalWomen = data.reduce((acc, p) => acc + p.womenTotal, 0)
  const totalWomenPct = Number(((totalWomen / totalCandidates) * 100).toFixed(1))

  const totalTop10Women = data.reduce((acc, p) => acc + p.womenTop10, 0)
  const totalTop10Seats = data.reduce((acc, p) => acc + Math.min(10, p.totalCandidates), 0)
  const totalTop10Pct = Number(((totalTop10Women / totalTop10Seats) * 100).toFixed(1))

  // Position expressed as a share of the list, never as a raw number. Average
  // position 104 in a 186-name list and 13 in a 33-name list are not comparable
  // quantities, and the two sat side by side as if they were.
  const listShare = (order: number, total: number) =>
    total > 0 ? Number(((order / total) * 100).toFixed(1)) : 0
  const gapShare = (party: (typeof data)[number]) =>
    listShare(party.avgOrderWomen, party.totalCandidates) -
    listShare(party.avgOrderMen, party.totalCandidates)

  // Both leader cards were hardcoded — one of them named the wrong party. They are
  // computed now, so they cannot drift away from the data they claim to describe.
  const bestParity = [...data].sort(
    (a, b) => Math.abs(a.womenTop10Pct - a.womenPct) - Math.abs(b.womenTop10Pct - b.womenPct),
  )[0]
  const largestDisparity = [...data].sort((a, b) => gapShare(b) - gapShare(a))[0]

  return (
    <div className="space-y-8">
      {/* Section Header */}
      <div className="max-w-3xl">
        <div className="flex items-center gap-2 text-primary font-semibold text-sm tracking-wide uppercase">
          <Scale className="h-4 w-4" />
          <span>{t('analytics.gender.eyebrow')}</span>
        </div>
        <h2 className="mt-1 text-2xl font-bold tracking-tight sm:text-3xl">
          {t('analytics.gender.title')}
        </h2>
        <p className="mt-2 text-muted-foreground text-sm sm:text-base">
          {t('analytics.gender.description')}
        </p>
        <p className="mt-3 text-xs text-muted-foreground">
          {t('analytics.gender.lawNote')}
        </p>
      </div>

      {/* KPI Cards */}
      <div className="grid grid-cols-2 gap-4 lg:grid-cols-4">
        <Card className="bg-muted/40">
          <CardContent className="p-4 sm:p-5">
            <div className="text-xs font-medium text-muted-foreground">
              {t('analytics.gender.kpi.totalWomen')}
            </div>
            <div className="mt-2 flex items-baseline gap-2">
              <span className="text-2xl sm:text-3xl font-bold text-foreground">{totalWomenPct}%</span>
              <span className="text-xs text-muted-foreground">({totalWomen} / {totalCandidates})</span>
            </div>
          </CardContent>
        </Card>

        <Card className="bg-muted/40">
          <CardContent className="p-4 sm:p-5">
            <div className="text-xs font-medium text-muted-foreground">
              {t('analytics.gender.kpi.top10Women')}
            </div>
            <div className="mt-2 flex items-baseline gap-2">
              <span className="text-2xl sm:text-3xl font-bold text-foreground">{totalTop10Pct}%</span>
              <span className="text-xs text-muted-foreground">({totalTop10Women} / {totalTop10Seats})</span>
            </div>
          </CardContent>
        </Card>

        <Card className="bg-muted/40">
          <CardContent className="p-4 sm:p-5">
            <div className="text-xs font-medium text-muted-foreground">
              {t('analytics.gender.kpi.bestParity')}
            </div>
            <div className="mt-2 flex items-center gap-2">
              <PartyLogo partyId={bestParity.partyId} className="h-5 w-5" />
              <span className="text-lg sm:text-xl font-bold">{bestParity.partyName}</span>
            </div>
            <div className="mt-1 text-[11px] text-muted-foreground">
              {t('analytics.gender.kpi.parityNote', {
                partyPct: bestParity.womenPct,
                top10Pct: bestParity.womenTop10Pct,
              })}
            </div>
          </CardContent>
        </Card>

        <Card className="bg-muted/40">
          <CardContent className="p-4 sm:p-5">
            <div className="text-xs font-medium text-muted-foreground">
              {t('analytics.gender.kpi.largestDisparity')}
            </div>
            <div className="mt-2 flex items-center gap-2">
              <PartyLogo partyId={largestDisparity.partyId} className="h-5 w-5" />
              <span className="text-lg sm:text-xl font-bold">{largestDisparity.partyName}</span>
            </div>
            <div className="mt-1 text-[11px] text-muted-foreground flex items-center gap-1">
              <TrendingDown className="h-3 w-3" />
              <span>
                {t('analytics.gender.kpi.disparityNote', {
                  gap: gapShare(largestDisparity).toFixed(1),
                })}
              </span>
            </div>
          </CardContent>
        </Card>
      </div>

      {/* Grid: 2 Charts */}
      <div className="grid gap-6 lg:grid-cols-2">
        {/* Chart 1: Glass Ceiling (Overall vs Top 10) */}
        <Card className="flex flex-col">
          <CardHeader>
            <CardTitle className="text-lg flex items-start justify-between gap-2">
              <span>{t('analytics.gender.ceilingTitle')}</span>
              <MetricExplainer
                className="shrink-0"
                title={t('analytics.gender.ceilingGuide.title')}
                summary={t('analytics.gender.ceilingGuide.summary')}
                points={[
                  t('analytics.gender.ceilingGuide.p1'),
                  t('analytics.gender.ceilingGuide.p2'),
                  t('analytics.gender.ceilingGuide.p3'),
                  t('analytics.gender.ceilingGuide.p4'),
                ]}
                caveat={t('analytics.gender.ceilingGuide.caveat')}
              />
            </CardTitle>
            <CardDescription>
              {t('analytics.gender.ceilingDesc')}
            </CardDescription>
          </CardHeader>
          <CardContent className="flex-1 pb-4">
            <div className="h-80 w-full">
              <ResponsiveContainer width="100%" height="100%">
                <BarChart
                  data={glassCeilingData}
                  margin={{ top: 15, right: 10, left: 0, bottom: 45 }}
                >
                  <CartesianGrid strokeDasharray="3 3" vertical={false} opacity={0.3} />
                  <XAxis
                    dataKey="name"
                    tick={{ fontSize: 11 }}
                    interval={0}
                    angle={-20}
                    textAnchor="end"
                    height={50}
                  />
                  <YAxis unit="%" domain={[0, 50]} tick={{ fontSize: 11 }} />
                  <Tooltip
                    formatter={(value, name) => {
                      if (name === 'overallPct') return [`${value}%`, t('analytics.gender.legend.overall')]
                      return [`${value}%`, t('analytics.gender.legend.top10')]
                    }}
                    contentStyle={{
                      backgroundColor: 'var(--card)',
                      borderColor: 'var(--border)',
                      borderRadius: '0.5rem',
                      fontSize: '0.85rem',
                    }}
                  />
                  <Legend
                    verticalAlign="top"
                    align="right"
                    formatter={(value) => {
                      if (value === 'overallPct') return t('analytics.gender.legend.overall')
                      return t('analytics.gender.legend.top10')
                    }}
                  />
                  <Bar
                    dataKey="overallPct"
                    name="overallPct"
                    fill="#3b82f6"
                    radius={[4, 4, 0, 0]}
                  />
                  <Bar
                    dataKey="top10Pct"
                    name="top10Pct"
                    fill="#ec4899"
                    radius={[4, 4, 0, 0]}
                  />
                </BarChart>
              </ResponsiveContainer>
            </div>
          </CardContent>
        </Card>

        {/* Chart 2: Distribution by 3 List Tiers */}
        <Card className="flex flex-col">
          <CardHeader>
            <CardTitle className="text-lg">
              {t('analytics.gender.tiersTitle')}
            </CardTitle>
            <CardDescription>
              {t('analytics.gender.tiersDesc')}
            </CardDescription>
          </CardHeader>
          <CardContent className="flex-1 pb-4">
            <div className="h-80 w-full">
              <ResponsiveContainer width="100%" height="100%">
                <BarChart
                  data={tiersData}
                  margin={{ top: 15, right: 10, left: 0, bottom: 45 }}
                >
                  <CartesianGrid strokeDasharray="3 3" vertical={false} opacity={0.3} />
                  <XAxis
                    dataKey="name"
                    tick={{ fontSize: 11 }}
                    interval={0}
                    angle={-20}
                    textAnchor="end"
                    height={50}
                  />
                  <YAxis unit="%" domain={[0, 60]} tick={{ fontSize: 11 }} />
                  <Tooltip
                    formatter={(value, name) => {
                      if (name === 'topThird') return [`${value}%`, t('analytics.gender.legend.topThird')]
                      if (name === 'midThird') return [`${value}%`, t('analytics.gender.legend.midThird')]
                      return [`${value}%`, t('analytics.gender.legend.tailThird')]
                    }}
                    contentStyle={{
                      backgroundColor: 'var(--card)',
                      borderColor: 'var(--border)',
                      borderRadius: '0.5rem',
                      fontSize: '0.85rem',
                    }}
                  />
                  <Legend
                    verticalAlign="top"
                    align="right"
                    formatter={(value) => {
                      if (value === 'topThird') return t('analytics.gender.legend.topThird')
                      if (value === 'midThird') return t('analytics.gender.legend.midThird')
                      return t('analytics.gender.legend.tailThird')
                    }}
                  />
                  <Bar dataKey="topThird" name="topThird" fill="#10b981" radius={[4, 4, 0, 0]} />
                  <Bar dataKey="midThird" name="midThird" fill="#f59e0b" radius={[4, 4, 0, 0]} />
                  <Bar dataKey="tailThird" name="tailThird" fill="#ef4444" radius={[4, 4, 0, 0]} />
                </BarChart>
              </ResponsiveContainer>
            </div>

            {youth && youth.length > 0 ? (
              <div className="mt-4 space-y-1.5 rounded-md border bg-muted/40 p-3 text-xs">
                <p className="font-medium text-foreground">
                  {t('analytics.gender.control.title')}
                </p>
                <p className="text-muted-foreground">
                  {t('analytics.gender.control.women', {
                    top: bandShare(data, 'womenTopThird', 'topThirdSize'),
                    mid: bandShare(data, 'womenMidThird', 'midThirdSize'),
                    tail: bandShare(data, 'womenTailThird', 'tailThirdSize'),
                  })}
                </p>
                <p className="text-muted-foreground">
                  {t('analytics.gender.control.youth', {
                    top: bandShare(youth, 'youthTopThird', 'topThirdSize'),
                    mid: bandShare(youth, 'youthMidThird', 'midThirdSize'),
                    tail: bandShare(youth, 'youthTailThird', 'tailThirdSize'),
                  })}
                </p>
                <p className="text-muted-foreground">
                  {t('analytics.gender.control.reading')}
                </p>
              </div>
            ) : null}
          </CardContent>
        </Card>
      </div>

      {/* Feature 3: Average Ballot Position & First Woman on List */}
      <Card className="border shadow-sm">
        <CardHeader className="bg-muted/30 border-b">
          <CardTitle className="text-lg flex items-center justify-between">
            <span className="flex items-center gap-2">
              <Users2 className="h-5 w-5 text-primary" />
              <span>{t('analytics.gender.avgOrderTitle')}</span>
            </span>
          </CardTitle>
          <CardDescription>
            {t('analytics.gender.avgOrderDesc')}
          </CardDescription>
        </CardHeader>
        <CardContent className="p-6">
          <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
            {data.map((party) => {
              // Compared as shares of the list, not as raw positions: +18 places
              // in a 186-name list is a smaller gap than +13 in a 69-name one, and
              // ranking by the raw number reversed the order of the two.
              const womenShare = listShare(party.avgOrderWomen, party.totalCandidates)
              const menShare = listShare(party.avgOrderMen, party.totalCandidates)
              const disparity = Number((womenShare - menShare).toFixed(1))
              const isWomenFurther = disparity > 3
              const isBalanced = Math.abs(disparity) <= 3
              const isWomenEarlier = disparity < -3

              return (
                <div
                  key={party.partyId}
                  className="flex flex-col justify-between rounded-xl border bg-card p-4 transition-all duration-150 hover:border-primary/40 hover:shadow-sm"
                >
                  <div>
                    {/* Party Name & First Woman Badge */}
                    <div className="flex items-center justify-between gap-2 mb-3">
                      <div className="flex items-center gap-2">
                        <PartyLogo partyId={party.partyId} className="h-5 w-5" />
                        <span className="font-semibold text-sm truncate">{party.partyName}</span>
                      </div>
                      <Badge variant="secondary" className="text-[10px] shrink-0 font-medium">
                        {t('analytics.gender.firstWomanBadge', { rank: party.firstWomanRank })}
                      </Badge>
                    </div>

                    {/* Progress bars comparing Average List Order */}
                    <div className="space-y-2 text-xs">
                      <div>
                        <div className="flex justify-between text-muted-foreground mb-1">
                          <span>{t('analytics.gender.womenAvgLabel')}</span>
                          <span className="font-semibold text-foreground">
                            {t('analytics.gender.positionOfList', { pct: womenShare })}
                          </span>
                        </div>
                        <div className="h-2 w-full bg-muted rounded-full overflow-hidden">
                          <div
                            className="h-full bg-pink-500 rounded-full"
                            style={{ width: `${Math.min(100, womenShare)}%` }}
                          />
                        </div>
                      </div>

                      <div>
                        <div className="flex justify-between text-muted-foreground mb-1">
                          <span>{t('analytics.gender.menAvgLabel')}</span>
                          <span className="font-semibold text-foreground">
                            {t('analytics.gender.positionOfList', { pct: menShare })}
                          </span>
                        </div>
                        <div className="h-2 w-full bg-muted rounded-full overflow-hidden">
                          <div
                            className="h-full bg-blue-500 rounded-full"
                            style={{ width: `${Math.min(100, menShare)}%` }}
                          />
                        </div>
                      </div>
                    </div>
                  </div>

                  {/* Summary Footer Pill */}
                  <div className="mt-4 pt-3 border-t text-[11px] flex items-center justify-between">
                    <span className="text-muted-foreground">{t('analytics.gender.balanceLabel')}</span>
                    {isBalanced && (
                      <span className="text-emerald-600 dark:text-emerald-400 font-semibold flex items-center gap-1">
                        <Sparkles className="h-3 w-3" /> {t('analytics.gender.balanced')}
                      </span>
                    )}
                    {isWomenFurther && (
                      <span className="text-rose-600 dark:text-rose-400 font-semibold">
                        {t('analytics.gender.womenFurther', { gap: disparity })}
                      </span>
                    )}
                    {isWomenEarlier && (
                      <span className="text-primary font-semibold">
                        {t('analytics.gender.womenEarlier', { gap: Math.abs(disparity) })}
                      </span>
                    )}
                  </div>
                </div>
              )
            })}
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
