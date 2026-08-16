import { Navigate, Outlet, useParams } from 'react-router'

import {
  DEFAULT_LANGUAGE,
  isSupportedLanguage,
} from '@/shared/config/language'

export function LanguageLayout() {
  const { language } = useParams()

  if (!isSupportedLanguage(language)) {
    return <Navigate to={`/${DEFAULT_LANGUAGE}/candidates`} replace />
  }

  return <Outlet />
}
