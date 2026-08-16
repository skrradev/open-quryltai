import { queryOptions } from '@tanstack/react-query'

import type { Party } from '@/entities/party/model/party'
import { apiRequest } from '@/shared/api/client'
import type { Language } from '@/shared/config/language'

interface GetPartiesOptions {
  language: Language
  signal?: AbortSignal
}

export function getParties({ language, signal }: GetPartiesOptions) {
  return apiRequest<Party[]>('/parties', { language, signal })
}

export const partyQueries = {
  all: ['parties'] as const,
  list: (language: Language) =>
    queryOptions({
      queryKey: [...partyQueries.all, 'list', language] as const,
      queryFn: ({ signal }) => getParties({ language, signal }),
    }),
}
