import type { Party } from '@/entities/party'

export interface StatisticsCategory {
  category: {
    code: string
    label: string
  }
  count: number
}

export interface StatisticsParty {
  party: Party
  count: number
}

export interface StatisticsSummary {
  totalCandidates: number
  totalParties: number
  averageAge: number
  incumbentCount: number
}

export interface Statistics {
  summary: StatisticsSummary
  parties: StatisticsParty[]
  genders: StatisticsCategory[]
  ageGroups: StatisticsCategory[]
  sectors: StatisticsCategory[]
}

export interface PartyGenderStats {
  partyId: string
  partyName: string
  totalCandidates: number
  womenTotal: number
  womenPct: number
  womenTop10: number
  womenTop10Pct: number
  womenTopThirdPct: number
  womenMidThirdPct: number
  womenTailThirdPct: number
  womenTopThird: number
  topThirdSize: number
  womenMidThird: number
  midThirdSize: number
  womenTailThird: number
  tailThirdSize: number
  avgOrderWomen: number
  avgOrderMen: number
  firstWomanRank: number
}


/**
 * Young candidates on a party list.
 *
 * Counts accompany every share because the numbers are small: parties field
 * between four and twenty-four candidates under 35, so a third of a list can be
 * three people.
 */
export interface PartyYouthStats {
  partyId: string
  partyName: string
  totalCandidates: number
  youthTotal: number
  youthPct: number
  youthTop10: number
  top10Size: number
  youthTopThird: number
  topThirdSize: number
  youthMidThird: number
  midThirdSize: number
  youthTailThird: number
  tailThirdSize: number
  /** Position of the first candidate under 35, or 0 when the list has none. */
  firstYouthRank: number
}

export interface PartyCadreStats {
  partyId: string
  partyName: string
  totalCandidates: number
  stateOrQuasiCount: number
  stateOrQuasiPct: number
  partyApparatusCount: number
  partyApparatusPct: number
  overlapCount: number
}

export interface PartyGeographyStats {
  partyId: string
  partyName: string
  totalCandidates: number
  republicanCityCount: number
  republicanCityPct: number
  distinctResidencePlaceCount: number
}
