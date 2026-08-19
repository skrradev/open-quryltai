import { queryOptions } from '@tanstack/react-query'

import type {
  ProgramComparison,
  ProgramMeasurement,
} from '@/entities/program/model/program'
import { apiRequest } from '@/shared/api/client'
import type { Language } from '@/shared/config/language'

interface RequestOptions {
  language: Language
  signal?: AbortSignal
}

export function getProgramComparison({ language, signal }: RequestOptions) {
  return apiRequest<ProgramComparison>('/programs/comparison', { language, signal })
}

export function getPartyProgram(
  partyId: string,
  { language, signal }: RequestOptions,
) {
  return apiRequest<ProgramMeasurement>(`/programs/${partyId}`, { language, signal })
}

export const programQueries = {
  all: ['programs'] as const,
  comparison: (language: Language) =>
    queryOptions({
      queryKey: [...programQueries.all, 'comparison', language] as const,
      queryFn: ({ signal }) => getProgramComparison({ language, signal }),
    }),
  party: (language: Language, partyId: string) =>
    queryOptions({
      queryKey: [...programQueries.all, 'party', language, partyId] as const,
      queryFn: ({ signal }) => getPartyProgram(partyId, { language, signal }),
    }),
}
