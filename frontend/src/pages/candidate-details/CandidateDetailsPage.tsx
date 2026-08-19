import { useQuery } from '@tanstack/react-query'
import {
  Archive,
  ArrowLeft,
  ExternalLink,
  Sparkles,
} from 'lucide-react'
import { useState } from 'react'
import { useTranslation } from 'react-i18next'
import { Link, useLocation, useParams } from 'react-router'
import Markdown from 'react-markdown'
import rehypeSanitize, { defaultSchema } from 'rehype-sanitize'
import remarkGfm from 'remark-gfm'

import {
  candidateQueries,
  type Candidate,
  type CandidateContent,
  type CandidateSource,
} from '@/entities/candidate'
import { ApiError } from '@/shared/api/client'
import type { Language } from '@/shared/config/language'
import { useRouteLanguage } from '@/shared/lib/use-route-language'
import { Badge } from '@/shared/ui/badge'
import { Button } from '@/shared/ui/button'
import { Card, CardContent, CardHeader, CardTitle } from '@/shared/ui/card'
import { Skeleton } from '@/shared/ui/skeleton'

const markdownSchema = {
  ...defaultSchema,
  tagNames: defaultSchema.tagNames?.filter((tagName) => tagName !== 'img'),
}

interface DetailRowProps {
  label: string
  value: React.ReactNode
}

function DetailRow({ label, value }: DetailRowProps) {
  if (value === undefined || value === null || value === '') return null
  return (
    <div className="flex flex-col gap-0.5 border-b pb-2 sm:flex-row sm:items-center sm:justify-between">
      <dt className="text-muted-foreground text-xs">{label}</dt>
      <dd className="font-medium text-sm text-right">{value}</dd>
    </div>
  )
}

