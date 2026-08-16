import { Link, useParams } from 'react-router'

import { Button } from '@/shared/ui/button'

export function CandidateDetailsPage() {
  const { candidateId, language } = useParams()

  return (
    <main className="grid min-h-svh place-items-center p-6">
      <div className="flex max-w-lg flex-col items-center gap-4 text-center">
        <p className="text-sm text-muted-foreground">{candidateId}</p>
        <h1 className="text-4xl font-semibold tracking-tight">Quryltai</h1>
        <Button asChild variant="outline">
          <Link to={`/${language}/candidates`}>Candidates</Link>
        </Button>
      </div>
    </main>
  )
}
