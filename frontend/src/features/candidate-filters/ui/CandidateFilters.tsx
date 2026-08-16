import { useEffect, useState, type FormEvent } from 'react'
import { RotateCcw, Search } from 'lucide-react'
import { useQuery } from '@tanstack/react-query'
import { useTranslation } from 'react-i18next'

import {
  employerTypes,
  genders,
  placeTypes,
  sectors,
  type CandidateListParams,
  type CandidateSort,
  type SortDirection,
} from '@/entities/candidate'
import { partyQueries } from '@/entities/party'
import { placeQueries } from '@/entities/place'
import type { Language } from '@/shared/config/language'
import { Button } from '@/shared/ui/button'
import { Input } from '@/shared/ui/input'
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/shared/ui/select'

const ALL = 'all'

interface FilterOption {
  label: string
  value: string
}

interface FilterSelectProps {
  disabled?: boolean
  id: string
  includeAll?: boolean
  label: string
  onValueChange: (value: string | undefined) => void
  options: FilterOption[]
  value?: string
}

function FilterSelect({
  disabled,
  id,
  includeAll = true,
  label,
  onValueChange,
  options,
  value,
}: FilterSelectProps) {
  const { t } = useTranslation()

  return (
    <div className="grid gap-1.5">
      <label className="text-xs font-medium text-muted-foreground" htmlFor={id}>
        {label}
      </label>
      <Select
        disabled={disabled}
        onValueChange={(nextValue) =>
          onValueChange(nextValue === ALL ? undefined : nextValue)
        }
        value={value ?? ALL}
      >
        <SelectTrigger className="w-full" id={id}>
          <SelectValue />
        </SelectTrigger>
        <SelectContent>
          {includeAll && <SelectItem value={ALL}>{t('filters.all')}</SelectItem>}
          {options.map((option) => (
            <SelectItem key={option.value} value={option.value}>
              {option.label}
            </SelectItem>
          ))}
        </SelectContent>
      </Select>
    </div>
  )
}

interface CandidateFiltersProps {
  hasCustomParams: boolean
  language: Language
  onReset: () => void
  onUpdate: (patch: Partial<CandidateListParams>) => void
  params: CandidateListParams
}

