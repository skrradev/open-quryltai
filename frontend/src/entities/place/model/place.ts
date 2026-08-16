import type { CodeLabel } from '@/shared/api/types'

export interface CandidatePlace {
  id: string
  name: string
  type: CodeLabel
}

export interface Place extends CandidatePlace {
  parentRegionId: string | null
}
