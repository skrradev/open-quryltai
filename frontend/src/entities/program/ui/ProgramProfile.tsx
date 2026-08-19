import { useTranslation } from 'react-i18next'

import type { ProgramMeasurement } from '@/entities/program/model/program'
import { ProgramStatementTypes } from '@/entities/program/ui/ProgramStatementTypes'
import { MIN_UNITS_FOR_SHARE, rampClass } from '@/entities/program/ui/program-scale'

interface Props {
  measurement: ProgramMeasurement
}

/** One party's own programme profile — no other party appears here. */
export function ProgramProfile({ measurement }: Props) {
  const { t } = useTranslation()

  const topics = [...measurement.topics].sort((a, b) => b.unitCount - a.unitCount)
  const max = Math.max(...topics.map((topic) => topic.share ?? 0))

  return (
    <div className="space-y-6">
      <div className="space-y-1.5">
        {topics.map((topic) => {
          const countOnly =
            topic.share === null ||
            (topic.unitCount > 0 && topic.unitCount < MIN_UNITS_FOR_SHARE)
          return (
          <div className="flex items-center gap-3" key={topic.topic.code}>
            <div
              className="w-48 shrink-0 text-sm leading-snug break-words"
              title={topic.topic.label}
            >
              {topic.topic.label}
            </div>
            <div className="flex flex-1 items-center gap-2 min-w-0">
              <div
                className={`h-5 rounded-sm shrink-0 ${rampClass(topic.share ?? 0, max)}`}
                style={{
                  width: countOnly || topic.share === null ? 0 : `${(topic.share / max) * 100}%`,
                  minWidth: countOnly ? 0 : 3,
                }}
              />
              <span className="text-xs tabular-nums text-muted-foreground shrink-0 whitespace-nowrap">
                {countOnly || topic.share === null
                  ? t('program.profile.countOnly', { count: topic.unitCount })
                  : `${(topic.share * 100).toFixed(1)}% · ${topic.unitCount}`}
              </span>
            </div>
            </div>
          )
        })}
      </div>

      <div className="space-y-2">
        <h3 className="text-sm font-semibold">{t('program.types.title')}</h3>
        <ProgramStatementTypes measurements={[measurement]} showNames={false} />
      </div>

      <p className="text-xs text-muted-foreground">
        {t('program.profile.denominator', {
          denominator: measurement.denominator,
          total: measurement.unitsTotal,
        })}
      </p>
    </div>
  )
}