function CandidateDetailsSkeleton() {
  return (
    <div aria-hidden="true" className="grid gap-6">
      <div className="grid gap-3">
        <Skeleton className="h-5 w-28 rounded-full" />
        <Skeleton className="h-10 w-3/4" />
        <Skeleton className="h-6 w-full max-w-2xl" />
      </div>
      <div className="grid gap-4 md:grid-cols-2">
        {[0, 1, 2].map((section) => (
          <Card className={section === 2 ? 'md:col-span-2' : undefined} key={section}>
            <CardHeader>
              <Skeleton className="h-6 w-40" />
            </CardHeader>
            <CardContent className="grid gap-4">
              {[0, 1, 2].map((row) => (
                <Skeleton className="h-8 w-full" key={row} />
              ))}
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  )
}

interface SafeMarkdownProps {
  children: string
}

function SafeMarkdown({ children }: SafeMarkdownProps) {
  return (
    <div className="grid gap-3 text-sm leading-7 text-foreground/90 [&_a]:font-medium [&_a]:text-primary [&_a]:underline [&_a]:underline-offset-4 [&_blockquote]:border-l-2 [&_blockquote]:pl-4 [&_h2]:text-xl [&_h2]:font-semibold [&_h3]:text-lg [&_h3]:font-semibold [&_li]:ml-5 [&_li]:list-disc [&_ol>li]:list-decimal [&_table]:w-full [&_table]:border-collapse [&_td]:border [&_td]:p-2 [&_th]:border [&_th]:bg-muted [&_th]:p-2 [&_th]:text-left">
      <Markdown
        components={{
          a: ({ children: linkText, href }) => (
            <a
              href={href}
              rel="nofollow noopener noreferrer"
              target="_blank"
            >
              {linkText}
            </a>
          ),
        }}
        rehypePlugins={[[rehypeSanitize, markdownSchema]]}
        remarkPlugins={[remarkGfm]}
      >
        {children}
      </Markdown>
    </div>
  )
}

function AiOverviewCard({
  section,
}: {
  section: CandidateContent
  language: Language
}) {
  return (
    <Card className="overflow-hidden border-indigo-500/30 bg-gradient-to-br from-indigo-500/[0.05] via-purple-500/[0.02] to-transparent shadow-xs">
      <CardHeader className="border-b border-indigo-500/10 bg-gradient-to-r from-indigo-500/10 via-purple-500/5 to-transparent pb-4">
        <div className="flex flex-wrap items-center justify-between gap-3">
          <div className="flex items-center gap-2.5">
            <div className="flex size-7 items-center justify-center rounded-lg bg-gradient-to-br from-blue-600 to-indigo-600 text-white shadow-xs">
              <Sparkles className="size-4 fill-white/20" />
            </div>
            <div>
              <CardTitle className="text-lg font-bold tracking-tight">
                <span className="bg-gradient-to-r from-blue-600 via-indigo-600 to-purple-600 bg-clip-text text-transparent dark:from-blue-400 dark:via-indigo-300 dark:to-purple-300">
                  {section.title}
                </span>
              </CardTitle>
            </div>
          </div>
          <div className="flex items-center gap-2">
            <Badge
              className="border-indigo-500/20 bg-indigo-500/10 text-indigo-700 dark:text-indigo-300"
              variant="outline"
            >
              ✦ Google AI Overview
            </Badge>
          </div>
        </div>
      </CardHeader>
      <CardContent className="pt-5">
        <SafeMarkdown>{section.bodyMarkdown}</SafeMarkdown>
      </CardContent>
    </Card>
  )
}

function CandidateContentSection({
  content,
  language,
}: {
  content: CandidateContent[]
  language: Language
}) {
  if (content.length === 0) {
    return null
  }

  return (
    <div className="grid gap-4">
      {content.map((section) => {
        if (section.sectionType === 'OVERVIEW') {
          return (
            <AiOverviewCard
              key={section.sectionType}
              language={language}
              section={section}
            />
          )
        }

        return (
          <Card key={section.sectionType}>
            <CardHeader>
              <CardTitle>
                <h2>{section.title}</h2>
              </CardTitle>
            </CardHeader>
            <CardContent>
              <SafeMarkdown>{section.bodyMarkdown}</SafeMarkdown>
            </CardContent>
          </Card>
        )
      })}
    </div>
  )
}

function SourceCard({
  language,
  source,
}: {
  language: Language
  source: CandidateSource
}) {
  const { t } = useTranslation()
  const publishedAt = source.publishedAt
    ? new Intl.DateTimeFormat(language === 'ru' ? 'ru-KZ' : 'kk-KZ', {
        dateStyle: 'long',
      }).format(new Date(source.publishedAt))
    : null

  return (
    <li className="rounded-xl border p-5">
      <div className="flex flex-wrap items-center gap-2 text-xs text-muted-foreground">
        <span className="font-medium text-foreground">{source.publisher}</span>
        {publishedAt && <span>· {publishedAt}</span>}
        <Badge variant="outline">
          {t('candidate.details.sources.language', {
            language: source.language.toUpperCase(),
          })}
        </Badge>
      </div>
      <a
        className="mt-2 inline-flex items-start gap-2 font-semibold leading-snug hover:underline"
        href={source.url}
        rel="nofollow noopener noreferrer"
        target="_blank"
      >
        <span>{source.title}</span>
        <ExternalLink aria-hidden="true" className="mt-0.5 size-4 shrink-0" />
      </a>
      {source.summary && (
        <div className="mt-3">
          <SafeMarkdown>{source.summary}</SafeMarkdown>
        </div>
      )}
      {source.archivedUrl && (
        <a
          className="mt-4 inline-flex items-center gap-2 text-xs font-medium text-muted-foreground hover:text-foreground"
          href={source.archivedUrl}
          rel="nofollow noopener noreferrer"
          target="_blank"
        >
          <Archive aria-hidden="true" className="size-3.5" />
          {t('candidate.details.sources.archive')}
        </a>
      )}
    </li>
  )
}

function EditorialError({ retry }: { retry: () => void }) {
  const { t } = useTranslation()
  return (
    <div className="rounded-xl border border-destructive/20 bg-destructive/5 p-5" role="alert">
      <p className="text-sm text-muted-foreground">
        {t('errors.candidateEditorial.description')}
      </p>
      <Button className="mt-3" onClick={retry} size="sm" variant="outline">
        {t('actions.retry')}
      </Button>
    </div>
  )
}

function CandidateEditorialContent({
  candidateId,
  language,
}: {
  candidateId: number
  language: Language
}) {
  const { t } = useTranslation()
  const [sourcePage, setSourcePage] = useState(0)
  const contentQuery = useQuery(candidateQueries.content(language, candidateId))
  const sourcesQuery = useQuery(
    candidateQueries.sources(language, candidateId, sourcePage),
  )

  return (
    <div className="grid gap-8">
      {contentQuery.isPending && <Skeleton className="h-48 w-full" />}
      {contentQuery.isError && (
        <EditorialError retry={() => void contentQuery.refetch()} />
      )}
      {contentQuery.data && (
        <CandidateContentSection
          content={contentQuery.data}
          language={language}
        />
      )}

      {sourcesQuery.isPending && <Skeleton className="h-48 w-full" />}
      {sourcesQuery.isError && (
        <EditorialError retry={() => void sourcesQuery.refetch()} />
      )}
      {sourcesQuery.data && sourcesQuery.data.totalItems > 0 && (
        <Card>
          <CardHeader>
            <CardTitle>
              <h2>{t('candidate.details.sources.title')}</h2>
            </CardTitle>
          </CardHeader>
          <CardContent>
            <ul className="grid gap-3">
              {sourcesQuery.data.items.map((source) => (
                <SourceCard
                  key={source.sourceKey}
                  language={language}
                  source={source}
                />
              ))}
            </ul>
            {sourcesQuery.data.totalPages > 1 && (
              <div className="mt-5 flex items-center justify-between gap-3">
                <Button
                  disabled={sourcePage === 0}
                  onClick={() => setSourcePage((page) => page - 1)}
                  size="sm"
                  variant="outline"
                >
                  {t('pagination.previous')}
                </Button>
                <span className="text-sm text-muted-foreground">
                  {t('pagination.status', {
                    current: sourcePage + 1,
                    total: sourcesQuery.data.totalPages,
                  })}
                </span>
                <Button
                  disabled={sourcePage + 1 >= sourcesQuery.data.totalPages}
                  onClick={() => setSourcePage((page) => page + 1)}
                  size="sm"
                  variant="outline"
                >
                  {t('pagination.next')}
                </Button>
              </div>
            )}
          </CardContent>
        </Card>
      )}
    </div>
  )
}

function getReturnTo(
  state: unknown,
  language: Language,
  partyId?: string,
): string {
  const fallback = partyId
    ? `/${language}/parties/${partyId}#party-candidates`
    : `/${language}/parties`

  if (typeof state !== 'object' || state === null || !('from' in state)) {
    return fallback
  }

  const from = state.from

  if (typeof from !== 'string' || !/^\/(kk|ru)\/(?:parties|candidates)(?:\?|$)/.test(from)) {
    return fallback
  }

  return from.replace(/^\/(kk|ru)/, `/${language}`)
}

interface CandidateDetailsContentProps {
  candidate: Candidate
  language: Language
}

function CandidateDetailsContent({ candidate, language }: CandidateDetailsContentProps) {
  const { t } = useTranslation()
  const booleanLabel = (value: boolean) =>
    value ? t('common.yes') : t('common.no')

  return (
    <article className="grid gap-8">
      <header className="flex max-w-4xl flex-col gap-6 sm:flex-row sm:items-start sm:gap-8">
        {candidate.photoUrl && (
          <img
            alt={t('candidate.details.photoAlt', { name: candidate.fullName })}
            className="w-32 shrink-0 rounded-xl border bg-muted object-cover sm:w-40"
            decoding="async"
            /* Intrinsic size from the API keeps the box stable while loading. */
            height={candidate.photoHeight ?? undefined}
            src={candidate.photoUrl}
            width={candidate.photoWidth ?? undefined}
          />
        )}
        <div className="min-w-0">
          <div className="mb-4 flex flex-wrap items-center gap-2">
            <Badge asChild variant="secondary">
              <Link to={`/${language}/parties/${candidate.party.id}#party-candidates`}>
                {candidate.party.name}
              </Link>
            </Badge>
            <Badge variant="outline">
              {t('candidate.details.listOrder', { order: candidate.listOrder })}
            </Badge>
          </div>
          <h1 className="text-3xl font-semibold tracking-tight sm:text-5xl">
            {candidate.fullName}
          </h1>
          <p className="mt-4 text-lg leading-relaxed text-muted-foreground">
            {candidate.position}
          </p>
        </div>
      </header>

      <div className="grid gap-4 md:grid-cols-2">

        <Card>
          <CardHeader>
            <CardTitle>
              <h2>{t('candidate.details.sections.basic')}</h2>
            </CardTitle>
          </CardHeader>
          <CardContent>
            <dl>
              <DetailRow
                label={t('candidate.details.fields.birthYear')}
                value={candidate.birthYear}
              />
              <DetailRow
                label={t('candidate.details.fields.gender')}
                value={candidate.gender.label}
              />
              <DetailRow
                label={t('candidate.details.fields.place')}
                value={candidate.place.name}
              />
            </dl>
          </CardContent>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle>
              <h2>{t('candidate.details.sections.political')}</h2>
            </CardTitle>
          </CardHeader>
          <CardContent>
            <dl>
              <DetailRow
                label={t('candidate.details.fields.party')}
                value={candidate.party.name}
              />
              <DetailRow
                label={t('candidate.details.fields.partyInsider')}
                value={booleanLabel(candidate.partyInsider)}
              />
              <DetailRow
                label={t('candidate.details.fields.incumbent')}
                value={booleanLabel(candidate.incumbent)}
              />
            </dl>
          </CardContent>
        </Card>

        <Card className="md:col-span-2">
          <CardHeader>
            <CardTitle>
              <h2>{t('candidate.details.sections.professional')}</h2>
            </CardTitle>
          </CardHeader>
          <CardContent>
            <dl>
              <DetailRow
                label={t('candidate.details.fields.position')}
                value={candidate.position}
              />
            </dl>
          </CardContent>
        </Card>
      </div>

      <CandidateEditorialContent
        candidateId={candidate.candidateId}
        key={`${candidate.candidateId}-${language}`}
        language={language}
      />
    </article>
  )
}

export function CandidateDetailsPage() {
  const { candidateId } = useParams()
  const location = useLocation()
  const language = useRouteLanguage()
  const { t } = useTranslation()
  const parsedCandidateId = Number(candidateId)
  const isValidCandidateId =
    /^\d+$/.test(candidateId ?? '') &&
    Number.isInteger(parsedCandidateId) &&
    parsedCandidateId > 0 &&
    parsedCandidateId <= 32_767
  const candidateQuery = useQuery({
    ...candidateQueries.detail(language, isValidCandidateId ? parsedCandidateId : 0),
    enabled: isValidCandidateId,
    retry: (failureCount, error) =>
      !(error instanceof ApiError && error.status === 404) && failureCount < 1,
  })
  const returnTo = getReturnTo(
    location.state,
    language,
    candidateQuery.data?.party.id,
  )
  const isNotFound =
    !isValidCandidateId ||
    (candidateQuery.error instanceof ApiError && candidateQuery.error.status === 404)

  return (
    <main className="mx-auto min-h-svh w-full max-w-6xl px-4 py-24 sm:px-6 lg:px-8">
      <Button asChild className="mb-8" variant="ghost">
        <Link to={returnTo}>
          <ArrowLeft aria-hidden="true" data-icon="inline-start" />
          {candidateQuery.data?.party.name
            ? `${candidateQuery.data.party.name} · ${t('candidate.list.title')}`
            : t('actions.backToParties')}
        </Link>
      </Button>

      {candidateQuery.isPending && isValidCandidateId && (
        <CandidateDetailsSkeleton />
      )}

      {isNotFound && (
        <section className="rounded-xl border border-dashed p-10 text-center">
          <h1 className="text-3xl font-semibold tracking-tight">
            {t('candidate.details.notFound.title')}
          </h1>
          <p className="mt-2 text-muted-foreground">
            {t('candidate.details.notFound.description')}
          </p>
        </section>
      )}

      {candidateQuery.isError && !isNotFound && (
        <section
          aria-live="assertive"
          className="rounded-xl border border-destructive/20 bg-destructive/5 p-6"
          role="alert"
        >
          <h1 className="font-semibold">{t('errors.candidate.title')}</h1>
          <p className="mt-1 text-sm text-muted-foreground">
            {t('errors.candidate.description')}
          </p>
          <Button
            className="mt-4"
            onClick={() => void candidateQuery.refetch()}
            variant="outline"
          >
            {t('actions.retry')}
          </Button>
        </section>
      )}

      {candidateQuery.data && (
        <CandidateDetailsContent
          candidate={candidateQuery.data}
          language={language}
        />
      )}
    </main>
  )
}
