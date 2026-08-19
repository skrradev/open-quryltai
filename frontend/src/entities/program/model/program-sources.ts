export interface PartyProgramSource {
  partyId: string
  sourceUrl: string
  documentUrl?: string
  format: 'PDF' | 'DOCX' | 'WEB'
  nameRu: string
  nameKk: string
  docTitleRu: string
  docTitleKk: string
}

export const PARTY_PROGRAM_SOURCES: Record<string, PartyProgramSource> = {
  adilet: {
    partyId: 'adilet',
    sourceUrl: 'https://adilet-partiyasy.kz/ru/kurultai/program',
    documentUrl:
      'https://adilet-partiyasy.kz/api/media/uploads/kurultai-docs/ru-566c1b37-cf91-4c84-99d8-e99f1e04266c.pdf',
    format: 'PDF',
    nameRu: '«Әділет»',
    nameKk: '«Әділет»',
    docTitleRu: 'Предвыборная программа партии «Әділет» (PDF, 153 тыс. знаков)',
    docTitleKk: '«Әділет» партиясының сайлауалды бағдарламасы (PDF)',
  },
  ak_zhol: {
    partyId: 'ak_zhol',
    sourceUrl: 'https://akzhol.kz/ru/program',
    format: 'WEB',
    nameRu: '«Ақ жол»',
    nameKk: '«Ақ жол»',
    docTitleRu: 'Официальная программа на сайте akzhol.kz (Веб-платформа)',
    docTitleKk: 'akzhol.kz сайтындағы ресми бағдарлама (Веб-платформа)',
  },
  auyl: {
    partyId: 'auyl',
    sourceUrl: 'https://auyl.kz/',
    documentUrl: 'https://auyl.kz/docs/programma-ru.docx',
    format: 'DOCX',
    nameRu: '«Ауыл»',
    nameKk: '«Ауыл»',
    docTitleRu: 'Официальная программа партии «Ауыл» (DOCX)',
    docTitleKk: '«Ауыл» партиясының ресми бағдарламасы (DOCX)',
  },
  baitaq: {
    partyId: 'baitaq',
    sourceUrl: 'https://baytaq.kz/program',
    documentUrl:
      'https://baytaq.kz/docs/Baytaq%20%D0%9F%D0%BB%D0%B0%D1%82%D1%84%D0%BE%D1%80%D0%BC%D0%B0%202026%20%D0%A0%D1%83%D1%81.pdf',
    format: 'PDF',
    nameRu: '«Байтақ»',
    nameKk: '«Байтақ»',
    docTitleRu: 'Платформа партии «Байтақ» 2026 (PDF)',
    docTitleKk: '«Байтақ» партиясының 2026 жылғы платформасы (PDF)',
  },
  npk: {
    partyId: 'npk',
    sourceUrl: 'https://halykpartiyasy.kz/',
    documentUrl: 'https://halykpartiyasy.kz/documents/program-ru.pdf',
    format: 'PDF',
    nameRu: 'НПК',
    nameKk: 'ҚХП',
    docTitleRu: 'Предвыборная программа Народной партии Казахстана (PDF)',
    docTitleKk: 'Қазақстан Халық партиясының бағдарламасы (PDF)',
  },
  osdp: {
    partyId: 'osdp',
    sourceUrl: 'https://osdp.kz/programma',
    documentUrl: 'https://osdp.kz/storage/app/media/programma-rus-na-sayt.pdf',
    format: 'PDF',
    nameRu: 'ОСДП',
    nameKk: 'ЖСДП',
    docTitleRu: 'Предвыборная программа ОСДП (PDF)',
    docTitleKk: 'ЖСДП сайлауалды бағдарламасы (PDF)',
  },
  respublica: {
    partyId: 'respublica',
    sourceUrl: 'https://respublica-partiyasy.kz/',
    documentUrl:
      'https://api.respublica-partiyasy.kz/uploads/2026/07/23/fbd38a6f0354877f9dadd35d01642993_141304.pdf',
    format: 'PDF',
    nameRu: 'Respublica',
    nameKk: 'Respublica',
    docTitleRu: 'Официальный манифест партии Respublica (PDF)',
    docTitleKk: 'Respublica партиясының манифесі (PDF)',
  },
}
