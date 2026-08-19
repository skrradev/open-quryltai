/**
 * The topic matrix compares magnitudes across a grid, so it uses one sequential
 * hue rather than a colour per topic: seventeen topics would demand seventeen
 * hues, and no palette survives that.
 *
 * The steps themselves live in index.css as `.program-ramp-N`, with a `.dark`
 * override, because this app switches themes by class — a colour chosen in
 * JavaScript would not follow the switch. Label ink was validated per step rather
 * than eyeballed, and its flip point inverts between the light and dark ramps.
 */
export const RAMP_STEPS = 7

/**
 * Below this many statements the cell shows its count instead of a share.
 *
 * The handoff records the same principle from the earlier party metrics: never
 * print a proportion computed off a tiny numerator. The threshold differs from
 * that one (n < 10) because the failure mode differs — there a nine-person band
 * produced 89% off a tiny base; here the base is the whole programme, so the
 * share is stable and the risk is over-reading instead. One or two statements is
 * a segmentation decision, not a party's attention; five is a thread.
 */
export const MIN_UNITS_FOR_SHARE = 5

export function rampClass(share: number, max: number): string {
  if (share <= 0 || max <= 0) {
    return 'program-ramp-0'
  }
  const index = Math.min(
    RAMP_STEPS - 1,
    1 + Math.floor((share / max) * (RAMP_STEPS - 1.001)),
  )
  return `program-ramp-${index}`
}

/** Categorical slots 1–6, validated in both modes for the adjacent pairlist. */
export const STATEMENT_TYPE_ORDER = [
  'PROBLEM',
  'GOAL',
  'INSTRUMENT',
  'COMMITMENT',
  'ACHIEVEMENT',
  'DESCRIPTION',
] as const

export function statementTypeClass(code: string): string {
  return `program-type-${code.toLowerCase()}`
}
