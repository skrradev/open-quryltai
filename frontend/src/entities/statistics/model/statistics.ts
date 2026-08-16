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
