import { queryOptions } from '@tanstack/react-query'

import type {
  Candidate,
  CandidateListParams,
} from '@/entities/candidate/model/candidate'
import { apiRequest } from '@/shared/api/client'
import type { Page } from '@/shared/api/types'
import type { Language } from '@/shared/config/language'

interface CandidateRequestOptions {
  language: Language
  signal?: AbortSignal
}

interface GetCandidatesOptions extends CandidateRequestOptions {
  params?: CandidateListParams
}

function toSearchParams(params: CandidateListParams): URLSearchParams {
  const searchParams = new URLSearchParams()

  for (const [key, value] of Object.entries(params)) {
    if (value !== undefined && value !== '') {
      searchParams.set(key, String(value))
    }
  }

  return searchParams
}

export function getCandidates({
  language,
  params = {},
  signal,
}: GetCandidatesOptions) {
  const searchParams = toSearchParams(params)
  const query = searchParams.size > 0 ? `?${searchParams}` : ''

  return apiRequest<Page<Candidate>>(`/candidates${query}`, {
    language,
    signal,
  })
}

export function getCandidate(
  candidateId: number,
  { language, signal }: CandidateRequestOptions,
) {
  return apiRequest<Candidate>(`/candidates/${candidateId}`, {
    language,
    signal,
  })
}

export const candidateQueries = {
  all: ['candidates'] as const,
  detail: (language: Language, candidateId: number) =>
    queryOptions({
      queryKey: [...candidateQueries.all, 'detail', language, candidateId] as const,
      queryFn: ({ signal }) => getCandidate(candidateId, { language, signal }),
    }),
  list: (language: Language, params: CandidateListParams = {}) =>
    queryOptions({
      queryKey: [...candidateQueries.all, 'list', language, params] as const,
      queryFn: ({ signal }) => getCandidates({ language, params, signal }),
    }),
}
