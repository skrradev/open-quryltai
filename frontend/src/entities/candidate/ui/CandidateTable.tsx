import { useTranslation } from 'react-i18next'
import { Link, useLocation } from 'react-router'

import type { Candidate } from '@/entities/candidate/model/candidate'
import { CandidateAvatar } from '@/entities/candidate/ui/CandidateAvatar'
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
  const returnTo = `${location.pathname}${location.search}#party-candidates`

  return (
    <div className="w-full min-w-0 overflow-hidden rounded-xl border bg-card">
      <Table className="w-full min-w-3xl">
        <caption className="sr-only">{t('candidate.list.description')}</caption>
        <TableHeader>
          <TableRow className="hover:bg-transparent">
            <TableHead className="w-14 text-center">
              {t('candidate.table.columns.order')}
            </TableHead>
            <TableHead className="min-w-56">
              {t('candidate.table.columns.candidate')}
            </TableHead>
            <TableHead className="w-28">
              {t('candidate.table.columns.birthYear')}
            </TableHead>
            <TableHead className="min-w-32">
              {t('candidate.table.columns.place')}
            </TableHead>
            <TableHead className="min-w-44">
              {t('candidate.table.columns.position')}
            </TableHead>
            <TableHead className="w-24 text-center">
              {t('candidate.table.columns.incumbent')}
            </TableHead>
          </TableRow>
        </TableHeader>
        <TableBody>
          {candidates.map((candidate) => {
            return (
              <TableRow key={candidate.candidateId}>
                <TableCell className="text-center font-medium text-muted-foreground">
                  {candidate.listOrder}
                </TableCell>
                <TableCell>
                  <div className="flex items-center gap-3">
                    <CandidateAvatar
                      fullName={candidate.fullName}
                      src={candidate.photoThumbnailUrl}
                    />
                    <Link
                      className="font-semibold underline-offset-4 hover:underline focus-visible:rounded-sm focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring"
                      state={{ from: returnTo }}
                      to={`/${language}/candidates/${candidate.candidateId}`}
                    >
                      {candidate.fullName}
                    </Link>
                  </div>
                </TableCell>
                <TableCell>{candidate.birthYear}</TableCell>
                <TableCell>{candidate.place.name}</TableCell>
                <TableCell className="break-words whitespace-normal leading-relaxed text-xs">
                  {candidate.position}
                </TableCell>
                <TableCell className="text-center whitespace-nowrap">
                  {candidate.incumbent ? (
                    <Badge>{t('common.yes')}</Badge>
                  ) : (
                    <span className="text-muted-foreground text-xs">{t('common.no')}</span>
                  )}
                </TableCell>
              </TableRow>
            )
          })}
        </TableBody>
      </Table>
    </div>
  )
}
