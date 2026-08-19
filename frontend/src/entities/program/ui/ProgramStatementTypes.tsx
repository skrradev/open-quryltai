import { useTranslation } from 'react-i18next'

import type { ProgramMeasurement } from '@/entities/program/model/program'
import {
  STATEMENT_TYPE_ORDER,
  statementTypeClass,
} from '@/entities/program/ui/program-scale'

interface Props {
  measurements: ProgramMeasurement[]
  /** Hide the party column when there is only one party to show. */
  showNames?: boolean
}

/**
 * How each party writes, as a part-to-whole bar.
 *
 * The same topic stated as a diagnosis, a desired state, a mechanism or a promise
 * is a different statement, and this difference separates the parties more
 * sharply than the topics do.
 */
export function ProgramStatementTypes({ measurements, showNames = true }: Props) {
  const { t } = useTranslation()

  const ordered = (measurement: ProgramMeasurement) =>
    STATEMENT_TYPE_ORDER.flatMap((code) => {
      const type = measurement.statementTypes.find(
        (candidate) => candidate.statementType.code === code,
      )
      return type && type.share > 0 ? [type] : []
    })

  const legend = STATEMENT_TYPE_ORDER.flatMap((code) => {
    const label = measurements
      .flatMap((measurement) => measurement.statementTypes)
      .find((type) => type.statementType.code === code)?.statementType.label
    return label ? [{ code, label }] : []
  })

  return (
    <div className="space-y-3">
      {measurements.map((measurement) => (
        <div className="flex items-center gap-3" key={measurement.party.id}>
          {showNames ? (
            <div className="w-32 shrink-0 text-sm">
              {measurement.party.name}
              <span className="block text-xs text-muted-foreground">
                n={measurement.denominator}
              </span>
            </div>
          ) : null}
          <div className="flex h-8 flex-1 gap-0.5 overflow-hidden rounded-sm">
            {ordered(measurement).map((type) => (
              <div
                className={`flex min-w-[3px] items-center justify-center text-[11px] font-semibold ${statementTypeClass(
                  type.statementType.code,
                )}`}
                key={type.statementType.code}
                style={{ flex: `${type.share} 0 0` }}
                title={t('program.types.segment', {
                  party: measurement.party.name,
                  type: type.statementType.label,
                  count: type.unitCount,
                  denominator: measurement.denominator,
                })}
              >
                {type.share >= 0.09 ? `${Math.round(type.share * 100)}%` : null}
              </div>
            ))}
          </div>
        </div>
      ))}

      <div
        className={`flex flex-wrap gap-x-4 gap-y-1 text-xs text-muted-foreground ${
          showNames ? 'sm:ml-35' : ''
        }`}
      >
        {legend.map((entry) => (
          <span className="inline-flex items-center gap-1.5" key={entry.code}>
            <i
              aria-hidden
              className={`inline-block h-3 w-3 rounded-sm ${statementTypeClass(entry.code)}`}
            />
            {entry.label}
          </span>
        ))}
      </div>
    </div>
  )
}
