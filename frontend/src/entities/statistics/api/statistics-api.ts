import { queryOptions } from '@tanstack/react-query'

import type {
  PartyGenderStats,
  PartyCadreStats,
  PartyGeographyStats,
  PartyYouthStats,
  Statistics,
} from '@/entities/statistics/model/statistics'
import { apiRequest } from '@/shared/api/client'
import type { Language } from '@/shared/config/language'

export function getStatistics(language: Language, signal?: AbortSignal) {
  return apiRequest<Statistics>('/statistics', { language, signal })
}

export function getYouthStatistics(language: Language, signal?: AbortSignal) {
  return apiRequest<PartyYouthStats[]>('/statistics/youth', { language, signal })
}

export function getGenderStatistics(language: Language, signal?: AbortSignal) {
  return apiRequest<PartyGenderStats[]>('/statistics/gender', { language, signal })
}

export function getCadreStatistics(language: Language, signal?: AbortSignal) {
  return apiRequest<PartyCadreStats[]>('/statistics/cadre', { language, signal })
}

export function getGeographyStatistics(language: Language, signal?: AbortSignal) {
  return apiRequest<PartyGeographyStats[]>('/statistics/geography', { language, signal })
}

export const statisticsQueries = {
  all: ['statistics'] as const,
  detail: (language: Language) =>
    queryOptions({
      queryKey: [...statisticsQueries.all, language] as const,
      queryFn: ({ signal }) => getStatistics(language, signal),
    }),
  youth: (language: Language) =>
    queryOptions({
      queryKey: [...statisticsQueries.all, 'youth', language] as const,
      queryFn: ({ signal }) => getYouthStatistics(language, signal),
    }),
  gender: (language: Language) =>
    queryOptions({
      queryKey: [...statisticsQueries.all, 'gender', language] as const,
      queryFn: ({ signal }) => getGenderStatistics(language, signal),
    }),
  cadre: (language: Language) =>
    queryOptions({
      queryKey: [...statisticsQueries.all, 'cadre', language] as const,
      queryFn: ({ signal }) => getCadreStatistics(language, signal),
    }),
  geography: (language: Language) =>
    queryOptions({
      queryKey: [...statisticsQueries.all, 'geography', language] as const,
      queryFn: ({ signal }) => getGeographyStatistics(language, signal),
    }),
}
