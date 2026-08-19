import { useState } from 'react'

import { cn } from '@/shared/lib/utils'

function initials(fullName: string): string {
  return fullName
    .split(/\s+/)
    .filter(Boolean)
    .slice(0, 2)
    .map((part) => part[0]?.toUpperCase() ?? '')
    .join('')
}

interface CandidateAvatarProps {
  className?: string
  fullName: string
  /** Thumbnail URL, or null when the candidate has no published photo. */
  src: string | null
}

/**
 * Small portrait for list rows. Falls back to initials, which is the common case:
 * most candidates have no photo yet, so the fallback must look deliberate rather
 * than broken. Decorative by design — the candidate name always sits next to it,
 * so announcing the image again would just duplicate it for screen readers.
 */
export function CandidateAvatar({
  className,
  fullName,
  src,
}: CandidateAvatarProps) {
  const [failed, setFailed] = useState(false)

  return (
    <span
      aria-hidden="true"
      className={cn(
        'grid size-10 shrink-0 place-items-center overflow-hidden rounded-full border bg-muted text-xs font-medium text-muted-foreground select-none',
        className,
      )}
    >
      {src && !failed ? (
        <img
          alt=""
          className="size-full object-cover"
          decoding="async"
          loading="lazy"
          onError={() => setFailed(true)}
          src={src}
        />
      ) : (
        initials(fullName)
      )}
    </span>
  )
}
