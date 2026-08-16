import type { Party } from '@/entities/party'
import type { CandidatePlace } from '@/entities/place'
import type { CodeLabel } from '@/shared/api/types'

export interface Candidate {
  birthYear: number
  candidateId: number
  employerType: CodeLabel
  fullName: string
  gender: CodeLabel
  givenNames: string
  incumbent: boolean
  listOrder: number
  party: Party
  partyInsider: boolean
  place: CandidatePlace
  position: string
  residenceRaw: string
  sector: CodeLabel
  seniority: CodeLabel
  surname: string
}

export type CandidateSort = 'party' | 'name' | 'birthYear' | 'listOrder'
export type SortDirection = 'asc' | 'desc'

export interface CandidateListParams {
  direction?: SortDirection
  employerType?: string
  gender?: string
  incumbent?: boolean
  page?: number
  partyId?: string
  partyInsider?: boolean
  placeId?: string
  placeType?: string
  search?: string
  sector?: string
  size?: number
  sort?: CandidateSort
}
