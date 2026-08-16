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
  pagination: {
    label: 'Страницы списка кандидатов',
    next: 'Следующая страница',
    pageSize: 'На странице',
    previous: 'Предыдущая страница',
    status: 'Страница {{current}} из {{total}}',
  },
} as const
