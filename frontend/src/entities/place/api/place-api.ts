import { queryOptions } from '@tanstack/react-query'

import type { Place } from '@/entities/place/model/place'
import { apiRequest } from '@/shared/api/client'
import type { Language } from '@/shared/config/language'

interface GetPlacesOptions {
  language: Language
  signal?: AbortSignal
}

export function getPlaces({ language, signal }: GetPlacesOptions) {
  return apiRequest<Place[]>('/places', { language, signal })
}

export const placeQueries = {
  all: ['places'] as const,
  list: (language: Language) =>
    queryOptions({
      queryKey: [...placeQueries.all, 'list', language] as const,
      queryFn: ({ signal }) => getPlaces({ language, signal }),
    }),
}
