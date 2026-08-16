export const kk = {
  app: {
    name: 'Quryltai',
  },
  common: {
    no: 'Жоқ',
    yes: 'Иә',
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
      fields: {
        birthYear: 'Туған жылы',
        gender: 'Жынысы',
        incumbent: 'Қазіргі депутат',
        party: 'Партия',
        partyInsider: 'Партия аппаратының өкілі',
        place: 'Тұрғылықты жері',
        position: 'Лауазымы',
      },
      listOrder: 'Тізімдегі №{{order}}',
      notFound: {
        title: 'Үміткер табылмады',
        description: 'Мұндай нөмірі бар үміткер жоқ.',
      },
      sections: {
        basic: 'Негізгі мәліметтер',
        political: 'Саяси мәліметтер',
        professional: 'Кәсіби мәліметтер',
      },
      title: 'Үміткер',
    },
  },
  errors: {
    candidate: {
      title: 'Үміткер туралы деректерді жүктеу мүмкін болмады',
      description: 'Байланысты тексеріп, әрекетті қайталап көріңіз.',
    },
    candidates: {
      title: 'Деректерді жүктеу мүмкін болмады',
      description: 'Байланысты тексеріп, әрекетті қайталап көріңіз.',
    },
    notFound: {
      title: 'Бет табылмады',
      description: 'Сұралған бет жоқ немесе оның мекенжайы өзгерген.',
    },
  },
  enums: {
    employerType: {
      PRIVATE_COMPANY: 'Жекеменшік компания',
      STATE_BODY: 'Мемлекеттік орган',
      QUASI_GOVERNMENTAL: 'Квазимемлекеттік ұйым',
      POLITICAL_PARTY: 'Саяси партия',
      NGO: 'Үкіметтік емес ұйым',
      SELF_EMPLOYED: 'Өзін-өзі жұмыспен қамтыған',
      UNCLEAR: 'Анықталмаған',
    },
    gender: {
      M: 'Ер',
      F: 'Әйел',
    },
    placeType: {
      CITY: 'Қала',
      REGION: 'Облыс',
      DISTRICT: 'Аудан',
      VILLAGE: 'Ауыл',
      SETTLEMENT: 'Кент',
    },
    sector: {
      GOVERNMENT: 'Мемлекеттік қызмет',
      BUSINESS: 'Бизнес',
      PARTY_APPARATUS: 'Партиялық аппарат',
      LEGISLATOR: 'Заң шығарушы',
      EDUCATION_AND_SCIENCE: 'Білім және ғылым',
      HEALTHCARE: 'Денсаулық сақтау',
      CULTURE: 'Мәдениет',
      SPORT: 'Спорт',
      CIVIL_SOCIETY: 'Азаматтық қоғам',
      LAW: 'Құқық',
      MEDIA: 'Бұқаралық ақпарат құралдары',
      AGRICULTURE: 'Ауыл шаруашылығы',
      OTHER_OR_UNCLEAR: 'Басқа немесе анықталмаған',
    },
  },
  filters: {
    all: 'Барлығы',
    employerType: 'Жұмыс беруші түрі',
    gender: 'Жынысы',
    incumbent: 'Қазіргі депутат мәртебесі',
    party: 'Партия',
    partyInsider: 'Партия аппараты',
    place: 'Тұрғылықты жері',
    placeType: 'Мекен түрі',
    reset: 'Сүзгілерді тазарту',
    search: {
      action: 'Іздеу',
      label: 'Үміткерлерді іздеу',
      placeholder: 'Аты-жөні немесе лауазымы бойынша',
    },
    sector: 'Қызмет саласы',
    sort: {
      label: 'Сұрыптау',
      options: {
        partyAsc: 'Партия: А–Я',
        partyDesc: 'Партия: Я–А',
        nameAsc: 'Аты-жөні: А–Я',
        nameDesc: 'Аты-жөні: Я–А',
        birthYearDesc: 'Жасы: кішіден үлкенге',
        birthYearAsc: 'Жасы: үлкеннен кішіге',
        listOrderAsc: 'Тізімдегі реті: өсуі бойынша',
        listOrderDesc: 'Тізімдегі реті: кемуі бойынша',
      },
    },
    title: 'Сүзгілер',
  },
  language: {
    selectorLabel: 'Тілді таңдау',
    switchTo: '{{language}} тіліне ауысу',
    names: {
      kk: 'қазақ',
      ru: 'орыс',
    },
  },
  pagination: {
    label: 'Үміткерлер тізімінің беттері',
    next: 'Келесі бет',
    pageSize: 'Бір бетте',
    previous: 'Алдыңғы бет',
    status: '{{current}} / {{total}} бет',
  },
} as const
