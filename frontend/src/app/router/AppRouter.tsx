import { lazy, Suspense } from 'react'
import { BrowserRouter, Navigate, Route, Routes } from 'react-router'

import { LanguageLayout } from '@/app/router/LanguageLayout'
import { AboutPage } from '@/pages/about/AboutPage'
import { CandidateDetailsPage } from '@/pages/candidate-details/CandidateDetailsPage'
import { NotFoundPage } from '@/pages/not-found/NotFoundPage'
import { PartyListPage } from '@/pages/party-list/PartyListPage'
import { DEFAULT_LANGUAGE } from '@/shared/config/language'

const defaultPath = `/${DEFAULT_LANGUAGE}`
const StatisticsPage = lazy(async () => {
  const page = await import('@/pages/statistics/StatisticsPage')

  return { default: page.StatisticsPage }
})
const PartyDetailsPage = lazy(async () => {
  const page = await import('@/pages/party-details/PartyDetailsPage')

  return { default: page.PartyDetailsPage }
})

export function AppRouter() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Navigate to={defaultPath} replace />} />

        <Route path="/:language" element={<LanguageLayout />}>
          <Route
            index
            element={
              <Suspense fallback={null}>
                <StatisticsPage />
              </Suspense>
            }
          />
          <Route path="candidates" element={<Navigate to=".." relative="path" replace />} />
          <Route path="statistics" element={<Navigate to=".." relative="path" replace />} />
          <Route path="candidates/:candidateId" element={<CandidateDetailsPage />} />
          <Route path="parties" element={<PartyListPage />} />
          <Route path="about" element={<AboutPage />} />
          <Route
            path="parties/:partyId"
            element={
              <Suspense fallback={null}>
                <PartyDetailsPage />
              </Suspense>
            }
          />
          <Route path="*" element={<NotFoundPage />} />
        </Route>

        <Route path="*" element={<NotFoundPage />} />
      </Routes>
    </BrowserRouter>
  )
}
