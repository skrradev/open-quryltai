export const kk = {
  app: {
    name: 'Quryltai',
  },
  actions: {
    backToCandidates: 'Үміткерлерге оралу',
    goToCandidates: 'Үміткерлерге өту',
    retry: 'Қайталап көру',
  },
  candidate: {
    card: {
      birthYear: 'Туған жылы: {{year}}',
    },
    list: {
      description: 'Үміткерлер туралы мәліметтер',
      empty: {
        title: 'Үміткерлер табылмады',
        description: 'Қазір көрсетуге болатын үміткерлер жоқ.',
      },
      title: 'Үміткерлер',
      total: 'Барлығы: {{count}}',
    },
    details: {
      title: 'Үміткер',
    },
  },
  errors: {
    candidates: {
      title: 'Деректерді жүктеу мүмкін болмады',
      description: 'Байланысты тексеріп, әрекетті қайталап көріңіз.',
    },
    notFound: {
      title: 'Бет табылмады',
      description: 'Сұралған бет жоқ немесе оның мекенжайы өзгерген.',
    },
  },
  language: {
    selectorLabel: 'Тілді таңдау',
    switchTo: '{{language}} тіліне ауысу',
    names: {
      kk: 'қазақ',
      ru: 'орыс',
    },
  },
} as const
