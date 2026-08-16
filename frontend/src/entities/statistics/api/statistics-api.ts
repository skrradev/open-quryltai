import { queryOptions } from '@tanstack/react-query'

import type { Statistics } from '@/entities/statistics/model/statistics'
import { apiRequest } from '@/shared/api/client'
import type { Language } from '@/shared/config/language'

export function getStatistics(language: Language, signal?: AbortSignal) {
  return apiRequest<Statistics>('/statistics', { language, signal })
}

export const statisticsQueries = {
  all: ['statistics'] as const,
  detail: (language: Language) =>
    queryOptions({
      queryKey: [...statisticsQueries.all, language] as const,
      queryFn: ({ signal }) => getStatistics(language, signal),
    }),
}
