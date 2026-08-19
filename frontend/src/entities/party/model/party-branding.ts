import type { Language } from '@/shared/config/language'

const PARTY_ASSET_BASE_URL = 'https://assets.open-quryltai.org/parties'

export interface PartyBranding {
  partyId: string
  brandColor: string
  logoVariant: 'COLOUR' | 'LIGHT_ONLY'
  getLogoUrl: (language: Language) => string
}

export const PARTY_BRANDING: Record<string, PartyBranding> = {
  adilet: {
    partyId: 'adilet',
    brandColor: '#290081',
    logoVariant: 'COLOUR',
    getLogoUrl: () => `${PARTY_ASSET_BASE_URL}/adilet/logo.svg`,
  },
  ak_zhol: {
    partyId: 'ak_zhol',
    brandColor: '#124B8B',
    logoVariant: 'COLOUR',
    getLogoUrl: () => `${PARTY_ASSET_BASE_URL}/ak_zhol/logo.png`,
  },
  auyl: {
    partyId: 'auyl',
    brandColor: '#085C4B',
    logoVariant: 'COLOUR',
    getLogoUrl: () => `${PARTY_ASSET_BASE_URL}/auyl/logo.svg`,
  },
  baitaq: {
    partyId: 'baitaq',
    brandColor: '#1F7036',
    logoVariant: 'LIGHT_ONLY',
    getLogoUrl: () => `${PARTY_ASSET_BASE_URL}/baitaq/logo.png`,
  },
  npk: {
    partyId: 'npk',
    brandColor: '#DC0F2D',
    logoVariant: 'COLOUR',
    getLogoUrl: (language: Language) =>
      language === 'kk'
        ? `${PARTY_ASSET_BASE_URL}/npk/logo-kk.svg`
        : `${PARTY_ASSET_BASE_URL}/npk/logo-ru.svg`,
  },
  osdp: {
    partyId: 'osdp',
    brandColor: '#0040B0',
    logoVariant: 'COLOUR',
    getLogoUrl: () => `${PARTY_ASSET_BASE_URL}/osdp/logo.png`,
  },
  respublica: {
    partyId: 'respublica',
    brandColor: '#4A78EC',
    logoVariant: 'COLOUR',
    getLogoUrl: () => `${PARTY_ASSET_BASE_URL}/respublica/logo.png`,
  },
}
