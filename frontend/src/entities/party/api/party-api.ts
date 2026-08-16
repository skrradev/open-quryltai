import { queryOptions } from '@tanstack/react-query'

import type { Party, PartyDetails } from '@/entities/party/model/party'
import { apiRequest } from '@/shared/api/client'
import type { Language } from '@/shared/config/language'

interface GetPartiesOptions {
  language: Language
  signal?: AbortSignal
}

export function getParties({ language, signal }: GetPartiesOptions) {
  return apiRequest<Party[]>('/parties', { language, signal })
}

export function getParty(
  partyId: string,
  { language, signal }: GetPartiesOptions,
) {
  return apiRequest<PartyDetails>(`/parties/${partyId}`, { language, signal })
}

export const partyQueries = {
  all: ['parties'] as const,
  detail: (language: Language, partyId: string) =>
    queryOptions({
      queryKey: [...partyQueries.all, 'detail', language, partyId] as const,
      queryFn: ({ signal }) => getParty(partyId, { language, signal }),
    }),
  list: (language: Language) =>
    queryOptions({
      queryKey: [...partyQueries.all, 'list', language] as const,
      queryFn: ({ signal }) => getParties({ language, signal }),
    }),
}
