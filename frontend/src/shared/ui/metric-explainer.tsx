import { HelpCircle } from 'lucide-react'
import type { ReactNode } from 'react'

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
  /** Shown as the dialog heading and as the trigger's accessible name. */
  title: string
  /** One sentence: what the metric is. */
  summary: string
  /** What the number does and does not support. Rendered as a list. */
  points: string[]
  /** Optional closing caveat, set apart from the list. */
  caveat?: ReactNode
  className?: string
}

/**
 * A "?" beside a metric that explains what it means and what it cannot show.
 *
 * Every comparative number on this site needs one: a share of attention, a list
 * position or a top-ten proportion all invite a reading the data does not
 * support, and the limits belong next to the figure rather than in a footnote
 * nobody scrolls to.
 */
export function MetricExplainer({ title, summary, points, caveat, className }: Props) {
  return (
    <Dialog>
      <DialogTrigger asChild>
        <Button
          aria-label={title}
          className={className}
          size="icon-xs"
          title={title}
          variant="ghost"
        >
          <HelpCircle className="size-4 text-muted-foreground transition-colors hover:text-foreground" />
        </Button>
      </DialogTrigger>

      <DialogContent className="max-h-[85vh] max-w-lg overflow-y-auto">
        <DialogHeader>
          <DialogTitle>{title}</DialogTitle>
          <DialogDescription>{summary}</DialogDescription>
        </DialogHeader>

        <ul className="space-y-2.5 text-sm text-muted-foreground">
          {points.map((point) => (
            <li className="flex gap-2" key={point}>
              <span aria-hidden className="mt-2 size-1.5 shrink-0 rounded-full bg-muted-foreground/50" />
              <span>{point}</span>
            </li>
          ))}
        </ul>

        {caveat ? (
          <p className="rounded-md border bg-muted/40 p-3 text-xs text-muted-foreground">
            {caveat}
          </p>
        ) : null}
      </DialogContent>
    </Dialog>
  )
}
