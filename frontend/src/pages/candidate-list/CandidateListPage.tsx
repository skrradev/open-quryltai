import { useParams } from 'react-router'

import { Badge } from '@/shared/ui/badge'

export function CandidateListPage() {
  const { language } = useParams()

  return (
    <main className="grid min-h-svh place-items-center p-6">
      <div className="flex flex-col items-center gap-4 text-center">
        <Badge variant="secondary">{language?.toUpperCase()}</Badge>
        <h1 className="text-4xl font-semibold tracking-tight">Quryltai</h1>
      </div>
    </main>
  )
}
