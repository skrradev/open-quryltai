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

export const genders = ['M', 'F'] as const
export type Gender = (typeof genders)[number]

export const placeTypes = [
  'CITY',
  'REGION',
  'DISTRICT',
  'VILLAGE',
  'SETTLEMENT',
] as const
export type PlaceType = (typeof placeTypes)[number]

export const sectors = [
  'GOVERNMENT',
  'BUSINESS',
  'PARTY_APPARATUS',
  'LEGISLATOR',
  'EDUCATION_AND_SCIENCE',
  'HEALTHCARE',
  'CULTURE',
  'SPORT',
  'CIVIL_SOCIETY',
  'LAW',
  'MEDIA',
  'AGRICULTURE',
  'OTHER_OR_UNCLEAR',
] as const
export type Sector = (typeof sectors)[number]

export const employerTypes = [
  'PRIVATE_COMPANY',
  'STATE_BODY',
  'QUASI_GOVERNMENTAL',
  'POLITICAL_PARTY',
  'NGO',
  'SELF_EMPLOYED',
  'UNCLEAR',
] as const
export type EmployerType = (typeof employerTypes)[number]

export interface CandidateListParams {
  direction?: SortDirection
  employerType?: EmployerType
  gender?: Gender
  incumbent?: boolean
  page?: number
  partyId?: string
  partyInsider?: boolean
  placeId?: string
  placeType?: PlaceType
  search?: string
  sector?: Sector
  size?: number
  sort?: CandidateSort
}
