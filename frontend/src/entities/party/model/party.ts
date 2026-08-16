export interface Party {
  id: string
  name: string
}

export interface PartyStatisticsCategory {
  category: {
    code: string
    label: string
  }
  count: number
}

export interface PartyDetails {
  party: Party
  summary: {
    candidateCount: number
    averageAge: number
    incumbentCount: number
    partyInsiderCount: number
  }
  genders: PartyStatisticsCategory[]
  ageGroups: PartyStatisticsCategory[]
  sectors: PartyStatisticsCategory[]
}
