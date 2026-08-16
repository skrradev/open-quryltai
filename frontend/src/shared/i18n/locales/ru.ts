export const ru = {
  app: {
    name: 'Quryltai',
  },
  common: {
    no: 'Нет',
    yes: 'Да',
  },
  actions: {
    backToCandidates: 'Вернуться к кандидатам',
    backToParties: 'Вернуться к партиям',
    goToCandidates: 'Перейти к кандидатам',
    retry: 'Повторить',
    viewCandidates: 'Посмотреть кандидатов',
    viewParty: 'Открыть страницу партии',
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
      fields: {
        birthYear: 'Год рождения',
        gender: 'Пол',
        incumbent: 'Действующий депутат',
        party: 'Партия',
        partyInsider: 'Представитель партийного аппарата',
        place: 'Место проживания',
        position: 'Должность',
      },
      listOrder: '№{{order}} в списке',
      notFound: {
        title: 'Кандидат не найден',
        description: 'Кандидата с таким номером не существует.',
      },
      sections: {
        basic: 'Основные сведения',
        political: 'Политические сведения',
        professional: 'Профессиональные сведения',
      },
      title: 'Кандидат',
    },
  },
  errors: {
    candidate: {
      title: 'Не удалось загрузить сведения о кандидате',
      description: 'Проверьте подключение и повторите попытку.',
    },
    candidates: {
      title: 'Не удалось загрузить данные',
      description: 'Проверьте подключение и повторите попытку.',
    },
    parties: {
      title: 'Не удалось загрузить сведения о партиях',
      description: 'Проверьте подключение и повторите попытку.',
    },
    party: {
      title: 'Не удалось загрузить сведения о партии',
      description: 'Проверьте подключение и повторите попытку.',
    },
    statistics: {
      title: 'Не удалось загрузить статистику',
      description: 'Проверьте подключение и повторите попытку.',
    },
    notFound: {
      title: 'Страница не найдена',
      description: 'Запрошенной страницы не существует или её адрес изменился.',
    },
  },
  enums: {
    employerType: {
      PRIVATE_COMPANY: 'Частная компания',
      STATE_BODY: 'Государственный орган',
      QUASI_GOVERNMENTAL: 'Квазигосударственная организация',
      POLITICAL_PARTY: 'Политическая партия',
      NGO: 'Неправительственная организация',
      SELF_EMPLOYED: 'Самозанятый',
      UNCLEAR: 'Неясно',
    },
    gender: {
      M: 'Мужчина',
      F: 'Женщина',
    },
    placeType: {
      CITY: 'Город',
      REGION: 'Область',
      DISTRICT: 'Район',
      VILLAGE: 'Село',
      SETTLEMENT: 'Поселок',
    },
    sector: {
      GOVERNMENT: 'Государственная служба',
      BUSINESS: 'Бизнес',
      PARTY_APPARATUS: 'Партийный аппарат',
      LEGISLATOR: 'Законодатель',
      EDUCATION_AND_SCIENCE: 'Образование и наука',
      HEALTHCARE: 'Здравоохранение',
      CULTURE: 'Культура',
      SPORT: 'Спорт',
      CIVIL_SOCIETY: 'Гражданское общество',
      LAW: 'Право',
      MEDIA: 'Средства массовой информации',
      AGRICULTURE: 'Сельское хозяйство',
      OTHER_OR_UNCLEAR: 'Другое или неясно',
    },
  },
  filters: {
    all: 'Все',
    employerType: 'Тип работодателя',
    gender: 'Пол',
    incumbent: 'Статус действующего депутата',
    party: 'Партия',
    partyInsider: 'Партийный аппарат',
    place: 'Место проживания',
    placeType: 'Тип населённого пункта',
    reset: 'Сбросить фильтры',
    search: {
      action: 'Найти',
      label: 'Поиск кандидатов',
      placeholder: 'По имени или должности',
    },
    sector: 'Сфера деятельности',
    sort: {
      label: 'Сортировка',
      options: {
        partyAsc: 'Партия: А–Я',
        partyDesc: 'Партия: Я–А',
        nameAsc: 'Имя: А–Я',
        nameDesc: 'Имя: Я–А',
        birthYearDesc: 'Возраст: по возрастанию',
        birthYearAsc: 'Возраст: по убыванию',
        listOrderAsc: 'Номер в списке: по возрастанию',
        listOrderDesc: 'Номер в списке: по убыванию',
      },
    },
    title: 'Фильтры',
  },
  language: {
    selectorLabel: 'Выбор языка',
    switchTo: 'Переключиться на {{language}} язык',
    names: {
      kk: 'казахский',
      ru: 'русский',
    },
  },
  navigation: {
    candidates: 'Кандидаты',
    label: 'Основная навигация',
    overview: 'Обзор',
    parties: 'Партии',
  },
  pagination: {
    label: 'Страницы списка кандидатов',
    next: 'Следующая страница',
    pageSize: 'На странице',
    previous: 'Предыдущая страница',
    status: 'Страница {{current}} из {{total}}',
  },
  party: {
    list: {
      candidateCount: '{{count}} кандидатов',
      description: 'Политические партии, выдвинувшие кандидатов на выборах в Мажилис 2026 года.',
      title: 'Партии',
    },
    details: {
      eyebrow: 'Статистика партии',
      notFound: {
        title: 'Партия не найдена',
        description: 'Партии с таким идентификатором не существует.',
      },
      summary: {
        title: 'Ключевые показатели',
        candidates: 'Всего кандидатов',
        averageAge: 'Средний возраст (2026)',
        incumbents: 'Действующие депутаты',
        insiders: 'Представители партийного аппарата',
      },
      charts: {
        gender: {
          title: 'Гендерный состав',
          description: 'Распределение кандидатов партии по полу',
        },
        age: {
          title: 'Возрастные группы',
          description: 'Распределение по возрасту в 2026 году',
        },
        sectors: {
          title: 'Сферы деятельности',
          description: 'Основные профессиональные сферы кандидатов партии',
        },
      },
    },
  },
  statistics: {
    title: 'Обзор данных о выборах',
    description:
      'Состав и профессиональный профиль кандидатов на выборах в Мажилис 2026 года.',
    summary: {
      title: 'Ключевые показатели',
      candidates: 'Всего кандидатов',
      parties: 'Политические партии',
      averageAge: 'Средний возраст (2026)',
      incumbents: 'Действующие депутаты',
    },
    charts: {
      parties: {
        title: 'По партиям',
        description: 'Количество кандидатов от каждой партии',
      },
      gender: {
        title: 'Гендерный состав',
        description: 'Распределение кандидатов по полу',
      },
      age: {
        title: 'Возрастные группы',
        description: 'Распределение по возрасту в 2026 году',
      },
      sectors: {
        title: 'Сферы деятельности',
        description: 'Основные профессиональные сферы кандидатов',
      },
    },
  },
} as const
