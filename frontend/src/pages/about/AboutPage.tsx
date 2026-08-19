import { Database, ExternalLink, GitFork, Languages, Scale } from 'lucide-react'
import { useTranslation } from 'react-i18next'

const REPOSITORY_URL = 'https://github.com/skrradev/open-quryltai'
const AUTHOR_LINKEDIN_URL = 'https://www.linkedin.com/in/zhanarys-toremurat-13057019b/'

export function AboutPage() {
  const { t } = useTranslation()

  const principles = [
    { icon: Database, title: t('about.principles.source.title'), description: t('about.principles.source.description') },
    { icon: Languages, title: t('about.principles.language.title'), description: t('about.principles.language.description') },
    { icon: Scale, title: t('about.principles.method.title'), description: t('about.principles.method.description') },
  ]

  return (
    <main className="mx-auto min-h-svh w-full max-w-5xl px-4 py-24 sm:px-6 lg:px-8">
      <header className="max-w-3xl">
        <p className="text-sm font-semibold tracking-wide text-primary uppercase">{t('about.eyebrow')}</p>
        <h1 className="mt-2 text-4xl font-semibold tracking-tight sm:text-5xl">{t('about.title')}</h1>
        <p className="mt-5 text-base leading-7 text-muted-foreground sm:text-lg">{t('about.description')}</p>
      </header>

      <section aria-labelledby="about-principles" className="mt-12 border-t pt-8">
        <h2 className="text-2xl font-semibold tracking-tight" id="about-principles">{t('about.principles.title')}</h2>
        <ul className="mt-6 list-disc space-y-6">
          {principles.map(({ icon: Icon, title, description }) => (
            <li className="ml-5 pl-1" key={title}>
              <div className="flex items-center gap-2">
                <Icon aria-hidden="true" className="size-4 text-primary" />
                <h3 className="font-semibold">{title}</h3>
              </div>
              <p className="mt-2 text-sm leading-6 text-muted-foreground">{description}</p>
            </li>
          ))}
        </ul>
      </section>

      <section className="mt-12 border-t pt-8">
        <div className="space-y-8">
          <AboutItem title={t('about.data.title')} description={t('about.data.description')} />
          <AboutItem title={t('about.limitations.title')} description={t('about.limitations.description')} />
          <AboutItem title={t('about.nonCampaigning.title')} description={t('about.nonCampaigning.description')} />
        </div>
      </section>

      <section className="mt-12 border-t pt-8">
        <div className="flex items-center gap-2">
          <GitFork aria-hidden="true" className="size-4 text-primary" />
          <h2 className="font-semibold">{t('about.openSource.title')}</h2>
        </div>
        <p className="mt-2 text-sm leading-6 text-muted-foreground">{t('about.openSource.description')}</p>
        <a
          className="mt-4 inline-flex text-sm font-medium text-primary underline-offset-4 hover:underline"
          href={REPOSITORY_URL}
          rel="noreferrer"
          target="_blank"
        >
          {t('about.openSource.link')}
          <ExternalLink aria-hidden="true" className="ml-1 size-3.5" />
        </a>
        <p className="mt-5 text-sm text-muted-foreground">
          {t('about.openSource.authorLabel')}{' '}
          <a
            className="font-medium text-primary underline-offset-4 hover:underline"
            href={AUTHOR_LINKEDIN_URL}
            rel="noreferrer"
            target="_blank"
          >
            Toremurat Zhanarys
          </a>
        </p>
      </section>
    </main>
  )
}

function AboutItem({ title, description }: { title: string; description: string }) {
  return (
    <div>
      <h2 className="font-semibold">{title}</h2>
      <p className="mt-2 text-sm leading-6 text-muted-foreground">{description}</p>
    </div>
  )
}
