import { ChevronLeft, ChevronRight } from 'lucide-react'
import { useTranslation } from 'react-i18next'

import { Button } from '@/shared/ui/button'
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/shared/ui/select'

const pageSizes = [12, 24, 48, 96] as const

interface CandidatePaginationProps {
  disabled?: boolean
  onPageChange: (page: number) => void
  onPageSizeChange: (size: number) => void
  page: number
  size: number
  totalPages: number
}

export function CandidatePagination({
  disabled,
  onPageChange,
  onPageSizeChange,
  page,
  size,
  totalPages,
}: CandidatePaginationProps) {
  const { t } = useTranslation()

  if (totalPages === 0) return null

  return (
    <nav
      aria-label={t('pagination.label')}
      className="mt-8 flex flex-col-reverse items-center justify-between gap-4 border-t pt-6 sm:flex-row"
    >
      <div className="flex items-center gap-2">
        <label className="text-sm text-muted-foreground" htmlFor="page-size">
          {t('pagination.pageSize')}
        </label>
        <Select
          disabled={disabled}
          onValueChange={(value) => onPageSizeChange(Number(value))}
          value={String(size)}
        >
          <SelectTrigger id="page-size" size="sm">
            <SelectValue />
          </SelectTrigger>
          <SelectContent>
            {pageSizes.map((pageSize) => (
              <SelectItem key={pageSize} value={String(pageSize)}>
                {pageSize}
              </SelectItem>
            ))}
          </SelectContent>
        </Select>
      </div>

      <div className="flex items-center gap-2">
        <Button
          aria-label={t('pagination.previous')}
          disabled={disabled || page === 0}
          onClick={() => onPageChange(page - 1)}
          size="icon"
          variant="outline"
        >
          <ChevronLeft aria-hidden="true" />
        </Button>
        <p aria-live="polite" className="min-w-28 text-center text-sm font-medium">
          {t('pagination.status', { current: page + 1, total: totalPages })}
        </p>
        <Button
          aria-label={t('pagination.next')}
          disabled={disabled || page >= totalPages - 1}
          onClick={() => onPageChange(page + 1)}
          size="icon"
          variant="outline"
        >
          <ChevronRight aria-hidden="true" />
        </Button>
      </div>
    </nav>
  )
}