export function CandidateFilters({
  hasCustomParams,
  language,
  onReset,
  onUpdate,
  params,
}: CandidateFiltersProps) {
  const { t } = useTranslation()
  const [search, setSearch] = useState(params.search ?? '')
  const partiesQuery = useQuery(partyQueries.list(language))
  const placesQuery = useQuery(placeQueries.list(language))

  useEffect(() => {
    setSearch(params.search ?? '')
  }, [params.search])

  function handleSearch(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    onUpdate({ search: search.trim() || undefined })
  }

  const booleanOptions = [
    { label: t('common.yes'), value: 'true' },
    { label: t('common.no'), value: 'false' },
  ]
  const sortOptions: Array<
    FilterOption & { direction: SortDirection; sort: CandidateSort }
  > = [
    {
      direction: 'asc',
      label: t('filters.sort.options.partyAsc'),
      sort: 'party',
      value: 'party:asc',
    },
    {
      direction: 'desc',
      label: t('filters.sort.options.partyDesc'),
      sort: 'party',
      value: 'party:desc',
    },
    {
      direction: 'asc',
      label: t('filters.sort.options.nameAsc'),
      sort: 'name',
      value: 'name:asc',
    },
    {
      direction: 'desc',
      label: t('filters.sort.options.nameDesc'),
      sort: 'name',
      value: 'name:desc',
    },
    {
      direction: 'desc',
      label: t('filters.sort.options.birthYearDesc'),
      sort: 'birthYear',
      value: 'birthYear:desc',
    },
    {
      direction: 'asc',
      label: t('filters.sort.options.birthYearAsc'),
      sort: 'birthYear',
      value: 'birthYear:asc',
    },
    {
      direction: 'asc',
      label: t('filters.sort.options.listOrderAsc'),
      sort: 'listOrder',
      value: 'listOrder:asc',
    },
    {
      direction: 'desc',
      label: t('filters.sort.options.listOrderDesc'),
      sort: 'listOrder',
      value: 'listOrder:desc',
    },
  ]
  const selectedSort = `${params.sort ?? 'party'}:${params.direction ?? 'asc'}`

  return (
    <section aria-label={t('filters.title')} className="mb-8 rounded-xl border bg-card p-4">
      <form className="flex gap-2" onSubmit={handleSearch} role="search">
        <label className="sr-only" htmlFor="candidate-search">
          {t('filters.search.label')}
        </label>
        <Input
          id="candidate-search"
          onChange={(event) => setSearch(event.target.value)}
          placeholder={t('filters.search.placeholder')}
          type="search"
          value={search}
        />
        <Button type="submit">
          <Search aria-hidden="true" data-icon="inline-start" />
          {t('filters.search.action')}
        </Button>
      </form>

      <div className="mt-4 grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
        <FilterSelect
          disabled={partiesQuery.isPending || partiesQuery.isError}
          id="party-filter"
          label={t('filters.party')}
          onValueChange={(partyId) => onUpdate({ partyId })}
          options={(partiesQuery.data ?? []).map((party) => ({
            label: party.name,
            value: party.id,
          }))}
          value={params.partyId}
        />
        <FilterSelect
          disabled={placesQuery.isPending || placesQuery.isError}
          id="place-filter"
          label={t('filters.place')}
          onValueChange={(placeId) => onUpdate({ placeId })}
          options={(placesQuery.data ?? []).map((place) => ({
            label: place.name,
            value: place.id,
          }))}
          value={params.placeId}
        />
        <FilterSelect
          id="place-type-filter"
          label={t('filters.placeType')}
          onValueChange={(placeType) =>
            onUpdate({ placeType: placeType as CandidateListParams['placeType'] })
          }
          options={placeTypes.map((placeType) => ({
            label: t(`enums.placeType.${placeType}`),
            value: placeType,
          }))}
          value={params.placeType}
        />
        <FilterSelect
          id="sector-filter"
          label={t('filters.sector')}
          onValueChange={(sector) =>
            onUpdate({ sector: sector as CandidateListParams['sector'] })
          }
          options={sectors.map((sector) => ({
            label: t(`enums.sector.${sector}`),
            value: sector,
          }))}
          value={params.sector}
        />
        <FilterSelect
          id="employer-type-filter"
          label={t('filters.employerType')}
          onValueChange={(employerType) =>
            onUpdate({
              employerType: employerType as CandidateListParams['employerType'],
            })
          }
          options={employerTypes.map((employerType) => ({
            label: t(`enums.employerType.${employerType}`),
            value: employerType,
          }))}
          value={params.employerType}
        />
        <FilterSelect
          id="gender-filter"
          label={t('filters.gender')}
          onValueChange={(gender) =>
            onUpdate({ gender: gender as CandidateListParams['gender'] })
          }
          options={genders.map((gender) => ({
            label: t(`enums.gender.${gender}`),
            value: gender,
          }))}
          value={params.gender}
        />
        <FilterSelect
          id="incumbent-filter"
          label={t('filters.incumbent')}
          onValueChange={(incumbent) =>
            onUpdate({ incumbent: incumbent === undefined ? undefined : incumbent === 'true' })
          }
          options={booleanOptions}
          value={params.incumbent === undefined ? undefined : String(params.incumbent)}
        />
        <FilterSelect
          id="party-insider-filter"
          label={t('filters.partyInsider')}
          onValueChange={(partyInsider) =>
            onUpdate({
              partyInsider:
                partyInsider === undefined ? undefined : partyInsider === 'true',
            })
          }
          options={booleanOptions}
          value={
            params.partyInsider === undefined
              ? undefined
              : String(params.partyInsider)
          }
        />
      </div>

      <div className="mt-4 flex flex-col gap-3 border-t pt-4 sm:flex-row sm:items-end sm:justify-between">
        <FilterSelect
          id="sort-filter"
          includeAll={false}
          label={t('filters.sort.label')}
          onValueChange={(value) => {
            const option = sortOptions.find((candidate) => candidate.value === value)
            if (option) onUpdate({ direction: option.direction, sort: option.sort })
          }}
          options={sortOptions}
          value={selectedSort}
        />
        <Button disabled={!hasCustomParams} onClick={onReset} type="button" variant="ghost">
          <RotateCcw aria-hidden="true" data-icon="inline-start" />
          {t('filters.reset')}
        </Button>
      </div>
    </section>
  )
}
