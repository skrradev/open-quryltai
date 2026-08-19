import { useTranslation } from 'react-i18next'
import { Link } from 'react-router'

import type { ProgramComparison } from '@/entities/program/model/program'
import {
  MIN_UNITS_FOR_SHARE,
  RAMP_STEPS,
  rampClass,
} from '@/entities/program/ui/program-scale'
import { PARTY_BRANDING } from '@/entities/party'
import type { Language } from '@/shared/config/language'

interface Props {
  comparison: ProgramComparison
  language: Language
}

/**
 * Every party's topic profile side by side.
 *
 * A heatmap rather than a radar: this is a grid of magnitudes, and a radar over
 * seventeen topics and seven parties is a web nobody can read.
 */
export function ProgramTopicMatrix({ comparison, language }: Props) {
  const { t } = useTranslation()
  const { parties, topics } = comparison

  const shareOf = (partyId: string, topicCode: string) =>
    parties
      .find((party) => party.party.id === partyId)
      ?.topics.find((topic) => topic.topic.code === topicCode)

  // Topics ordered by their weight across the whole corpus, so the eye reads the
  // rows top-down by how much of the campaign they actually occupy.
  const weight = (topicCode: string) =>
    parties.reduce(
      (total, party) =>
        total +
        (party.topics.find((topic) => topic.topic.code === topicCode)?.unitCount ?? 0),
      0,
    )
  const orderedTopics = [...topics].sort((a, b) => weight(b.code) - weight(a.code))

  // Only explain the marker when one is actually on screen.
  const hasCountOnly = parties.some((party) =>
    party.topics.some(
      (topic) =>
        !topic.pilotVerified ||
        (topic.unitCount > 0 && topic.unitCount < MIN_UNITS_FOR_SHARE),
    ),
  )

  const max = Math.max(
    ...parties.flatMap((party) =>
      party.topics.map((topic) => topic.share ?? 0),
    ),
  )

  return (
    <div className="space-y-3">
      <div className="overflow-x-auto">
        <table className="w-full border-collapse text-sm">
          <caption className="sr-only">{t('program.matrix.caption')}</caption>
          <thead>
            <tr>
              <th
                className="border-b p-2 text-left text-xs font-semibold text-muted-foreground"
                scope="col"
              >
                {t('program.matrix.topic')}
              </th>
              {parties.map((party) => (
                <th
                  className="border-b p-2 text-left text-xs font-semibold text-muted-foreground"
                  key={party.party.id}
                  scope="col"
                >
                  <Link
                    className="flex items-center gap-1.5 max-w-28 hover:underline"
                    to={`/${language}/parties/${party.party.id}`}
                  >
                    <span
                      className="size-2 rounded-full shrink-0 inline-block"
                      style={{
                        backgroundColor:
                          PARTY_BRANDING[party.party.id]?.brandColor ?? 'currentColor',
                      }}
                    />
                    <span className="truncate">{party.party.name}</span>
                  </Link>
                  <span
                    className="block font-normal cursor-help hover:text-foreground transition-colors"
                    title={t('program.matrix.denominatorTooltip', { count: party.denominator })}
                  >
                    n={party.denominator}
                  </span>
                </th>
              ))}
            </tr>
          </thead>
          <tbody>
            {orderedTopics.map((topic) => (
              <tr key={topic.code}>
                <th
                  className="p-2 text-left font-medium whitespace-nowrap"
                  scope="row"
                >
                  {topic.label}
                </th>
                {parties.map((party) => {
                  const cell = shareOf(party.party.id, topic.code)
                  // A missing row means the party has no units on this topic — a
                  // plain zero. Only a row that exists AND failed the pilot has an
                  // unpublishable share; conflating the two would print an asterisk
                  // on an ordinary zero and claim it was unmeasurable.
                  // A share is printed only when it rests on enough statements to
                  // survive a different phrasing. Below that the count is the honest
                  // figure: one sentence segmented differently moves 0.4% to 0.2%.
                  const tooFewUnits =
                    cell !== undefined &&
                    cell.unitCount > 0 &&
                    cell.unitCount < MIN_UNITS_FOR_SHARE
                  const countOnly =
                    (cell !== undefined && !cell.pilotVerified) || tooFewUnits
                  const share = cell?.share ?? 0
                  const count = cell?.unitCount ?? 0
                  return (
                    <td
                      className={`rounded-sm border-2 border-background p-2 text-center tabular-nums ${rampClass(
                        countOnly ? 0 : share,
                        max,
                      )}`}
                      key={party.party.id}
                      title={t('program.matrix.cell', {
                        party: party.party.name,
                        topic: topic.label,
                        count,
                        denominator: party.denominator,
                      })}
                    >
                      {countOnly ? (
                        <span>
                          {count}
                          <span aria-hidden>*</span>
                        </span>
                      ) : (
                        (share * 100).toFixed(1)
                      )}
                    </td>
                  )
                })}
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      <div className="flex items-center gap-2 text-xs text-muted-foreground">
        <span>0</span>
        {Array.from({ length: RAMP_STEPS }, (_, step) => (
          <i
            aria-hidden
            className={`inline-block h-3 w-6 rounded-sm program-ramp-${step}`}
            key={step}
          />
        ))}
        <span>{t('program.matrix.scaleMax', { max: (max * 100).toFixed(0) })}</span>
      </div>

      {/* The asterisk is meaningless without this line: it marks a count shown
          without a share, not a small number. */}
      {hasCountOnly ? (
        <p className="text-xs text-muted-foreground">{t('program.matrix.unpiloted')}</p>
      ) : null}
    </div>
  )
}
