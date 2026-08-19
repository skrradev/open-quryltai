import { env } from '@/shared/config/env'
import type { Language } from '@/shared/config/language'

interface ApiRequestOptions extends Omit<RequestInit, 'headers'> {
  headers?: HeadersInit
  language: Language
}

export class ApiError extends Error {
  readonly body: unknown
  readonly status: number

  constructor(response: Response, body: unknown) {
    super(`API request failed with status ${response.status}`)
    this.name = 'ApiError'
    this.status = response.status
    this.body = body
  }
}

async function readResponseBody(response: Response): Promise<unknown> {
  if (response.status === 204) {
    return undefined
  }

  const contentType = response.headers.get('content-type')

  if (contentType?.includes('application/json')) {
    return response.json()
  }

  return response.text()
}

export async function apiRequest<T>(
  path: `/${string}`,
  { headers: requestHeaders, language, ...requestOptions }: ApiRequestOptions,
): Promise<T> {
  const headers = new Headers(requestHeaders)
  headers.set('Accept', 'application/json')
  headers.set('Accept-Language', language)

  const response = await fetch(`${env.apiBaseUrl}${path}`, {
    ...requestOptions,
    headers,
  })
  const body = await readResponseBody(response)

  if (!response.ok) {
    throw new ApiError(response, body)
  }

  return body as T
}
