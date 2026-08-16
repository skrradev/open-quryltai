import { useCallback, useMemo } from 'react'
import { useSearchParams } from 'react-router'

import {
  employerTypes,
  genders,
  placeTypes,
  sectors,
  type CandidateListParams,
  type CandidateSort,
  type EmployerType,
  type Gender,
  type PlaceType,
  type Sector,
  type SortDirection,
} from '@/entities/candidate'

const candidateSorts = ['party', 'name', 'birthYear', 'listOrder'] as const
const sortDirections = ['asc', 'desc'] as const
const pageSizes = [12, 24, 48, 96] as const

function includes<T extends string>(values: readonly T[], value: string | null): value is T {
  return value !== null && values.some((candidate) => candidate === value)
}

function parseBoolean(value: string | null): boolean | undefined {
  if (value === 'true') return true
  if (value === 'false') return false
  return undefined
}

function parseNonNegativeInteger(value: string | null, fallback: number): number {
  const parsed = Number(value)
  return Number.isInteger(parsed) && parsed >= 0 ? parsed : fallback
}

function parsePageSize(value: string | null): number {
  const parsed = Number(value)
  return pageSizes.some((size) => size === parsed) ? parsed : 24
}

function parseCandidateListParams(searchParams: URLSearchParams): CandidateListParams {
  const employerType = searchParams.get('employerType')
  const gender = searchParams.get('gender')
  const placeType = searchParams.get('placeType')
  const sector = searchParams.get('sector')
  const sort = searchParams.get('sort')
  const direction = searchParams.get('direction')
  const search = searchParams.get('search')?.trim()

  return {
    direction: includes(sortDirections, direction)
      ? (direction as SortDirection)
      : 'asc',
    employerType: includes(employerTypes, employerType)
      ? (employerType as EmployerType)
      : undefined,
    gender: includes(genders, gender) ? (gender as Gender) : undefined,
    incumbent: parseBoolean(searchParams.get('incumbent')),
    page: parseNonNegativeInteger(searchParams.get('page'), 0),
    partyId: searchParams.get('partyId') || undefined,
    partyInsider: parseBoolean(searchParams.get('partyInsider')),
    placeId: searchParams.get('placeId') || undefined,
    placeType: includes(placeTypes, placeType)
      ? (placeType as PlaceType)
      : undefined,
    search: search || undefined,
    sector: includes(sectors, sector) ? (sector as Sector) : undefined,
    size: parsePageSize(searchParams.get('size')),
    sort: includes(candidateSorts, sort) ? (sort as CandidateSort) : 'party',
  }
}

function isDefaultValue(key: string, value: unknown): boolean {
  return (
    (key === 'page' && value === 0) ||
    (key === 'size' && value === 24) ||
    (key === 'sort' && value === 'party') ||
    (key === 'direction' && value === 'asc')
  )
}

export function useCandidateListParams() {
  const [searchParams, setSearchParams] = useSearchParams()
  const params = useMemo(
    () => parseCandidateListParams(searchParams),
    [searchParams],
  )

  const updateParams = useCallback(
    (
      patch: Partial<CandidateListParams>,
      options: { resetPage?: boolean } = {},
    ) => {
      setSearchParams((current) => {
        const next = new URLSearchParams(current)

        if (options.resetPage !== false) {
          next.delete('page')
        }

        for (const [key, value] of Object.entries(patch)) {
          if (value === undefined || value === '' || isDefaultValue(key, value)) {
            next.delete(key)
          } else {
            next.set(key, String(value))
          }
        }

        return next
      })
    },
    [setSearchParams],
  )

  const resetParams = useCallback(() => {
    setSearchParams(new URLSearchParams())
  }, [setSearchParams])

  return {
    hasCustomParams: searchParams.size > 0,
    params,
    resetParams,
    updateParams,
  }
}

export { pageSizes }
