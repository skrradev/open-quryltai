export interface CodeLabel {
  code: string
  label: string
}

export interface ProgramTopic {
  topic: CodeLabel
  unitCount: number
  /**
   * False for codes that entered the codebook after the two-annotator pilot
   * (T15, T16). Their agreement was never measured, so the count is publishable
   * and the share is not.
   */
  pilotVerified: boolean
  /** Null exactly when `pilotVerified` is false — render the count, omit the bar. */
  share: number | null
}

export interface ProgramStatementType {
  statementType: CodeLabel
  unitCount: number
  share: number
}

export interface ProgramMeasurement {
  party: { id: string; name: string }
  unitsTotal: number
  /**
   * Substantive units — the divisor of every share. Shown beside the shares
   * because where the boundary between a statement and a heading falls is itself
   * an annotation decision, and it moves every number above it.
   */
  denominator: number
  codebookVersion: string
  topics: ProgramTopic[]
  statementTypes: ProgramStatementType[]
}

export interface ProgramComparison {
  parties: ProgramMeasurement[]
  topics: CodeLabel[]
  statementTypes: CodeLabel[]
  /** The API says so itself: these numbers are attention, not a ranking. */
  measuresAttention: boolean
}
