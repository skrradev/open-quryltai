import { useTranslation } from 'react-i18next'
import { Link, useLocation } from 'react-router'

import type { Candidate } from '@/entities/candidate/model/candidate'
import type { Language } from '@/shared/config/language'
import { Badge } from '@/shared/ui/badge'
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from '@/shared/ui/table'

interface CandidateTableProps {
  candidates: Candidate[]
  language: Language
}

export function CandidateTable({ candidates, language }: CandidateTableProps) {
  const { t } = useTranslation()
  const location = useLocation()
  const returnTo = `${location.pathname}${location.search}`

  return (
    <div className="overflow-hidden rounded-xl border bg-card">
      <Table className="min-w-6xl">
        <caption className="sr-only">{t('candidate.list.description')}</caption>
        <TableHeader>
          <TableRow className="hover:bg-transparent">
            <TableHead className="w-16 text-center">
              {t('candidate.table.columns.order')}
            </TableHead>
            <TableHead className="min-w-60">
              {t('candidate.table.columns.candidate')}
            </TableHead>
            <TableHead className="min-w-40">
              {t('candidate.table.columns.party')}
            </TableHead>
            <TableHead className="w-28">
              {t('candidate.table.columns.birthYear')}
            </TableHead>
            <TableHead className="min-w-36">
              {t('candidate.table.columns.place')}
            </TableHead>
            <TableHead className="min-w-96">
              {t('candidate.table.columns.position')}
            </TableHead>
            <TableHead className="w-32">
              {t('candidate.table.columns.incumbent')}
            </TableHead>
          </TableRow>
        </TableHeader>
        <TableBody>
          {candidates.map((candidate) => (
            <TableRow key={candidate.candidateId}>
              <TableCell className="text-center font-medium text-muted-foreground">
                {candidate.listOrder}
              </TableCell>
              <TableCell>
                <Link
                  className="font-semibold underline-offset-4 hover:underline focus-visible:rounded-sm focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring"
                  state={{ from: returnTo }}
                  to={`/${language}/candidates/${candidate.candidateId}`}
                >
                  {candidate.fullName}
                </Link>
              </TableCell>
              <TableCell>
                <Badge asChild variant="secondary">
                  <Link to={`/${language}/parties/${candidate.party.id}`}>
                    {candidate.party.name}
                  </Link>
                </Badge>
              </TableCell>
              <TableCell>{candidate.birthYear}</TableCell>
              <TableCell>{candidate.place.name}</TableCell>
              <TableCell className="max-w-md leading-relaxed">
                {candidate.position}
              </TableCell>
              <TableCell>
                {candidate.incumbent ? (
                  <Badge>{t('common.yes')}</Badge>
                ) : (
                  <span className="text-muted-foreground">{t('common.no')}</span>
                )}
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </div>
  )
}
