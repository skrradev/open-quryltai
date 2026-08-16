export const ru = {
  app: {
    name: 'Quryltai',
  },
  actions: {
    backToCandidates: 'Вернуться к кандидатам',
    goToCandidates: 'Перейти к кандидатам',
  },
  candidate: {
    list: {
      title: 'Кандидаты',
    },
    details: {
      title: 'Кандидат',
    },
  },
  errors: {
    notFound: {
      title: 'Страница не найдена',
      description: 'Запрошенной страницы не существует или её адрес изменился.',
    },
  },
  language: {
    selectorLabel: 'Выбор языка',
    switchTo: 'Переключиться на {{language}} язык',
    names: {
      kk: 'казахский',
      ru: 'русский',
    },
  },
} as const
