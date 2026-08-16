export const ru = {
  app: {
    name: 'Quryltai',
  },
  actions: {
    backToCandidates: 'Вернуться к кандидатам',
    goToCandidates: 'Перейти к кандидатам',
    retry: 'Повторить',
  },
  candidate: {
    card: {
      birthYear: 'Год рождения: {{year}}',
    },
    list: {
      description: 'Сведения о кандидатах',
      empty: {
        title: 'Кандидаты не найдены',
        description: 'Сейчас нет кандидатов для отображения.',
      },
      title: 'Кандидаты',
      total: 'Всего: {{count}}',
    },
    details: {
      title: 'Кандидат',
    },
  },
  errors: {
    candidates: {
      title: 'Не удалось загрузить данные',
      description: 'Проверьте подключение и повторите попытку.',
    },
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
