import { PARTY_BRANDING } from '@/entities/party/model/party-branding'
import { useRouteLanguage } from '@/shared/lib/use-route-language'
import { cn } from '@/shared/lib/utils'

interface Props {
  partyId: string
  alt?: string
  size?: 'sm' | 'md' | 'lg' | 'xl'
  className?: string
}

export function PartyLogo({ partyId, alt, size = 'md', className }: Props) {
  const language = useRouteLanguage()
  const branding = PARTY_BRANDING[partyId]

  if (!branding) {
    return null
  }

  const logoUrl = branding.getLogoUrl(language)
  const isLightOnly = branding.logoVariant === 'LIGHT_ONLY'

  const imgSizeClasses = {
    sm: 'max-h-5 max-w-[60px]',
    md: 'max-h-7 max-w-[90px]',
    lg: 'max-h-10 max-w-[130px]',
    xl: 'max-h-12 max-w-[160px]',
  }

  const containerClasses = {
    sm: 'h-8 min-w-[32px] px-2 rounded-md',
    md: 'h-11 min-w-[44px] px-3 rounded-lg',
    lg: 'h-14 min-w-[56px] px-3.5 rounded-xl',
    xl: 'h-16 min-w-[64px] px-4 rounded-xl',
  }

  return (
    <div
      className={cn(
        'inline-flex items-center justify-center shrink-0 overflow-hidden select-none transition-transform',
        isLightOnly
          ? 'shadow-xs'
          : 'bg-white dark:bg-white border border-border/40 shadow-xs',
        containerClasses[size],
        className,
      )}
      style={isLightOnly ? { backgroundColor: branding.brandColor } : undefined}
    >
      <img
        alt={alt ?? partyId}
        className={cn('h-full w-auto max-w-full object-contain', imgSizeClasses[size])}
        loading="eager"
        src={logoUrl}
      />
    </div>
  )
}
