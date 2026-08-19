import { useState } from 'react'
import {
  BarChart3,
  BookOpen,
  CheckCircle2,
  ExternalLink,
  FileText,
  HelpCircle,
  Layers,
  Sparkles,
} from 'lucide-react'
import { useTranslation } from 'react-i18next'

import { PARTY_PROGRAM_SOURCES } from '@/entities/program/model/program-sources'
import { useRouteLanguage } from '@/shared/lib/use-route-language'
import { Button } from '@/shared/ui/button'
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from '@/shared/ui/dialog'

interface Props {
  mode?: 'matrix' | 'types' | 'all'
  variant?: 'button' | 'icon'
  className?: string
}

export function ProgramMethodologyModal({
  mode = 'all',
  variant = 'button',
  className,
}: Props) {
  const { t } = useTranslation()
  const language = useRouteLanguage()
  const [activeTab, setActiveTab] = useState<'matrix' | 'types' | 'sources' | 'science'>(
    mode === 'types' ? 'types' : 'matrix'
  )

  const triggerLabel =
    mode === 'matrix'
      ? t('program.matrix.guideTrigger')
      : mode === 'types'
        ? t('program.types.guideTrigger')
        : t('program.methodology.trigger')

  const title =
    mode === 'matrix'
      ? t('program.matrix.guideTitle')
      : mode === 'types'
        ? t('program.types.guideTitle')
        : t('program.methodology.title')

  const subtitle =
    mode === 'matrix'
      ? t('program.matrix.guideSubtitle')
      : mode === 'types'
        ? t('program.types.guideSubtitle')
        : t('program.methodology.subtitle')

  const programList = Object.values(PARTY_PROGRAM_SOURCES)

  return (
    <Dialog>
      <DialogTrigger asChild>
        {variant === 'icon' ? (
          <Button
            aria-label={triggerLabel}
            className={className}
            size="icon-xs"
            title={triggerLabel}
            variant="ghost"
          >
            <HelpCircle className="size-4 text-muted-foreground hover:text-foreground transition-colors" />
          </Button>
        ) : (
          <Button className={className} size="sm" variant="outline">
            <HelpCircle className="size-3.5" data-icon="inline-start" />
            <span>{triggerLabel}</span>
          </Button>
        )}
      </DialogTrigger>

      <DialogContent className="max-w-2xl max-h-[85vh] overflow-y-auto">
        <DialogHeader>
          <div className="flex items-center gap-2 text-primary font-medium text-xs tracking-wide uppercase">
            <BookOpen className="size-4" />
            <span>{t('program.methodology.badge')}</span>
          </div>
          <DialogTitle className="text-xl font-bold">{title}</DialogTitle>
          <DialogDescription>{subtitle}</DialogDescription>
        </DialogHeader>

        {/* Tab Navigation if mode === 'all' */}
        {mode === 'all' && (
          <div className="flex border-b border-border gap-2 pt-2 overflow-x-auto">
            <button
              className={`pb-2 text-xs font-semibold whitespace-nowrap transition-colors flex items-center gap-1.5 border-b-2 ${
                activeTab === 'matrix'
                  ? 'border-primary text-primary'
                  : 'border-transparent text-muted-foreground hover:text-foreground'
              }`}
              onClick={() => setActiveTab('matrix')}
              type="button"
            >
              <Layers className="size-3.5" />
              <span>{t('program.methodology.tabs.matrix')}</span>
            </button>
            <button
              className={`pb-2 text-xs font-semibold whitespace-nowrap transition-colors flex items-center gap-1.5 border-b-2 ${
                activeTab === 'types'
                  ? 'border-primary text-primary'
                  : 'border-transparent text-muted-foreground hover:text-foreground'
              }`}
              onClick={() => setActiveTab('types')}
              type="button"
            >
              <BarChart3 className="size-3.5" />
              <span>{t('program.methodology.tabs.types')}</span>
            </button>
            <button
              className={`pb-2 text-xs font-semibold whitespace-nowrap transition-colors flex items-center gap-1.5 border-b-2 ${
                activeTab === 'sources'
                  ? 'border-primary text-primary'
                  : 'border-transparent text-muted-foreground hover:text-foreground'
              }`}
              onClick={() => setActiveTab('sources')}
              type="button"
            >
              <FileText className="size-3.5" />
              <span>{t('program.methodology.tabs.sources')}</span>
            </button>
            <button
              className={`pb-2 text-xs font-semibold whitespace-nowrap transition-colors flex items-center gap-1.5 border-b-2 ${
                activeTab === 'science'
                  ? 'border-primary text-primary'
                  : 'border-transparent text-muted-foreground hover:text-foreground'
              }`}
              onClick={() => setActiveTab('science')}
              type="button"
            >
              <Sparkles className="size-3.5" />
              <span>{t('program.methodology.tabs.science')}</span>
            </button>
          </div>
        )}

        {/* Matrix Guide Section */}
        {(mode === 'matrix' || (mode === 'all' && activeTab === 'matrix')) && (
          <div className="space-y-4 pt-2 text-sm text-foreground/90">
            {/* n Value */}
            <div className="rounded-lg border bg-muted/40 p-3.5 space-y-2">
              <h5 className="font-semibold text-xs text-primary flex items-center gap-1.5">
                <CheckCircle2 className="size-3.5" />
                {t('program.methodology.matrixGuide.nValue.title')}
              </h5>
              <p className="text-xs text-muted-foreground leading-normal">
                {t('program.methodology.matrixGuide.nValue.text')}
              </p>
              <div className="rounded bg-background/80 p-2.5 text-xs text-foreground/90 border border-border/50">
                <p className="font-medium leading-relaxed">
                  💡 {t('program.methodology.matrixGuide.nValue.example')}
                </p>
              </div>
            </div>

            {/* Percentages */}
            <div className="rounded-lg border bg-muted/40 p-3.5 space-y-1">
              <h5 className="font-semibold text-xs text-primary flex items-center gap-1.5">
                <CheckCircle2 className="size-3.5" />
                {t('program.methodology.matrixGuide.percentages.title')}
              </h5>
              <p className="text-xs text-muted-foreground leading-normal">
                {t('program.methodology.matrixGuide.percentages.text')}
              </p>
            </div>

            {/* Colors */}
            <div className="rounded-lg border bg-muted/40 p-3.5 space-y-1">
              <h5 className="font-semibold text-xs text-primary flex items-center gap-1.5">
                <CheckCircle2 className="size-3.5" />
                {t('program.methodology.matrixGuide.colors.title')}
              </h5>
              <p className="text-xs text-muted-foreground leading-normal">
                {t('program.methodology.matrixGuide.colors.text')}
              </p>
            </div>

            {/* Program Sources List */}
            <div className="rounded-lg border bg-muted/40 p-3.5 space-y-2.5">
              <h5 className="font-semibold text-xs text-primary flex items-center gap-1.5">
                <FileText className="size-3.5" />
                {t('program.methodology.sourcesGuide.title')}
              </h5>
              <p className="text-xs text-muted-foreground">
                {t('program.methodology.sourcesGuide.subtitle')}
              </p>
              <div className="grid gap-2 sm:grid-cols-2 pt-1">
                {programList.map((item) => (
                  <a
                    className="flex items-center justify-between rounded-md border border-border/60 bg-background/80 px-2.5 py-1.5 text-xs text-foreground/90 hover:border-primary hover:text-primary transition-all group"
                    href={item.documentUrl || item.sourceUrl}
                    key={item.partyId}
                    rel="noreferrer"
                    target="_blank"
                  >
                    <span className="font-medium truncate">
                      {language === 'kk' ? item.nameKk : item.nameRu}
                    </span>
                    <span className="flex items-center gap-1 text-[11px] text-muted-foreground group-hover:text-primary shrink-0 ml-2">
                      <span className="rounded bg-muted px-1 py-0.2 font-mono text-[10px]">
                        {item.format}
                      </span>
                      <ExternalLink className="size-3" />
                    </span>
                  </a>
                ))}
              </div>
            </div>

            {/* Methodology References for Matrix */}
            <div className="pt-2 border-t space-y-2">
              <h5 className="text-xs font-semibold uppercase tracking-wider text-muted-foreground">
                {t('program.methodology.matrixGuide.references.title')}
              </h5>
              <ul className="space-y-1.5 text-xs text-muted-foreground">
                <li className="flex items-center gap-1.5">
                  <ExternalLink className="size-3.5 shrink-0 text-primary" />
                  <a
                    className="text-primary hover:underline"
                    href="https://manifesto-project.wzb.eu/"
                    rel="noreferrer"
                    target="_blank"
                  >
                    {t('program.methodology.matrixGuide.references.manifesto')}
                  </a>
                </li>
                <li className="flex items-center gap-1.5">
                  <ExternalLink className="size-3.5 shrink-0 text-primary" />
                  <a
                    className="text-primary hover:underline"
                    href="https://en.wikipedia.org/wiki/Krippendorff%27s_alpha"
                    rel="noreferrer"
                    target="_blank"
                  >
                    {t('program.methodology.matrixGuide.references.krippendorff')}
                  </a>
                </li>
              </ul>
            </div>
          </div>
        )}

        {/* Statement Types Section */}
        {(mode === 'types' || (mode === 'all' && activeTab === 'types')) && (
          <div className="space-y-4 pt-2 text-sm text-foreground/90">
            <div className="grid gap-2.5 sm:grid-cols-2">
              {/* Problem */}
              <div className="rounded-lg border bg-muted/40 p-3 space-y-1">
                <span className="inline-block px-1.5 py-0.5 rounded text-[10px] font-bold bg-blue-500/15 text-blue-600 dark:text-blue-400">
                  {t('program.methodology.typesGuide.items.problem.title')}
                </span>
                <p className="text-xs text-muted-foreground">
                  {t('program.methodology.typesGuide.items.problem.desc')}
                </p>
                <p className="text-[11px] italic text-foreground/80 pt-0.5">
                  {t('program.methodology.typesGuide.items.problem.example')}
                </p>
              </div>

              {/* Goal */}
              <div className="rounded-lg border bg-muted/40 p-3 space-y-1">
                <span className="inline-block px-1.5 py-0.5 rounded text-[10px] font-bold bg-orange-500/15 text-orange-600 dark:text-orange-400">
                  {t('program.methodology.typesGuide.items.goal.title')}
                </span>
                <p className="text-xs text-muted-foreground">
                  {t('program.methodology.typesGuide.items.goal.desc')}
                </p>
                <p className="text-[11px] italic text-foreground/80 pt-0.5">
                  {t('program.methodology.typesGuide.items.goal.example')}
                </p>
              </div>

              {/* Instrument */}
              <div className="rounded-lg border bg-muted/40 p-3 space-y-1">
                <span className="inline-block px-1.5 py-0.5 rounded text-[10px] font-bold bg-emerald-500/15 text-emerald-600 dark:text-emerald-400">
                  {t('program.methodology.typesGuide.items.instrument.title')}
                </span>
                <p className="text-xs text-muted-foreground">
                  {t('program.methodology.typesGuide.items.instrument.desc')}
                </p>
                <p className="text-[11px] italic text-foreground/80 pt-0.5">
                  {t('program.methodology.typesGuide.items.instrument.example')}
                </p>
              </div>

              {/* Commitment */}
              <div className="rounded-lg border bg-muted/40 p-3 space-y-1">
                <span className="inline-block px-1.5 py-0.5 rounded text-[10px] font-bold bg-amber-500/15 text-amber-600 dark:text-amber-400">
                  {t('program.methodology.typesGuide.items.commitment.title')}
                </span>
                <p className="text-xs text-muted-foreground">
                  {t('program.methodology.typesGuide.items.commitment.desc')}
                </p>
                <p className="text-[11px] italic text-foreground/80 pt-0.5">
                  {t('program.methodology.typesGuide.items.commitment.example')}
                </p>
              </div>

              {/* Achievement */}
              <div className="rounded-lg border bg-muted/40 p-3 space-y-1">
                <span className="inline-block px-1.5 py-0.5 rounded text-[10px] font-bold bg-pink-500/15 text-pink-600 dark:text-pink-400">
                  {t('program.methodology.typesGuide.items.achievement.title')}
                </span>
                <p className="text-xs text-muted-foreground">
                  {t('program.methodology.typesGuide.items.achievement.desc')}
                </p>
                <p className="text-[11px] italic text-foreground/80 pt-0.5">
                  {t('program.methodology.typesGuide.items.achievement.example')}
                </p>
              </div>

              {/* Description */}
              <div className="rounded-lg border bg-muted/40 p-3 space-y-1">
                <span className="inline-block px-1.5 py-0.5 rounded text-[10px] font-bold bg-green-500/15 text-green-700 dark:text-green-400">
                  {t('program.methodology.typesGuide.items.description.title')}
                </span>
                <p className="text-xs text-muted-foreground">
                  {t('program.methodology.typesGuide.items.description.desc')}
                </p>
                <p className="text-[11px] italic text-foreground/80 pt-0.5">
                  {t('program.methodology.typesGuide.items.description.example')}
                </p>
              </div>
            </div>

            {/* Methodology References for Statement Types */}
            <div className="pt-2 border-t space-y-2">
              <h5 className="text-xs font-semibold uppercase tracking-wider text-muted-foreground">
                {t('program.methodology.typesGuide.references.title')}
              </h5>
              <ul className="space-y-1.5 text-xs text-muted-foreground">
                <li className="flex items-center gap-1.5">
                  <ExternalLink className="size-3.5 shrink-0 text-primary" />
                  <a
                    className="text-primary hover:underline"
                    href="https://manifesto-project.wzb.eu/"
                    rel="noreferrer"
                    target="_blank"
                  >
                    {t('program.methodology.typesGuide.references.speechActs')}
                  </a>
                </li>
                <li className="flex items-center gap-1.5">
                  <ExternalLink className="size-3.5 shrink-0 text-primary" />
                  <a
                    className="text-primary hover:underline"
                    href="https://en.wikipedia.org/wiki/Krippendorff%27s_alpha"
                    rel="noreferrer"
                    target="_blank"
                  >
                    {t('program.methodology.typesGuide.references.krippendorff')}
                  </a>
                </li>
              </ul>
            </div>
          </div>
        )}

        {/* Sources Section (when mode === 'all' and activeTab === 'sources') */}
        {mode === 'all' && activeTab === 'sources' && (
          <div className="space-y-4 pt-2 text-sm text-foreground/90">
            <div>
              <h4 className="font-semibold text-sm text-foreground">
                {t('program.methodology.sourcesGuide.title')}
              </h4>
              <p className="text-xs text-muted-foreground mt-0.5">
                {t('program.methodology.sourcesGuide.subtitle')}
              </p>
            </div>

            <div className="space-y-2">
              {programList.map((item) => (
                <div
                  className="flex flex-col sm:flex-row sm:items-center justify-between gap-2 rounded-lg border bg-muted/40 p-3"
                  key={item.partyId}
                >
                  <div>
                    <h5 className="font-semibold text-xs text-foreground">
                      {language === 'kk' ? item.nameKk : item.nameRu}
                    </h5>
                    <p className="text-xs text-muted-foreground">
                      {language === 'kk' ? item.docTitleKk : item.docTitleRu}
                    </p>
                  </div>
                  <Button asChild className="shrink-0 self-start sm:self-auto" size="xs" variant="outline">
                    <a href={item.documentUrl || item.sourceUrl} rel="noreferrer" target="_blank">
                      <FileText className="size-3" data-icon="inline-start" />
                      <span>{t('program.methodology.sourcesGuide.openDoc')}</span>
                      <ExternalLink className="size-3 text-muted-foreground ml-1" />
                    </a>
                  </Button>
                </div>
              ))}
            </div>
          </div>
        )}

        {/* Science Guide Section (when mode === 'all' and activeTab === 'science') */}
        {mode === 'all' && activeTab === 'science' && (
          <div className="space-y-4 pt-2 text-sm text-foreground/90">
            <div className="rounded-lg border bg-muted/40 p-3.5 space-y-1">
              <h5 className="font-semibold text-xs text-primary flex items-center gap-1.5">
                <CheckCircle2 className="size-3.5" />
                {t('program.methodology.scienceGuide.attention.title')}
              </h5>
              <p className="text-xs text-muted-foreground leading-normal">
                {t('program.methodology.scienceGuide.attention.text')}
              </p>
            </div>

            <div className="rounded-lg border bg-muted/40 p-3.5 space-y-1">
              <h5 className="font-semibold text-xs text-primary flex items-center gap-1.5">
                <CheckCircle2 className="size-3.5" />
                {t('program.methodology.scienceGuide.reliability.title')}
              </h5>
              <p className="text-xs text-muted-foreground leading-normal">
                {t('program.methodology.scienceGuide.reliability.text')}
              </p>
            </div>

            <div className="pt-2 border-t space-y-2">
              <h5 className="text-xs font-semibold uppercase tracking-wider text-muted-foreground">
                {t('program.methodology.scienceGuide.references.title')}
              </h5>
              <ul className="space-y-1.5 text-xs text-muted-foreground">
                <li className="flex items-center gap-1.5">
                  <ExternalLink className="size-3.5 shrink-0 text-primary" />
                  <a
                    className="text-primary hover:underline"
                    href="https://en.wikipedia.org/wiki/Krippendorff%27s_alpha"
                    rel="noreferrer"
                    target="_blank"
                  >
                    {t('program.methodology.scienceGuide.references.krippendorff')}
                  </a>
                </li>
                <li className="flex items-center gap-1.5">
                  <ExternalLink className="size-3.5 shrink-0 text-primary" />
                  <a
                    className="text-primary hover:underline"
                    href="https://manifesto-project.wzb.eu/"
                    rel="noreferrer"
                    target="_blank"
                  >
                    {t('program.methodology.scienceGuide.references.manifesto')}
                  </a>
                </li>
              </ul>
            </div>
          </div>
        )}
      </DialogContent>
    </Dialog>
  )
}
