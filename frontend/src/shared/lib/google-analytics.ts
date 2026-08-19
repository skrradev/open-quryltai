const measurementId = import.meta.env.VITE_GA_MEASUREMENT_ID?.trim()

declare global { interface Window { dataLayer?: unknown[]; gtag?: (...args: unknown[]) => void } }

export function initializeAnalytics() {
  if (!measurementId || window.gtag) return
  const script = document.createElement('script')
  script.async = true
  script.src = `https://www.googletagmanager.com/gtag/js?id=${encodeURIComponent(measurementId)}`
  document.head.append(script)
  window.dataLayer = window.dataLayer ?? []
  window.gtag = (...args: unknown[]) => window.dataLayer?.push(args)
  window.gtag('js', new Date())
  window.gtag('config', measurementId, { send_page_view: false })
}

export function trackPageView(path: string) {
  if (measurementId && window.gtag) window.gtag('event', 'page_view', { page_location: window.location.href, page_path: path, page_title: document.title })
}
