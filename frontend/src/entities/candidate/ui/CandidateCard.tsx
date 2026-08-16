import { BriefcaseBusiness, MapPin } from 'lucide-react'
import { useTranslation } from 'react-i18next'
import { Link } from 'react-router'

import type { Candidate } from '@/entities/candidate/model/candidate'
import type { Language } from '@/shared/config/language'
import { Badge } from '@/shared/ui/badge'
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from '@/shared/ui/card'

interface CandidateCardProps {
  candidate: Candidate
  language: Language
}

export function CandidateCard({ candidate, language }: CandidateCardProps) {
  const { t } = useTranslation()

  return (
    <Link
      className="group rounded-xl outline-none focus-visible:ring-3 focus-visible:ring-ring/50"
      to={`/${language}/candidates/${candidate.candidateId}`}
    >
      <Card className="h-full transition-colors group-hover:bg-muted/40">
        <CardHeader>
          <Badge variant="secondary">{candidate.party.name}</Badge>
          <CardTitle className="mt-2 text-lg group-hover:underline">
            {candidate.fullName}
          </CardTitle>
          <CardDescription>
            {t('candidate.card.birthYear', { year: candidate.birthYear })}
          </CardDescription>
        </CardHeader>
        <CardContent className="grid gap-3 text-sm">
          <p className="flex items-start gap-2">
            <BriefcaseBusiness
              aria-hidden="true"
              className="mt-0.5 size-4 shrink-0 text-muted-foreground"
            />
            <span>{candidate.position}</span>
          </p>
          <p className="flex items-start gap-2 text-muted-foreground">
            <MapPin aria-hidden="true" className="mt-0.5 size-4 shrink-0" />
            <span>{candidate.place.name}</span>
          </p>
        </CardContent>
      </Card>
    </Link>
  )
}
