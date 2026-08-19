import { queryOptions } from '@tanstack/react-query'

import type {
  Candidate,
  CandidateContent,
  CandidateListParams,
  CandidateSource,
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

export function getCandidateContent(
  candidateId: number,
  { language, signal }: CandidateRequestOptions,
) {
  return apiRequest<CandidateContent[]>(`/candidates/${candidateId}/content`, {
    language,
    signal,
  })
}

export function getCandidateSources(
  candidateId: number,
  page: number,
  { language, signal }: CandidateRequestOptions,
) {
  const search = new URLSearchParams({
    page: String(page),
    size: '20',
  })
  return apiRequest<Page<CandidateSource>>(
    `/candidates/${candidateId}/sources?${search}`,
    { language, signal },
  )
}

export const candidateQueries = {
  all: ['candidates'] as const,
  detail: (language: Language, candidateId: number) =>
    queryOptions({
      queryKey: [...candidateQueries.all, 'detail', language, candidateId] as const,
      queryFn: ({ signal }) => getCandidate(candidateId, { language, signal }),
    }),
  content: (language: Language, candidateId: number) =>
    queryOptions({
      queryKey: [...candidateQueries.all, 'content', language, candidateId] as const,
      queryFn: ({ signal }) =>
        getCandidateContent(candidateId, { language, signal }),
    }),
  sources: (language: Language, candidateId: number, page: number) =>
    queryOptions({
      queryKey: [
        ...candidateQueries.all,
        'sources',
        language,
        candidateId,
        page,
      ] as const,
      queryFn: ({ signal }) =>
        getCandidateSources(candidateId, page, { language, signal }),
    }),
  list: (language: Language, params: CandidateListParams = {}) =>
    queryOptions({
      queryKey: [...candidateQueries.all, 'list', language, params] as const,
      queryFn: ({ signal }) => getCandidates({ language, params, signal }),
    }),
}
