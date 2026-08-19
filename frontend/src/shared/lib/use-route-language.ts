import { useParams } from 'react-router'

import { DEFAULT_LANGUAGE, isSupportedLanguage } from '@/shared/config/language'

export function useRouteLanguage() {
  const { language } = useParams()

  return isSupportedLanguage(language) ? language : DEFAULT_LANGUAGE
}
