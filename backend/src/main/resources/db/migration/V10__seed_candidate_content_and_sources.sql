-- V10: Seed verified candidate content (biographies) and primary sources (Wikipedia, Parliament, Party Sites)
-- 1. Insert primary sources
INSERT INTO source (source_key, source_type, publisher, title, original_url, canonical_url, language, retrieved_at, content_hash, source_revision, active) VALUES
    ('wiki:ru:respublica:9', 'OTHER', 'Wikipedia (Википедия)', 'Аубакиров Нурлан Ерикбаевич — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%90%D1%83%D0%B1%D0%B0%D0%BA%D0%B8%D1%80%D0%BE%D0%B2,_%D0%9D%D1%83%D1%80%D0%BB%D0%B0%D0%BD_%D0%95%D1%80%D0%B8%D0%BA%D0%B1%D0%B0%D0%B5%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%90%D1%83%D0%B1%D0%B0%D0%BA%D0%B8%D1%80%D0%BE%D0%B2,_%D0%9D%D1%83%D1%80%D0%BB%D0%B0%D0%BD_%D0%95%D1%80%D0%B8%D0%BA%D0%B1%D0%B0%D0%B5%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, '65c04255264a17a9ecdf5aea132423b680a568564aa73b7193371ea40f4e1dc5', '2026-08-19', TRUE),
    ('wiki:ru:respublica:21', 'OTHER', 'Wikipedia (Википедия)', 'Габбасов Еркин Тлеугабылович — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%93%D0%B0%D0%B1%D0%B1%D0%B0%D1%81%D0%BE%D0%B2,_%D0%95%D1%80%D0%BA%D0%B8%D0%BD_%D0%A2%D0%BB%D0%B5%D1%83%D0%B3%D0%B0%D0%B1%D1%8B%D0%BB%D0%BE%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%93%D0%B0%D0%B1%D0%B1%D0%B0%D1%81%D0%BE%D0%B2,_%D0%95%D1%80%D0%BA%D0%B8%D0%BD_%D0%A2%D0%BB%D0%B5%D1%83%D0%B3%D0%B0%D0%B1%D1%8B%D0%BB%D0%BE%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, '7ae8cb44e6fb6a39df575d2b4e77e3d75e4f025333195de0e5461b2a21424f19', '2026-08-19', TRUE),
    ('wiki:ru:respublica:43', 'OTHER', 'Wikipedia (Википедия)', 'Куспеков Олжас Хайроллаевич — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%9A%D1%83%D1%81%D0%BF%D0%B5%D0%BA%D0%BE%D0%B2,_%D0%9E%D0%BB%D0%B6%D0%B0%D1%81_%D0%A5%D0%B0%D0%B9%D1%80%D0%BE%D0%BB%D0%BB%D0%B0%D0%B5%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%9A%D1%83%D1%81%D0%BF%D0%B5%D0%BA%D0%BE%D0%B2,_%D0%9E%D0%BB%D0%B6%D0%B0%D1%81_%D0%A5%D0%B0%D0%B9%D1%80%D0%BE%D0%BB%D0%BB%D0%B0%D0%B5%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, 'eea84f64e33da1f575419b0580e91dd7ba9748c6e827e8d38771e704dd3be8b3', '2026-08-19', TRUE),
    ('wiki:ru:respublica:54', 'OTHER', 'Wikipedia (Википедия)', 'Науатбек Ақмарал Маратқызы — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%9D%D0%B0%D1%83%D0%B0%D1%82%D0%B1%D0%B5%D0%BA,_%D0%90%D0%BA%D0%BC%D0%B0%D1%80%D0%B0%D0%BB_%D0%9C%D0%B0%D1%80%D0%B0%D1%82%D0%BA%D1%8B%D0%B7%D1%8B', 'https://ru.wikipedia.org/wiki/%D0%9D%D0%B0%D1%83%D0%B0%D1%82%D0%B1%D0%B5%D0%BA,_%D0%90%D0%BA%D0%BC%D0%B0%D1%80%D0%B0%D0%BB_%D0%9C%D0%B0%D1%80%D0%B0%D1%82%D0%BA%D1%8B%D0%B7%D1%8B', 'ru', CURRENT_TIMESTAMP, 'd8b963ccc6d3aa092691025801dcc6f8d3edd7549d240363dc74716a56276cf8', '2026-08-19', TRUE),
    ('wiki:ru:respublica:55', 'OTHER', 'Wikipedia (Википедия)', 'Наумова Динара Рустамовна — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%9D%D0%B0%D1%83%D0%BC%D0%BE%D0%B2%D0%B0,_%D0%94%D0%B8%D0%BD%D0%B0%D1%80%D0%B0_%D0%A0%D1%83%D1%81%D1%82%D0%B0%D0%BC%D0%BE%D0%B2%D0%BD%D0%B0', 'https://ru.wikipedia.org/wiki/%D0%9D%D0%B0%D1%83%D0%BC%D0%BE%D0%B2%D0%B0,_%D0%94%D0%B8%D0%BD%D0%B0%D1%80%D0%B0_%D0%A0%D1%83%D1%81%D1%82%D0%B0%D0%BC%D0%BE%D0%B2%D0%BD%D0%B0', 'ru', CURRENT_TIMESTAMP, 'b6fb48fd5822ac5a42d4cf2ea8a72fad4db51c8c9cc9f20089c066c76b6f00af', '2026-08-19', TRUE),
    ('wiki:ru:respublica:60', 'OTHER', 'Wikipedia (Википедия)', 'Смолякова Екатерина Сергеевна — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%A1%D0%BC%D0%BE%D0%BB%D1%8F%D0%BA%D0%BE%D0%B2%D0%B0,_%D0%95%D0%BA%D0%B0%D1%82%D0%B5%D1%80%D0%B8%D0%BD%D0%B0_%D0%A1%D0%B5%D1%80%D0%B3%D0%B5%D0%B5%D0%B2%D0%BD%D0%B0', 'https://ru.wikipedia.org/wiki/%D0%A1%D0%BC%D0%BE%D0%BB%D1%8F%D0%BA%D0%BE%D0%B2%D0%B0,_%D0%95%D0%BA%D0%B0%D1%82%D0%B5%D1%80%D0%B8%D0%BD%D0%B0_%D0%A1%D0%B5%D1%80%D0%B3%D0%B5%D0%B5%D0%B2%D0%BD%D0%B0', 'ru', CURRENT_TIMESTAMP, '73bc9852aab44a15a4a9bee14441ab26f7f3341135d51c6dd9120aa22433956a', '2026-08-19', TRUE),
    ('wiki:ru:respublica:65', 'OTHER', 'Wikipedia (Википедия)', 'Сураган Дурвудхан — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%A1%D1%83%D1%80%D0%B0%D0%B3%D0%B0%D0%BD,_%D0%94%D1%83%D1%80%D0%B2%D1%83%D0%B4%D1%85%D0%B0%D0%BD', 'https://ru.wikipedia.org/wiki/%D0%A1%D1%83%D1%80%D0%B0%D0%B3%D0%B0%D0%BD,_%D0%94%D1%83%D1%80%D0%B2%D1%83%D0%B4%D1%85%D0%B0%D0%BD', 'ru', CURRENT_TIMESTAMP, '907db81cb669cef03ccb584c47a2b8e5126040b02dcd95f69a88d394e4f4c12f', '2026-08-19', TRUE),
    ('wiki:ru:respublica:66', 'OTHER', 'Wikipedia (Википедия)', 'Тау Нургул — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%A2%D0%B0%D1%83,_%D0%9D%D1%83%D1%80%D0%B3%D1%83%D0%BB', 'https://ru.wikipedia.org/wiki/%D0%A2%D0%B0%D1%83,_%D0%9D%D1%83%D1%80%D0%B3%D1%83%D0%BB', 'ru', CURRENT_TIMESTAMP, 'ecd0a9eb8042ef9751379335cd432672e211eea71705e52b3fa30e8c975314a1', '2026-08-19', TRUE),
    ('wiki:ru:respublica:75', 'OTHER', 'Wikipedia (Википедия)', 'Ходжаназаров Айдарбек Асанович — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%A5%D0%BE%D0%B4%D0%B6%D0%B0%D0%BD%D0%B0%D0%B7%D0%B0%D1%80%D0%BE%D0%B2,_%D0%90%D0%B9%D0%B4%D0%B0%D1%80%D0%B1%D0%B5%D0%BA_%D0%90%D1%81%D0%B0%D0%BD%D0%BE%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%A5%D0%BE%D0%B4%D0%B6%D0%B0%D0%BD%D0%B0%D0%B7%D0%B0%D1%80%D0%BE%D0%B2,_%D0%90%D0%B9%D0%B4%D0%B0%D1%80%D0%B1%D0%B5%D0%BA_%D0%90%D1%81%D0%B0%D0%BD%D0%BE%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, 'f7a90d93b6c40ecc2db317075baecadfe739bcc9f8cb4711781b36c4edc53702', '2026-08-19', TRUE),
    ('wiki:ru:ak_zhol:5', 'OTHER', 'Wikipedia (Википедия)', 'Барлыбаев Ерлан Хайланович — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%91%D0%B0%D1%80%D0%BB%D1%8B%D0%B1%D0%B0%D0%B5%D0%B2,_%D0%95%D1%80%D0%BB%D0%B0%D0%BD_%D0%A5%D0%B0%D0%B9%D0%BB%D0%B0%D0%BD%D0%BE%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%91%D0%B0%D1%80%D0%BB%D1%8B%D0%B1%D0%B0%D0%B5%D0%B2,_%D0%95%D1%80%D0%BB%D0%B0%D0%BD_%D0%A5%D0%B0%D0%B9%D0%BB%D0%B0%D0%BD%D0%BE%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, '7fa3e1eec58284ecf98b32e0c8bdac5a2b84940c25fa03e7ea18c6ca4c5ebf87', '2026-08-19', TRUE),
    ('wiki:ru:ak_zhol:6', 'OTHER', 'Wikipedia (Википедия)', 'Бейсенбаев Ержан Алмабекович — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%91%D0%B5%D0%B9%D1%81%D0%B5%D0%BD%D0%B1%D0%B0%D0%B5%D0%B2,_%D0%95%D1%80%D0%B6%D0%B0%D0%BD_%D0%90%D0%BB%D0%BC%D0%B0%D0%B1%D0%B5%D0%BA%D0%BE%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%91%D0%B5%D0%B9%D1%81%D0%B5%D0%BD%D0%B1%D0%B0%D0%B5%D0%B2,_%D0%95%D1%80%D0%B6%D0%B0%D0%BD_%D0%90%D0%BB%D0%BC%D0%B0%D0%B1%D0%B5%D0%BA%D0%BE%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, 'a11e0eb823fe0746d8b1570b0876ac34cf3bd06dedb6a93b53ae2d178f19b0b3', '2026-08-19', TRUE),
    ('wiki:ru:ak_zhol:11', 'OTHER', 'Wikipedia (Википедия)', 'Дюсембинов Берик Салимжанович — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%94%D1%8E%D1%81%D0%B5%D0%BC%D0%B1%D0%B8%D0%BD%D0%BE%D0%B2,_%D0%91%D0%B5%D1%80%D0%B8%D0%BA_%D0%A1%D0%B0%D0%BB%D0%B8%D0%BC%D0%B6%D0%B0%D0%BD%D0%BE%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%94%D1%8E%D1%81%D0%B5%D0%BC%D0%B1%D0%B8%D0%BD%D0%BE%D0%B2,_%D0%91%D0%B5%D1%80%D0%B8%D0%BA_%D0%A1%D0%B0%D0%BB%D0%B8%D0%BC%D0%B6%D0%B0%D0%BD%D0%BE%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, 'd86f52f09dc2c1eb608a62533831bb3092136c10b821a470080152d91cfb62d5', '2026-08-19', TRUE),
    ('wiki:ru:ak_zhol:14', 'OTHER', 'Wikipedia (Википедия)', 'Ерубаев Серик Сарсенович — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%95%D1%80%D1%83%D0%B1%D0%B0%D0%B5%D0%B2,_%D0%A1%D0%B5%D1%80%D0%B8%D0%BA_%D0%A1%D0%B0%D1%80%D1%81%D0%B5%D0%BD%D0%BE%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%95%D1%80%D1%83%D0%B1%D0%B0%D0%B5%D0%B2,_%D0%A1%D0%B5%D1%80%D0%B8%D0%BA_%D0%A1%D0%B0%D1%80%D1%81%D0%B5%D0%BD%D0%BE%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, '069ef9c03664d9316e1b3a41e70aa000c52f46695ae2a8dbf1635da27250b540', '2026-08-19', TRUE),
    ('wiki:ru:ak_zhol:15', 'OTHER', 'Wikipedia (Википедия)', 'Еспаева Дания Мадиевна — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%95%D1%81%D0%BF%D0%B0%D0%B5%D0%B2%D0%B0,_%D0%94%D0%B0%D0%BD%D0%B8%D1%8F_%D0%9C%D0%B0%D0%B4%D0%B8%D0%B5%D0%B2%D0%BD%D0%B0', 'https://ru.wikipedia.org/wiki/%D0%95%D1%81%D0%BF%D0%B0%D0%B5%D0%B2%D0%B0,_%D0%94%D0%B0%D0%BD%D0%B8%D1%8F_%D0%9C%D0%B0%D0%B4%D0%B8%D0%B5%D0%B2%D0%BD%D0%B0', 'ru', CURRENT_TIMESTAMP, '1dda8fe16b6357bc879855b540e34742eac2c65c0ebb20189faa94d699e8c388', '2026-08-19', TRUE),
    ('wiki:ru:ak_zhol:21', 'OTHER', 'Wikipedia (Википедия)', 'Иса Қазыбек Жарылқасынұлы — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%98%D1%81%D0%B0,_%D0%9A%D0%B0%D0%B7%D1%8B%D0%B1%D0%B5%D0%BA_%D0%96%D0%B0%D1%80%D1%8B%D0%BB%D0%BA%D0%B0%D1%81%D1%8B%D0%BD%D1%83%D0%BB%D1%8B', 'https://ru.wikipedia.org/wiki/%D0%98%D1%81%D0%B0,_%D0%9A%D0%B0%D0%B7%D1%8B%D0%B1%D0%B5%D0%BA_%D0%96%D0%B0%D1%80%D1%8B%D0%BB%D0%BA%D0%B0%D1%81%D1%8B%D0%BD%D1%83%D0%BB%D1%8B', 'ru', CURRENT_TIMESTAMP, 'd9ccd1da31ddd891a3f33735eb6b1efe265d0760e6186e11c2f4abfcd039dba4', '2026-08-19', TRUE),
    ('wiki:kk:ak_zhol:21', 'OTHER', 'Уикипедия (Wikipedia)', 'Иса Қазыбек Жарылқасынұлы — KK Wikipedia', 'https://kk.wikipedia.org/wiki/%D2%9A%D0%B0%D0%B7%D1%8B%D0%B1%D0%B5%D0%BA_%D0%96%D0%B0%D1%80%D1%8B%D0%BB%D2%9B%D0%B0%D1%81%D1%8B%D0%BD%D2%B1%D0%BB%D1%8B_%D0%98%D1%81%D0%B0', 'https://kk.wikipedia.org/wiki/%D2%9A%D0%B0%D0%B7%D1%8B%D0%B1%D0%B5%D0%BA_%D0%96%D0%B0%D1%80%D1%8B%D0%BB%D2%9B%D0%B0%D1%81%D1%8B%D0%BD%D2%B1%D0%BB%D1%8B_%D0%98%D1%81%D0%B0', 'kk', CURRENT_TIMESTAMP, 'd21104fd1ebbbef46b2ec73d4ef634b2d0988ff726ccd07c763e5efcc862570a', '2026-08-19', TRUE),
    ('wiki:ru:ak_zhol:31', 'OTHER', 'Wikipedia (Википедия)', 'Ли Юрий Виссарионович — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%9B%D0%B8,_%D0%AE%D1%80%D0%B8%D0%B9_%D0%92%D0%B8%D1%81%D1%81%D0%B0%D1%80%D0%B8%D0%BE%D0%BD%D0%BE%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%9B%D0%B8,_%D0%AE%D1%80%D0%B8%D0%B9_%D0%92%D0%B8%D1%81%D1%81%D0%B0%D1%80%D0%B8%D0%BE%D0%BD%D0%BE%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, 'be128f45f7a6a6cb1c594c92f5eb1cfaf0e847d448c324314a72d59dc6324410', '2026-08-19', TRUE),
    ('wiki:ru:ak_zhol:32', 'OTHER', 'Wikipedia (Википедия)', 'Линник Андрей Григорьевич — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%9B%D0%B8%D0%BD%D0%BD%D0%B8%D0%BA,_%D0%90%D0%BD%D0%B4%D1%80%D0%B5%D0%B9_%D0%93%D1%80%D0%B8%D0%B3%D0%BE%D1%80%D1%8C%D0%B5%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%9B%D0%B8%D0%BD%D0%BD%D0%B8%D0%BA,_%D0%90%D0%BD%D0%B4%D1%80%D0%B5%D0%B9_%D0%93%D1%80%D0%B8%D0%B3%D0%BE%D1%80%D1%8C%D0%B5%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, '25d7d24e24ae8c7b233f5801f106bb6610323271ffef77518be68356af0cc89f', '2026-08-19', TRUE),
    ('wiki:ru:ak_zhol:40', 'OTHER', 'Wikipedia (Википедия)', 'Нуралдинов Олжас Ельтайулы — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%9D%D1%83%D1%80%D0%B0%D0%BB%D0%B4%D0%B8%D0%BD%D0%BE%D0%B2,_%D0%9E%D0%BB%D0%B6%D0%B0%D1%81_%D0%95%D0%BB%D1%8C%D1%82%D0%B0%D0%B9%D1%83%D0%BB%D1%8B', 'https://ru.wikipedia.org/wiki/%D0%9D%D1%83%D1%80%D0%B0%D0%BB%D0%B4%D0%B8%D0%BD%D0%BE%D0%B2,_%D0%9E%D0%BB%D0%B6%D0%B0%D1%81_%D0%95%D0%BB%D1%8C%D1%82%D0%B0%D0%B9%D1%83%D0%BB%D1%8B', 'ru', CURRENT_TIMESTAMP, '2c2b6f38495bce6adce0df365011d01835ed367af81ff01ea0e0ad4f5656872f', '2026-08-19', TRUE),
    ('wiki:ru:ak_zhol:42', 'OTHER', 'Wikipedia (Википедия)', 'Перуашев Азат Турлыбекулы — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%9F%D0%B5%D1%80%D1%83%D0%B0%D1%88%D0%B5%D0%B2,_%D0%90%D0%B7%D0%B0%D1%82_%D0%A2%D1%83%D1%80%D0%BB%D1%8B%D0%B1%D0%B5%D0%BA%D1%83%D0%BB%D1%8B', 'https://ru.wikipedia.org/wiki/%D0%9F%D0%B5%D1%80%D1%83%D0%B0%D1%88%D0%B5%D0%B2,_%D0%90%D0%B7%D0%B0%D1%82_%D0%A2%D1%83%D1%80%D0%BB%D1%8B%D0%B1%D0%B5%D0%BA%D1%83%D0%BB%D1%8B', 'ru', CURRENT_TIMESTAMP, '40f602e1104209bf280e04c55f763eda3f1e05a9e1f8621532a265b1169d8bfd', '2026-08-19', TRUE),
    ('wiki:kk:ak_zhol:52', 'OTHER', 'Уикипедия (Wikipedia)', 'Тастекей Дулат Тұрсынұлы — KK Wikipedia', 'https://kk.wikipedia.org/wiki/%D0%94%D1%83%D0%BB%D0%B0%D1%82_%D0%A2%D2%B1%D1%80%D1%81%D1%8B%D0%BD%D2%B1%D0%BB%D1%8B_%D0%A2%D0%B0%D1%81%D1%82%D0%B5%D0%BA%D0%B5%D0%B9', 'https://kk.wikipedia.org/wiki/%D0%94%D1%83%D0%BB%D0%B0%D1%82_%D0%A2%D2%B1%D1%80%D1%81%D1%8B%D0%BD%D2%B1%D0%BB%D1%8B_%D0%A2%D0%B0%D1%81%D1%82%D0%B5%D0%BA%D0%B5%D0%B9', 'kk', CURRENT_TIMESTAMP, 'bcb532f2431b9d1d54616f8f87f40fcb02c70d364ca91833dbe028b41acb0f33', '2026-08-19', TRUE),
    ('wiki:ru:auyl:1', 'OTHER', 'Wikipedia (Википедия)', 'Абден Қарақат Жақсылыққызы — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%90%D0%B1%D0%B4%D0%B5%D0%BD,_%D0%9A%D0%B0%D1%80%D0%B0%D0%BA%D0%B0%D1%82_%D0%96%D0%B0%D0%BA%D1%81%D1%8B%D0%BB%D1%8B%D0%BA%D0%BA%D1%8B%D0%B7%D1%8B', 'https://ru.wikipedia.org/wiki/%D0%90%D0%B1%D0%B4%D0%B5%D0%BD,_%D0%9A%D0%B0%D1%80%D0%B0%D0%BA%D0%B0%D1%82_%D0%96%D0%B0%D0%BA%D1%81%D1%8B%D0%BB%D1%8B%D0%BA%D0%BA%D1%8B%D0%B7%D1%8B', 'ru', CURRENT_TIMESTAMP, '1822d717f351a0c8ac1c6da98e2033179d275d893b43eab844523fcddd991a4b', '2026-08-19', TRUE),
    ('wiki:ru:auyl:7', 'OTHER', 'Wikipedia (Википедия)', 'Айтуганов Кайрат Капарович — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%90%D0%B9%D1%82%D1%83%D0%B3%D0%B0%D0%BD%D0%BE%D0%B2,_%D0%9A%D0%B0%D0%B9%D1%80%D0%B0%D1%82_%D0%9A%D0%B0%D0%BF%D0%B0%D1%80%D0%BE%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%90%D0%B9%D1%82%D1%83%D0%B3%D0%B0%D0%BD%D0%BE%D0%B2,_%D0%9A%D0%B0%D0%B9%D1%80%D0%B0%D1%82_%D0%9A%D0%B0%D0%BF%D0%B0%D1%80%D0%BE%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, 'c54692fcc2560f446e485c5e40d4a8afaf43167f4ffe3f86f70cfeae68e98c7f', '2026-08-19', TRUE),
    ('wiki:ru:auyl:11', 'OTHER', 'Wikipedia (Википедия)', 'Арсютин Николай Геннадьевич — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%90%D1%80%D1%81%D1%8E%D1%82%D0%B8%D0%BD,_%D0%9D%D0%B8%D0%BA%D0%BE%D0%BB%D0%B0%D0%B9_%D0%93%D0%B5%D0%BD%D0%BD%D0%B0%D0%B4%D1%8C%D0%B5%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%90%D1%80%D1%81%D1%8E%D1%82%D0%B8%D0%BD,_%D0%9D%D0%B8%D0%BA%D0%BE%D0%BB%D0%B0%D0%B9_%D0%93%D0%B5%D0%BD%D0%BD%D0%B0%D0%B4%D1%8C%D0%B5%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, 'bc909eb09256e7ec379f57580af4236c6bfafeea1ef1590bd964bd3ea954ae08', '2026-08-19', TRUE),
    ('wiki:ru:auyl:23', 'OTHER', 'Wikipedia (Википедия)', 'Дайрабаев Жигули Молдакалыкович — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%94%D0%B0%D0%B9%D1%80%D0%B0%D0%B1%D0%B0%D0%B5%D0%B2,_%D0%96%D0%B8%D0%B3%D1%83%D0%BB%D0%B8_%D0%9C%D0%BE%D0%BB%D0%B4%D0%B0%D0%BA%D0%B0%D0%BB%D1%8B%D0%BA%D0%BE%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%94%D0%B0%D0%B9%D1%80%D0%B0%D0%B1%D0%B0%D0%B5%D0%B2,_%D0%96%D0%B8%D0%B3%D1%83%D0%BB%D0%B8_%D0%9C%D0%BE%D0%BB%D0%B4%D0%B0%D0%BA%D0%B0%D0%BB%D1%8B%D0%BA%D0%BE%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, '4e6ff28caabdc0e4d5771d330bb904a3f3b3fc32c718e857d42d9d2176c011b9', '2026-08-19', TRUE),
    ('wiki:kk:auyl:23', 'OTHER', 'Уикипедия (Wikipedia)', 'Дайрабаев Жигули Молдакалыкович — KK Wikipedia', 'https://kk.wikipedia.org/wiki/%D0%96%D0%B8%D0%B3%D1%83%D0%BB%D0%B8_%D0%9C%D0%BE%D0%BB%D0%B4%D0%B0%D2%9B%D0%B0%D0%BB%D1%8B%D2%9B%D2%B1%D0%BB%D1%8B_%D0%94%D0%B0%D0%B9%D1%80%D0%B0%D0%B1%D0%B0%D0%B5%D0%B2', 'https://kk.wikipedia.org/wiki/%D0%96%D0%B8%D0%B3%D1%83%D0%BB%D0%B8_%D0%9C%D0%BE%D0%BB%D0%B4%D0%B0%D2%9B%D0%B0%D0%BB%D1%8B%D2%9B%D2%B1%D0%BB%D1%8B_%D0%94%D0%B0%D0%B9%D1%80%D0%B0%D0%B1%D0%B0%D0%B5%D0%B2', 'kk', CURRENT_TIMESTAMP, 'af01f3c30e2f3097dc90acdf68a7b79f743e3ff74b46da4e51f2d98e5dae1fae', '2026-08-19', TRUE),
    ('wiki:kk:auyl:28', 'OTHER', 'Уикипедия (Wikipedia)', 'Егізбаев Серік Рахметоллаұлы — KK Wikipedia', 'https://kk.wikipedia.org/wiki/%D0%A1%D0%B5%D1%80%D1%96%D0%BA_%D0%A0%D0%B0%D1%85%D0%BC%D0%B5%D1%82%D0%BE%D0%BB%D0%BB%D0%B0%D2%B1%D0%BB%D1%8B_%D0%95%D0%B3%D1%96%D0%B7%D0%B1%D0%B0%D0%B5%D0%B2', 'https://kk.wikipedia.org/wiki/%D0%A1%D0%B5%D1%80%D1%96%D0%BA_%D0%A0%D0%B0%D1%85%D0%BC%D0%B5%D1%82%D0%BE%D0%BB%D0%BB%D0%B0%D2%B1%D0%BB%D1%8B_%D0%95%D0%B3%D1%96%D0%B7%D0%B1%D0%B0%D0%B5%D0%B2', 'kk', CURRENT_TIMESTAMP, 'f6574bd91088249287635e341bd2fc61dfa8f146194f0f8568fa6951951f7c4a', '2026-08-19', TRUE),
    ('wiki:ru:auyl:59', 'OTHER', 'Wikipedia (Википедия)', 'Саурыков Ерболат Байузакович — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%A1%D0%B0%D1%83%D1%80%D1%8B%D0%BA%D0%BE%D0%B2,_%D0%95%D1%80%D0%B1%D0%BE%D0%BB%D0%B0%D1%82_%D0%91%D0%B0%D0%B9%D1%83%D0%B7%D0%B0%D0%BA%D0%BE%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%A1%D0%B0%D1%83%D1%80%D1%8B%D0%BA%D0%BE%D0%B2,_%D0%95%D1%80%D0%B1%D0%BE%D0%BB%D0%B0%D1%82_%D0%91%D0%B0%D0%B9%D1%83%D0%B7%D0%B0%D0%BA%D0%BE%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, 'd3e6ea48833e2d10b03654a1e3c696555dca62f78b53bce7e0be5d961471696d', '2026-08-19', TRUE),
    ('wiki:ru:auyl:65', 'OTHER', 'Wikipedia (Википедия)', 'Траисова Эльмара Аскаровна — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%A2%D1%80%D0%B0%D0%B8%D1%81%D0%BE%D0%B2%D0%B0,_%D0%AD%D0%BB%D1%8C%D0%BC%D0%B0%D1%80%D0%B0_%D0%90%D1%81%D0%BA%D0%B0%D1%80%D0%BE%D0%B2%D0%BD%D0%B0', 'https://ru.wikipedia.org/wiki/%D0%A2%D1%80%D0%B0%D0%B8%D1%81%D0%BE%D0%B2%D0%B0,_%D0%AD%D0%BB%D1%8C%D0%BC%D0%B0%D1%80%D0%B0_%D0%90%D1%81%D0%BA%D0%B0%D1%80%D0%BE%D0%B2%D0%BD%D0%B0', 'ru', CURRENT_TIMESTAMP, 'e55ef1edf78d4da5703fce0d146df5f20062d3872fca5ec780e37c664817154a', '2026-08-19', TRUE),
    ('wiki:ru:npk:61', 'OTHER', 'Wikipedia (Википедия)', 'Сейтжан Кенжеғұл Социалұлы — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%A1%D0%B5%D0%B9%D1%82%D0%B6%D0%B0%D0%BD,_%D0%9A%D0%B5%D0%BD%D0%B6%D0%B5%D0%B3%D1%83%D0%BB_%D0%A1%D0%BE%D1%86%D0%B8%D0%B0%D0%BB%D1%83%D0%BB%D1%8B', 'https://ru.wikipedia.org/wiki/%D0%A1%D0%B5%D0%B9%D1%82%D0%B6%D0%B0%D0%BD,_%D0%9A%D0%B5%D0%BD%D0%B6%D0%B5%D0%B3%D1%83%D0%BB_%D0%A1%D0%BE%D1%86%D0%B8%D0%B0%D0%BB%D1%83%D0%BB%D1%8B', 'ru', CURRENT_TIMESTAMP, 'c4f37565890d198e2a2830eab00e2154204f376ec0ba1fc0055bd761379c7704', '2026-08-19', TRUE),
    ('wiki:kk:npk:61', 'OTHER', 'Уикипедия (Wikipedia)', 'Сейтжан Кенжеғұл Социалұлы — KK Wikipedia', 'https://kk.wikipedia.org/wiki/%D0%9A%D0%B5%D0%BD%D0%B6%D0%B5%D2%93%D2%B1%D0%BB_%D0%A1%D0%BE%D1%86%D0%B8%D0%B0%D0%BB%D2%B1%D0%BB%D1%8B_%D0%A1%D0%B5%D0%B9%D1%82%D0%B6%D0%B0%D0%BD', 'https://kk.wikipedia.org/wiki/%D0%9A%D0%B5%D0%BD%D0%B6%D0%B5%D2%93%D2%B1%D0%BB_%D0%A1%D0%BE%D1%86%D0%B8%D0%B0%D0%BB%D2%B1%D0%BB%D1%8B_%D0%A1%D0%B5%D0%B9%D1%82%D0%B6%D0%B0%D0%BD', 'kk', CURRENT_TIMESTAMP, '3aa245a694cf94b4301e55e6ddc935f2b98af8e5de2907868bb3598c0cb151fe', '2026-08-19', TRUE),
    ('wiki:ru:npk:63', 'OTHER', 'Wikipedia (Википедия)', 'Смирнова Ирина Владимировна — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%A1%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B2%D0%B0,_%D0%98%D1%80%D0%B8%D0%BD%D0%B0_%D0%92%D0%BB%D0%B0%D0%B4%D0%B8%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%BD%D0%B0', 'https://ru.wikipedia.org/wiki/%D0%A1%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B2%D0%B0,_%D0%98%D1%80%D0%B8%D0%BD%D0%B0_%D0%92%D0%BB%D0%B0%D0%B4%D0%B8%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%BD%D0%B0', 'ru', CURRENT_TIMESTAMP, '587e571781327c9ebb4127a439e551ccd5057c5d3f19225d4e383c5a6dae326a', '2026-08-19', TRUE),
    ('wiki:kk:npk:63', 'OTHER', 'Уикипедия (Wikipedia)', 'Смирнова Ирина Владимировна — KK Wikipedia', 'https://kk.wikipedia.org/wiki/%D0%98%D1%80%D0%B8%D0%BD%D0%B0_%D0%92%D0%BB%D0%B0%D0%B4%D0%B8%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%BD%D0%B0_%D0%A1%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B2%D0%B0', 'https://kk.wikipedia.org/wiki/%D0%98%D1%80%D0%B8%D0%BD%D0%B0_%D0%92%D0%BB%D0%B0%D0%B4%D0%B8%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%BD%D0%B0_%D0%A1%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B2%D0%B0', 'kk', CURRENT_TIMESTAMP, '347b319617fde540877cccab4fb04b1eb18493c94ab6348ca63bc3f987383eae', '2026-08-19', TRUE),
    ('wiki:kk:npk:64', 'OTHER', 'Уикипедия (Wikipedia)', 'Сүлеймен Ләззат Жаңылысқызы — KK Wikipedia', 'https://kk.wikipedia.org/wiki/%D0%9B%D3%99%D0%B7%D0%B7%D0%B0%D1%82_%D0%96%D0%B0%D2%A3%D1%8B%D0%BB%D1%8B%D1%81%D2%9B%D1%8B%D0%B7%D1%8B_%D0%A1%D2%AF%D0%BB%D0%B5%D0%B9%D0%BC%D0%B5%D0%BD', 'https://kk.wikipedia.org/wiki/%D0%9B%D3%99%D0%B7%D0%B7%D0%B0%D1%82_%D0%96%D0%B0%D2%A3%D1%8B%D0%BB%D1%8B%D1%81%D2%9B%D1%8B%D0%B7%D1%8B_%D0%A1%D2%AF%D0%BB%D0%B5%D0%B9%D0%BC%D0%B5%D0%BD', 'kk', CURRENT_TIMESTAMP, 'f66804fe923c1c12392a3b8944016e50cf89fb8156404a35093ec2eda064ed7a', '2026-08-19', TRUE),
    ('wiki:ru:npk:71', 'OTHER', 'Wikipedia (Википедия)', 'Шоканов Нурсултан Нурланович — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%A8%D0%BE%D0%BA%D0%B0%D0%BD%D0%BE%D0%B2,_%D0%9D%D1%83%D1%80%D1%81%D1%83%D0%BB%D1%82%D0%B0%D0%BD_%D0%9D%D1%83%D1%80%D0%BB%D0%B0%D0%BD%D0%BE%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%A8%D0%BE%D0%BA%D0%B0%D0%BD%D0%BE%D0%B2,_%D0%9D%D1%83%D1%80%D1%81%D1%83%D0%BB%D1%82%D0%B0%D0%BD_%D0%9D%D1%83%D1%80%D0%BB%D0%B0%D0%BD%D0%BE%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, '2f7f8602831acfc3f19fbf6e1544123fd124552ebd2166e6197275002b8f03b8', '2026-08-19', TRUE),
    ('wiki:ru:osdp:8', 'OTHER', 'Wikipedia (Википедия)', 'Ауесбаев Нурлан Сатыбалдиевич — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%90%D1%83%D0%B5%D1%81%D0%B1%D0%B0%D0%B5%D0%B2,_%D0%9D%D1%83%D1%80%D0%BB%D0%B0%D0%BD_%D0%A1%D0%B0%D1%82%D1%8B%D0%B1%D0%B0%D0%BB%D0%B4%D0%B8%D0%B5%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%90%D1%83%D0%B5%D1%81%D0%B1%D0%B0%D0%B5%D0%B2,_%D0%9D%D1%83%D1%80%D0%BB%D0%B0%D0%BD_%D0%A1%D0%B0%D1%82%D1%8B%D0%B1%D0%B0%D0%BB%D0%B4%D0%B8%D0%B5%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, '76f322bbf86688c8e16372d69d57683fb73722275c755ce94ace4cd242b7d4ec', '2026-08-19', TRUE),
    ('wiki:ru:osdp:28', 'OTHER', 'Wikipedia (Википедия)', 'Рахимжанов Асхат Нурмагамбетович — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%A0%D0%B0%D1%85%D0%B8%D0%BC%D0%B6%D0%B0%D0%BD%D0%BE%D0%B2,_%D0%90%D1%81%D1%85%D0%B0%D1%82_%D0%9D%D1%83%D1%80%D0%BC%D0%B0%D0%B3%D0%B0%D0%BC%D0%B1%D0%B5%D1%82%D0%BE%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%A0%D0%B0%D1%85%D0%B8%D0%BC%D0%B6%D0%B0%D0%BD%D0%BE%D0%B2,_%D0%90%D1%81%D1%85%D0%B0%D1%82_%D0%9D%D1%83%D1%80%D0%BC%D0%B0%D0%B3%D0%B0%D0%BC%D0%B1%D0%B5%D1%82%D0%BE%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, 'b58db279b9b53c7359cf99d5f8a9325b7444b5c1201537676c44ed9652c3d199', '2026-08-19', TRUE),
    ('wiki:ru:osdp:29', 'OTHER', 'Wikipedia (Википедия)', 'Сагандыкова Ажар Бахитовна — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%A1%D0%B0%D0%B3%D0%B0%D0%BD%D0%B4%D1%8B%D0%BA%D0%BE%D0%B2%D0%B0,_%D0%90%D0%B6%D0%B0%D1%80_%D0%91%D0%B0%D1%85%D0%B8%D1%82%D0%BE%D0%B2%D0%BD%D0%B0', 'https://ru.wikipedia.org/wiki/%D0%A1%D0%B0%D0%B3%D0%B0%D0%BD%D0%B4%D1%8B%D0%BA%D0%BE%D0%B2%D0%B0,_%D0%90%D0%B6%D0%B0%D1%80_%D0%91%D0%B0%D1%85%D0%B8%D1%82%D0%BE%D0%B2%D0%BD%D0%B0', 'ru', CURRENT_TIMESTAMP, '6e35c3f51edd7bfbdb2bd626463631d25785382c4c26e86d8bac9532e8fc421f', '2026-08-19', TRUE),
    ('wiki:ru:osdp:30', 'OTHER', 'Wikipedia (Википедия)', 'Сайлаубай Наурыз Саятұлы — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%A1%D0%B0%D0%B9%D0%BB%D0%B0%D1%83%D0%B1%D0%B0%D0%B9,_%D0%9D%D0%B0%D1%83%D1%80%D1%8B%D0%B7_%D0%A1%D0%B0%D1%8F%D1%82%D1%83%D0%BB%D1%8B', 'https://ru.wikipedia.org/wiki/%D0%A1%D0%B0%D0%B9%D0%BB%D0%B0%D1%83%D0%B1%D0%B0%D0%B9,_%D0%9D%D0%B0%D1%83%D1%80%D1%8B%D0%B7_%D0%A1%D0%B0%D1%8F%D1%82%D1%83%D0%BB%D1%8B', 'ru', CURRENT_TIMESTAMP, '44e7a7ff4c9a5ba59fc23e1a6f461a7fb955644aae24645a6cb5f0e20559c4fe', '2026-08-19', TRUE),
    ('wiki:ru:adilet:2', 'OTHER', 'Wikipedia (Википедия)', 'Абенов Мурат Абдуламитович — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%90%D0%B1%D0%B5%D0%BD%D0%BE%D0%B2,_%D0%9C%D1%83%D1%80%D0%B0%D1%82_%D0%90%D0%B1%D0%B4%D1%83%D0%BB%D0%B0%D0%BC%D0%B8%D1%82%D0%BE%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%90%D0%B1%D0%B5%D0%BD%D0%BE%D0%B2,_%D0%9C%D1%83%D1%80%D0%B0%D1%82_%D0%90%D0%B1%D0%B4%D1%83%D0%BB%D0%B0%D0%BC%D0%B8%D1%82%D0%BE%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, 'bb0e9099c512730bc802e4a8f9c00b9cee66adff41ca15161eda69fbf3a46065', '2026-08-19', TRUE),
    ('wiki:ru:adilet:4', 'OTHER', 'Wikipedia (Википедия)', 'Авершин Константин Викторович — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%90%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD,_%D0%9A%D0%BE%D0%BD%D1%81%D1%82%D0%B0%D0%BD%D1%82%D0%B8%D0%BD_%D0%92%D0%B8%D0%BA%D1%82%D0%BE%D1%80%D0%BE%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%90%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD,_%D0%9A%D0%BE%D0%BD%D1%81%D1%82%D0%B0%D0%BD%D1%82%D0%B8%D0%BD_%D0%92%D0%B8%D0%BA%D1%82%D0%BE%D1%80%D0%BE%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, '0d8a1029679a7d93c0203e65668ab2deb49a7861db69975b4d2cf3b1f2112f27', '2026-08-19', TRUE),
    ('wiki:kk:adilet:4', 'OTHER', 'Уикипедия (Wikipedia)', 'Авершин Константин Викторович — KK Wikipedia', 'https://kk.wikipedia.org/wiki/%D0%9A%D0%BE%D0%BD%D1%81%D1%82%D0%B0%D0%BD%D1%82%D0%B8%D0%BD_%D0%92%D0%B8%D0%BA%D1%82%D0%BE%D1%80%D0%BE%D0%B2%D0%B8%D1%87_%D0%90%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD', 'https://kk.wikipedia.org/wiki/%D0%9A%D0%BE%D0%BD%D1%81%D1%82%D0%B0%D0%BD%D1%82%D0%B8%D0%BD_%D0%92%D0%B8%D0%BA%D1%82%D0%BE%D1%80%D0%BE%D0%B2%D0%B8%D1%87_%D0%90%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD', 'kk', CURRENT_TIMESTAMP, '5f37677d3370c544dcbd3c6d15336092a29b06263e700525ed4dde7f0dd4d5ba', '2026-08-19', TRUE),
    ('wiki:ru:adilet:8', 'OTHER', 'Wikipedia (Википедия)', 'Адамбеков Тилектес Серикбайулы — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%90%D0%B4%D0%B0%D0%BC%D0%B1%D0%B5%D0%BA%D0%BE%D0%B2,_%D0%A2%D0%B8%D0%BB%D0%B5%D0%BA%D1%82%D0%B5%D1%81_%D0%A1%D0%B5%D1%80%D0%B8%D0%BA%D0%B1%D0%B0%D0%B9%D1%83%D0%BB%D1%8B', 'https://ru.wikipedia.org/wiki/%D0%90%D0%B4%D0%B0%D0%BC%D0%B1%D0%B5%D0%BA%D0%BE%D0%B2,_%D0%A2%D0%B8%D0%BB%D0%B5%D0%BA%D1%82%D0%B5%D1%81_%D0%A1%D0%B5%D1%80%D0%B8%D0%BA%D0%B1%D0%B0%D0%B9%D1%83%D0%BB%D1%8B', 'ru', CURRENT_TIMESTAMP, '17c5fbc5e02414000d03e9b9d6ad6e6996a0cc0de3e7ed83c4fbf9524ed1ce48', '2026-08-19', TRUE),
    ('wiki:ru:adilet:9', 'OTHER', 'Wikipedia (Википедия)', 'Аймагамбетов Асхат Канатович — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%90%D0%B9%D0%BC%D0%B0%D0%B3%D0%B0%D0%BC%D0%B1%D0%B5%D1%82%D0%BE%D0%B2,_%D0%90%D1%81%D1%85%D0%B0%D1%82_%D0%9A%D0%B0%D0%BD%D0%B0%D1%82%D0%BE%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%90%D0%B9%D0%BC%D0%B0%D0%B3%D0%B0%D0%BC%D0%B1%D0%B5%D1%82%D0%BE%D0%B2,_%D0%90%D1%81%D1%85%D0%B0%D1%82_%D0%9A%D0%B0%D0%BD%D0%B0%D1%82%D0%BE%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, '29ed5721238798990b06ab9c4cc89a250d6028b1fcf3a404afea34cfb056213b', '2026-08-19', TRUE),
    ('wiki:ru:adilet:13', 'OTHER', 'Wikipedia (Википедия)', 'Амантай Жаркынбек — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%90%D0%BC%D0%B0%D0%BD%D1%82%D0%B0%D0%B9,_%D0%96%D0%B0%D1%80%D0%BA%D1%8B%D0%BD%D0%B1%D0%B5%D0%BA', 'https://ru.wikipedia.org/wiki/%D0%90%D0%BC%D0%B0%D0%BD%D1%82%D0%B0%D0%B9,_%D0%96%D0%B0%D1%80%D0%BA%D1%8B%D0%BD%D0%B1%D0%B5%D0%BA', 'ru', CURRENT_TIMESTAMP, '07a23385df4bbcc8d9b2f6a0b06c8df7fbe128039f583ff7259765e26e85f14c', '2026-08-19', TRUE),
    ('wiki:ru:adilet:33', 'OTHER', 'Wikipedia (Википедия)', 'Басин Вадим Борисович — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%91%D0%B0%D1%81%D0%B8%D0%BD,_%D0%92%D0%B0%D0%B4%D0%B8%D0%BC_%D0%91%D0%BE%D1%80%D0%B8%D1%81%D0%BE%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%91%D0%B0%D1%81%D0%B8%D0%BD,_%D0%92%D0%B0%D0%B4%D0%B8%D0%BC_%D0%91%D0%BE%D1%80%D0%B8%D1%81%D0%BE%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, 'a5b1c697bb8d9e73fda110cfe1bc4278714d7ea33e93e94fc1c78491ced17929', '2026-08-19', TRUE),
    ('wiki:ru:adilet:34', 'OTHER', 'Wikipedia (Википедия)', 'Батырбеков Эрлан Гадлетович — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%91%D0%B0%D1%82%D1%8B%D1%80%D0%B1%D0%B5%D0%BA%D0%BE%D0%B2,_%D0%AD%D1%80%D0%BB%D0%B0%D0%BD_%D0%93%D0%B0%D0%B4%D0%BB%D0%B5%D1%82%D0%BE%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%91%D0%B0%D1%82%D1%8B%D1%80%D0%B1%D0%B5%D0%BA%D0%BE%D0%B2,_%D0%AD%D1%80%D0%BB%D0%B0%D0%BD_%D0%93%D0%B0%D0%B4%D0%BB%D0%B5%D1%82%D0%BE%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, '1a1166a8d096fd2c4ed3ce37beb688d93286ec7eaef33121080ace6b688417ef', '2026-08-19', TRUE),
    ('wiki:ru:adilet:36', 'OTHER', 'Wikipedia (Википедия)', 'Башимов Марат Советович — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%91%D0%B0%D1%88%D0%B8%D0%BC%D0%BE%D0%B2,_%D0%9C%D0%B0%D1%80%D0%B0%D1%82_%D0%A1%D0%BE%D0%B2%D0%B5%D1%82%D0%BE%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%91%D0%B0%D1%88%D0%B8%D0%BC%D0%BE%D0%B2,_%D0%9C%D0%B0%D1%80%D0%B0%D1%82_%D0%A1%D0%BE%D0%B2%D0%B5%D1%82%D0%BE%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, '476cafdcb2fab035870c666fa6f59b212f0db327caeac827816480729b06ef55', '2026-08-19', TRUE),
    ('wiki:ru:adilet:40', 'OTHER', 'Wikipedia (Википедия)', 'Бекназаров Нурлан Кудиярович — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%91%D0%B5%D0%BA%D0%BD%D0%B0%D0%B7%D0%B0%D1%80%D0%BE%D0%B2,_%D0%9D%D1%83%D1%80%D0%BB%D0%B0%D0%BD_%D0%9A%D1%83%D0%B4%D0%B8%D1%8F%D1%80%D0%BE%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%91%D0%B5%D0%BA%D0%BD%D0%B0%D0%B7%D0%B0%D1%80%D0%BE%D0%B2,_%D0%9D%D1%83%D1%80%D0%BB%D0%B0%D0%BD_%D0%9A%D1%83%D0%B4%D0%B8%D1%8F%D1%80%D0%BE%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, '759ba1ac0337064968e05f0815f937682f8c66316018dfaac137854da398803c', '2026-08-19', TRUE),
    ('wiki:ru:adilet:46', 'OTHER', 'Wikipedia (Википедия)', 'Больгерт Евгений Андреевич — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%91%D0%BE%D0%BB%D1%8C%D0%B3%D0%B5%D1%80%D1%82,_%D0%95%D0%B2%D0%B3%D0%B5%D0%BD%D0%B8%D0%B9_%D0%90%D0%BD%D0%B4%D1%80%D0%B5%D0%B5%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%91%D0%BE%D0%BB%D1%8C%D0%B3%D0%B5%D1%80%D1%82,_%D0%95%D0%B2%D0%B3%D0%B5%D0%BD%D0%B8%D0%B9_%D0%90%D0%BD%D0%B4%D1%80%D0%B5%D0%B5%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, '777b6f5c8e8fadbadc646a16acaa5d3eddef749263463578545f6a902462f9db', '2026-08-19', TRUE),
    ('wiki:kk:adilet:49', 'OTHER', 'Уикипедия (Wikipedia)', 'Годунова Наталья Николаевна — KK Wikipedia', 'https://kk.wikipedia.org/wiki/%D0%9D%D0%B0%D1%82%D0%B0%D0%BB%D1%8C%D1%8F_%D0%9D%D0%B8%D0%BA%D0%BE%D0%BB%D0%B0%D0%B5%D0%B2%D0%BD%D0%B0_%D0%93%D0%BE%D0%B4%D1%83%D0%BD%D0%BE%D0%B2%D0%B0', 'https://kk.wikipedia.org/wiki/%D0%9D%D0%B0%D1%82%D0%B0%D0%BB%D1%8C%D1%8F_%D0%9D%D0%B8%D0%BA%D0%BE%D0%BB%D0%B0%D0%B5%D0%B2%D0%BD%D0%B0_%D0%93%D0%BE%D0%B4%D1%83%D0%BD%D0%BE%D0%B2%D0%B0', 'kk', CURRENT_TIMESTAMP, '75bcfdfcede26159df04ffcc310f6da353cd8371166331d6fd123defb760c92d', '2026-08-19', TRUE),
    ('wiki:kk:adilet:54', 'OTHER', 'Уикипедия (Wikipedia)', 'Дәдебай Айбек Арқабайұлы — KK Wikipedia', 'https://kk.wikipedia.org/wiki/%D0%90%D0%B9%D0%B1%D0%B5%D0%BA_%D0%90%D1%80%D2%9B%D0%B0%D0%B1%D0%B0%D0%B9%D2%B1%D0%BB%D1%8B_%D0%94%D3%99%D0%B4%D0%B5%D0%B1%D0%B0%D0%B9', 'https://kk.wikipedia.org/wiki/%D0%90%D0%B9%D0%B1%D0%B5%D0%BA_%D0%90%D1%80%D2%9B%D0%B0%D0%B1%D0%B0%D0%B9%D2%B1%D0%BB%D1%8B_%D0%94%D3%99%D0%B4%D0%B5%D0%B1%D0%B0%D0%B9', 'kk', CURRENT_TIMESTAMP, '9c67ffcc8a59485cd6bed96b706ed2f2d6aa8c24db4e850659b5cbe771534d1f', '2026-08-19', TRUE),
    ('wiki:ru:adilet:59', 'OTHER', 'Wikipedia (Википедия)', 'Дулатбеков Нурлан Орынбасарович — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%94%D1%83%D0%BB%D0%B0%D1%82%D0%B1%D0%B5%D0%BA%D0%BE%D0%B2,_%D0%9D%D1%83%D1%80%D0%BB%D0%B0%D0%BD_%D0%9E%D1%80%D1%8B%D0%BD%D0%B1%D0%B0%D1%81%D0%B0%D1%80%D0%BE%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%94%D1%83%D0%BB%D0%B0%D1%82%D0%B1%D0%B5%D0%BA%D0%BE%D0%B2,_%D0%9D%D1%83%D1%80%D0%BB%D0%B0%D0%BD_%D0%9E%D1%80%D1%8B%D0%BD%D0%B1%D0%B0%D1%81%D0%B0%D1%80%D0%BE%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, '6ec3b9077bdce210560d2836dcb46bc86f434d1c49f700721a3de19d5703a7b7', '2026-08-19', TRUE),
    ('wiki:ru:adilet:74', 'OTHER', 'Wikipedia (Википедия)', 'Закиева Динара Болатовна — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%97%D0%B0%D0%BA%D0%B8%D0%B5%D0%B2%D0%B0,_%D0%94%D0%B8%D0%BD%D0%B0%D1%80%D0%B0_%D0%91%D0%BE%D0%BB%D0%B0%D1%82%D0%BE%D0%B2%D0%BD%D0%B0', 'https://ru.wikipedia.org/wiki/%D0%97%D0%B0%D0%BA%D0%B8%D0%B5%D0%B2%D0%B0,_%D0%94%D0%B8%D0%BD%D0%B0%D1%80%D0%B0_%D0%91%D0%BE%D0%BB%D0%B0%D1%82%D0%BE%D0%B2%D0%BD%D0%B0', 'ru', CURRENT_TIMESTAMP, 'b2c140ed9c19d8c0fa6c1868de76eb149cb8882e42d03fae889053b9b340ee44', '2026-08-19', TRUE),
    ('wiki:ru:adilet:75', 'OTHER', 'Wikipedia (Википедия)', 'Зенченко Геннадий Геннадьевич — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%97%D0%B5%D0%BD%D1%87%D0%B5%D0%BD%D0%BA%D0%BE,_%D0%93%D0%B5%D0%BD%D0%BD%D0%B0%D0%B4%D0%B8%D0%B9_%D0%93%D0%B5%D0%BD%D0%BD%D0%B0%D0%B4%D1%8C%D0%B5%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%97%D0%B5%D0%BD%D1%87%D0%B5%D0%BD%D0%BA%D0%BE,_%D0%93%D0%B5%D0%BD%D0%BD%D0%B0%D0%B4%D0%B8%D0%B9_%D0%93%D0%B5%D0%BD%D0%BD%D0%B0%D0%B4%D1%8C%D0%B5%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, '6e7b56e287754edf5a8090e755fc116f8f18526754634aaa3cb2bc7f39c35d24', '2026-08-19', TRUE),
    ('wiki:ru:adilet:77', 'OTHER', 'Wikipedia (Википедия)', 'Имашева Снежанна Валерьевна — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%98%D0%BC%D0%B0%D1%88%D0%B5%D0%B2%D0%B0,_%D0%A1%D0%BD%D0%B5%D0%B6%D0%B0%D0%BD%D0%BD%D0%B0_%D0%92%D0%B0%D0%BB%D0%B5%D1%80%D1%8C%D0%B5%D0%B2%D0%BD%D0%B0', 'https://ru.wikipedia.org/wiki/%D0%98%D0%BC%D0%B0%D1%88%D0%B5%D0%B2%D0%B0,_%D0%A1%D0%BD%D0%B5%D0%B6%D0%B0%D0%BD%D0%BD%D0%B0_%D0%92%D0%B0%D0%BB%D0%B5%D1%80%D1%8C%D0%B5%D0%B2%D0%BD%D0%B0', 'ru', CURRENT_TIMESTAMP, '879a527b01c68d1884a1f0b1d4c5716e9554bcad570decbc7f8d5e7e27de4a93', '2026-08-19', TRUE),
    ('wiki:ru:adilet:81', 'OTHER', 'Wikipedia (Википедия)', 'Кайдарова Диляра Радиковна — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%9A%D0%B0%D0%B9%D0%B4%D0%B0%D1%80%D0%BE%D0%B2%D0%B0,_%D0%94%D0%B8%D0%BB%D1%8F%D1%80%D0%B0_%D0%A0%D0%B0%D0%B4%D0%B8%D0%BA%D0%BE%D0%B2%D0%BD%D0%B0', 'https://ru.wikipedia.org/wiki/%D0%9A%D0%B0%D0%B9%D0%B4%D0%B0%D1%80%D0%BE%D0%B2%D0%B0,_%D0%94%D0%B8%D0%BB%D1%8F%D1%80%D0%B0_%D0%A0%D0%B0%D0%B4%D0%B8%D0%BA%D0%BE%D0%B2%D0%BD%D0%B0', 'ru', CURRENT_TIMESTAMP, 'e48963a72ac5283cba9685c466ddcf113cb7ecdf221c303cd96e29a41f5f81f2', '2026-08-19', TRUE),
    ('wiki:ru:adilet:83', 'OTHER', 'Wikipedia (Википедия)', 'Калыков Арман Кобыландынович — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%9A%D0%B0%D0%BB%D1%8B%D0%BA%D0%BE%D0%B2,_%D0%90%D1%80%D0%BC%D0%B0%D0%BD_%D0%9A%D0%BE%D0%B1%D1%8B%D0%BB%D0%B0%D0%BD%D0%B4%D1%8B%D0%BD%D0%BE%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%9A%D0%B0%D0%BB%D1%8B%D0%BA%D0%BE%D0%B2,_%D0%90%D1%80%D0%BC%D0%B0%D0%BD_%D0%9A%D0%BE%D0%B1%D1%8B%D0%BB%D0%B0%D0%BD%D0%B4%D1%8B%D0%BD%D0%BE%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, '01d21abaac8b830fcb321c10697487a53ba35ca09532f6156e9e49c85ce8fa91', '2026-08-19', TRUE),
    ('wiki:ru:adilet:86', 'OTHER', 'Wikipedia (Википедия)', 'Карин Ерлан Тынымбайұлы — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%9A%D0%B0%D1%80%D0%B8%D0%BD,_%D0%95%D1%80%D0%BB%D0%B0%D0%BD_%D0%A2%D1%8B%D0%BD%D1%8B%D0%BC%D0%B1%D0%B0%D0%B9%D1%83%D0%BB%D1%8B', 'https://ru.wikipedia.org/wiki/%D0%9A%D0%B0%D1%80%D0%B8%D0%BD,_%D0%95%D1%80%D0%BB%D0%B0%D0%BD_%D0%A2%D1%8B%D0%BD%D1%8B%D0%BC%D0%B1%D0%B0%D0%B9%D1%83%D0%BB%D1%8B', 'ru', CURRENT_TIMESTAMP, '3ac15cf8902828547d3bc57b9e83e6d99c7eb884e18955aa5b66c3b7b54d918a', '2026-08-19', TRUE),
    ('wiki:kk:adilet:88', 'OTHER', 'Уикипедия (Wikipedia)', 'Кәрібек Дәулет Жамаубайұлы — KK Wikipedia', 'https://kk.wikipedia.org/wiki/%D0%94%D3%99%D1%83%D0%BB%D0%B5%D1%82_%D0%96%D0%B0%D0%BC%D0%B0%D1%83%D0%B1%D0%B0%D0%B9%D2%B1%D0%BB%D1%8B_%D0%9A%D3%99%D1%80%D1%96%D0%B1%D0%B5%D0%BA', 'https://kk.wikipedia.org/wiki/%D0%94%D3%99%D1%83%D0%BB%D0%B5%D1%82_%D0%96%D0%B0%D0%BC%D0%B0%D1%83%D0%B1%D0%B0%D0%B9%D2%B1%D0%BB%D1%8B_%D0%9A%D3%99%D1%80%D1%96%D0%B1%D0%B5%D0%BA', 'kk', CURRENT_TIMESTAMP, '41e779c41b2632439820e379c0d582db27ab9186607af69f1ef9e9b5f51fcc40', '2026-08-19', TRUE),
    ('wiki:kk:adilet:90', 'OTHER', 'Уикипедия (Wikipedia)', 'Кенжеханұлы Рауан — KK Wikipedia', 'https://kk.wikipedia.org/wiki/%D0%A0%D0%B0%D1%83%D0%B0%D0%BD_%D0%9A%D0%B5%D0%BD%D0%B6%D0%B5%D1%85%D0%B0%D0%BD%D2%B1%D0%BB%D1%8B', 'https://kk.wikipedia.org/wiki/%D0%A0%D0%B0%D1%83%D0%B0%D0%BD_%D0%9A%D0%B5%D0%BD%D0%B6%D0%B5%D1%85%D0%B0%D0%BD%D2%B1%D0%BB%D1%8B', 'kk', CURRENT_TIMESTAMP, 'ac672fbc7d12d3b6cda2c45c3ba40cc231245c83856809fcd9178a0ba90ffead', '2026-08-19', TRUE),
    ('wiki:ru:adilet:94', 'OTHER', 'Wikipedia (Википедия)', 'Кожаев Марат Шадетханович — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%9A%D0%BE%D0%B6%D0%B0%D0%B5%D0%B2,_%D0%9C%D0%B0%D1%80%D0%B0%D1%82_%D0%A8%D0%B0%D0%B4%D0%B5%D1%82%D1%85%D0%B0%D0%BD%D0%BE%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%9A%D0%BE%D0%B6%D0%B0%D0%B5%D0%B2,_%D0%9C%D0%B0%D1%80%D0%B0%D1%82_%D0%A8%D0%B0%D0%B4%D0%B5%D1%82%D1%85%D0%B0%D0%BD%D0%BE%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, 'ddfead386df7db8ff3a169c870a5a94ad1b443167a94bfbdb5149e96a438c556', '2026-08-19', TRUE),
    ('wiki:ru:adilet:95', 'OTHER', 'Wikipedia (Википедия)', 'Кожаниязов Серик Салаватович — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%9A%D0%BE%D0%B6%D0%B0%D0%BD%D0%B8%D1%8F%D0%B7%D0%BE%D0%B2,_%D0%A1%D0%B5%D1%80%D0%B8%D0%BA_%D0%A1%D0%B0%D0%BB%D0%B0%D0%B2%D0%B0%D1%82%D0%BE%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%9A%D0%BE%D0%B6%D0%B0%D0%BD%D0%B8%D1%8F%D0%B7%D0%BE%D0%B2,_%D0%A1%D0%B5%D1%80%D0%B8%D0%BA_%D0%A1%D0%B0%D0%BB%D0%B0%D0%B2%D0%B0%D1%82%D0%BE%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, 'f40820303f5a211240e4a4f531d23d5c82b857fcaac84ef1b5b791e3ab335688', '2026-08-19', TRUE),
    ('wiki:ru:adilet:99', 'OTHER', 'Wikipedia (Википедия)', 'Кучинская Юлия Владимировна — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%9A%D1%83%D1%87%D0%B8%D0%BD%D1%81%D0%BA%D0%B0%D1%8F,_%D0%AE%D0%BB%D0%B8%D1%8F_%D0%92%D0%BB%D0%B0%D0%B4%D0%B8%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%BD%D0%B0', 'https://ru.wikipedia.org/wiki/%D0%9A%D1%83%D1%87%D0%B8%D0%BD%D1%81%D0%BA%D0%B0%D1%8F,_%D0%AE%D0%BB%D0%B8%D1%8F_%D0%92%D0%BB%D0%B0%D0%B4%D0%B8%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%BD%D0%B0', 'ru', CURRENT_TIMESTAMP, '5f9a0db88f24013a1123c985d257a2f6bc67737fa6625a40ac7095c143676f37', '2026-08-19', TRUE),
    ('wiki:kk:adilet:100', 'OTHER', 'Уикипедия (Wikipedia)', 'Қамзабекұлы Дихан — KK Wikipedia', 'https://kk.wikipedia.org/wiki/%D0%94%D0%B8%D1%85%D0%B0%D0%BD_%D2%9A%D0%B0%D0%BC%D0%B7%D0%B0%D0%B1%D0%B5%D0%BA%D2%B1%D0%BB%D1%8B', 'https://kk.wikipedia.org/wiki/%D0%94%D0%B8%D1%85%D0%B0%D0%BD_%D2%9A%D0%B0%D0%BC%D0%B7%D0%B0%D0%B1%D0%B5%D0%BA%D2%B1%D0%BB%D1%8B', 'kk', CURRENT_TIMESTAMP, '2c55be0aafc61748f2f4c9226bc0aeda0c659046b893dae5b580634b5ca30ba5', '2026-08-19', TRUE),
    ('wiki:ru:adilet:103', 'OTHER', 'Wikipedia (Википедия)', 'Лаврентьев Андрей Сергеевич — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%9B%D0%B0%D0%B2%D1%80%D0%B5%D0%BD%D1%82%D1%8C%D0%B5%D0%B2,_%D0%90%D0%BD%D0%B4%D1%80%D0%B5%D0%B9_%D0%A1%D0%B5%D1%80%D0%B3%D0%B5%D0%B5%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%9B%D0%B0%D0%B2%D1%80%D0%B5%D0%BD%D1%82%D1%8C%D0%B5%D0%B2,_%D0%90%D0%BD%D0%B4%D1%80%D0%B5%D0%B9_%D0%A1%D0%B5%D1%80%D0%B3%D0%B5%D0%B5%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, '365b44069be5595dfa2675410449de14dc87045d08b2038a80884120d9a2a2dc', '2026-08-19', TRUE),
    ('wiki:ru:adilet:108', 'OTHER', 'Wikipedia (Википедия)', 'Мусин Багдат Батырбекович — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%9C%D1%83%D1%81%D0%B8%D0%BD,_%D0%91%D0%B0%D0%B3%D0%B4%D0%B0%D1%82_%D0%91%D0%B0%D1%82%D1%8B%D1%80%D0%B1%D0%B5%D0%BA%D0%BE%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%9C%D1%83%D1%81%D0%B8%D0%BD,_%D0%91%D0%B0%D0%B3%D0%B4%D0%B0%D1%82_%D0%91%D0%B0%D1%82%D1%8B%D1%80%D0%B1%D0%B5%D0%BA%D0%BE%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, '9c715e1429a9fe6bc32ba35f1826dab22685eba93a2e4fea5283205f2bfb0d09', '2026-08-19', TRUE),
    ('wiki:ru:adilet:109', 'OTHER', 'Wikipedia (Википедия)', 'Муталип Шахмурат — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%9C%D1%83%D1%82%D0%B0%D0%BB%D0%B8%D0%BF,_%D0%A8%D0%B0%D1%85%D0%BC%D1%83%D1%80%D0%B0%D1%82', 'https://ru.wikipedia.org/wiki/%D0%9C%D1%83%D1%82%D0%B0%D0%BB%D0%B8%D0%BF,_%D0%A8%D0%B0%D1%85%D0%BC%D1%83%D1%80%D0%B0%D1%82', 'ru', CURRENT_TIMESTAMP, '20f8ec4e9f7871d11d6ccc48d6d65d2ea06f46c0e269eaddf013e83d011934c7', '2026-08-19', TRUE),
    ('wiki:ru:adilet:117', 'OTHER', 'Wikipedia (Википедия)', 'Нахбаева Гүлісхан Сайфулинқызы — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%9D%D0%B0%D1%85%D0%B1%D0%B0%D0%B5%D0%B2%D0%B0,_%D0%93%D1%83%D0%BB%D0%B8%D1%81%D1%85%D0%B0%D0%BD_%D0%A1%D0%B0%D0%B9%D1%84%D1%83%D0%BB%D0%BB%D0%B8%D0%BD%D0%BE%D0%B2%D0%BD%D0%B0', 'https://ru.wikipedia.org/wiki/%D0%9D%D0%B0%D1%85%D0%B1%D0%B0%D0%B5%D0%B2%D0%B0,_%D0%93%D1%83%D0%BB%D0%B8%D1%81%D1%85%D0%B0%D0%BD_%D0%A1%D0%B0%D0%B9%D1%84%D1%83%D0%BB%D0%BB%D0%B8%D0%BD%D0%BE%D0%B2%D0%BD%D0%B0', 'ru', CURRENT_TIMESTAMP, '808a0970ed0de29472fc84b312244237e25eadcddd8c2c177d64ed484ec9bf84', '2026-08-19', TRUE),
    ('wiki:ru:adilet:126', 'OTHER', 'Wikipedia (Википедия)', 'Перепечина Ольга Валентиновна — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%9F%D0%B5%D1%80%D0%B5%D0%BF%D0%B5%D1%87%D0%B8%D0%BD%D0%B0,_%D0%9E%D0%BB%D1%8C%D0%B3%D0%B0_%D0%92%D0%B0%D0%BB%D0%B5%D0%BD%D1%82%D0%B8%D0%BD%D0%BE%D0%B2%D0%BD%D0%B0', 'https://ru.wikipedia.org/wiki/%D0%9F%D0%B5%D1%80%D0%B5%D0%BF%D0%B5%D1%87%D0%B8%D0%BD%D0%B0,_%D0%9E%D0%BB%D1%8C%D0%B3%D0%B0_%D0%92%D0%B0%D0%BB%D0%B5%D0%BD%D1%82%D0%B8%D0%BD%D0%BE%D0%B2%D0%BD%D0%B0', 'ru', CURRENT_TIMESTAMP, '45ec3326e4ee88d2fe2130f2c4c72db2b2b97c4fcb96c0e6cb0a83172aa2798f', '2026-08-19', TRUE),
    ('wiki:kk:adilet:126', 'OTHER', 'Уикипедия (Wikipedia)', 'Перепечина Ольга Валентиновна — KK Wikipedia', 'https://kk.wikipedia.org/wiki/%D0%9E%D0%BB%D1%8C%D0%B3%D0%B0_%D0%92%D0%B0%D0%BB%D0%B5%D0%BD%D1%82%D0%B8%D0%BD%D0%BE%D0%B2%D0%BD%D0%B0_%D0%9F%D0%B5%D1%80%D0%B5%D0%BF%D0%B5%D1%87%D0%B8%D0%BD%D0%B0', 'https://kk.wikipedia.org/wiki/%D0%9E%D0%BB%D1%8C%D0%B3%D0%B0_%D0%92%D0%B0%D0%BB%D0%B5%D0%BD%D1%82%D0%B8%D0%BD%D0%BE%D0%B2%D0%BD%D0%B0_%D0%9F%D0%B5%D1%80%D0%B5%D0%BF%D0%B5%D1%87%D0%B8%D0%BD%D0%B0', 'kk', CURRENT_TIMESTAMP, 'a1eed3eee7a50c811fa1d2fc42842759de2e05b9a9b4086ff244720a926180d7', '2026-08-19', TRUE),
    ('wiki:ru:adilet:128', 'OTHER', 'Wikipedia (Википедия)', 'Пономарёв Сергей Михайлович — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%9F%D0%BE%D0%BD%D0%BE%D0%BC%D0%B0%D1%80%D1%91%D0%B2,_%D0%A1%D0%B5%D1%80%D0%B3%D0%B5%D0%B9_%D0%9C%D0%B8%D1%85%D0%B0%D0%B9%D0%BB%D0%BE%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%9F%D0%BE%D0%BD%D0%BE%D0%BC%D0%B0%D1%80%D1%91%D0%B2,_%D0%A1%D0%B5%D1%80%D0%B3%D0%B5%D0%B9_%D0%9C%D0%B8%D1%85%D0%B0%D0%B9%D0%BB%D0%BE%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, 'f6a5a9ce2b342ab6eb869597b2d2cee8e054d841b8c48c9a066e3cdd5b2f6f1d', '2026-08-19', TRUE),
    ('wiki:ru:adilet:133', 'OTHER', 'Wikipedia (Википедия)', 'Рожин Максим Николаевич — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%A0%D0%BE%D0%B6%D0%B8%D0%BD,_%D0%9C%D0%B0%D0%BA%D1%81%D0%B8%D0%BC_%D0%9D%D0%B8%D0%BA%D0%BE%D0%BB%D0%B0%D0%B5%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%A0%D0%BE%D0%B6%D0%B8%D0%BD,_%D0%9C%D0%B0%D0%BA%D1%81%D0%B8%D0%BC_%D0%9D%D0%B8%D0%BA%D0%BE%D0%BB%D0%B0%D0%B5%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, 'd0e7ee7ca5f023aa9f0278f6feb4d851e28a17deb34bcd17e1f736557eb4e09a', '2026-08-19', TRUE),
    ('wiki:ru:adilet:136', 'OTHER', 'Wikipedia (Википедия)', 'Савельева Татьяна Михайловна — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%A1%D0%B0%D0%B2%D0%B5%D0%BB%D1%8C%D0%B5%D0%B2%D0%B0,_%D0%A2%D0%B0%D1%82%D1%8C%D1%8F%D0%BD%D0%B0_%D0%9C%D0%B8%D1%85%D0%B0%D0%B9%D0%BB%D0%BE%D0%B2%D0%BD%D0%B0', 'https://ru.wikipedia.org/wiki/%D0%A1%D0%B0%D0%B2%D0%B5%D0%BB%D1%8C%D0%B5%D0%B2%D0%B0,_%D0%A2%D0%B0%D1%82%D1%8C%D1%8F%D0%BD%D0%B0_%D0%9C%D0%B8%D1%85%D0%B0%D0%B9%D0%BB%D0%BE%D0%B2%D0%BD%D0%B0', 'ru', CURRENT_TIMESTAMP, '30a86b4eaf3f6c162f2938905171289b8782217539c48f9e572b5724b5d82c89', '2026-08-19', TRUE),
    ('wiki:ru:adilet:144', 'OTHER', 'Wikipedia (Википедия)', 'Сарым Айдос Әміроллаұлы — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%A1%D0%B0%D1%80%D1%8B%D0%BC,_%D0%90%D0%B9%D0%B4%D0%BE%D1%81_%D0%90%D0%BC%D0%B8%D1%80%D0%BE%D0%BB%D0%BB%D0%B0%D1%83%D0%BB%D1%8B', 'https://ru.wikipedia.org/wiki/%D0%A1%D0%B0%D1%80%D1%8B%D0%BC,_%D0%90%D0%B9%D0%B4%D0%BE%D1%81_%D0%90%D0%BC%D0%B8%D1%80%D0%BE%D0%BB%D0%BB%D0%B0%D1%83%D0%BB%D1%8B', 'ru', CURRENT_TIMESTAMP, 'a60d2db3998a0f3a5e49adb09a2c27455281e7b6823c1baeb2cc998a1e045663', '2026-08-19', TRUE),
    ('wiki:kk:adilet:144', 'OTHER', 'Уикипедия (Wikipedia)', 'Сарым Айдос Әміроллаұлы — KK Wikipedia', 'https://kk.wikipedia.org/wiki/%D0%90%D0%B9%D0%B4%D0%BE%D1%81_%D3%98%D0%BC%D1%96%D1%80%D0%BE%D0%BB%D0%BB%D0%B0%D2%B1%D0%BB%D1%8B_%D0%A1%D0%B0%D1%80%D1%8B%D0%BC', 'https://kk.wikipedia.org/wiki/%D0%90%D0%B9%D0%B4%D0%BE%D1%81_%D3%98%D0%BC%D1%96%D1%80%D0%BE%D0%BB%D0%BB%D0%B0%D2%B1%D0%BB%D1%8B_%D0%A1%D0%B0%D1%80%D1%8B%D0%BC', 'kk', CURRENT_TIMESTAMP, '10e9e8f3ea28d7966b44089fa6c85349c864a6d928f1f612652545899110d8fb', '2026-08-19', TRUE),
    ('wiki:ru:adilet:147', 'OTHER', 'Wikipedia (Википедия)', 'Скакова Айжан Амангельдиевна — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%A1%D0%BA%D0%B0%D0%BA%D0%BE%D0%B2%D0%B0,_%D0%90%D0%B9%D0%B6%D0%B0%D0%BD_%D0%90%D0%BC%D0%B0%D0%BD%D0%B3%D0%B5%D0%BB%D1%8C%D0%B4%D0%B8%D0%B5%D0%B2%D0%BD%D0%B0', 'https://ru.wikipedia.org/wiki/%D0%A1%D0%BA%D0%B0%D0%BA%D0%BE%D0%B2%D0%B0,_%D0%90%D0%B9%D0%B6%D0%B0%D0%BD_%D0%90%D0%BC%D0%B0%D0%BD%D0%B3%D0%B5%D0%BB%D1%8C%D0%B4%D0%B8%D0%B5%D0%B2%D0%BD%D0%B0', 'ru', CURRENT_TIMESTAMP, '154b188d5be68daf167d74b86fcfdf16896110731c03936d353b3ca68cdd039f', '2026-08-19', TRUE),
    ('wiki:ru:adilet:148', 'OTHER', 'Wikipedia (Википедия)', 'Смышляева Екатерина Васильевна — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%A1%D0%BC%D1%8B%D1%88%D0%BB%D1%8F%D0%B5%D0%B2%D0%B0,_%D0%95%D0%BA%D0%B0%D1%82%D0%B5%D1%80%D0%B8%D0%BD%D0%B0_%D0%92%D0%B0%D1%81%D0%B8%D0%BB%D1%8C%D0%B5%D0%B2%D0%BD%D0%B0', 'https://ru.wikipedia.org/wiki/%D0%A1%D0%BC%D1%8B%D1%88%D0%BB%D1%8F%D0%B5%D0%B2%D0%B0,_%D0%95%D0%BA%D0%B0%D1%82%D0%B5%D1%80%D0%B8%D0%BD%D0%B0_%D0%92%D0%B0%D1%81%D0%B8%D0%BB%D1%8C%D0%B5%D0%B2%D0%BD%D0%B0', 'ru', CURRENT_TIMESTAMP, 'b7b17fa184aa30e858a90f1030a1ecc7b109b0c2218e46630b12f5d32a3c7fac', '2026-08-19', TRUE),
    ('wiki:ru:adilet:153', 'OTHER', 'Wikipedia (Википедия)', 'Сулейменова Жулдыз Досбергеновна — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%A1%D1%83%D0%BB%D0%B5%D0%B9%D0%BC%D0%B5%D0%BD%D0%BE%D0%B2%D0%B0,_%D0%96%D1%83%D0%BB%D0%B4%D1%8B%D0%B7_%D0%94%D0%BE%D1%81%D0%B1%D0%B5%D1%80%D0%B3%D0%B5%D0%BD%D0%BE%D0%B2%D0%BD%D0%B0', 'https://ru.wikipedia.org/wiki/%D0%A1%D1%83%D0%BB%D0%B5%D0%B9%D0%BC%D0%B5%D0%BD%D0%BE%D0%B2%D0%B0,_%D0%96%D1%83%D0%BB%D0%B4%D1%8B%D0%B7_%D0%94%D0%BE%D1%81%D0%B1%D0%B5%D1%80%D0%B3%D0%B5%D0%BD%D0%BE%D0%B2%D0%BD%D0%B0', 'ru', CURRENT_TIMESTAMP, '61718228161b715a8d5e4f9a508282318fb5ee320ed8c42a665fbf8e0e6d124a', '2026-08-19', TRUE),
    ('wiki:kk:adilet:161', 'OTHER', 'Уикипедия (Wikipedia)', 'Теңізбаев Нұрбақыт Молдахметұлы — KK Wikipedia', 'https://kk.wikipedia.org/wiki/%D0%9D%D2%B1%D1%80%D0%B1%D0%B0%D2%9B%D1%8B%D1%82_%D0%9C%D0%BE%D0%BB%D0%B4%D0%B0%D1%85%D0%BC%D0%B5%D1%82%D2%B1%D0%BB%D1%8B_%D0%A2%D0%B5%D2%A3%D1%96%D0%B7%D0%B1%D0%B0%D0%B5%D0%B2', 'https://kk.wikipedia.org/wiki/%D0%9D%D2%B1%D1%80%D0%B1%D0%B0%D2%9B%D1%8B%D1%82_%D0%9C%D0%BE%D0%BB%D0%B4%D0%B0%D1%85%D0%BC%D0%B5%D1%82%D2%B1%D0%BB%D1%8B_%D0%A2%D0%B5%D2%A3%D1%96%D0%B7%D0%B1%D0%B0%D0%B5%D0%B2', 'kk', CURRENT_TIMESTAMP, '6db2baaf3b80a6197cc92ae6c63f72530f036028044c29644cdf0b3e311531a7', '2026-08-19', TRUE),
    ('wiki:ru:adilet:179', 'OTHER', 'Wikipedia (Википедия)', 'Шагиртаев Имамзада Куанышбаевич — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%A8%D0%B0%D0%B3%D0%B8%D1%80%D1%82%D0%B0%D0%B5%D0%B2,_%D0%98%D0%BC%D0%B0%D0%BC%D0%B7%D0%B0%D0%B4%D0%B0_%D0%9A%D1%83%D0%B0%D0%BD%D1%8B%D1%88%D0%B1%D0%B0%D0%B5%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%A8%D0%B0%D0%B3%D0%B8%D1%80%D1%82%D0%B0%D0%B5%D0%B2,_%D0%98%D0%BC%D0%B0%D0%BC%D0%B7%D0%B0%D0%B4%D0%B0_%D0%9A%D1%83%D0%B0%D0%BD%D1%8B%D1%88%D0%B1%D0%B0%D0%B5%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, '0b6aa17f798cd2440a8efa973434bc70d8af37132200073b0f9c57517c3ba5b6', '2026-08-19', TRUE),
    ('wiki:ru:adilet:181', 'OTHER', 'Wikipedia (Википедия)', 'Шапак Унзила — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%A8%D0%B0%D0%BF%D0%B0%D0%BA,_%D0%A3%D0%BD%D0%B7%D0%B8%D0%BB%D0%B0', 'https://ru.wikipedia.org/wiki/%D0%A8%D0%B0%D0%BF%D0%B0%D0%BA,_%D0%A3%D0%BD%D0%B7%D0%B8%D0%BB%D0%B0', 'ru', CURRENT_TIMESTAMP, 'd3db6263d62d761a543591ff77eb0423cf01dc2197d349bf2bb584dc74cb9c37', '2026-08-19', TRUE),
    ('wiki:ru:adilet:182', 'OTHER', 'Wikipedia (Википедия)', 'Шаталов Никита Сергеевич — RU Wikipedia', 'https://ru.wikipedia.org/wiki/%D0%A8%D0%B0%D1%82%D0%B0%D0%BB%D0%BE%D0%B2,_%D0%9D%D0%B8%D0%BA%D0%B8%D1%82%D0%B0_%D0%A1%D0%B5%D1%80%D0%B3%D0%B5%D0%B5%D0%B2%D0%B8%D1%87', 'https://ru.wikipedia.org/wiki/%D0%A8%D0%B0%D1%82%D0%B0%D0%BB%D0%BE%D0%B2,_%D0%9D%D0%B8%D0%BA%D0%B8%D1%82%D0%B0_%D0%A1%D0%B5%D1%80%D0%B3%D0%B5%D0%B5%D0%B2%D0%B8%D1%87', 'ru', CURRENT_TIMESTAMP, '5d06f21703d92b6000139fc268c7f6c67cf8c9518f70f1fde633abbb275ee3fe', '2026-08-19', TRUE),
    ('wiki:kk:adilet:183', 'OTHER', 'Уикипедия (Wikipedia)', 'Шермағанбет Мейрамбек Зинабдинұлы — KK Wikipedia', 'https://kk.wikipedia.org/wiki/%D0%9C%D0%B5%D0%B9%D1%80%D0%B0%D0%BC%D0%B1%D0%B5%D0%BA_%D0%97%D0%B8%D0%BD%D0%B0%D0%B1%D0%B4%D0%B8%D0%BD%D2%B1%D0%BB%D1%8B_%D0%A8%D0%B5%D1%80%D0%BC%D0%B0%D2%93%D0%B0%D0%BD%D0%B1%D0%B5%D1%82', 'https://kk.wikipedia.org/wiki/%D0%9C%D0%B5%D0%B9%D1%80%D0%B0%D0%BC%D0%B1%D0%B5%D0%BA_%D0%97%D0%B8%D0%BD%D0%B0%D0%B1%D0%B4%D0%B8%D0%BD%D2%B1%D0%BB%D1%8B_%D0%A8%D0%B5%D1%80%D0%BC%D0%B0%D2%93%D0%B0%D0%BD%D0%B1%D0%B5%D1%82', 'kk', CURRENT_TIMESTAMP, '596ff58b7f1d531e7106f40e15889d605b1f85993fa5aa96721db72376573157', '2026-08-19', TRUE),
    ('mazhilis:1674:adilet:2', 'OFFICIAL', 'Мажилис Парламента РК', 'ӘБЕНОВ Мұрат Абдуламитұлы — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/1674', 'https://mazhilis.parlam.kz/ru/deputies/1674', 'ru', CURRENT_TIMESTAMP, '3faeb111c5b52d3d1b3db51a9d82a73aadd7c775a351199a2607fe6d2762fbfb', '2026-08-19', TRUE),
    ('mazhilis:1678:adilet:4', 'OFFICIAL', 'Мажилис Парламента РК', 'АВЕРШИН Константин Викторович — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/1678', 'https://mazhilis.parlam.kz/ru/deputies/1678', 'ru', CURRENT_TIMESTAMP, 'c944fe5c8bd6edb08a809427d80cb0ff448de5f4e37692673e82c8416e5df1d9', '2026-08-19', TRUE),
    ('mazhilis:1679:adilet:8', 'OFFICIAL', 'Мажилис Парламента РК', 'АДАМБЕКОВ Тілектес Серікбайұлы — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/1679', 'https://mazhilis.parlam.kz/ru/deputies/1679', 'ru', CURRENT_TIMESTAMP, 'a5a8c5008f5a91785fd6bcb98150ad22eadbff933c7ef9809bc845d9ec3d283a', '2026-08-19', TRUE),
    ('mazhilis:8:adilet:9', 'OFFICIAL', 'Мажилис Парламента РК', 'АЙМАҒАМБЕТОВ Асхат Қанатұлы — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/8', 'https://mazhilis.parlam.kz/ru/deputies/8', 'ru', CURRENT_TIMESTAMP, 'ca9b16e855da162be101d91c8616b6a31f31d286a7aab5c6733bfb805026b0d6', '2026-08-19', TRUE),
    ('mazhilis:1681:adilet:13', 'OFFICIAL', 'Мажилис Парламента РК', 'АМАНТАЙ Жарқынбек None — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/1681', 'https://mazhilis.parlam.kz/ru/deputies/1681', 'ru', CURRENT_TIMESTAMP, '94e8dbd6e51432c39ebb925afa1f4e601d575ac459fc7c87509c80fe6a513ea9', '2026-08-19', TRUE),
    ('mazhilis:1685:adilet:21', 'OFFICIAL', 'Мажилис Парламента РК', 'ӘШІМЖАНОВ Жанарбек Садықанұлы — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/1685', 'https://mazhilis.parlam.kz/ru/deputies/1685', 'ru', CURRENT_TIMESTAMP, '0893fcf54e88d5e4c7b805378b925a570f3d9ad4b878179c4aba256ccba818bc', '2026-08-19', TRUE),
    ('mazhilis:34:adilet:36', 'OFFICIAL', 'Мажилис Парламента РК', 'БАШИМОВ Марат Советұлы — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/34', 'https://mazhilis.parlam.kz/ru/deputies/34', 'ru', CURRENT_TIMESTAMP, 'bdafac81e4322770effdc941f47559883efaa1120cb06e9ee7d5417d263140e2', '2026-08-19', TRUE),
    ('mazhilis:50:adilet:77', 'OFFICIAL', 'Мажилис Парламента РК', 'ИМАШЕВА Снежанна Валерьевна — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/50', 'https://mazhilis.parlam.kz/ru/deputies/50', 'ru', CURRENT_TIMESTAMP, 'bbb2a810fd6d26f5f5563ce8e2b9398768d6a709b7a6c27d7b63dca51f52b850', '2026-08-19', TRUE),
    ('mazhilis:56:adilet:83', 'OFFICIAL', 'Мажилис Парламента РК', 'ҚАЛЫҚОВ Арман Қобыландыұлы — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/56', 'https://mazhilis.parlam.kz/ru/deputies/56', 'ru', CURRENT_TIMESTAMP, '7d3c886fb90a4bd609d398f1b3b8377a9fd560845b078a602b35d3f6460f6b70', '2026-08-19', TRUE),
    ('mazhilis:64:adilet:99', 'OFFICIAL', 'Мажилис Парламента РК', 'КУЧИНСКАЯ Юлия Владимировна — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/64', 'https://mazhilis.parlam.kz/ru/deputies/64', 'ru', CURRENT_TIMESTAMP, 'c238af294749402554c1e1a5d6972af54595477d98ea0320a753d91d8970c8d5', '2026-08-19', TRUE),
    ('mazhilis:76:adilet:128', 'OFFICIAL', 'Мажилис Парламента РК', 'ПОНОМАРЕВ Сергей Михайлович — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/76', 'https://mazhilis.parlam.kz/ru/deputies/76', 'ru', CURRENT_TIMESTAMP, '05595248a39fd0ce363b9101a3e1853c646283b893b9bd0c4265f513fec5cb3b', '2026-08-19', TRUE),
    ('mazhilis:78:adilet:133', 'OFFICIAL', 'Мажилис Парламента РК', 'РОЖИН Максим Николаевич — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/78', 'https://mazhilis.parlam.kz/ru/deputies/78', 'ru', CURRENT_TIMESTAMP, '1a87ba82752ca25a20e2c361718b6f916dc8e2015077de282972df4ba4b59fff', '2026-08-19', TRUE),
    ('mazhilis:80:adilet:136', 'OFFICIAL', 'Мажилис Парламента РК', 'САВЕЛЬЕВА Татьяна Михайловна — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/80', 'https://mazhilis.parlam.kz/ru/deputies/80', 'ru', CURRENT_TIMESTAMP, '1f19c0cce1b0ca8d16ba780672491eb46da1992acf2f65bf1229c8c0626ddb12', '2026-08-19', TRUE),
    ('mazhilis:84:adilet:141', 'OFFICIAL', 'Мажилис Парламента РК', 'САИРОВ Ерлан Бияхметұлы — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/84', 'https://mazhilis.parlam.kz/ru/deputies/84', 'ru', CURRENT_TIMESTAMP, '8f1bb23acc620a27d811eb24e23e7b18c42d1b762a422af45013fbdc8256b6a0', '2026-08-19', TRUE),
    ('mazhilis:87:adilet:144', 'OFFICIAL', 'Мажилис Парламента РК', 'САРЫМ Айдос Әміроллаұлы — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/87', 'https://mazhilis.parlam.kz/ru/deputies/87', 'ru', CURRENT_TIMESTAMP, '2441a9075ce242fe01a6adfba3dab97c4a1e3357003f7b570461533db899cf54', '2026-08-19', TRUE),
    ('mazhilis:94:adilet:148', 'OFFICIAL', 'Мажилис Парламента РК', 'СМЫШЛЯЕВА Екатерина Васильевна — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/94', 'https://mazhilis.parlam.kz/ru/deputies/94', 'ru', CURRENT_TIMESTAMP, '06af0af2f1731a6bc658fa6662335a19f83f164918445b238a2f53ea01293b12', '2026-08-19', TRUE),
    ('mazhilis:106:adilet:181', 'OFFICIAL', 'Мажилис Парламента РК', 'ШАПАҚ Үнзила None — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/106', 'https://mazhilis.parlam.kz/ru/deputies/106', 'ru', CURRENT_TIMESTAMP, '94209a455e9b314bbb86d2c68380c21bff3ab8b62e9a76543eb7a070822670ff', '2026-08-19', TRUE),
    ('mazhilis:1703:adilet:182', 'OFFICIAL', 'Мажилис Парламента РК', 'ШАТАЛОВ Никита Сергеевич — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/1703', 'https://mazhilis.parlam.kz/ru/deputies/1703', 'ru', CURRENT_TIMESTAMP, '204cd86a9e9470fe0aac4d8292e4313902bb4713d48fe3caab908c18c2fc4fa8', '2026-08-19', TRUE),
    ('mazhilis:33:ak_zhol:5', 'OFFICIAL', 'Мажилис Парламента РК', 'БАРЛЫБАЕВ Ерлан Хайланұлы — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/33', 'https://mazhilis.parlam.kz/ru/deputies/33', 'ru', CURRENT_TIMESTAMP, 'e7718d88969b7f2e28a414be066a501fdf01641074dc1550bd07822a66a288b1', '2026-08-19', TRUE),
    ('mazhilis:1962:ak_zhol:14', 'OFFICIAL', 'Мажилис Парламента РК', 'ЕРУБАЕВ Серік Сәрсенұлы — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/1962', 'https://mazhilis.parlam.kz/ru/deputies/1962', 'ru', CURRENT_TIMESTAMP, '3e569b826f63e824153cd54c4b1f335fe597e42ddce87f970bb9105c0a024013', '2026-08-19', TRUE),
    ('mazhilis:4:ak_zhol:15', 'OFFICIAL', 'Мажилис Парламента РК', 'ЕСПАЕВА Дания Мәдиқызы — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/4', 'https://mazhilis.parlam.kz/ru/deputies/4', 'ru', CURRENT_TIMESTAMP, '110e916fd47cec0449d7dcb7439ed29b52dcc7de0dfb921ca34d11943a070a0b', '2026-08-19', TRUE),
    ('mazhilis:51:ak_zhol:21', 'OFFICIAL', 'Мажилис Парламента РК', 'ИСА Қазыбек Жарылқасынұлы — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/51', 'https://mazhilis.parlam.kz/ru/deputies/51', 'ru', CURRENT_TIMESTAMP, '7a8f293bd427129d430c40e2e91741e7e4a3d9da2402c9cc72daa7f1079b9dbc', '2026-08-19', TRUE),
    ('mazhilis:1971:ak_zhol:40', 'OFFICIAL', 'Мажилис Парламента РК', 'НҰРАЛДИНОВ Олжас Елтайұлы — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/1971', 'https://mazhilis.parlam.kz/ru/deputies/1971', 'ru', CURRENT_TIMESTAMP, '96faa33ac81b27d646d843f93ddb3df0605caa260331d2a5fc2236327bd78ed2', '2026-08-19', TRUE),
    ('mazhilis:1698:ak_zhol:42', 'OFFICIAL', 'Мажилис Парламента РК', 'ПЕРУАШЕВ Азат Тұрлыбекұлы — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/1698', 'https://mazhilis.parlam.kz/ru/deputies/1698', 'ru', CURRENT_TIMESTAMP, '2ecace5f7ccaf311afa571858238810dd903327b34b9d61a8535fa97a1b3479f', '2026-08-19', TRUE),
    ('mazhilis:1963:npk:53', 'OFFICIAL', 'Мажилис Парламента РК', 'НҰРАЛИН Асылбек Жамашұлы — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/1963', 'https://mazhilis.parlam.kz/ru/deputies/1963', 'ru', CURRENT_TIMESTAMP, 'edec698b16fe48de47a875d60735c478345160623ff6c1475a695cf23b33d5d8', '2026-08-19', TRUE),
    ('mazhilis:90:npk:61', 'OFFICIAL', 'Мажилис Парламента РК', 'Сейтжан Кенжеғұл Социалұлы — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/90', 'https://mazhilis.parlam.kz/ru/deputies/90', 'ru', CURRENT_TIMESTAMP, 'd663cecdee2bdadcee0eb9bc9f86ae29d9dc7017ac2535a8b6f6f47ee3e74e9c', '2026-08-19', TRUE),
    ('mazhilis:93:npk:63', 'OFFICIAL', 'Мажилис Парламента РК', 'СМИРНОВА Ирина Владимировна — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/93', 'https://mazhilis.parlam.kz/ru/deputies/93', 'ru', CURRENT_TIMESTAMP, '9fffa7a8b29f99e8492356c86e463e59024058620ec0c40f1ad6c21209fc5176', '2026-08-19', TRUE),
    ('mazhilis:97:npk:65', 'OFFICIAL', 'Мажилис Парламента РК', 'СҰҢҚАР Ислам Еркінұлы — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/97', 'https://mazhilis.parlam.kz/ru/deputies/97', 'ru', CURRENT_TIMESTAMP, '655782f7a9effeb4b797cce7e830b95b687caa611a59ef7afb73a4617a5213fd', '2026-08-19', TRUE),
    ('mazhilis:1683:osdp:8', 'OFFICIAL', 'Мажилис Парламента РК', 'ӘУЕСБАЕВ Нұрлан Сатыбалдыұлы — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/1683', 'https://mazhilis.parlam.kz/ru/deputies/1683', 'ru', CURRENT_TIMESTAMP, '3aeb1e58ae06801572ba4d09ab971dfd57c327c34667007c7fb74a3707f6a857', '2026-08-19', TRUE),
    ('mazhilis:77:osdp:28', 'OFFICIAL', 'Мажилис Парламента РК', 'Рақымжанов Асхат Нұрмағамбетұлы — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/77', 'https://mazhilis.parlam.kz/ru/deputies/77', 'ru', CURRENT_TIMESTAMP, 'fa61dbb7919d86223af6f0ef7a5b7f1158984a50270879a2e34a2f6244fc89d2', '2026-08-19', TRUE),
    ('mazhilis:1699:osdp:29', 'OFFICIAL', 'Мажилис Парламента РК', 'САГАНДЫКОВА Ажар Бахытқызы — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/1699', 'https://mazhilis.parlam.kz/ru/deputies/1699', 'ru', CURRENT_TIMESTAMP, '50547173dd2a36f529ff171175bd58a8d314731d007e1ea1e47855b0656df53a', '2026-08-19', TRUE),
    ('mazhilis:85:osdp:30', 'OFFICIAL', 'Мажилис Парламента РК', 'САЙЛАУБАЙ Наурыз Саятұлы — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/85', 'https://mazhilis.parlam.kz/ru/deputies/85', 'ru', CURRENT_TIMESTAMP, '71e2cca1c947d790e7c57d9db327d3a1526a7c38ed9059aa44bd3a120e3b3d09', '2026-08-19', TRUE),
    ('mazhilis:63:respublica:43', 'OFFICIAL', 'Мажилис Парламента РК', 'ҚҰСПЕКОВ Олжас Хайроллаұлы — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/63', 'https://mazhilis.parlam.kz/ru/deputies/63', 'ru', CURRENT_TIMESTAMP, '59de705c1d5dce2a3d4c54e1b0405275066a4aeb6d964b7812d962c404e89d3e', '2026-08-19', TRUE),
    ('mazhilis:73:respublica:55', 'OFFICIAL', 'Мажилис Парламента РК', 'НАУМОВА Динара Рустамқызы — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/73', 'https://mazhilis.parlam.kz/ru/deputies/73', 'ru', CURRENT_TIMESTAMP, '287e0575409f24e61184a2446bc00867704e763ef760a1adb1c6a53933d11c40', '2026-08-19', TRUE),
    ('mazhilis:1964:respublica:60', 'OFFICIAL', 'Мажилис Парламента РК', 'СМОЛЯКОВА Екатерина Сергеевна — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/1964', 'https://mazhilis.parlam.kz/ru/deputies/1964', 'ru', CURRENT_TIMESTAMP, '285bfc0aab9a856a61737ed2e9d746a3bea109efa7e42ff028d86abe2bd1e9c6', '2026-08-19', TRUE),
    ('mazhilis:100:respublica:66', 'OFFICIAL', 'Мажилис Парламента РК', 'ТАУ Нұргүл None — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/100', 'https://mazhilis.parlam.kz/ru/deputies/100', 'ru', CURRENT_TIMESTAMP, '903c39c5f6df23b8f0ba5c75b262c7401643a56819cc21d592d2abc9f7217574', '2026-08-19', TRUE),
    ('mazhilis:1702:respublica:75', 'OFFICIAL', 'Мажилис Парламента РК', 'ҚОЖАНАЗАРОВ Айдарбек Асанұлы — Официальный профиль депутата Мажилиса', 'https://mazhilis.parlam.kz/ru/deputies/1702', 'https://mazhilis.parlam.kz/ru/deputies/1702', 'ru', CURRENT_TIMESTAMP, 'f1ccece8cd490afddb0d79e0b5425427fb4267678cd3dccd7ef8cb1bc162d459', '2026-08-19', TRUE),
    ('senate:921:adilet:40', 'OFFICIAL', 'Сенат Парламента РК', 'Бекназаров Нурлан Кудиярович — Официальный профиль депутата Сената', 'https://senate.parlam.kz/ru-RU/about/deputies/921', 'https://senate.parlam.kz/ru-RU/about/deputies/921', 'ru', CURRENT_TIMESTAMP, 'e708189ceab053ba3568c88b3705ac6f412ee212a87a0d8b7301a8d8edb90ab0', '2026-08-19', TRUE),
    ('senate:1004:adilet:46', 'OFFICIAL', 'Сенат Парламента РК', 'Больгерт Евгений Андреевич — Официальный профиль депутата Сената', 'https://senate.parlam.kz/ru-RU/about/deputies/1004', 'https://senate.parlam.kz/ru-RU/about/deputies/1004', 'ru', CURRENT_TIMESTAMP, '0db8dc5d4695d29456d1b43ea07a3b404f9ade886feb1427804c52fe7cf55f45', '2026-08-19', TRUE),
    ('senate:1012:adilet:94', 'OFFICIAL', 'Сенат Парламента РК', 'Кожаев Марат Шадетханович — Официальный профиль депутата Сената', 'https://senate.parlam.kz/ru-RU/about/deputies/1012', 'https://senate.parlam.kz/ru-RU/about/deputies/1012', 'ru', CURRENT_TIMESTAMP, 'a71ccbc485bf02c159e740e6424eb275c64541260d75e7ac7a3e3419f0884a99', '2026-08-19', TRUE),
    ('senate:663:adilet:126', 'OFFICIAL', 'Сенат Парламента РК', 'Перепечина Ольга Валентиновна — Официальный профиль депутата Сената', 'https://senate.parlam.kz/ru-RU/about/deputies/663', 'https://senate.parlam.kz/ru-RU/about/deputies/663', 'ru', CURRENT_TIMESTAMP, 'e2fbe5bb034d7d3b6d667761d5b1049ead8357c340ec4f2293fc6cbc258da197', '2026-08-19', TRUE),
    ('adilet:16', 'OFFICIAL', 'Партия «Әділет» (adilet-partiyasy.kz)', 'Гульзира Атабаева — Официальный сайт партии «Әділет»', 'https://adilet-partiyasy.kz/ru/leadership', 'https://adilet-partiyasy.kz/ru/leadership', 'ru', CURRENT_TIMESTAMP, 'd57fcd5a0b725c9e31d9bee554778c4f7c44fabe5ddc42e84d5f266a04098d60', '2026-08-19', TRUE),
    ('adilet:41', 'OFFICIAL', 'Партия «Әділет» (adilet-partiyasy.kz)', 'Ренат Бектуров — Официальный сайт партии «Әділет»', 'https://adilet-partiyasy.kz/ru/leadership', 'https://adilet-partiyasy.kz/ru/leadership#adilet-41', 'ru', CURRENT_TIMESTAMP, 'c1a20490cf40f68f9b389fc989d79af664edc6a1fcdd37c552a73fadb31d32a1', '2026-08-19', TRUE),
    ('adilet:48', 'OFFICIAL', 'Партия «Әділет» (adilet-partiyasy.kz)', 'Белла Газдиева — Официальный сайт партии «Әділет»', 'https://adilet-partiyasy.kz/ru/leadership', 'https://adilet-partiyasy.kz/ru/leadership#adilet-48', 'ru', CURRENT_TIMESTAMP, 'd1d0d2ce46b8d299dc1c53c2cc649efd4b770805366157031ee2f737b46428d3', '2026-08-19', TRUE),
    ('adilet:54', 'OFFICIAL', 'Партия «Әділет» (adilet-partiyasy.kz)', 'Айбек Аркабаевич Дадебай — Официальный сайт партии «Әділет»', 'https://adilet-partiyasy.kz/ru/chairman', 'https://adilet-partiyasy.kz/ru/chairman', 'ru', CURRENT_TIMESTAMP, 'a14cdbc7273f9296f47a7c6a7728f6e594625abd78a46b43d0e3e950622d6013', '2026-08-19', TRUE),
    ('adilet:56', 'OFFICIAL', 'Партия «Әділет» (adilet-partiyasy.kz)', 'Карлыгаш Джаманкулова — Официальный сайт партии «Әділет»', 'https://adilet-partiyasy.kz/ru/leadership', 'https://adilet-partiyasy.kz/ru/leadership#adilet-56', 'ru', CURRENT_TIMESTAMP, '031c587802742e1be4c89d9a255a4587696d9c655abdd161943f16ba40ecc23d', '2026-08-19', TRUE),
    ('adilet:74', 'OFFICIAL', 'Партия «Әділет» (adilet-partiyasy.kz)', 'Динара Закиева — Официальный сайт партии «Әділет»', 'https://adilet-partiyasy.kz/ru/leadership', 'https://adilet-partiyasy.kz/ru/leadership#adilet-74', 'ru', CURRENT_TIMESTAMP, 'cedf103fcc569dbbb70b51cac6caf123a07eba2321095006cfd7b19a66ef1976', '2026-08-19', TRUE),
    ('adilet:90', 'OFFICIAL', 'Партия «Әділет» (adilet-partiyasy.kz)', 'Рауан Кенжеханулы — Официальный сайт партии «Әділет»', 'https://adilet-partiyasy.kz/ru/leadership', 'https://adilet-partiyasy.kz/ru/leadership#adilet-90', 'ru', CURRENT_TIMESTAMP, '61aa9f2373825fec45c7fe4c2513b5cba77e9dff688b4140a5691b715df1b3d8', '2026-08-19', TRUE),
    ('adilet:97', 'OFFICIAL', 'Партия «Әділет» (adilet-partiyasy.kz)', 'Замира Кузиева — Официальный сайт партии «Әділет»', 'https://adilet-partiyasy.kz/ru/leadership', 'https://adilet-partiyasy.kz/ru/leadership#adilet-97', 'ru', CURRENT_TIMESTAMP, '5ad4417d1e391a72ced0d7896684c581bd80c70439a2d14825e943bbf50e9a27', '2026-08-19', TRUE),
    ('adilet:103', 'OFFICIAL', 'Партия «Әділет» (adilet-partiyasy.kz)', 'Андрей Лаврентьев — Официальный сайт партии «Әділет»', 'https://adilet-partiyasy.kz/ru/leadership', 'https://adilet-partiyasy.kz/ru/leadership#adilet-103', 'ru', CURRENT_TIMESTAMP, '94eb7282b1a3ef5f656e95c10b3dea36395d100189af97147d99c11f1f8d5b32', '2026-08-19', TRUE),
    ('adilet:158', 'OFFICIAL', 'Партия «Әділет» (adilet-partiyasy.kz)', 'Мухамедкали Тауан — Официальный сайт партии «Әділет»', 'https://adilet-partiyasy.kz/ru/leadership', 'https://adilet-partiyasy.kz/ru/leadership#adilet-158', 'ru', CURRENT_TIMESTAMP, '68d08da53ff01d32e834a587664619714f58734cd04e959c2b4aa298e5ba6d6e', '2026-08-19', TRUE),
    ('adilet:160', 'OFFICIAL', 'Партия «Әділет» (adilet-partiyasy.kz)', 'Ирина Тен — Официальный сайт партии «Әділет»', 'https://adilet-partiyasy.kz/ru/leadership', 'https://adilet-partiyasy.kz/ru/leadership#adilet-160', 'ru', CURRENT_TIMESTAMP, 'e0686cc9ea568a53f26cb97b0ffbd0bc75ecc3303257ca2a6c3572a1a58be324', '2026-08-19', TRUE),
    ('adilet:178', 'OFFICIAL', 'Партия «Әділет» (adilet-partiyasy.kz)', 'Лаззат Чинкисбаева — Официальный сайт партии «Әділет»', 'https://adilet-partiyasy.kz/ru/leadership', 'https://adilet-partiyasy.kz/ru/leadership#adilet-178', 'ru', CURRENT_TIMESTAMP, '5bebd1b11415007491458a50fa859194c6f7e80225ae78f13f863d65cf836f43', '2026-08-19', TRUE),
    ('adilet:184', 'OFFICIAL', 'Партия «Әділет» (adilet-partiyasy.kz)', 'Марат Шибутов — Официальный сайт партии «Әділет»', 'https://adilet-partiyasy.kz/ru/leadership', 'https://adilet-partiyasy.kz/ru/leadership#adilet-184', 'ru', CURRENT_TIMESTAMP, 'e30726142d52bf9cd3da05d55741cdb79179ecf6fd11f1a5f482deae1a083044', '2026-08-19', TRUE),
    ('respublica:16', 'OFFICIAL', 'Партия «Respublica» (respublica-partiyasy.kz)', ' Бергенев Чингиз Адылгазыевич — Официальный сайт партии Respublica', 'https://api.respublica-partiyasy.kz/api/v1/party-leadership/9', 'https://api.respublica-partiyasy.kz/api/v1/party-leadership/9', 'ru', CURRENT_TIMESTAMP, '4168264ecc9824cd6839005de993f25e883e0f2850d619ba0c0704570aea0e6a', '2026-08-19', TRUE),
    ('respublica:17', 'OFFICIAL', 'Партия «Respublica» (respublica-partiyasy.kz)', 'Болысов Тохтар Коммунарович — Официальный сайт партии Respublica', 'https://api.respublica-partiyasy.kz/api/v1/party-leadership/25', 'https://api.respublica-partiyasy.kz/api/v1/party-leadership/25', 'ru', CURRENT_TIMESTAMP, '954b832dfc861cad89b7d12329a7644e0a5a22adfacc05ba3eaa78a6c9747869', '2026-08-19', TRUE),
    ('respublica:33', 'OFFICIAL', 'Партия «Respublica» (respublica-partiyasy.kz)', 'Искаков Жанат Маратович — Официальный сайт партии Respublica', 'https://api.respublica-partiyasy.kz/api/v1/party-leadership/4', 'https://api.respublica-partiyasy.kz/api/v1/party-leadership/4', 'ru', CURRENT_TIMESTAMP, '16c299306727bb3daa4ebe379efa312f26f69e504a618666ac9d0c536331ddd4', '2026-08-19', TRUE),
    ('respublica:43', 'OFFICIAL', 'Партия «Respublica» (respublica-partiyasy.kz)', 'КУСПЕКОВ Олжас — Официальный сайт партии Respublica', 'https://api.respublica-partiyasy.kz/api/v1/deputies', 'https://api.respublica-partiyasy.kz/api/v1/deputies', 'ru', CURRENT_TIMESTAMP, 'e01136192955fd20d1c3e2f442615022967e1d6d074912e6b6aa183d5d8c7988', '2026-08-19', TRUE),
    ('respublica:55', 'OFFICIAL', 'Партия «Respublica» (respublica-partiyasy.kz)', 'НАУМОВА Динара — Официальный сайт партии Respublica', 'https://api.respublica-partiyasy.kz/api/v1/deputies', 'https://api.respublica-partiyasy.kz/api/v1/deputies#respublica-55', 'ru', CURRENT_TIMESTAMP, '537c36faec12ee476535d6b33f1c5eb7abf5f024bfdb35aa70fcd075100a7fd5', '2026-08-19', TRUE),
    ('respublica:60', 'OFFICIAL', 'Партия «Respublica» (respublica-partiyasy.kz)', 'СМОЛЯКОВА Екатерина — Официальный сайт партии Respublica', 'https://api.respublica-partiyasy.kz/api/v1/deputies', 'https://api.respublica-partiyasy.kz/api/v1/deputies#respublica-60', 'ru', CURRENT_TIMESTAMP, 'e853dedac77ba4c3190004ca17fd7ddfbd89ed10b35f29f25749f1a57ad6242a', '2026-08-19', TRUE),
    ('respublica:66', 'OFFICIAL', 'Партия «Respublica» (respublica-partiyasy.kz)', 'ТАУ Нургуль — Официальный сайт партии Respublica', 'https://api.respublica-partiyasy.kz/api/v1/deputies', 'https://api.respublica-partiyasy.kz/api/v1/deputies#respublica-66', 'ru', CURRENT_TIMESTAMP, '82ab49565d8eb68051aa44221692eae4f236d88b000517f92247507d03d61902', '2026-08-19', TRUE),
    ('respublica:68', 'OFFICIAL', 'Партия «Respublica» (respublica-partiyasy.kz)', ' Тогизбаева Айдана Кенбаевна — Официальный сайт партии Respublica', 'https://api.respublica-partiyasy.kz/api/v1/party-leadership/10', 'https://api.respublica-partiyasy.kz/api/v1/party-leadership/10', 'ru', CURRENT_TIMESTAMP, 'b24ffe6d3fc713369f5dac70adb15f91a0cc0c3dd71071c4530a405a90efef7d', '2026-08-19', TRUE),
    ('respublica:75', 'OFFICIAL', 'Партия «Respublica» (respublica-partiyasy.kz)', 'Ходжаназаров Айдарбек Асанович — Официальный сайт партии Respublica', 'https://api.respublica-partiyasy.kz/api/v1/party-leadership/2', 'https://api.respublica-partiyasy.kz/api/v1/party-leadership/2', 'ru', CURRENT_TIMESTAMP, '54d792579a164a9f615ade400d604628c0747ad6acff362c35d0f0b25c160c59', '2026-08-19', TRUE),
    ('npk:12', 'OFFICIAL', 'Народная партия Казахстана (qnpk.kz)', 'Аукенов Мирас Серикбекович — Официальный сайт НПК', 'https://halykpartiyasy.kz/api/v1/team', 'https://halykpartiyasy.kz/api/v1/team', 'ru', CURRENT_TIMESTAMP, '359b548cec43cb1730fb2bc62361be848c97adb5e78b2a53c1725f3712965323', '2026-08-19', TRUE),
    ('npk:42', 'OFFICIAL', 'Народная партия Казахстана (qnpk.kz)', 'Куленова Лейла Искандеровна — Официальный сайт НПК', 'https://halykpartiyasy.kz/api/v1/team', 'https://halykpartiyasy.kz/api/v1/team#npk-42', 'ru', CURRENT_TIMESTAMP, 'f34bdb633d55f1fb35bd84acf380a09ea537f5da630c4f1b112cce0343216479', '2026-08-19', TRUE),
    ('npk:45', 'OFFICIAL', 'Народная партия Казахстана (qnpk.kz)', 'Кусаинов Бейбит Булатович — Официальный сайт НПК', 'https://halykpartiyasy.kz/api/v1/team', 'https://halykpartiyasy.kz/api/v1/team#npk-45', 'ru', CURRENT_TIMESTAMP, '5e72fc0b98e17c488ff058c54a9cd0ba9dc9537bc766f6db59ddc482baf1a3e0', '2026-08-19', TRUE),
    ('npk:48', 'OFFICIAL', 'Народная партия Казахстана (qnpk.kz)', 'Максутов Калел Мукатаевич — Официальный сайт НПК', 'https://halykpartiyasy.kz/api/v1/team', 'https://halykpartiyasy.kz/api/v1/team#npk-48', 'ru', CURRENT_TIMESTAMP, '363871049ecd5c83f04a516297405776938dfd5174497574b9a5711f35cd7737', '2026-08-19', TRUE),
    ('npk:71', 'OFFICIAL', 'Народная партия Казахстана (qnpk.kz)', 'Шоканов Нурсултан Нурланович — Официальный сайт НПК', 'https://halykpartiyasy.kz/api/v1/team', 'https://halykpartiyasy.kz/api/v1/team#npk-71', 'ru', CURRENT_TIMESTAMP, 'ef9bfa6d776d5233623e0cfc8e4f7ea0940623931ec716ab66f64a80809972f7', '2026-08-19', TRUE),
    ('baitaq:3', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Әміртаев Азаматхан Сайлауұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/amirtaev-azamathan-saylouovich', 'https://baytaq.kz/kk/candidates/amirtaev-azamathan-saylouovich', 'ru', CURRENT_TIMESTAMP, '6c6a150522bcecdaa191935db945a877663d3d4f312d2415d72f9eab94936d32', '2026-08-19', TRUE),
    ('baitaq:6', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Әмірова Шолпан Кенесқызы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/amirova-sholpan-keneskyzy', 'https://baytaq.kz/kk/candidates/amirova-sholpan-keneskyzy', 'ru', CURRENT_TIMESTAMP, 'c3c64770721303614eab976ab5cc9a106992d07cd3b00d61d4aeef796a52296b', '2026-08-19', TRUE),
    ('baitaq:2', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Айбеков Елдос Айбекұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/aybekov-aydos-aybekuly', 'https://baytaq.kz/kk/candidates/aybekov-aydos-aybekuly', 'ru', CURRENT_TIMESTAMP, '9028d58f0a628b59d5f1845ced2d54a86700d13d6fc7bd3b22729d8e4f202f04', '2026-08-19', TRUE),
    ('baitaq:4', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Әміртаев Сапар Әбдіраманұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/amirtaev-sapar-abdramanovich', 'https://baytaq.kz/kk/candidates/amirtaev-sapar-abdramanovich', 'ru', CURRENT_TIMESTAMP, '3945df22a4945e415097edda5059a12826dc0809ede86bc8da8f8d5e8adf51c2', '2026-08-19', TRUE),
    ('baitaq:1', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Әбдуалиева Айгүл Қадесқызы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/abdualieva-aygul-kadesovna', 'https://baytaq.kz/kk/candidates/abdualieva-aygul-kadesovna', 'ru', CURRENT_TIMESTAMP, 'f1672c9a940a0910c6c41a9d491bd67fef2b9581226f6faa9a2b5cb32af9a684', '2026-08-19', TRUE),
    ('baitaq:5', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Асқаров Бекзат Ерікұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/askarov-bekzat-erikovich', 'https://baytaq.kz/kk/candidates/askarov-bekzat-erikovich', 'ru', CURRENT_TIMESTAMP, '94c921f1743be1c242f6296b270f3c36da12cccc6c4852406a5520d084f9c32c', '2026-08-19', TRUE),
    ('baitaq:7', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Байзаханов Аслан Әділханұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/bayzahanov-aslan-adil-hanovich', 'https://baytaq.kz/kk/candidates/bayzahanov-aslan-adil-hanovich', 'ru', CURRENT_TIMESTAMP, '6192867d8c2ea333e3e977b87d7b171444d7864586a0a492c5a80290f03c6c9f', '2026-08-19', TRUE),
    ('baitaq:8', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Байтеміров Тұрсынбек Шерниязұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/baytemirov-tursynbek-sherniyazovich', 'https://baytaq.kz/kk/candidates/baytemirov-tursynbek-sherniyazovich', 'ru', CURRENT_TIMESTAMP, '9d5ad963afb52288e1af5a6d1d49b4233b41e3ff963896767dd8d0be803f8913', '2026-08-19', TRUE),
    ('baitaq:9', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Баубек Нариман Асқарұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/baubek-nariman-askaruly', 'https://baytaq.kz/kk/candidates/baubek-nariman-askaruly', 'ru', CURRENT_TIMESTAMP, 'bafdf2eecc43ac311d44ec07a04f1dc1091f2d7195a1a09fc5cb56972df7ecd2', '2026-08-19', TRUE),
    ('baitaq:11', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Бекахметов Ғабит Қайратұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/bekahmetov-gabit-kayratovich', 'https://baytaq.kz/kk/candidates/bekahmetov-gabit-kayratovich', 'ru', CURRENT_TIMESTAMP, 'e121620387e72aff36bec78ca36bfac684d1a0b04d3af251326755c1ca9e59ac', '2026-08-19', TRUE),
    ('baitaq:10', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Баяжұма Асылбек — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/bayazhuma-asylbek', 'https://baytaq.kz/kk/candidates/bayazhuma-asylbek', 'ru', CURRENT_TIMESTAMP, '840eb4638b9e6e4bc4167ceee163e8cc5ecb6588ab155be45b7a10234cd884c4', '2026-08-19', TRUE),
    ('baitaq:12', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Деркач Марина Владимировна — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/derkach-marina-vladimirovna', 'https://baytaq.kz/kk/candidates/derkach-marina-vladimirovna', 'ru', CURRENT_TIMESTAMP, '19c6a1815668125b2f03f451bb4c3a5c34088df3b088c3dd7e3c24f4db9502fb', '2026-08-19', TRUE),
    ('baitaq:15', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Досанов Абай Сәбитұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/dosanov-abay-sabitovich', 'https://baytaq.kz/kk/candidates/dosanov-abay-sabitovich', 'ru', CURRENT_TIMESTAMP, '671033a46e05315f37e45e2ae41c03bfc7b668751da8dc202638b0b66e6b107b', '2026-08-19', TRUE),
    ('baitaq:14', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Жаппарова Ардак Сарсенбекқызы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/dzhapparova-ardak-sarsenbekovna', 'https://baytaq.kz/kk/candidates/dzhapparova-ardak-sarsenbekovna', 'ru', CURRENT_TIMESTAMP, '3d6acca619e6f0544456e8f9edeb70c6540270d9f3638128d15d0d3b1d27b4ef', '2026-08-19', TRUE),
    ('baitaq:13', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Жакишев Алмаз Әжібекұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/dzhakishev-almaz-azhibekovich', 'https://baytaq.kz/kk/candidates/dzhakishev-almaz-azhibekovich', 'ru', CURRENT_TIMESTAMP, '5283dd247f0162a93a5666a9db46bd065a1bbed18403d8c6085c9225afeb2fc1', '2026-08-19', TRUE),
    ('baitaq:17', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Иманбаев Айдос Бейбітұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/imanbaev-aydos-beybitovich', 'https://baytaq.kz/kk/candidates/imanbaev-aydos-beybitovich', 'ru', CURRENT_TIMESTAMP, 'd0d67d5e3735595583aec0000aaa58dd25cf4bc8ed05334b8ab0a7f77e6fd877', '2026-08-19', TRUE),
    ('baitaq:16', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Иманалиев Аскар Маратович — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/imanaliev-askar-maratovich', 'https://baytaq.kz/kk/candidates/imanaliev-askar-maratovich', 'ru', CURRENT_TIMESTAMP, 'd60fafd591a42f752948a249120ae7943d2e013a0f70378d8df332e6d53af43a', '2026-08-19', TRUE),
    ('baitaq:18', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Қажиев Серікқан Ерғалиұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/kazhiev-serikkan-ergalievich', 'https://baytaq.kz/kk/candidates/kazhiev-serikkan-ergalievich', 'ru', CURRENT_TIMESTAMP, 'f20d1ad899ddd96354cf374d13629d3c844de3119377213d7428710d5595798f', '2026-08-19', TRUE),
    ('baitaq:19', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Каметов Бақыт Хабидоллаұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/kametov-bakyt-habidullaevich', 'https://baytaq.kz/kk/candidates/kametov-bakyt-habidullaevich', 'ru', CURRENT_TIMESTAMP, 'a24e2e80b0ee38f563f33f99e062869cc0112c75fd7da565c286efc50f74132c', '2026-08-19', TRUE),
    ('baitaq:22', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Кенжебекова Роза Темірқұлқызы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/kenzhebekova-roza-temirkulkyzy', 'https://baytaq.kz/kk/candidates/kenzhebekova-roza-temirkulkyzy', 'ru', CURRENT_TIMESTAMP, 'fa25a715040c58ae9cab66fb438c9158eb98842ea30f25c61cdb0e8eecc032a6', '2026-08-19', TRUE),
    ('baitaq:23', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Керей Бекберген Дүйсенбайұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/kerey-bekbergen-duysenbayuly', 'https://baytaq.kz/kk/candidates/kerey-bekbergen-duysenbayuly', 'ru', CURRENT_TIMESTAMP, 'd68289234df65503513c0bdeb1579a5b36890e997bdde727e8ff9fa188b1b3a1', '2026-08-19', TRUE),
    ('baitaq:21', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Кенжалиев Эльнар Бақдәулетұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/kenzhaliev-el-nar-bagdauletovich', 'https://baytaq.kz/kk/candidates/kenzhaliev-el-nar-bagdauletovich', 'ru', CURRENT_TIMESTAMP, 'd0a206b0b24f0b8ecd35175eeb237f5e5b2d7fc29eb7ffbb15f933e357a6f3bc', '2026-08-19', TRUE),
    ('baitaq:26', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Күнғожин Алмаз Мұхамбетұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/kungozhin-almaz-muhambetovich', 'https://baytaq.kz/kk/candidates/kungozhin-almaz-muhambetovich', 'ru', CURRENT_TIMESTAMP, 'd0388c0a8179437d98ee7f54152d336f0fe1915aec7b522e8006d114937026a1', '2026-08-19', TRUE),
    ('baitaq:24', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Краснокуцкий Андрей Анатольевич — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/krasnokutskiy-andrey-anatol-evich', 'https://baytaq.kz/kk/candidates/krasnokutskiy-andrey-anatol-evich', 'ru', CURRENT_TIMESTAMP, '71739803099de2f7d3ada145b735a7ff7bf16a1600855eaa3eb6ab8923533214', '2026-08-19', TRUE),
    ('baitaq:25', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Құдеринов Мұрат Тасболатұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/kuderinov-murat-tasbulatovich', 'https://baytaq.kz/kk/candidates/kuderinov-murat-tasbulatovich', 'ru', CURRENT_TIMESTAMP, 'b0d41f121a9a0358e92907765cc9f2ebbe6cc58543b76d0a6c8cd2c9900f9101', '2026-08-19', TRUE),
    ('baitaq:27', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Қыдырбаев Ерлан Жайлаубайұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/kydyrbaev-erlan-zhaylaubaevich', 'https://baytaq.kz/kk/candidates/kydyrbaev-erlan-zhaylaubaevich', 'ru', CURRENT_TIMESTAMP, '97b91d94baaf2462f74abc50a49942d31e5878e70ae361ed538ceea53f2394c3', '2026-08-19', TRUE),
    ('baitaq:28', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Қадырбаева Нұргүл Жұмахметқызы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/kadyrbaeva-nurgul-zhumahmetkyzy', 'https://baytaq.kz/kk/candidates/kadyrbaeva-nurgul-zhumahmetkyzy', 'ru', CURRENT_TIMESTAMP, 'b0125eadc6020352ddb51c9334ace2a79d46326e5456a3d9f996d3713d12afc2', '2026-08-19', TRUE),
    ('baitaq:29', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Алма Қараш — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/karash-alma', 'https://baytaq.kz/kk/candidates/karash-alma', 'ru', CURRENT_TIMESTAMP, '009d5637ce5ac22f8498b380a35279a42e0f1d48ba4071e0122d2f7456c95323', '2026-08-19', TRUE),
    ('baitaq:20', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Қамытбекова Сәуле Жайлауқызы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/kamytbekova-saule-zhaylaukyzy', 'https://baytaq.kz/kk/candidates/kamytbekova-saule-zhaylaukyzy', 'ru', CURRENT_TIMESTAMP, '07c4e839ea1f27bf26893a030de01e8b0623f7dd1b80a34c69b25b10b45068d9', '2026-08-19', TRUE),
    ('baitaq:34', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Руслан Мұратұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/muratuly-ruslan', 'https://baytaq.kz/kk/candidates/muratuly-ruslan', 'ru', CURRENT_TIMESTAMP, '3a4a2c9c939e6df47b2a4775e06750ec488ba68db26d2d82c3e4ca99e6616fcc', '2026-08-19', TRUE),
    ('baitaq:30', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Мамытов Нұрғали Киябайұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/mamytov-nurgalyy-kiyabaevich', 'https://baytaq.kz/kk/candidates/mamytov-nurgalyy-kiyabaevich', 'ru', CURRENT_TIMESTAMP, 'dad8e98c5c4cdd52b1bad1c301f0e774f77ac955376357ca3247af6ad650200f', '2026-08-19', TRUE),
    ('baitaq:31', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Мартель Владимир Александрович — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/martel-vladimir-aleksandrovich', 'https://baytaq.kz/kk/candidates/martel-vladimir-aleksandrovich', 'ru', CURRENT_TIMESTAMP, 'e52eed1ba9ee177024cf0fcb0e8411eb0acefd03d6aa43330098ed0e33d87f27', '2026-08-19', TRUE),
    ('baitaq:33', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Мұсаев Ұлан Жолдошбекович — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/musaev-ulan-zholdoshbekovich', 'https://baytaq.kz/kk/candidates/musaev-ulan-zholdoshbekovich', 'ru', CURRENT_TIMESTAMP, 'def4f136db71b13a34e0d13a9ec76c268c33cd6b1cd8fe279fe21527c52a8659', '2026-08-19', TRUE),
    ('baitaq:32', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Махамбетова Назген Мансұрханқызы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/mahambetova-nazgen-mansurhankyzy', 'https://baytaq.kz/kk/candidates/mahambetova-nazgen-mansurhankyzy', 'ru', CURRENT_TIMESTAMP, '2b29eb9f91a3cce9094cff3aedf3c0be0ec8338d0c79c39e23457a0ff830d610', '2026-08-19', TRUE),
    ('baitaq:36', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Ордабеков Алтай Еркебекұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/ordabekov-altay-erkebekovich', 'https://baytaq.kz/kk/candidates/ordabekov-altay-erkebekovich', 'ru', CURRENT_TIMESTAMP, '3854b352f99d7ca7bf29befd39d79a110abda935df764579004d4f3d2fd7d985', '2026-08-19', TRUE),
    ('baitaq:35', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Ордабеков Айдос Бахытжанұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/ordabekov-aydos-bahytzhanuly', 'https://baytaq.kz/kk/candidates/ordabekov-aydos-bahytzhanuly', 'ru', CURRENT_TIMESTAMP, '9aaa55838afe1767fb1dad4ea554dfeba68dd1abdb73e27c793aca023de43511', '2026-08-19', TRUE),
    ('baitaq:38', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Сабырова Нұргүл Едігеқызы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/saburova-nurgul-edigeevna', 'https://baytaq.kz/kk/candidates/saburova-nurgul-edigeevna', 'ru', CURRENT_TIMESTAMP, '3915279570a5d800b8c2369b48b202bd06ecb24f509364a796c72ef20f5213c8', '2026-08-19', TRUE),
    ('baitaq:40', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Садинов Самат Қамысбайұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/sadinov-samat-kamysbaevich', 'https://baytaq.kz/kk/candidates/sadinov-samat-kamysbaevich', 'ru', CURRENT_TIMESTAMP, '7766f2c4086e6cbe453a81da6d8e338f92e1d3bfab60fc034a7d56cc1b82fd8b', '2026-08-19', TRUE),
    ('baitaq:39', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Сағымбаев Таир Амантайұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/sagimbaev-tair-amantaevich', 'https://baytaq.kz/kk/candidates/sagimbaev-tair-amantaevich', 'ru', CURRENT_TIMESTAMP, 'b032f2152c5e584ddb03e6e96196e96811693179e75976800da163ebc5ca7208', '2026-08-19', TRUE),
    ('baitaq:42', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Серікбаев Айбол Үсенұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/serikbaev-aybol-usenovich', 'https://baytaq.kz/kk/candidates/serikbaev-aybol-usenovich', 'ru', CURRENT_TIMESTAMP, '91daefe27eff4eba7a12c0cafa0bd2bc0474812787da71538549b26062427ccc', '2026-08-19', TRUE),
    ('baitaq:41', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Сексенова Айман Казиевна — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/seksenova-ayman-kazievna', 'https://baytaq.kz/kk/candidates/seksenova-ayman-kazievna', 'ru', CURRENT_TIMESTAMP, 'e235f2ae07f232416379b7b7540b813c48d6c9990f627c1549d0523372594c64', '2026-08-19', TRUE),
    ('baitaq:43', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Сқақов Ануарбек Ақылбекұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/skakov-anuarbek-adylbekovich', 'https://baytaq.kz/kk/candidates/skakov-anuarbek-adylbekovich', 'ru', CURRENT_TIMESTAMP, '602c15f35249f4f94a81243bef9cb0f9f30f37e2287e2dd2cb433cab087b1122', '2026-08-19', TRUE),
    ('baitaq:44', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Тұртаев Алмат Керімбайұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/turtaev-almat-kerimbaevich', 'https://baytaq.kz/kk/candidates/turtaev-almat-kerimbaevich', 'ru', CURRENT_TIMESTAMP, '86dda8316cca9666349ddc1c13906752d0849a1c7d857edf1a186586ce72cf38', '2026-08-19', TRUE),
    ('baitaq:45', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Тұртаев Болат Талғасұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/turtaev-bolat-talgasuly', 'https://baytaq.kz/kk/candidates/turtaev-bolat-talgasuly', 'ru', CURRENT_TIMESTAMP, '77794b628d3f96b2fee9441b6a2a03c37adcbc39bb5ccfc9b515e75c0217401f', '2026-08-19', TRUE),
    ('baitaq:46', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Файзулин Тамирлан Банияминұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/fayzulin-tamirlan-baniyaminovich', 'https://baytaq.kz/kk/candidates/fayzulin-tamirlan-baniyaminovich', 'ru', CURRENT_TIMESTAMP, '58761772e4f43392c1a7358593a9e8799018b3c22313304dc7baf7cb7bbee587', '2026-08-19', TRUE),
    ('baitaq:47', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Ысматуллаев Руслан Серікұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/ysmatullaev-ruslan-serikuly', 'https://baytaq.kz/kk/candidates/ysmatullaev-ruslan-serikuly', 'ru', CURRENT_TIMESTAMP, '10b8fc84e209dc3209c0bdb04fa1465ae21d3089548eb269d31c772bd55bfd3f', '2026-08-19', TRUE),
    ('baitaq:37', 'OFFICIAL', 'Партия «Байтақ» (qazaq-eco-party.kz)', 'Өміртай Амалбек Дәркенұлы — Официальный сайт партии Байтақ', 'https://baytaq.kz/kk/candidates/omirtay-amalbek-darkenuly', 'https://baytaq.kz/kk/candidates/omirtay-amalbek-darkenuly', 'ru', CURRENT_TIMESTAMP, '1dec67c588b40bba8371ac3305bedcc2ebbbbe1a60d04c318ef8024446b94f6c', '2026-08-19', TRUE);

-- 2. Link sources to candidates
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '423acc959d4e41a7f40899384ed9a86df3d703da3a829f48105d8a92986ab820', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 9 AND s.source_key = 'wiki:ru:respublica:9';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '6460c97d4a745fd49d8be2e698310500c01d81dfcf8cb0ab86107dd61f9460af', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 21 AND s.source_key = 'wiki:ru:respublica:21';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '23700b97a71810d5dbb06a9bfddd02a49994fa83beebe60c5e54b845cc02a0c2', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 43 AND s.source_key = 'wiki:ru:respublica:43';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'b35df5d89c28f77ce2d6ae3b7ca06f35608d9519562d4ac4eb3dbe536020a206', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 54 AND s.source_key = 'wiki:ru:respublica:54';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '8aa075de2c5226714171baf7bd3419a3aabb856751ce1069c8c4e6f184590098', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 55 AND s.source_key = 'wiki:ru:respublica:55';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'a929f24e47935f0fa0f510483654d02df38291fcec46cd204c871d8502e0d916', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 60 AND s.source_key = 'wiki:ru:respublica:60';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'f2f9a33d88780702c603f6b890b627943127309280d5c552a2ca9d0c67421dbc', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 65 AND s.source_key = 'wiki:ru:respublica:65';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '79b514a4e2bd89e1b0eb01ddcd3b7cafa2f92062fdc9653d9a1212aa24e8cbaa', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 66 AND s.source_key = 'wiki:ru:respublica:66';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'c0aaa11ffd84510adb76c49bdb49ed5395d0cc7d1054331197a5e221538e10b1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 75 AND s.source_key = 'wiki:ru:respublica:75';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'afb63d6e2a50abb2f5611874f8fa27afe23ac5d0b878e54d0af3e2a42b5046b9', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 5 AND s.source_key = 'wiki:ru:ak_zhol:5';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '45077d1bdbe1255bf475d30fc01dc71b2120c591d3c520d25643e37dc2906af2', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 6 AND s.source_key = 'wiki:ru:ak_zhol:6';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'b315b57aa1dc3f9f9f3c72bfc700b4346937e238b2c615bbffd7f0c4f118b0aa', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 11 AND s.source_key = 'wiki:ru:ak_zhol:11';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'c3bbfd810effa78c58b20780a5e9e8c05165b71a2bedf265a964e04fd24b6a1d', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 14 AND s.source_key = 'wiki:ru:ak_zhol:14';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '1925f327d95df05856d2871c40424893a164e1064c1933c560f8cdf306fa1ddf', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 15 AND s.source_key = 'wiki:ru:ak_zhol:15';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'c37b4ab91c002f7f38ca71fcc7b824c35b8f4bb2cfe96c4d1fb551ff3480ebb2', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 21 AND s.source_key = 'wiki:ru:ak_zhol:21';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'c4405a8f042e3152b45b3d6131339f24f86dcd302ba2ecb30d909a50d2489651', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 21 AND s.source_key = 'wiki:kk:ak_zhol:21';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '0aec1cfc35fb9201c78387b17d2d8406826bd1665663474dbcc18a9986465ec0', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 31 AND s.source_key = 'wiki:ru:ak_zhol:31';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'f800122667d4717ef041e142b64cf409a524f2ab964332cb5535f674e7e636ea', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 32 AND s.source_key = 'wiki:ru:ak_zhol:32';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'b3167dde58d58d5befb9c2d51c993f0d648579af9855c0112af37656477a01b4', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 40 AND s.source_key = 'wiki:ru:ak_zhol:40';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '178ad84e68a5e376c58e744bdb33eb2290cfd3bcfdbe7586ff565830d0903a78', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 42 AND s.source_key = 'wiki:ru:ak_zhol:42';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'bc46b15c4fb483d700f6a60e1e913ac6c09fc093d9522476fac5d8b4b96a8be0', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 52 AND s.source_key = 'wiki:kk:ak_zhol:52';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '4d3ad8081afabf2c4dea15f506bc12484487fd2c5c148c7322e38bdefa75c827', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'auyl' AND c.list_order = 1 AND s.source_key = 'wiki:ru:auyl:1';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '9604dae404f885eb889f0f833b33b30ffeb191b9f7c7bcc849f98211aff5adc7', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'auyl' AND c.list_order = 7 AND s.source_key = 'wiki:ru:auyl:7';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '28fa651f18236935d5a82b793b5935cc252357017c943d528c467dfbe2d563aa', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'auyl' AND c.list_order = 11 AND s.source_key = 'wiki:ru:auyl:11';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '62ab6ce590f5129222ef5fbbcfca13d17f60c50829229a2755f7143ab274719a', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'auyl' AND c.list_order = 23 AND s.source_key = 'wiki:ru:auyl:23';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'f5227270ecd0b0047f9c5626eb655acf57c57794d3cc291319577b0bbe4e9b9c', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'auyl' AND c.list_order = 23 AND s.source_key = 'wiki:kk:auyl:23';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '5a28dc3b6f0f084dacc5ae6a7daf53148f44ce2f0599411d210acaa492aa8371', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'auyl' AND c.list_order = 28 AND s.source_key = 'wiki:kk:auyl:28';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'cc6f869ed151e2b9edb122adae30c048d6f9678829b219ecf63d0b236b75b9c6', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'auyl' AND c.list_order = 59 AND s.source_key = 'wiki:ru:auyl:59';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'cf9f4a4ea4d347f0ee43e42d3579be4994335d646e095093b510bc897695097a', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'auyl' AND c.list_order = 65 AND s.source_key = 'wiki:ru:auyl:65';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '88114a703c361d7a4658d02b9202409cb8c8081671551a2d9500d68d521fae97', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 61 AND s.source_key = 'wiki:ru:npk:61';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '66b3febceb6b813fee9b3839326d3c41d639800904ad8cbc51d2056216928518', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 61 AND s.source_key = 'wiki:kk:npk:61';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'dd52a13317845a31b27c21de89451dc49461c5c34de61918fc99d9564d0189d6', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 63 AND s.source_key = 'wiki:ru:npk:63';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'ea3f1b56cef27c48653edbd851b8608ce597a2511186c459c03eb649889e3787', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 63 AND s.source_key = 'wiki:kk:npk:63';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'e2bbf5fb46359a33deab85f26811fbb2831afb35f66e0c2cd985d1145e8300cf', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 64 AND s.source_key = 'wiki:kk:npk:64';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'f45b642d4ba2772101ed52c3b234f08525567266ccafff18716038bdd61cee65', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 71 AND s.source_key = 'wiki:ru:npk:71';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '027cab887cf3660a89b3e68c09c72556efbe9ae2281ed9064b902be3c0aaae9e', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'osdp' AND c.list_order = 8 AND s.source_key = 'wiki:ru:osdp:8';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '896d90b756dea8b3f6d96ffd4057e695bbabb1ee8d2864d6d532ead6a20649dc', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'osdp' AND c.list_order = 28 AND s.source_key = 'wiki:ru:osdp:28';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '5f0f93452a60e7b5f05f17818fd86a4a59fc079a6fca9eee5e9053874b28acfa', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'osdp' AND c.list_order = 29 AND s.source_key = 'wiki:ru:osdp:29';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'b1c6db8f9a7ad7b8e44d2871598024a54b6f56a695139ba5b472cd870497bc1e', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'osdp' AND c.list_order = 30 AND s.source_key = 'wiki:ru:osdp:30';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '9f1c7d9690357b1cfea8447646eced0bdb801bd55c3148980d4d46828a3ed52d', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 2 AND s.source_key = 'wiki:ru:adilet:2';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'ca513bcc69dbc65dd595fa874cffccdb76b50026e694481b8c04e6ddb0b1e3e2', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 4 AND s.source_key = 'wiki:ru:adilet:4';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'b238ae7b600f9dd42a0462cca5268f28f640feee131c719ec2c392a96f9c4958', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 4 AND s.source_key = 'wiki:kk:adilet:4';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '17f68b5c1076ae39c8ab9e4092258d76db5142312e113c4fe80318ac0e6c1f87', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 8 AND s.source_key = 'wiki:ru:adilet:8';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'f078e2302c7fefefdcd3142ee85beb9b2771d8b698907cc9dc96560156f74d64', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 9 AND s.source_key = 'wiki:ru:adilet:9';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '7a8282e84984e4d28050382f4492147ab8d7791a262fb587a90b505f8cfc4262', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 13 AND s.source_key = 'wiki:ru:adilet:13';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '35190593f6957c8e65c0c720f0627f2e6f0f3535f9a59f94c74b9cf3f409edc4', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 33 AND s.source_key = 'wiki:ru:adilet:33';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '076ee42091d8d02276715466a983c0cfe347df59526d7921389738d2470e0356', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 34 AND s.source_key = 'wiki:ru:adilet:34';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '806682fdacfd63821ed45e0f6abe8e0ce1395f4eaf6fdc5783b9d6ffa3559b01', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 36 AND s.source_key = 'wiki:ru:adilet:36';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'b1179adb7d42d949981f1f68e6a635fea75e0c162f55a164556fd49b4fd60b0e', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 40 AND s.source_key = 'wiki:ru:adilet:40';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '6af4a78224fbce587f92051e2f6cbd76cc6ca1b0bba52b3044f2c30143c7245b', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 46 AND s.source_key = 'wiki:ru:adilet:46';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '765f780b1d801b37012c32894d7b0e0454c72e21ca91dda7f0b9f98fd986b0a4', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 49 AND s.source_key = 'wiki:kk:adilet:49';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '431c4b36cf390744b1afc2f24d8d80b4dde28c066e48cf699f17f74d6f2f569e', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 54 AND s.source_key = 'wiki:kk:adilet:54';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'bf1658c4556a5aee92de635427fa9a52112e851fa37bc958b34bbb5e29a95a32', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 59 AND s.source_key = 'wiki:ru:adilet:59';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'ff4a4bc950ba95b56ab90fbf3c8bde4d11aa7babf59590a51ca774221e946f42', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 74 AND s.source_key = 'wiki:ru:adilet:74';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'ca2e841f0ab61cbbb5b0736f6c66302816cfd8ec57166d3e1853ac1054a88cc7', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 75 AND s.source_key = 'wiki:ru:adilet:75';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '9927e5d77808d2874d2487d7e9b786ee9eaac0446fc76f1e83f5aa50ade38914', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 77 AND s.source_key = 'wiki:ru:adilet:77';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '9d87d85d3c96e731332feaca994766c4925f7f4fd9d6797bf0638771de2a1b60', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 81 AND s.source_key = 'wiki:ru:adilet:81';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '8c6422422e7a583f65aca4fd762cb8216c0342ce4513046527b7e64f0f1c655b', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 83 AND s.source_key = 'wiki:ru:adilet:83';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'ff84e47371e55851c02eaa991204ff9c3d17d50ad7e5661cf20f7fdc8cbcd8c7', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 86 AND s.source_key = 'wiki:ru:adilet:86';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'c8f165592dcb477f62f705887826e4acdb906b4a9d982d4d0fccc52373603f6e', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 88 AND s.source_key = 'wiki:kk:adilet:88';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'e91f2063822d38fa383be90ec8ea65f867cbc725d2e24481e356f86e68e8b5db', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 90 AND s.source_key = 'wiki:kk:adilet:90';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '350d0610591e36344b627febc8c6bf27d8ef64e49c476d24dd0385304a3fe8ad', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 94 AND s.source_key = 'wiki:ru:adilet:94';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '9860f406030bb9c1f533e1b57d27ea3bdd8bd28cea227433e8bcdc13ba53291a', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 95 AND s.source_key = 'wiki:ru:adilet:95';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'fba72e7392e248ed1f54a1cfc304f810b99e8812b40a3e9d42b193311d554c16', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 99 AND s.source_key = 'wiki:ru:adilet:99';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '41727cd8761fc06e3d53063c31c089fcfdfe0bdb7d9d454b61b80a91597b66c1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 100 AND s.source_key = 'wiki:kk:adilet:100';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'cfd88d1cfdb7d023ada89a188aba779bb3eadc3910db8297a9c6faf0e98ca5c3', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 103 AND s.source_key = 'wiki:ru:adilet:103';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'af76705a49f7c21520bcbb23959d373a759185003a1799131dbf4be2e75a5f34', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 108 AND s.source_key = 'wiki:ru:adilet:108';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '8d6e8581287b6fcdc5b0707dac3fb9522727d3740c7827a5f3cc982f2e188f25', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 109 AND s.source_key = 'wiki:ru:adilet:109';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'baf90ac7035d1b18c1b63e2afc70f42b95114973c3776970bf17b4b7de754de2', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 117 AND s.source_key = 'wiki:ru:adilet:117';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'f252d5dda73ee920d69872f54c7f350dcc8144200d6b3693b0fde735045571ed', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 126 AND s.source_key = 'wiki:ru:adilet:126';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'cf529e53ed5c41df9ecd8a941aa7c87768375a2fc592d90780475a80409b2d8e', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 126 AND s.source_key = 'wiki:kk:adilet:126';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'f6a68f3c05dadddd14b857b231d5c9688cc8ae0ede03c64a9459c52ae2716d64', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 128 AND s.source_key = 'wiki:ru:adilet:128';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '8e333ff215415fbf05a2e2d089ca5246483c6d6e52b725d55749c8dc5c33e59f', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 133 AND s.source_key = 'wiki:ru:adilet:133';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'd631b6caea8651c2c67e5b0f80b38c575db005499cff3f46c59c1560bd24162b', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 136 AND s.source_key = 'wiki:ru:adilet:136';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '1372fad564c42c44d9146f8f09f445c385f8bd8a5cdb89395e47249a3252cac5', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 144 AND s.source_key = 'wiki:ru:adilet:144';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '24da6df26f39be977f4105f3fc0abae21d857db7a85a65aaf448695401f95719', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 144 AND s.source_key = 'wiki:kk:adilet:144';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'd7d8c4b3a957405771bd2fde45a49810e3d2006ad3a96dc15b814f61c0976d55', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 147 AND s.source_key = 'wiki:ru:adilet:147';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'ac54a9a535354a38d44416b7110645198389797357f224d42f9aae49a7e676b2', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 148 AND s.source_key = 'wiki:ru:adilet:148';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '1a42e9d077fbbe675f4204ebc2a322f3ea51c54fe9594cc03eec9d1551320103', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 153 AND s.source_key = 'wiki:ru:adilet:153';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'c4d5176c52f477841bbca585e170ffca55810af162a5a788e49f4542a5d9bf3b', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 161 AND s.source_key = 'wiki:kk:adilet:161';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'fa24c6b8ff50241c753c2777a285250c9c1b38746835c95043a098d16de8324e', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 179 AND s.source_key = 'wiki:ru:adilet:179';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'd8dfadb0b30a5c95c209e2caa67afceb01a5432ba2176550b69a3b185d3139f9', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 181 AND s.source_key = 'wiki:ru:adilet:181';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '8186d18a84b50831ef425da45362ea06b9ee77de38283ee5bee260aec9a84ace', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 182 AND s.source_key = 'wiki:ru:adilet:182';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '74c721578523240e7a09708eb1a25c036986c3956a521df725717612390a5320', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 183 AND s.source_key = 'wiki:kk:adilet:183';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'a6f91a9603dab52d548c5001690d7685adcbc71f28ed0b5c0bfca276ffbd8cd6', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 2 AND s.source_key = 'mazhilis:1674:adilet:2';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '89808491f82d1a70bb7a5f1d086a209c3291b48dee9da8b388a50322789b7d69', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 4 AND s.source_key = 'mazhilis:1678:adilet:4';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '60fac18c356243bfb9f22004b1bb5973e6af9aece6c1ddd5e9218c7a0486cabf', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 8 AND s.source_key = 'mazhilis:1679:adilet:8';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '51b46130b482929dd3329f59f1a29354d205769131cbd1d4a62322f89dac2ed0', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 9 AND s.source_key = 'mazhilis:8:adilet:9';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'cfeabbd57e176f081751c67a7753285bdecad18dc1a71a785e11b0dc823f2b7d', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 13 AND s.source_key = 'mazhilis:1681:adilet:13';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'ce77881ff84adc9b04b1fe64550d93b242f9c9318c51b16bd84b3b81b483abaf', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 21 AND s.source_key = 'mazhilis:1685:adilet:21';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '52473e7c5d0c7736e5b58a513a09199da3a1c52fd7165eb994b92aa0a886dfa5', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 36 AND s.source_key = 'mazhilis:34:adilet:36';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '9ab865137721e9042d0d38dee55aa00b59d447ff57bcde2202c1adcd91f60aa5', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 77 AND s.source_key = 'mazhilis:50:adilet:77';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'dba91edfceee73b0cbe58df93ed68dbdc4d22d87a7d38b0f8d5c774c22d3cab8', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 83 AND s.source_key = 'mazhilis:56:adilet:83';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '0485e8f9e54b56eedf581417f8ccf0094f4e9c79f079b54ff7d14ed1bae82ed1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 99 AND s.source_key = 'mazhilis:64:adilet:99';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '04db7eb7a8f2698ff08f8de640014fb75d926733de4e647672d0f4635afea90c', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 128 AND s.source_key = 'mazhilis:76:adilet:128';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '026258a3b849eaa18ee672c55a24859cc220149837759e4cc83a54917385d395', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 133 AND s.source_key = 'mazhilis:78:adilet:133';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '2892b6226470d04f6d3ed08dded659b56dd7436cea102424621786836f6f6af9', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 136 AND s.source_key = 'mazhilis:80:adilet:136';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '0917bfb964a24b799fde6f369c1bcedff1eb97a62835da6dc9b20d043ecd985d', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 141 AND s.source_key = 'mazhilis:84:adilet:141';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '8b1c58404e71151516f0f63fd5c09734344c7109bd2d474d5a748e0ad9fdee27', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 144 AND s.source_key = 'mazhilis:87:adilet:144';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'a0f04ede3ced20b655e632071e31ea0e1edd90aba6392991eb506a2c6b5bb612', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 148 AND s.source_key = 'mazhilis:94:adilet:148';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '54b17aa62133c6a36bff33fd6a1ce2fb0475514ef7fdc1dfcb34d1b98e30c828', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 181 AND s.source_key = 'mazhilis:106:adilet:181';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '1bb02aa30bf46754b932b094f7c8ed8400e3b574a9a80294dca5f84d36986eeb', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 182 AND s.source_key = 'mazhilis:1703:adilet:182';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'a680344db3dcc448ed682583067af8ab111cfc45cfb39c05d54b014650b89847', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 5 AND s.source_key = 'mazhilis:33:ak_zhol:5';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '152a4cd0147ffefe3bfc1ba1b3ca56e8ce3438edfdb846ced6af00ae8743d890', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 14 AND s.source_key = 'mazhilis:1962:ak_zhol:14';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '50af176987287054786c7607673e83abca15ec4476259c6535a2483f98f62260', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 15 AND s.source_key = 'mazhilis:4:ak_zhol:15';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'd7c5f5863e5b731ec0f12e6658d3abcadeede939d4a4b190e288314f62377c83', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 21 AND s.source_key = 'mazhilis:51:ak_zhol:21';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '261b89d01f20b9b0d05124928ec898f42231633761091b53a5c386352eb56576', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 40 AND s.source_key = 'mazhilis:1971:ak_zhol:40';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '785f4f8ad057d84b10b6416f4047304f62938367c9d9b26cded4d99da7561746', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 42 AND s.source_key = 'mazhilis:1698:ak_zhol:42';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '27e0d0ea64a3c7275c313d7d1c36e0d63f395b298c5b419c325de232c110d6b9', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 53 AND s.source_key = 'mazhilis:1963:npk:53';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'e05612ede7e94eba50f2e00e13f1917284d69bc99a75aff84516adfa719e7cbc', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 61 AND s.source_key = 'mazhilis:90:npk:61';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '51e787ae85684b0cf74c69957805470ba2dfb6fc9363fe0cb688b6a2d62bcdfd', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 63 AND s.source_key = 'mazhilis:93:npk:63';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'a048fc7af4920bfdf150d3b3f9e237385c42a0b02f73c261d6c2ea3a58483258', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 65 AND s.source_key = 'mazhilis:97:npk:65';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '03edfe60feb1110a4102b79e6706a4e808c5b900ac5f28336d8e7f6d5432cdb6', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'osdp' AND c.list_order = 8 AND s.source_key = 'mazhilis:1683:osdp:8';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '527729098d144c74b4524c3a6c0f649841b31d09d4e3c56e47ea41b48850c1d7', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'osdp' AND c.list_order = 28 AND s.source_key = 'mazhilis:77:osdp:28';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'aa7ebd1a33891b8f4539a42c9f69424656bc74d4068ab476dd166bfa5b7b0a1d', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'osdp' AND c.list_order = 29 AND s.source_key = 'mazhilis:1699:osdp:29';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '026dbe1bb1a3881f4144aee95ba08a5392be6bb9f6bb999e1c12fb3e44dffd06', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'osdp' AND c.list_order = 30 AND s.source_key = 'mazhilis:85:osdp:30';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '11c4e8deba8ad75bb4620c37d0c477962f3d0062d500e6a4451d93817d3558f4', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 43 AND s.source_key = 'mazhilis:63:respublica:43';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'ef88df6870eb79d908a71eaa5923c5d94ed7aa2bf1297831d59a62681646b99d', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 55 AND s.source_key = 'mazhilis:73:respublica:55';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '5e991055179f5c0ca4bd3a150df10c5e0d4fb3ca3d510c055440d10578dec421', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 60 AND s.source_key = 'mazhilis:1964:respublica:60';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'e5c4d5c10fdb0ca64709041c8700d6ba9526d07069415b504d1b324af17c5c95', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 66 AND s.source_key = 'mazhilis:100:respublica:66';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'cf30da5f1d0521e66e1ff247bc648a174e84274e8ef57259e3e51600cbf35252', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 75 AND s.source_key = 'mazhilis:1702:respublica:75';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '9e00ccae22e80ae58273c6bbb613ada6647f7e62fd34180af13f1992ea7eba0d', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 40 AND s.source_key = 'senate:921:adilet:40';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'e2fc4c5e40af43f39cd66e5c5307fb39c3bc55facb8980b093055c5d3825a9f8', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 46 AND s.source_key = 'senate:1004:adilet:46';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '705137254fea0c221a6f40dccca3b9fbc868a17ce492a06f09295b65c77a6b57', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 94 AND s.source_key = 'senate:1012:adilet:94';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'aa5e54f7d0aeb19e8202f99bd95b276d9d12847f327028bad4c551ed7c458024', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 126 AND s.source_key = 'senate:663:adilet:126';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'ed8e8901cf5583ba726cfeacc9fb2a38471b8e52b245f8a6e206003baf27bb4a', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 16 AND s.source_key = 'adilet:16';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '150597db3ee04229abd40b053366eb7bece764fb59b5de2983cd22615e2429cd', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 41 AND s.source_key = 'adilet:41';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '1470be3856f52c8ccc18b83be7bcb522c9aa28025afbddbd11d02b0164155242', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 48 AND s.source_key = 'adilet:48';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '4d84831694836e4e19d01b70471dc7807d90aafb1f995cdf9d4341ca8ac11aa4', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 54 AND s.source_key = 'adilet:54';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'f1d04fef62e7c4d8f28f9d77a30b1a4fd2a20216cfd4f05a81a253b7300bcaa3', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 56 AND s.source_key = 'adilet:56';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '0a07abe7f5c6fd4ee792044f1396304b1e98fd6ec81cff41839f9ffe0f84875d', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 74 AND s.source_key = 'adilet:74';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '6b5aa17e52721630260b1a4a98c18d968a0363b6ba7b23aaaa1f92c12fad8629', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 90 AND s.source_key = 'adilet:90';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'dce1c8c1ebccab4031f7dc9766a320b4db2febb96979ddae09d06334ff2084f9', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 97 AND s.source_key = 'adilet:97';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'cfc0f656805cb23f07868a3f51ca7efe388d74c9b721f555e0f1113bbeb7de0d', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 103 AND s.source_key = 'adilet:103';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '440bf9cb3e72bf683f8b69c4c3a82d5e551f5cecbf731875563d15a2adee5dfa', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 158 AND s.source_key = 'adilet:158';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '01c2402c651b9933b943aa4c9fe3afc677e8259c79d01c0d35997a90a0d96401', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 160 AND s.source_key = 'adilet:160';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'f7216072f486aba22ab9b4c8f4e5f4e23fb010e56687be6eb50c9065ff9c81a4', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 178 AND s.source_key = 'adilet:178';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '288bdea6785881c1b8b31e49805855a79862045f276cc8f73b95f17f4e0af72d', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 184 AND s.source_key = 'adilet:184';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '6caeac75c280ebe063ce21979e9875571d8dc147f2c74ff240f2b7d124b2cc55', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 16 AND s.source_key = 'respublica:16';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '714da1630c17a951376c1ed566b30acc4748b828be64fdeb6de4f6ac83694e37', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 17 AND s.source_key = 'respublica:17';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '568d5f3ce1f55af18c1186bfcc5bb10c05dc5321d5fd92407915913e52580f1e', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 33 AND s.source_key = 'respublica:33';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '9f1fc654e3e05703d8304186a2f0587d330bcf83a87d4879cbba72b852806b84', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 43 AND s.source_key = 'respublica:43';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'c42d2a037f23a1d94c14e387bf28e9333101709f7e36bab4771836ee4edc792c', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 55 AND s.source_key = 'respublica:55';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '7817fc5c56f5f8d519aeede2878bfa14399231ff97da94d849a8b24010ebf198', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 60 AND s.source_key = 'respublica:60';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '9f361f674142b6f86ff13c614799fd35d073ba8541ee23f1e7a472cdc579be8b', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 66 AND s.source_key = 'respublica:66';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '6c7242a3ebc2d3803e300ee98c89578aa6e05988b8b1021c3dd8046b0a8ed2b3', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 68 AND s.source_key = 'respublica:68';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '9c2741093fbf6249d4ffff4eb8c8d503d07e663e777b321a7a2d12be7da3f75b', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 75 AND s.source_key = 'respublica:75';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '4baa2f320289c452a96427889380b5008dc5f7bc8c0a0d465f90bcd5da7909ff', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 12 AND s.source_key = 'npk:12';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'cb22aaf815c0741dc48810291ddb4562166bd084d9c5f0ed3711a43a1b6b5d5a', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 42 AND s.source_key = 'npk:42';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '2fc63491854aeb1cfc8534c11580d533ecf8b2625838bac084e0105607ebb7a7', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 45 AND s.source_key = 'npk:45';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '149f05717d8f26e917cebe0eff018ffa5d4475c55824ec6dba78f2e31f070df4', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 48 AND s.source_key = 'npk:48';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'e7863a1aaa1d99394d9d73c1aeecba819ff7b84588b9afb95ed92872fc4c96e2', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 71 AND s.source_key = 'npk:71';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'b8f6216fe325b2575f26bcd169cc4948663b034c3d82642b590cf20dadf2346f', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 3 AND s.source_key = 'baitaq:3';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '6bab5dab8afc4470971ce7020a6c83e4b685b992f0bcd103cb9fd8629e4e6e5a', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 6 AND s.source_key = 'baitaq:6';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '9d01e5960b0348fd35c3eb764307e041233d76550501ce40ef42c01e6a434ae1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 2 AND s.source_key = 'baitaq:2';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '58801f5339998a056526428f4e78d9bd1b8468343c4b09c2584d6ccfe728be51', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 4 AND s.source_key = 'baitaq:4';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'cfde27df33f89af7e8d29c5aebdbc422d449c8281ac03001d323113791bffc77', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 1 AND s.source_key = 'baitaq:1';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '833906fa74b129dae00d9c3dd185692c83f02d7cc49aacb758a1e4b6564560e3', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 5 AND s.source_key = 'baitaq:5';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '13894dd1f5100313366b3b43321c7b0380c842971e8b44bf339e564a322168a0', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 7 AND s.source_key = 'baitaq:7';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '02967e8632fee3111f82c89b50f3df71717a83ed43951d3538b356e9e60023de', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 8 AND s.source_key = 'baitaq:8';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '4d8ef9fdbf3fe53af5d146a10043b91ccf9d5c3119f87b42ef77e9bf739afec1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 9 AND s.source_key = 'baitaq:9';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'f45ec60fbc907748c80069ee40b511d2cb766f726e2185fb4db28b0a7536347b', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 11 AND s.source_key = 'baitaq:11';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'c8c113c28fb940a8812dd4112e978e67965539fa7f77f0556263a5caaa39aa0b', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 10 AND s.source_key = 'baitaq:10';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '5e89b2becd02be589b86164125c9449819a041c9ae54602bbaf93d7b197bfeb0', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 12 AND s.source_key = 'baitaq:12';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '7200e6c60a2bd1ead77a89b0a071eb970703d7b0d24b1023da320221b5e46dc0', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 15 AND s.source_key = 'baitaq:15';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'ec88177488351c5a6940802efc21b6865cbf3bdf76d2dc3a89dbbe2737fe8999', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 14 AND s.source_key = 'baitaq:14';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'f14ca61986393f71179ddcdabf367cc52f80653d02ab9d5b4a5bb7dea13d391f', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 13 AND s.source_key = 'baitaq:13';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '1aa4d1982381d185bfd0bcd267d84e434990acbc606f0f2285af968e50ff4ca3', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 17 AND s.source_key = 'baitaq:17';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '9bceafe6a5dbe6c2cf379869786303f02e3ca0286fdaba9abf643dc75eafc6e6', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 16 AND s.source_key = 'baitaq:16';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'c9b97f52397c82881b1ebc7a580afcc15d6657f423468ccfec897be5b0949250', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 18 AND s.source_key = 'baitaq:18';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '467cb21ff16a007f20be214086bebc740e5d61c76dad5022347af402ea3a0e4d', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 19 AND s.source_key = 'baitaq:19';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'dded844845da8cef5182e8baf0a340cc5cd6bd7b83d636b408e5dfda902d8169', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 22 AND s.source_key = 'baitaq:22';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '03c8212bbfe68d410241c542b5efa453497e77ef9d6e18afe44fbecc40b9a3ce', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 23 AND s.source_key = 'baitaq:23';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '2e3da4eaea8e5936f4623700cc8d4f318e5d67ba9c68a37bae623ee9a5c29065', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 21 AND s.source_key = 'baitaq:21';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'c6e77451f02297a6cf64c5b4687e7f292d25b12117e34bc6ccf1cb672d6441b3', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 26 AND s.source_key = 'baitaq:26';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '0dd6e51759e7e47e5d3bad73d1de3ec398b4a96ca1b70b64ebe646f1be60ad57', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 24 AND s.source_key = 'baitaq:24';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '0998d698b7f869693cfa9e1267b8b887d6f73867c566af63f6fe2dc949483e57', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 25 AND s.source_key = 'baitaq:25';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '27ecff021cae77dca9be93fb134b4eadd88c478c1b729814cb471acb890c9f20', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 27 AND s.source_key = 'baitaq:27';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '0df7fe8d3482a90872eb8138edf40493b4533df8f037929c3558dc248410cd5b', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 28 AND s.source_key = 'baitaq:28';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '1a787a27ddc3fb461e422ba4e5c62e657c7795ce2058e5e032b07d4ef8d0bce3', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 29 AND s.source_key = 'baitaq:29';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '6f6b9fd5e2e158d6a36700c0fe5a1102280a688adeb4aaba7c32d9ff48a55d5f', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 20 AND s.source_key = 'baitaq:20';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '6d89967be92beb6337da745fac90bb68364a4b9521628eb7516a7ff8d04c74d7', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 34 AND s.source_key = 'baitaq:34';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '90a60c2a3b19f4e157fc0cefadfcc17f68a27651e6ff4e713df919960a6490c1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 30 AND s.source_key = 'baitaq:30';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '77bdfa33ada786120f5acc43a837308f81b47ccb9d716bed758b1b7e9b511312', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 31 AND s.source_key = 'baitaq:31';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'c3fb2d109502b81bb34abd59767bfd9f67fa00411915bd2dabc14c596b315ed5', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 33 AND s.source_key = 'baitaq:33';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '10d5e985d8059a2645b9e21190a3fbfce9ba1ad32e354a0b7c72363f7cab65bc', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 32 AND s.source_key = 'baitaq:32';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '346e485ef416e45ffe98948e718a92439c52a3f28813bb000b4af9058b16351f', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 36 AND s.source_key = 'baitaq:36';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '463af49b51eb1053c488899f542476ca8cb87ccf4eb924a9ab43cf97de82714f', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 35 AND s.source_key = 'baitaq:35';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'b018505122295ec78cda140edf681fce930cae121931d5ae207f7f3c9a43bc79', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 38 AND s.source_key = 'baitaq:38';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'deaaede654431098fa208168347ac8bf0403916ddb75ba628f5512ccc961749f', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 40 AND s.source_key = 'baitaq:40';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '16ca94c36e9bc01dec9c3786b56272fa3a6b93db50f20df35568c9f8e3a83592', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 39 AND s.source_key = 'baitaq:39';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'e2bf0a7454c36420ce06537d6ccab77e5959603c1cf447537fc26d920ccb55cf', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 42 AND s.source_key = 'baitaq:42';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '387c99e8f799168f61e169d0bcbe3d0cb0de39816c09afc339c840f3ee7a62f3', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 41 AND s.source_key = 'baitaq:41';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '1de303f83074b1920fc9aaa3aac08115b70c4fb7e462ac3ef0becf99f8a83a4f', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 43 AND s.source_key = 'baitaq:43';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, 'db73f8107460f0e9e5767b042fbf8c780d151390bc41f0c658c98c4e36eaca8d', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 44 AND s.source_key = 'baitaq:44';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '097283af3c15e25691b48a1ab129b1986edba5f8bcd11976b8bc987b8c02dccc', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 45 AND s.source_key = 'baitaq:45';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '0103fcd481e0377d4d972bb4c9069ad3f71b086a3b8a7ae79d1b108de2b70728', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 46 AND s.source_key = 'baitaq:46';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '1eb577772fc5032ba73b2f1b2269d43e4bd2edc7d5b5bd3f15aebabea67f1242', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 47 AND s.source_key = 'baitaq:47';
INSERT INTO candidate_source (candidate_id, source_id, relationship_type, is_primary_subject, sort_order, verified_at, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'PROFILE', TRUE, 0, CURRENT_TIMESTAMP, 'PUBLISHED', CURRENT_TIMESTAMP, '4e2df4e2369bec889d562bffd54c4b6740c5445290f37399526cf95d98eb54f1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 37 AND s.source_key = 'baitaq:37';

-- 3. Localize candidate source summaries
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Нурла́н Ери́кбаевич Аубакиров (каз. Нұрлан Ерікбайұлы Әубәкіров; род. 29 декабря 1975, Караганда) — аким города Караганды с 2014 по 2020 гг.', 'PUBLISHED', CURRENT_TIMESTAMP, '29d9fc07826e987b65e09f95da99a53fedd03b01d12b7bfcbfca2519172b6283', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 9 AND s.source_key = 'wiki:ru:respublica:9';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Нурла́н Ери́кбаевич Аубакиров (каз. Нұрлан Ерікбайұлы Әубәкіров; род. 29 декабря 1975, Караганда) — аким города Караганды с 2014 по 2020 гг.', 'PUBLISHED', CURRENT_TIMESTAMP, '29d9fc07826e987b65e09f95da99a53fedd03b01d12b7bfcbfca2519172b6283', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 9 AND s.source_key = 'wiki:ru:respublica:9';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Еркин Тлеугабылович Габбасов (каз. Еркін Тілеуғабылұлы Ғаббасов; род. 9 сентября 1983 года) — казахстанский спортсмен, стрелок-паралимпиец. Серебряный призёр летних Паралимпийских игр 2024 в Париже.', 'PUBLISHED', CURRENT_TIMESTAMP, 'a0dfb908d4a56e42c58a0fc4f83f9f255f73dc54ef199568004f8d10ee5a3ef0', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 21 AND s.source_key = 'wiki:ru:respublica:21';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Еркин Тлеугабылович Габбасов (каз. Еркін Тілеуғабылұлы Ғаббасов; род. 9 сентября 1983 года) — казахстанский спортсмен, стрелок-паралимпиец. Серебряный призёр летних Паралимпийских игр 2024 в Париже.', 'PUBLISHED', CURRENT_TIMESTAMP, 'a0dfb908d4a56e42c58a0fc4f83f9f255f73dc54ef199568004f8d10ee5a3ef0', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 21 AND s.source_key = 'wiki:ru:respublica:21';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Олжас Хайроллаевич Куспеков (каз. Олжас Хайроллаұлы Құспеков; род. 7 января 1986, Карагандинская область) — казахстанский государственный деятель. Депутат Мажилиса Парламента Республики Казахстан VIII созыва от партии Respublica с 2023 до упразднения Парламента в 2026 году.', 'PUBLISHED', CURRENT_TIMESTAMP, '0d971b6c81f4d3af16b5e3a11393873e5381f28fb5176d8fbf8774515d27d3da', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 43 AND s.source_key = 'wiki:ru:respublica:43';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Олжас Хайроллаевич Куспеков (каз. Олжас Хайроллаұлы Құспеков; род. 7 января 1986, Карагандинская область) — казахстанский государственный деятель. Депутат Мажилиса Парламента Республики Казахстан VIII созыва от партии Respublica с 2023 до упразднения Парламента в 2026 году.', 'PUBLISHED', CURRENT_TIMESTAMP, '0d971b6c81f4d3af16b5e3a11393873e5381f28fb5176d8fbf8774515d27d3da', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 43 AND s.source_key = 'wiki:ru:respublica:43';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Акмарал Мараткызы Науатбек (каз. Ақмарал Маратқызы Науатбек; род. 8 января 1999 года, Астана, Казахстан) — казахстанская парадзюдоистка. Чемпионка летних Паралимпийских игр 2024 года в Париже.', 'PUBLISHED', CURRENT_TIMESTAMP, '06f3d6b0102bfa1bea8b38f6759d0d77aea7c1732e3fb029545ef5be6bb75ee0', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 54 AND s.source_key = 'wiki:ru:respublica:54';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Акмарал Мараткызы Науатбек (каз. Ақмарал Маратқызы Науатбек; род. 8 января 1999 года, Астана, Казахстан) — казахстанская парадзюдоистка. Чемпионка летних Паралимпийских игр 2024 года в Париже.', 'PUBLISHED', CURRENT_TIMESTAMP, '06f3d6b0102bfa1bea8b38f6759d0d77aea7c1732e3fb029545ef5be6bb75ee0', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 54 AND s.source_key = 'wiki:ru:respublica:54';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Динара Рустамовна Наумова (каз. Динара Рустамқызы Наумова; род. 8 сентября 1997, Акмола, Казахстан) — казахстанский общественный деятель. Депутат Мажилиса Парламента Казахстана VIII созыва (2023—2026).', 'PUBLISHED', CURRENT_TIMESTAMP, 'dd3830f360de1b9fda68287cf963b1fd83c77777451bcd422e67f0232e7c5061', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 55 AND s.source_key = 'wiki:ru:respublica:55';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Динара Рустамовна Наумова (каз. Динара Рустамқызы Наумова; род. 8 сентября 1997, Акмола, Казахстан) — казахстанский общественный деятель. Депутат Мажилиса Парламента Казахстана VIII созыва (2023—2026).', 'PUBLISHED', CURRENT_TIMESTAMP, 'dd3830f360de1b9fda68287cf963b1fd83c77777451bcd422e67f0232e7c5061', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 55 AND s.source_key = 'wiki:ru:respublica:55';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Екатерина Сергеевна Смолякова (род. 2 августа 1987) — казахстанский политик. Депутат Мажилиса Парламента Казахстана VIII созыва (2025—2026).', 'PUBLISHED', CURRENT_TIMESTAMP, '3e525137518340e16bc04f0b26a02b49b09dabcb9ddbf9f1ac6959e7fe2d2fa7', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 60 AND s.source_key = 'wiki:ru:respublica:60';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Екатерина Сергеевна Смолякова (род. 2 августа 1987) — казахстанский политик. Депутат Мажилиса Парламента Казахстана VIII созыва (2025—2026).', 'PUBLISHED', CURRENT_TIMESTAMP, '3e525137518340e16bc04f0b26a02b49b09dabcb9ddbf9f1ac6959e7fe2d2fa7', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 60 AND s.source_key = 'wiki:ru:respublica:60';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Дурвудхан Сураган (каз. Дөрбетхан Сұраған; род. 25 апреля 1988, Баян-Улгий, Монголия) — казахстанский учёный-математик, профессор АОО «Назарбаев Университет», член-корреспондент (2017), академик (2024) Национальной академии наук Казахстана. Ведущий учёный-математик Казахстана. Один из наиболее высоко цитируемых за рубежом казахстанских учёных, общее количество цитирований 1 107 (индекс Хирша — 20) согласно базе данных Scopus. Самый молодой академик в истории НАН РК. Лауреат Государственной премии Республики Казахстана в области науки и техники имени аль-Фараби (2020). Лауреат премии Феррана Суньер-и-Балагера (2018).', 'PUBLISHED', CURRENT_TIMESTAMP, 'b04cc7b04e7aa8b804aedb8dabd2ad640d4a6191f02d9ea4ba8ac78d50f45c96', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 65 AND s.source_key = 'wiki:ru:respublica:65';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Дурвудхан Сураган (каз. Дөрбетхан Сұраған; род. 25 апреля 1988, Баян-Улгий, Монголия) — казахстанский учёный-математик, профессор АОО «Назарбаев Университет», член-корреспондент (2017), академик (2024) Национальной академии наук Казахстана. Ведущий учёный-математик Казахстана. Один из наиболее высоко цитируемых за рубежом казахстанских учёных, общее количество цитирований 1 107 (индекс Хирша — 20) согласно базе данных Scopus. Самый молодой академик в истории НАН РК. Лауреат Государственной премии Республики Казахстана в области науки и техники имени аль-Фараби (2020). Лауреат премии Феррана Суньер-и-Балагера (2018).', 'PUBLISHED', CURRENT_TIMESTAMP, 'b04cc7b04e7aa8b804aedb8dabd2ad640d4a6191f02d9ea4ba8ac78d50f45c96', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 65 AND s.source_key = 'wiki:ru:respublica:65';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Нургу́л Та́у (в точной транслитерации Нургу́ль Та́у; род. 3 января 1973, Баян-Ульгий, Монголия) — казахстанский государственный деятель, политик и педагог. Депутат Мажилиса Казахстана с 2023 до упразднения Мажилиса в 2026 году.', 'PUBLISHED', CURRENT_TIMESTAMP, 'b569f4ca26a169f6451af5a6752307919f4f96e270ae991ad4ddf54bfa50acb0', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 66 AND s.source_key = 'wiki:ru:respublica:66';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Нургу́л Та́у (в точной транслитерации Нургу́ль Та́у; род. 3 января 1973, Баян-Ульгий, Монголия) — казахстанский государственный деятель, политик и педагог. Депутат Мажилиса Казахстана с 2023 до упразднения Мажилиса в 2026 году.', 'PUBLISHED', CURRENT_TIMESTAMP, 'b569f4ca26a169f6451af5a6752307919f4f96e270ae991ad4ddf54bfa50acb0', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 66 AND s.source_key = 'wiki:ru:respublica:66';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Айдарбек Асанулы Кожаназаров (каз. Айдарбек Асанұлы Қожаназаров; род. 26 ноября 1983, Кзыл-Ординская область или Кзыл-Орда, Казахская ССР, СССР) — казахский бизнесмен и политик. Депутат Мажилиса Парламента Казахстана VIII созыва с 2023 до упразднения Парламента в 2026 году.', 'PUBLISHED', CURRENT_TIMESTAMP, 'c69691e0ef35c7a39290f48002a7bc1d0853ef4a9d3f09907ae9bc349f6740b7', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 75 AND s.source_key = 'wiki:ru:respublica:75';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Айдарбек Асанулы Кожаназаров (каз. Айдарбек Асанұлы Қожаназаров; род. 26 ноября 1983, Кзыл-Ординская область или Кзыл-Орда, Казахская ССР, СССР) — казахский бизнесмен и политик. Депутат Мажилиса Парламента Казахстана VIII созыва с 2023 до упразднения Парламента в 2026 году.', 'PUBLISHED', CURRENT_TIMESTAMP, 'c69691e0ef35c7a39290f48002a7bc1d0853ef4a9d3f09907ae9bc349f6740b7', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 75 AND s.source_key = 'wiki:ru:respublica:75';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Барлыбаев, Ерлан Хайланович', 'PUBLISHED', CURRENT_TIMESTAMP, 'a69e4680cbec307c091fcf679befd90bbe9b6dd44a230e1335c781edf2d0f0d3', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 5 AND s.source_key = 'wiki:ru:ak_zhol:5';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Барлыбаев, Ерлан Хайланович', 'PUBLISHED', CURRENT_TIMESTAMP, 'fa9f200e7ad0fb7ec1baa70829de74bf02eadfcdade20ae098d38b0de21cd29f', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 5 AND s.source_key = 'wiki:ru:ak_zhol:5';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Бейсенбаев, Ержан Алмабекович', 'PUBLISHED', CURRENT_TIMESTAMP, '6c4e79151a4c4448f8391f28f4bc9f719f26b66cacf6a97c98d5724eb2775995', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 6 AND s.source_key = 'wiki:ru:ak_zhol:6';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Бейсенбаев, Ержан Алмабекович', 'PUBLISHED', CURRENT_TIMESTAMP, '4a408d830524c9ce71abe3aba0f697ee264d91263fdd937eaaf284ac71f8d986', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 6 AND s.source_key = 'wiki:ru:ak_zhol:6';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Дюсембинов, Берик Салимжанович', 'PUBLISHED', CURRENT_TIMESTAMP, '70812e4100a7e078f14931deeb6bf4ec41dc8c32a00421cb753b7f1106452f22', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 11 AND s.source_key = 'wiki:ru:ak_zhol:11';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Дюсембинов, Берик Салимжанович', 'PUBLISHED', CURRENT_TIMESTAMP, '4a5dff24405c243df0a9f6f6ba935998e769e77055776a1be7496eb45eea2138', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 11 AND s.source_key = 'wiki:ru:ak_zhol:11';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Ерубаев, Серик Сарсенович', 'PUBLISHED', CURRENT_TIMESTAMP, '0ac0ec69103a19e7e89cf79827da40c61a7c4ec2a92e026b4b63bf89a68fabcb', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 14 AND s.source_key = 'wiki:ru:ak_zhol:14';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Ерубаев, Серик Сарсенович', 'PUBLISHED', CURRENT_TIMESTAMP, '28d11c0e78829e8df4b617cae057393058e2dc2d5ee2e652c5d8fde5fa49bf87', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 14 AND s.source_key = 'wiki:ru:ak_zhol:14';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Еспаева, Дания Мадиевна', 'PUBLISHED', CURRENT_TIMESTAMP, 'b40245bf91b5fb1499cc0498ec8ad1f7ec06d41f2c05a56309f9f3335cc54c50', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 15 AND s.source_key = 'wiki:ru:ak_zhol:15';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Еспаева, Дания Мадиевна', 'PUBLISHED', CURRENT_TIMESTAMP, 'd6496fb5baaafdcbd18c2500bd6fc90ff30e928fec94f1b763b1f5dcd2366c42', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 15 AND s.source_key = 'wiki:ru:ak_zhol:15';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Иса, Казыбек Жарылкасынулы', 'PUBLISHED', CURRENT_TIMESTAMP, '2aa1dbf8fd92dedbd431439c2c8e5eae701d1fdbc2d63e5628e5e49bf0636def', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 21 AND s.source_key = 'wiki:ru:ak_zhol:21';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Иса, Казыбек Жарылкасынулы', 'PUBLISHED', CURRENT_TIMESTAMP, '6cd5683a39eeb93a2065166031b4876d2057d751c55b930df2e2bc71573a895c', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 21 AND s.source_key = 'wiki:ru:ak_zhol:21';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Қазыбек Жарылқасынұлы Иса', 'PUBLISHED', CURRENT_TIMESTAMP, 'ac33ab28e529f8b90a0c40f24f6e7fdd5dcfee40f20203b7eaf91531d54e97aa', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 21 AND s.source_key = 'wiki:kk:ak_zhol:21';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Қазыбек Жарылқасынұлы Иса', 'PUBLISHED', CURRENT_TIMESTAMP, '962d8fbf666ac786d8fbcf7f3810f2c2679bec6c4d4e0f24b606250816ddb6ce', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 21 AND s.source_key = 'wiki:kk:ak_zhol:21';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Ли, Юрий Виссарионович', 'PUBLISHED', CURRENT_TIMESTAMP, '09be6569f950dbec3865d088bbd3a12068742f176c52f94ea1667d1879874c7f', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 31 AND s.source_key = 'wiki:ru:ak_zhol:31';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Ли, Юрий Виссарионович', 'PUBLISHED', CURRENT_TIMESTAMP, '8cec066fc41862db0af293be153c3cd41e12af19778a9c2183d295500c391f3a', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 31 AND s.source_key = 'wiki:ru:ak_zhol:31';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Линник, Андрей Григорьевич', 'PUBLISHED', CURRENT_TIMESTAMP, '6ab0896dffbef944e3ad5cceb2d673473ea04324b335665ac5a5c5b0a1122619', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 32 AND s.source_key = 'wiki:ru:ak_zhol:32';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Линник, Андрей Григорьевич', 'PUBLISHED', CURRENT_TIMESTAMP, 'dbc123a68409e6cedbf76c6aa6045e24322d212fb44a72901ad39266febdd722', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 32 AND s.source_key = 'wiki:ru:ak_zhol:32';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Нуралдинов, Олжас Ельтайулы', 'PUBLISHED', CURRENT_TIMESTAMP, '297ea7a8471c5e40b77c448608c6e9141098592adf48c9cc7622ac75e612bce0', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 40 AND s.source_key = 'wiki:ru:ak_zhol:40';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Нуралдинов, Олжас Ельтайулы', 'PUBLISHED', CURRENT_TIMESTAMP, '3faae914a9fd3c1bfd12902a5ee14da808510ce6e286dd3d80c2b6f418f64df0', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 40 AND s.source_key = 'wiki:ru:ak_zhol:40';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Перуашев, Азат Турлыбекулы', 'PUBLISHED', CURRENT_TIMESTAMP, 'a8cb0f305dcb2f9428edfae88bc42c264a731a3f8f6791448a42e23b3073e6e5', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 42 AND s.source_key = 'wiki:ru:ak_zhol:42';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Перуашев, Азат Турлыбекулы', 'PUBLISHED', CURRENT_TIMESTAMP, '8fd0f3925ba6973f6ebf1a0e765f27deb5a02666e22dfb58897975130c4b5116', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 42 AND s.source_key = 'wiki:ru:ak_zhol:42';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Дулат Тұрсынұлы Тастекей', 'PUBLISHED', CURRENT_TIMESTAMP, 'feb0786215724f26cd26f4ecc533ac5d50a4a65e6cb69daa91cb9aadf981555f', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 52 AND s.source_key = 'wiki:kk:ak_zhol:52';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Дулат Тұрсынұлы Тастекей', 'PUBLISHED', CURRENT_TIMESTAMP, '52e45e50ce54374e719f65665a35b96626db175e8786f8bb9fa07a03220c8d43', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 52 AND s.source_key = 'wiki:kk:ak_zhol:52';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Абден, Каракат Жаксылыккызы', 'PUBLISHED', CURRENT_TIMESTAMP, 'e89e08f8863455e37749e16fd989284b8f67224a6e2c0fb0089c5a6a93278da9', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'auyl' AND c.list_order = 1 AND s.source_key = 'wiki:ru:auyl:1';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Абден, Каракат Жаксылыккызы', 'PUBLISHED', CURRENT_TIMESTAMP, '2ffc22b6afaa561614e0144a74c9ed198f9064fc7c3aa60c101284ddda41250d', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'auyl' AND c.list_order = 1 AND s.source_key = 'wiki:ru:auyl:1';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Айтуганов, Кайрат Капарович', 'PUBLISHED', CURRENT_TIMESTAMP, '35072079a40950a68689209b22f46565d070b6e1a0cf59d09cd286210a00c8af', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'auyl' AND c.list_order = 7 AND s.source_key = 'wiki:ru:auyl:7';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Айтуганов, Кайрат Капарович', 'PUBLISHED', CURRENT_TIMESTAMP, '793a0e9a1158a41271ce82559feb57c8dc84e70ae12318da6b2495e5d30db985', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'auyl' AND c.list_order = 7 AND s.source_key = 'wiki:ru:auyl:7';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Арсютин, Николай Геннадьевич', 'PUBLISHED', CURRENT_TIMESTAMP, '03b5a5a90787c957933b477e0c0b0affb92ca4d1dd07d6626475c9134f40660a', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'auyl' AND c.list_order = 11 AND s.source_key = 'wiki:ru:auyl:11';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Арсютин, Николай Геннадьевич', 'PUBLISHED', CURRENT_TIMESTAMP, '52aa632d57c7dac2101ccb1ce41e93798ed129df591fdf67a18586fc8779065e', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'auyl' AND c.list_order = 11 AND s.source_key = 'wiki:ru:auyl:11';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Дайрабаев, Жигули Молдакалыкович', 'PUBLISHED', CURRENT_TIMESTAMP, '341bc4f80c11126476305906ff9e6ea5ec56c7c027d4bf3208277ee05ce6f772', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'auyl' AND c.list_order = 23 AND s.source_key = 'wiki:ru:auyl:23';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Дайрабаев, Жигули Молдакалыкович', 'PUBLISHED', CURRENT_TIMESTAMP, 'd2442cd01dc5d4a144cbfd9827d8114cf59ec5dc98ae05943276416d2f9de313', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'auyl' AND c.list_order = 23 AND s.source_key = 'wiki:ru:auyl:23';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Жигули Молдақалықұлы Дайрабаев', 'PUBLISHED', CURRENT_TIMESTAMP, 'f41829e34d0d27a5111f4f337524133c28f19a46e7a7c4271bf60f9f8cc05f8a', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'auyl' AND c.list_order = 23 AND s.source_key = 'wiki:kk:auyl:23';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Жигули Молдақалықұлы Дайрабаев', 'PUBLISHED', CURRENT_TIMESTAMP, '4e496879b04e3787655af4f30982edd35789a10e5416ac4d9e4e4e1654897d5b', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'auyl' AND c.list_order = 23 AND s.source_key = 'wiki:kk:auyl:23';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Серік Рахметоллаұлы Егізбаев', 'PUBLISHED', CURRENT_TIMESTAMP, 'bde81c1dfc492d71d09db4b321e536d48df31d1ef526625a979f57230ac4fca3', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'auyl' AND c.list_order = 28 AND s.source_key = 'wiki:kk:auyl:28';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Серік Рахметоллаұлы Егізбаев', 'PUBLISHED', CURRENT_TIMESTAMP, 'fe06df979da15cb8176176ed1a9909dcb76860b403da1f6bff88787f910cd4e0', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'auyl' AND c.list_order = 28 AND s.source_key = 'wiki:kk:auyl:28';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Саурыков, Ерболат Байузакович', 'PUBLISHED', CURRENT_TIMESTAMP, '9c364e29d74df4fd4b8dc52347a9121fededfc4c19e9383e31dd65b3c59d2cd1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'auyl' AND c.list_order = 59 AND s.source_key = 'wiki:ru:auyl:59';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Саурыков, Ерболат Байузакович', 'PUBLISHED', CURRENT_TIMESTAMP, 'a5967d0a460caf7bd28026f27ec9023f1f02c4f1e63eccc123f941fca0a3f92b', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'auyl' AND c.list_order = 59 AND s.source_key = 'wiki:ru:auyl:59';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Траисова, Эльмара Аскаровна', 'PUBLISHED', CURRENT_TIMESTAMP, '44391889831bd15c5b41e25117677dc55edf9ec3579bee752e8d08ba4b2bf4cf', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'auyl' AND c.list_order = 65 AND s.source_key = 'wiki:ru:auyl:65';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Траисова, Эльмара Аскаровна', 'PUBLISHED', CURRENT_TIMESTAMP, '0c835eb784ed62b0855863a17c97e93aa145ed90301accd554157b5e742e2861', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'auyl' AND c.list_order = 65 AND s.source_key = 'wiki:ru:auyl:65';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Сейтжан, Кенжегул Социалулы', 'PUBLISHED', CURRENT_TIMESTAMP, '7852cf7485e713c0dfabde08fa4ddfd31e80d3ce7034ef4144b165ebee9613db', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 61 AND s.source_key = 'wiki:ru:npk:61';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Сейтжан, Кенжегул Социалулы', 'PUBLISHED', CURRENT_TIMESTAMP, 'db8627aea7a89bd84df8e98ec3bcd9864401c4003b97276bfe084dfc748b7718', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 61 AND s.source_key = 'wiki:ru:npk:61';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кенжеғұл Социалұлы Сейтжан (29 шілде 1982, Амангелді ауылы, Амангелді ауданы, Қостанай облысы, Қазақ КСР) — қазақстандық қоғам қайраткер, паралимпиадалық спортшы, Қазақстан Парламенті Мәжілісінің VIII сайланым депутаты (2023 жылдан бастап).', 'PUBLISHED', CURRENT_TIMESTAMP, 'fffb6027ba206c678ed5e803c6af2acae15fe9b7514350f098ecb5c33ce285c7', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 61 AND s.source_key = 'wiki:kk:npk:61';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Кенжеғұл Социалұлы Сейтжан (29 шілде 1982, Амангелді ауылы, Амангелді ауданы, Қостанай облысы, Қазақ КСР) — қазақстандық қоғам қайраткер, паралимпиадалық спортшы, Қазақстан Парламенті Мәжілісінің VIII сайланым депутаты (2023 жылдан бастап).', 'PUBLISHED', CURRENT_TIMESTAMP, 'fffb6027ba206c678ed5e803c6af2acae15fe9b7514350f098ecb5c33ce285c7', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 61 AND s.source_key = 'wiki:kk:npk:61';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Смирнова, Ирина Владимировна: Смирнова, Ирина Владимировна (род. 1960) — депутат Мажилиса Парламента Казахстана VI созыва. Смирнова, Ирина Владимировна (род. 1981) — российская волейболистка сидя.', 'PUBLISHED', CURRENT_TIMESTAMP, 'c84183f6f926230babeac720d20b1f0368ac962786fc0be98c51cdc81157f11a', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 63 AND s.source_key = 'wiki:ru:npk:63';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Смирнова, Ирина Владимировна: Смирнова, Ирина Владимировна (род. 1960) — депутат Мажилиса Парламента Казахстана VI созыва. Смирнова, Ирина Владимировна (род. 1981) — российская волейболистка сидя.', 'PUBLISHED', CURRENT_TIMESTAMP, 'c84183f6f926230babeac720d20b1f0368ac962786fc0be98c51cdc81157f11a', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 63 AND s.source_key = 'wiki:ru:npk:63';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Ирина Владимировна Смирнова (21 шілде 1960 ,Ыстықкөл облысы, Қырғыз КСР) — қазақстандық мемлекеттік қайраткер, мәжілісмен (2016-).', 'PUBLISHED', CURRENT_TIMESTAMP, '2a7bd737b071dce02323e5a6352fb686539f22a383a90d9844f05e883dc29428', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 63 AND s.source_key = 'wiki:kk:npk:63';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Ирина Владимировна Смирнова (21 шілде 1960 ,Ыстықкөл облысы, Қырғыз КСР) — қазақстандық мемлекеттік қайраткер, мәжілісмен (2016-).', 'PUBLISHED', CURRENT_TIMESTAMP, '2a7bd737b071dce02323e5a6352fb686539f22a383a90d9844f05e883dc29428', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 63 AND s.source_key = 'wiki:kk:npk:63';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Ләззат Жаңылысқызы Сүлеймен. 1961 жылы 10 ақпанда Талдықорған облысы Ақсу ауданы Жансүгіров ауылында туған. Қазақ. Әкесі - Сүлейменов Жаңылыс Қожаханұлы, бөлімше меңгерушісі болған. Анасы - Жексембекова Тұрарбану, жұмысшы болған. Абай атындағы Қазақ педагогикалық институтының математика факультетін (1983) математика пәнінің мұғалімі мамандығы бойынша; Ресей мемлекеттік әлеуметтік институтының экономика факультетін (Мәскеу қаласы, 1992) экономист-менеджер мамандығы бойынша бітірген. Қазақ және орыс тілдерін біледі. 1977-1979 жылдары - Талдықорған облысы Ақсу ауданы ҚҒЗИЗ-ы Ақсу Тәжірибе жасау шаруашылығының жұмысшысы. 1983 жылдан -Талдықорған облысы Ақсу ауданы Жансүгіров кентінде Чапаев атындағы орта мектепте математика пәнінің мұғалімі, директордың орынбасары. 1986-1990 жылдары - Талдықорған облысы Қазақстан ЛКЖО Ақсу аудандық комитетінің бірінші хатшысы. 1992 жылдан - Талдықорған облыстық Жастар ісі комитетінің төрағасы, Талдықорған облыстық Жастар ісі, туризм және спорт басқармасының...', 'PUBLISHED', CURRENT_TIMESTAMP, 'd0fd9f150a1361054b1656cce405314d3c7aba4d4f2501e00ce37bed16fb7adc', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 64 AND s.source_key = 'wiki:kk:npk:64';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Ләззат Жаңылысқызы Сүлеймен. 1961 жылы 10 ақпанда Талдықорған облысы Ақсу ауданы Жансүгіров ауылында туған. Қазақ. Әкесі - Сүлейменов Жаңылыс Қожаханұлы, бөлімше меңгерушісі болған. Анасы - Жексембекова Тұрарбану, жұмысшы болған. Абай атындағы Қазақ педагогикалық институтының математика факультетін (1983) математика пәнінің мұғалімі мамандығы бойынша; Ресей мемлекеттік әлеуметтік институтының экономика факультетін (Мәскеу қаласы, 1992) экономист-менеджер мамандығы бойынша бітірген. Қазақ және орыс тілдерін біледі. 1977-1979 жылдары - Талдықорған облысы Ақсу ауданы ҚҒЗИЗ-ы Ақсу Тәжірибе жасау шаруашылығының жұмысшысы. 1983 жылдан -Талдықорған облысы Ақсу ауданы Жансүгіров кентінде Чапаев атындағы орта мектепте математика пәнінің мұғалімі, директордың орынбасары. 1986-1990 жылдары - Талдықорған облысы Қазақстан ЛКЖО Ақсу аудандық комитетінің бірінші хатшысы. 1992 жылдан - Талдықорған облыстық Жастар ісі комитетінің төрағасы, Талдықорған облыстық Жастар ісі, туризм және спорт басқармасының...', 'PUBLISHED', CURRENT_TIMESTAMP, 'd0fd9f150a1361054b1656cce405314d3c7aba4d4f2501e00ce37bed16fb7adc', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 64 AND s.source_key = 'wiki:kk:npk:64';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Нурсулта́н Нурла́нович Шока́нов (каз. Нұрсұлтан Нұрланұлы Шоқанов; род. 20 января 1986, Алматы, Казахская ССР, СССР) — казахстанский общественный деятель и предприниматель. Председатель Народной партии Казахстана с 2026 года. Депутат Маслихата Алматы с 2021 по 2025 годы.', 'PUBLISHED', CURRENT_TIMESTAMP, '78f3ffe65c3ce8d02c0af8e78685faac420a688fa2d0a07915d1d9d6ec91f5eb', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 71 AND s.source_key = 'wiki:ru:npk:71';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Нурсулта́н Нурла́нович Шока́нов (каз. Нұрсұлтан Нұрланұлы Шоқанов; род. 20 января 1986, Алматы, Казахская ССР, СССР) — казахстанский общественный деятель и предприниматель. Председатель Народной партии Казахстана с 2026 года. Депутат Маслихата Алматы с 2021 по 2025 годы.', 'PUBLISHED', CURRENT_TIMESTAMP, '78f3ffe65c3ce8d02c0af8e78685faac420a688fa2d0a07915d1d9d6ec91f5eb', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 71 AND s.source_key = 'wiki:ru:npk:71';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Нурлан Сатыбалдиевич Ауесбаев (каз. Нұрлан Сатыбалдыұлы Әуесбаев; род. 17 мая 1957, Алгабас, Чаяновский район, Южно-Казахстанская область) — казахстанский политический деятель. Депутат Мажилиса парламента Казахстана VIII созыва от Общенациональной социал-демократической партии с 2023 до упразднения Парламента в 2026 году. Кандидат в президенты Казахстана на выборах 2022 года от ОСДП.', 'PUBLISHED', CURRENT_TIMESTAMP, '67ebfc777ce7f42652a5b6269941580c0a29fe51c6772be34152c8e474861930', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'osdp' AND c.list_order = 8 AND s.source_key = 'wiki:ru:osdp:8';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Нурлан Сатыбалдиевич Ауесбаев (каз. Нұрлан Сатыбалдыұлы Әуесбаев; род. 17 мая 1957, Алгабас, Чаяновский район, Южно-Казахстанская область) — казахстанский политический деятель. Депутат Мажилиса парламента Казахстана VIII созыва от Общенациональной социал-демократической партии с 2023 до упразднения Парламента в 2026 году. Кандидат в президенты Казахстана на выборах 2022 года от ОСДП.', 'PUBLISHED', CURRENT_TIMESTAMP, '67ebfc777ce7f42652a5b6269941580c0a29fe51c6772be34152c8e474861930', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'osdp' AND c.list_order = 8 AND s.source_key = 'wiki:ru:osdp:8';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Асхат Нурмагамбетович Рахимжанов (каз. Асхат Нұрмағамбетұлы Рақымжанов, род. 10 июня 1983) — казахстанский государственный деятель, депутат, член Комитета по международным делам, обороне и безопасности Мажилиса Парламента Республики Казахстан VIII созыва с 2023 до до упразднения Парламента в 2026 году. Председатель Общенациональной социал-демократической партии.', 'PUBLISHED', CURRENT_TIMESTAMP, '82699498e0d248ccac18a774dd98ae469ad36607b7af4efc19f61d4ecf4350e3', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'osdp' AND c.list_order = 28 AND s.source_key = 'wiki:ru:osdp:28';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Асхат Нурмагамбетович Рахимжанов (каз. Асхат Нұрмағамбетұлы Рақымжанов, род. 10 июня 1983) — казахстанский государственный деятель, депутат, член Комитета по международным делам, обороне и безопасности Мажилиса Парламента Республики Казахстан VIII созыва с 2023 до до упразднения Парламента в 2026 году. Председатель Общенациональной социал-демократической партии.', 'PUBLISHED', CURRENT_TIMESTAMP, '82699498e0d248ccac18a774dd98ae469ad36607b7af4efc19f61d4ecf4350e3', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'osdp' AND c.list_order = 28 AND s.source_key = 'wiki:ru:osdp:28';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Ажар Бахитовна Сагандыкова (каз. Ажар Бақытқызы Сағандықова; род. 16 августа 1971, Павлодар) — казахстанский государственный деятель. Депутат Мажилиса Парламента Республики Казахстан VIII созыва от «Общенациональной социал-демократической партии» с 2023 до упразднения Парламента в 2026 году.', 'PUBLISHED', CURRENT_TIMESTAMP, '97562040d65b6d9314d730194f42877d8c4658c944eb504ff2f941e2a0b175fe', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'osdp' AND c.list_order = 29 AND s.source_key = 'wiki:ru:osdp:29';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Ажар Бахитовна Сагандыкова (каз. Ажар Бақытқызы Сағандықова; род. 16 августа 1971, Павлодар) — казахстанский государственный деятель. Депутат Мажилиса Парламента Республики Казахстан VIII созыва от «Общенациональной социал-демократической партии» с 2023 до упразднения Парламента в 2026 году.', 'PUBLISHED', CURRENT_TIMESTAMP, '97562040d65b6d9314d730194f42877d8c4658c944eb504ff2f941e2a0b175fe', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'osdp' AND c.list_order = 29 AND s.source_key = 'wiki:ru:osdp:29';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Науры́з Сая́тович Сайлауба́й (каз. Наурыз Саятұлы Сайлаубай; род. 4 марта 1994, село Кокжайдак, Аксуский район, Алматинская область, Казахстан) — казахстанский общественный деятель. Депутат Мажилиса Парламента Казахстана с 2023 до упразднения Парламента в 2026 году.', 'PUBLISHED', CURRENT_TIMESTAMP, '088b897fca7ef4d3d03922d6aa87129879a0545d777cf727fc34be3140fe56b3', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'osdp' AND c.list_order = 30 AND s.source_key = 'wiki:ru:osdp:30';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Науры́з Сая́тович Сайлауба́й (каз. Наурыз Саятұлы Сайлаубай; род. 4 марта 1994, село Кокжайдак, Аксуский район, Алматинская область, Казахстан) — казахстанский общественный деятель. Депутат Мажилиса Парламента Казахстана с 2023 до упразднения Парламента в 2026 году.', 'PUBLISHED', CURRENT_TIMESTAMP, '088b897fca7ef4d3d03922d6aa87129879a0545d777cf727fc34be3140fe56b3', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'osdp' AND c.list_order = 30 AND s.source_key = 'wiki:ru:osdp:30';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Абенов, Мурат Абдуламитович', 'PUBLISHED', CURRENT_TIMESTAMP, '5613f095215cd391c1be508f78214e26cd9b773bf679b8b246956d45dce146c6', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 2 AND s.source_key = 'wiki:ru:adilet:2';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Абенов, Мурат Абдуламитович', 'PUBLISHED', CURRENT_TIMESTAMP, '77cf80df6dc61b198d40a4b66e891a665b43f4b5c2e07e4d200d1679fa43122d', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 2 AND s.source_key = 'wiki:ru:adilet:2';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Авершин, Константин Викторович', 'PUBLISHED', CURRENT_TIMESTAMP, 'ff312e8b0f9058a9a733ad07daf3715f9476b29080e37f29dba82d260f69a4fc', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 4 AND s.source_key = 'wiki:ru:adilet:4';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Авершин, Константин Викторович', 'PUBLISHED', CURRENT_TIMESTAMP, 'b07008c90c27cd0711655d489c8cefe56bcc574212abb98188673e461112800f', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 4 AND s.source_key = 'wiki:ru:adilet:4';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Константин Викторович Авершин', 'PUBLISHED', CURRENT_TIMESTAMP, 'e3bfbc0fc3cbef3f01291fde17ea7251c1315b2fbb3d02704e0e5810b66fc0c0', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 4 AND s.source_key = 'wiki:kk:adilet:4';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Константин Викторович Авершин', 'PUBLISHED', CURRENT_TIMESTAMP, '37ba9911627f016308a5f7093d473179bfb1ab425aae67a94d4c0e85609e448a', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 4 AND s.source_key = 'wiki:kk:adilet:4';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Адамбеков, Тилектес Серикбайулы', 'PUBLISHED', CURRENT_TIMESTAMP, '96d0e3b47d322c10046689f2bc480356d32a7efd8d99261b9de36424a02a9e1e', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 8 AND s.source_key = 'wiki:ru:adilet:8';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Адамбеков, Тилектес Серикбайулы', 'PUBLISHED', CURRENT_TIMESTAMP, '9e5e8821ea4fd136cfe843ad0b2506bbcabb438fb48a7bc942f0d3602ede6a4e', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 8 AND s.source_key = 'wiki:ru:adilet:8';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Аймагамбетов, Асхат Канатович', 'PUBLISHED', CURRENT_TIMESTAMP, 'f5336b04e8bfba9fd340ffb7c0ecc0a68790ddd28f26233a97a05eeb527ae813', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 9 AND s.source_key = 'wiki:ru:adilet:9';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Аймагамбетов, Асхат Канатович', 'PUBLISHED', CURRENT_TIMESTAMP, '6862494ab50f03b70dfb6d00c31d2e0954b8afdfb95081ad5ac8a6a6a27624f7', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 9 AND s.source_key = 'wiki:ru:adilet:9';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Амантай, Жаркынбек', 'PUBLISHED', CURRENT_TIMESTAMP, 'c45b1372e4b593224b7603d1266b950dc97aeafbb231ebe5882c6168937ae429', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 13 AND s.source_key = 'wiki:ru:adilet:13';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Амантай, Жаркынбек', 'PUBLISHED', CURRENT_TIMESTAMP, '21b7ed139e9c4ac2b696469876ef272be226b5b56a6cdc93732b03317b541b09', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 13 AND s.source_key = 'wiki:ru:adilet:13';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Басин, Вадим Борисович', 'PUBLISHED', CURRENT_TIMESTAMP, 'f3478061b29279c4c05928d44c3b117fd03e142dc492d1aab736f14db3c4e4e4', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 33 AND s.source_key = 'wiki:ru:adilet:33';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Басин, Вадим Борисович', 'PUBLISHED', CURRENT_TIMESTAMP, 'b5a214f20820996592b6bc1427a308694200abed5175606817e318fa7a5b8767', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 33 AND s.source_key = 'wiki:ru:adilet:33';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Батырбеков, Эрлан Гадлетович', 'PUBLISHED', CURRENT_TIMESTAMP, '59a9a0d1e2b239fe8a2e48688d8f9236ea13678fda7c104cd063cf1b40e2c001', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 34 AND s.source_key = 'wiki:ru:adilet:34';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Батырбеков, Эрлан Гадлетович', 'PUBLISHED', CURRENT_TIMESTAMP, '02396d92b0df2f82986b943b0e9af9a6dba5252172b02265e2acf6905d259b1b', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 34 AND s.source_key = 'wiki:ru:adilet:34';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Башимов, Марат Советович', 'PUBLISHED', CURRENT_TIMESTAMP, '7095b498aa973754f079c5bfd651385d3286fe0608d3bd8347533a62a1b119ea', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 36 AND s.source_key = 'wiki:ru:adilet:36';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Башимов, Марат Советович', 'PUBLISHED', CURRENT_TIMESTAMP, 'e11ecd0f8f3201e5713a8b0c904a0873a05f1e27add02fda81be7ad9afba6796', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 36 AND s.source_key = 'wiki:ru:adilet:36';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Бекназаров, Нурлан Кудиярович', 'PUBLISHED', CURRENT_TIMESTAMP, 'efec23d34cdb52918f0f3c075cc22fb20d8e705c5865e0409afddadb83522c2a', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 40 AND s.source_key = 'wiki:ru:adilet:40';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Бекназаров, Нурлан Кудиярович', 'PUBLISHED', CURRENT_TIMESTAMP, 'd1e1ee53a77c655e90c2074b2f7843e81b9fb1b068bd38ada3dfdb4c7c2e7214', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 40 AND s.source_key = 'wiki:ru:adilet:40';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Больгерт, Евгений Андреевич', 'PUBLISHED', CURRENT_TIMESTAMP, 'c537fdbe527e2c96c996e3fe4f42377ac42be610d1b3728a4510383040e7b6c9', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 46 AND s.source_key = 'wiki:ru:adilet:46';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Больгерт, Евгений Андреевич', 'PUBLISHED', CURRENT_TIMESTAMP, 'eafdadaf78336ff9b0deb1c6422f1d96f443c54fa5a8fe892694daca06e8bc47', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 46 AND s.source_key = 'wiki:ru:adilet:46';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Наталья Николаевна Годунова', 'PUBLISHED', CURRENT_TIMESTAMP, 'c15d4e7fc6592158bd15ccc23585586bafe52590ae37dda3b41e1a9a8607c79a', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 49 AND s.source_key = 'wiki:kk:adilet:49';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Наталья Николаевна Годунова', 'PUBLISHED', CURRENT_TIMESTAMP, '98cc67c51324e246105fa331aedb6ee6e46781d5a3c48e1fb7b56b73b37f01e5', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 49 AND s.source_key = 'wiki:kk:adilet:49';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Айбек Арқабайұлы Дәдебай', 'PUBLISHED', CURRENT_TIMESTAMP, '55d51bc9a38b18723838534c3515663024a2e17ebd910c2b45b3a8616a82a8e7', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 54 AND s.source_key = 'wiki:kk:adilet:54';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Айбек Арқабайұлы Дәдебай', 'PUBLISHED', CURRENT_TIMESTAMP, '00e8339c4b38322264e3fd7dfa2818a4c0d6a08fd660ebddc429e101f74b8760', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 54 AND s.source_key = 'wiki:kk:adilet:54';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Дулатбеков, Нурлан Орынбасарович', 'PUBLISHED', CURRENT_TIMESTAMP, 'd4e7b04a93177672fe73117b7b2eafd6f8d0c9d250c6d04972ec83498ba7b3ff', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 59 AND s.source_key = 'wiki:ru:adilet:59';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Дулатбеков, Нурлан Орынбасарович', 'PUBLISHED', CURRENT_TIMESTAMP, 'c2a637492929c6aebb9d678e5d4954db1bffe25a74fbb79f0fa013976bf1fd8e', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 59 AND s.source_key = 'wiki:ru:adilet:59';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Закиева, Динара Болатовна', 'PUBLISHED', CURRENT_TIMESTAMP, '0df5f5ee369d78eefedc49863bd3651bad8de3d3087e72e7bbd6adef373ac66d', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 74 AND s.source_key = 'wiki:ru:adilet:74';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Закиева, Динара Болатовна', 'PUBLISHED', CURRENT_TIMESTAMP, '472e1bfda5e533cae2f81f9c96f494c55abeef613b6069d6c7d856e52749873a', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 74 AND s.source_key = 'wiki:ru:adilet:74';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Зенченко, Геннадий Геннадьевич', 'PUBLISHED', CURRENT_TIMESTAMP, 'f7adff7c21a0957ccc9e5ebaed04f99ce4bacbdd01be374fc757ac7991501153', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 75 AND s.source_key = 'wiki:ru:adilet:75';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Зенченко, Геннадий Геннадьевич', 'PUBLISHED', CURRENT_TIMESTAMP, '43f49e02361685dffe22d545455f4b5102ccc04d8bc56c33cca65b86156dd6e0', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 75 AND s.source_key = 'wiki:ru:adilet:75';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Имашева, Снежанна Валерьевна', 'PUBLISHED', CURRENT_TIMESTAMP, '4b8a035034cd146e1a06b096f2f69152f37923a7537b83f8d3fef089d351203e', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 77 AND s.source_key = 'wiki:ru:adilet:77';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Имашева, Снежанна Валерьевна', 'PUBLISHED', CURRENT_TIMESTAMP, '9ffc637e7fa37bed7f8a83d93686767fe7c2a120107f344d622559c7352752b1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 77 AND s.source_key = 'wiki:ru:adilet:77';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Кайдарова, Диляра Радиковна', 'PUBLISHED', CURRENT_TIMESTAMP, '1df313a1737e77bd9ff3f256c1ba4b4e6ec66a81a71887d62c37781ca8bc73b2', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 81 AND s.source_key = 'wiki:ru:adilet:81';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Кайдарова, Диляра Радиковна', 'PUBLISHED', CURRENT_TIMESTAMP, '1134b27f412de4670b58e74e67564d9a1541827b4049ac18cd597f8aa885b5d8', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 81 AND s.source_key = 'wiki:ru:adilet:81';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Калыков, Арман Кобыландынович', 'PUBLISHED', CURRENT_TIMESTAMP, '326ea250d4c97ccb1f721b6b7d1f654c6da8596bb3a855c45822484594d3cea7', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 83 AND s.source_key = 'wiki:ru:adilet:83';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Калыков, Арман Кобыландынович', 'PUBLISHED', CURRENT_TIMESTAMP, 'cd6f350eb16fdccce2053a21ece88dae5b378b5d004b955bcadc98b7fc28e681', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 83 AND s.source_key = 'wiki:ru:adilet:83';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Карин, Ерлан Тынымбайулы', 'PUBLISHED', CURRENT_TIMESTAMP, '9c3251deb8b281bff31f223aca05695bf20ffd7e9995ac9f7425ee86072c3e9c', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 86 AND s.source_key = 'wiki:ru:adilet:86';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Карин, Ерлан Тынымбайулы', 'PUBLISHED', CURRENT_TIMESTAMP, '2520665544de361cfca76bef0d0d15fc6f8b252feceabe29523f7ecbb85a47f6', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 86 AND s.source_key = 'wiki:ru:adilet:86';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Дәулет Жамаубайұлы Кәрібек', 'PUBLISHED', CURRENT_TIMESTAMP, 'bd0ed4466ef63b13653b5d078a0451b572c09f84b9af61d0e35641d86ce7e720', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 88 AND s.source_key = 'wiki:kk:adilet:88';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Дәулет Жамаубайұлы Кәрібек', 'PUBLISHED', CURRENT_TIMESTAMP, '6982036c6be98ed37fa92c6420acc7f24bae277b574ab20f3c6467583d4a8316', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 88 AND s.source_key = 'wiki:kk:adilet:88';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Рауан Кенжеханұлы', 'PUBLISHED', CURRENT_TIMESTAMP, '2ca59a7358bfea61ced4b9e70a26e44046a3807193e3f0c4360957edb0d702f9', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 90 AND s.source_key = 'wiki:kk:adilet:90';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Рауан Кенжеханұлы', 'PUBLISHED', CURRENT_TIMESTAMP, '494aeb2765cf75b53a398a2b930a82187fdd2af3e0cacb458353637fb980780f', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 90 AND s.source_key = 'wiki:kk:adilet:90';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Кожаев, Марат Шадетханович', 'PUBLISHED', CURRENT_TIMESTAMP, 'ef71e8b74c71c71a9da7e9b90613f2b31024edb659b935b613699a941e748c5a', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 94 AND s.source_key = 'wiki:ru:adilet:94';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Кожаев, Марат Шадетханович', 'PUBLISHED', CURRENT_TIMESTAMP, '8848bc47b2ebbc44bea91ab4daa443cd68438c67973a0021656a6eae604afd74', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 94 AND s.source_key = 'wiki:ru:adilet:94';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Кожаниязов, Серик Салаватович', 'PUBLISHED', CURRENT_TIMESTAMP, 'da17c54b3e62ec0cf7416b0af6acfb284891b1cbff250c60587b131a3779460c', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 95 AND s.source_key = 'wiki:ru:adilet:95';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Кожаниязов, Серик Салаватович', 'PUBLISHED', CURRENT_TIMESTAMP, 'd536175c5bf3e8f95c37f090274dc09ae3ccff2bd1d7eb3ea54a705b5c946b8d', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 95 AND s.source_key = 'wiki:ru:adilet:95';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Кучинская, Юлия Владимировна', 'PUBLISHED', CURRENT_TIMESTAMP, '168cce844443fe4a1060c7d8a39d555077899c029df03c11060200944424d50f', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 99 AND s.source_key = 'wiki:ru:adilet:99';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Кучинская, Юлия Владимировна', 'PUBLISHED', CURRENT_TIMESTAMP, 'f391cd6d52909f0caafdfffe267a32b78689609524da531846c50bd4725e8194', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 99 AND s.source_key = 'wiki:ru:adilet:99';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Дихан Қамзабекұлы', 'PUBLISHED', CURRENT_TIMESTAMP, 'da177a0cd7fa52c19f2774b712fb93518e434882b173b8ac20a89ed4aa0c12a4', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 100 AND s.source_key = 'wiki:kk:adilet:100';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Дихан Қамзабекұлы', 'PUBLISHED', CURRENT_TIMESTAMP, '29352de3b8d31e90930901bccd61b3bb1e6b726f108a3687e8b9603901d54dcf', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 100 AND s.source_key = 'wiki:kk:adilet:100';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Лаврентьев, Андрей Сергеевич', 'PUBLISHED', CURRENT_TIMESTAMP, '8a5a6f6f0e6eea8de0f7e7bc4d96f8acfac5d76defe6b50352dda826767b9051', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 103 AND s.source_key = 'wiki:ru:adilet:103';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Лаврентьев, Андрей Сергеевич', 'PUBLISHED', CURRENT_TIMESTAMP, '1759fcf5bac04f74c367cec8af8d7981b8b1992ce91feeeee63bc5368054d843', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 103 AND s.source_key = 'wiki:ru:adilet:103';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Мусин, Багдат Батырбекович', 'PUBLISHED', CURRENT_TIMESTAMP, 'ea25857577b4db8781792c37a7722c1ac8d9f95182c8dcce4e92e7887acad25f', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 108 AND s.source_key = 'wiki:ru:adilet:108';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Мусин, Багдат Батырбекович', 'PUBLISHED', CURRENT_TIMESTAMP, '752288271bf1402fb85ae90eedf8fc30f739748579262421d7f07604edbc9644', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 108 AND s.source_key = 'wiki:ru:adilet:108';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Муталип, Шахмурат', 'PUBLISHED', CURRENT_TIMESTAMP, 'e77b93346097dc39bc62c84ceb19ee8241a55a2cc9af70996dca143b9d682ced', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 109 AND s.source_key = 'wiki:ru:adilet:109';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Муталип, Шахмурат', 'PUBLISHED', CURRENT_TIMESTAMP, '151164a26a741b5f013378b388c32480f02c3fbe43d6360a20e1587e48d95b39', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 109 AND s.source_key = 'wiki:ru:adilet:109';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Нахбаева, Гулисхан Сайфуллиновна', 'PUBLISHED', CURRENT_TIMESTAMP, '6b8543af80f3d9aae9ab659f559753082320be76070179bd2aa8aba5e035ee15', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 117 AND s.source_key = 'wiki:ru:adilet:117';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Нахбаева, Гулисхан Сайфуллиновна', 'PUBLISHED', CURRENT_TIMESTAMP, '37d31a1e3a6d27f5f5e69012f888dcafc27c5009594f3ab6096095a03a06c063', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 117 AND s.source_key = 'wiki:ru:adilet:117';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Перепечина, Ольга Валентиновна', 'PUBLISHED', CURRENT_TIMESTAMP, '17ab7a7e9c38f0182527374c42a2239d1986036975b0e7c5b44ec499f2b4d9aa', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 126 AND s.source_key = 'wiki:ru:adilet:126';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Перепечина, Ольга Валентиновна', 'PUBLISHED', CURRENT_TIMESTAMP, 'f5f51b2c891a4c6344472259248097dec7cea7b29f4c14e28728658bb563cdd3', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 126 AND s.source_key = 'wiki:ru:adilet:126';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Ольга Валентиновна Перепечина', 'PUBLISHED', CURRENT_TIMESTAMP, '45913d0898648d8994db4cc9c7b59d8037691ddc766a75343b702a220f073ab0', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 126 AND s.source_key = 'wiki:kk:adilet:126';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Ольга Валентиновна Перепечина', 'PUBLISHED', CURRENT_TIMESTAMP, 'e67d2a726f113e7c7774093b4e9ca0bd65326afa57e2f2cea33913fe841aae54', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 126 AND s.source_key = 'wiki:kk:adilet:126';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Пономарёв, Сергей Михайлович', 'PUBLISHED', CURRENT_TIMESTAMP, 'b802c2b0c1cf66fc628157da4c8a0d5c4b2ccc714df2a2508816a83a318214fd', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 128 AND s.source_key = 'wiki:ru:adilet:128';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Пономарёв, Сергей Михайлович', 'PUBLISHED', CURRENT_TIMESTAMP, '27f39827e5f4f2e8be304e41c4b8e710e03e0c8de111e4e1310e035afefb04b0', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 128 AND s.source_key = 'wiki:ru:adilet:128';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Рожин, Максим Николаевич', 'PUBLISHED', CURRENT_TIMESTAMP, 'c580a21a5d95f7a390116a1cc8d176d89121dbfa469387df78205fbfe35b386a', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 133 AND s.source_key = 'wiki:ru:adilet:133';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Рожин, Максим Николаевич', 'PUBLISHED', CURRENT_TIMESTAMP, 'db9b55a29379d92cc188fd49161a30cfa399f78db03e20bee3ce9e74aba5bec8', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 133 AND s.source_key = 'wiki:ru:adilet:133';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Савельева, Татьяна Михайловна', 'PUBLISHED', CURRENT_TIMESTAMP, '3c3e7b48c58c5eea3b104dd281ff5dca43d670f207d1f8abce9d4f9c49ef65c8', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 136 AND s.source_key = 'wiki:ru:adilet:136';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Савельева, Татьяна Михайловна', 'PUBLISHED', CURRENT_TIMESTAMP, '96d6e59e7253d77bbc94a8ecddda7ec8f2d7ba372d5edb6c00eabf434f7cd549', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 136 AND s.source_key = 'wiki:ru:adilet:136';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Сарым, Айдос Амироллаулы', 'PUBLISHED', CURRENT_TIMESTAMP, '26064a90360c792219e81a6176f5229e2e355dbb207360be661b61fda4c3f340', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 144 AND s.source_key = 'wiki:ru:adilet:144';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Сарым, Айдос Амироллаулы', 'PUBLISHED', CURRENT_TIMESTAMP, '630452bcddfb28c9eb055e61f5ea36f02da5fc4c9226dde7b4f291caa9dd9485', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 144 AND s.source_key = 'wiki:ru:adilet:144';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Айдос Әміроллаұлы Сарым', 'PUBLISHED', CURRENT_TIMESTAMP, '5b52f18d4ea3770b4f0351ecfc626b8d28e71032a35031b568a8fe3ef3381458', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 144 AND s.source_key = 'wiki:kk:adilet:144';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Айдос Әміроллаұлы Сарым', 'PUBLISHED', CURRENT_TIMESTAMP, '38724f0d165b7907c24dc98cfbab4fe2d587bd59acc3d46f138384c0dd7404c2', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 144 AND s.source_key = 'wiki:kk:adilet:144';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Скакова, Айжан Амангельдиевна', 'PUBLISHED', CURRENT_TIMESTAMP, '0f65457f907c21d6baeb1c1f7f5ef955744fc8a12f63e9336451257091fce061', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 147 AND s.source_key = 'wiki:ru:adilet:147';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Скакова, Айжан Амангельдиевна', 'PUBLISHED', CURRENT_TIMESTAMP, '3f440aa9784023714d6cec5b905b4cbe588739d013e445ffe9314a3f42f3fa30', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 147 AND s.source_key = 'wiki:ru:adilet:147';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Смышляева, Екатерина Васильевна', 'PUBLISHED', CURRENT_TIMESTAMP, '5810dada5d678f06ab62be785de385e21db479e201574333a18dd1e0d8858506', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 148 AND s.source_key = 'wiki:ru:adilet:148';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Смышляева, Екатерина Васильевна', 'PUBLISHED', CURRENT_TIMESTAMP, 'f8d83d992f48322e00803bc4d317255c4a4af19d6fe8f8b1b84f14e1617c6465', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 148 AND s.source_key = 'wiki:ru:adilet:148';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Сулейменова, Жулдыз Досбергеновна', 'PUBLISHED', CURRENT_TIMESTAMP, '522dfc50f84cb30059a675c73d84d9aade6a09a5e6dbd25ab2ffe2915d7cb092', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 153 AND s.source_key = 'wiki:ru:adilet:153';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Сулейменова, Жулдыз Досбергеновна', 'PUBLISHED', CURRENT_TIMESTAMP, '51d8709f3342b7505372bcb16047b6774548c9a0526c78dd5d50f4cbd5306f5e', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 153 AND s.source_key = 'wiki:ru:adilet:153';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Нұрбақыт Молдахметұлы Теңізбаев', 'PUBLISHED', CURRENT_TIMESTAMP, 'b25ee1d3898a9796ee377eb3ece5af9a7507ddc1e8fe579ce0c610cebb6921b6', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 161 AND s.source_key = 'wiki:kk:adilet:161';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Нұрбақыт Молдахметұлы Теңізбаев', 'PUBLISHED', CURRENT_TIMESTAMP, '3ddc3eed1d73054a190ae720d3f80fcd8dc4928c0722339fbeebd374513c53da', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 161 AND s.source_key = 'wiki:kk:adilet:161';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Шагиртаев, Имамзада Куанышбаевич', 'PUBLISHED', CURRENT_TIMESTAMP, '14fc7d6cc7274f58efbcb991dc699c3e8b3b81da04f8d5dda8839dd18275b409', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 179 AND s.source_key = 'wiki:ru:adilet:179';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Шагиртаев, Имамзада Куанышбаевич', 'PUBLISHED', CURRENT_TIMESTAMP, '5bff11864a3b9b975567232fa1ab10406ac6af0bb8066e1186fd3804384a729a', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 179 AND s.source_key = 'wiki:ru:adilet:179';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Шапак, Унзила', 'PUBLISHED', CURRENT_TIMESTAMP, 'ec66d08f3eab33142718feaa665ee3963bafd43804c1b72ccb104c9fa5ad6ee3', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 181 AND s.source_key = 'wiki:ru:adilet:181';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Шапак, Унзила', 'PUBLISHED', CURRENT_TIMESTAMP, 'b714ccb51a32a7e33ae2c64f5231e5ae45846a903df5c347242b3a8880e01ea5', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 181 AND s.source_key = 'wiki:ru:adilet:181';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Шаталов, Никита Сергеевич', 'PUBLISHED', CURRENT_TIMESTAMP, '2430efec59b0f0298b2bde09817f1e7f1bfc5041be9ed60e485fff34a1605118', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 182 AND s.source_key = 'wiki:ru:adilet:182';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Шаталов, Никита Сергеевич', 'PUBLISHED', CURRENT_TIMESTAMP, 'dd8e7ec554e4e5bfaf7c2fa2690ca5cbd8296cb41a3026308c72d9341d5320c7', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 182 AND s.source_key = 'wiki:ru:adilet:182';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Статья о кандидате в Википедии: Мейрамбек Зинабдинұлы Шермағанбет', 'PUBLISHED', CURRENT_TIMESTAMP, '58da4ce10d647fc5778df175f2edcad4b8009d8a8365eee5fdb3e71aa7885dbf', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 183 AND s.source_key = 'wiki:kk:adilet:183';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Уикипедиядағы кандидат туралы мақала: Мейрамбек Зинабдинұлы Шермағанбет', 'PUBLISHED', CURRENT_TIMESTAMP, 'ecf44bb914848207634606f08496129cb51dec6410bfa5ad0deeb27fd6b47cac', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 183 AND s.source_key = 'wiki:kk:adilet:183';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. «AMANAT» партиясының фракциясы. Экономикалық реформа және өңірлік даму комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, 'ffa655ecbbb3bf59b26be8b1d6a138fa46ce2eaed2a5125cdcfb9cd4d5744378', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 2 AND s.source_key = 'mazhilis:1674:adilet:2';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. «AMANAT» партиясының фракциясы. Экономикалық реформа және өңірлік даму комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '479406bbd0ca21238272915752e4e3129e7cad007e2f1f40e2d44aefe43753a9', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 2 AND s.source_key = 'mazhilis:1674:adilet:2';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. «AMANAT» партиясының фракциясы. Халықаралық істер, қорғаныс және қауіпсіздік комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '200834b5c10bae3f0dc16fbb0f7675003b8fff6a3666e5101f037101102b6723', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 4 AND s.source_key = 'mazhilis:1678:adilet:4';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. «AMANAT» партиясының фракциясы. Халықаралық істер, қорғаныс және қауіпсіздік комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, 'fa0d8c2760a4bafcaebfc6644aae88ab573eb095fc935b5d5537b1219806c5d8', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 4 AND s.source_key = 'mazhilis:1678:adilet:4';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. «AMANAT» партиясының фракциясы. Экономикалық реформа және өңірлік даму комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, 'ffa655ecbbb3bf59b26be8b1d6a138fa46ce2eaed2a5125cdcfb9cd4d5744378', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 8 AND s.source_key = 'mazhilis:1679:adilet:8';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. «AMANAT» партиясының фракциясы. Экономикалық реформа және өңірлік даму комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '479406bbd0ca21238272915752e4e3129e7cad007e2f1f40e2d44aefe43753a9', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 8 AND s.source_key = 'mazhilis:1679:adilet:8';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. «AMANAT» партиясының фракциясы. Әлеуметтік-мәдени даму комитеті. Комитет Төрағасы.', 'PUBLISHED', CURRENT_TIMESTAMP, '105b9b7d4fb8af0e23ce09efa3a98409a425f89d4d5cdc594b922f22e7a22119', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 9 AND s.source_key = 'mazhilis:8:adilet:9';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. «AMANAT» партиясының фракциясы. Әлеуметтік-мәдени даму комитеті. Комитет Төрағасы.', 'PUBLISHED', CURRENT_TIMESTAMP, '748504db43ebfc40f20babd9b616511ecca5b4012a4c6c37e9b4f916ab81f324', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 9 AND s.source_key = 'mazhilis:8:adilet:9';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. «AMANAT» партиясының фракциясы. Заңнама және сот-құқықтық реформа комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, 'f5e38c94fab39563ea9220d805217f6cfe23baeda7084e78fdb54220edafd8bc', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 13 AND s.source_key = 'mazhilis:1681:adilet:13';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. «AMANAT» партиясының фракциясы. Заңнама және сот-құқықтық реформа комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '4dacd1dbff9f3669e7acd03444fb3c806ee780fa4b131d6a146208912a516f02', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 13 AND s.source_key = 'mazhilis:1681:adilet:13';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. «AMANAT» партиясының фракциясы. Әлеуметтік-мәдени даму комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '8fa7b4a9e7c0ec4c7bdc7811a0fe25904d50ff6b43961adcfd7c858b06c08267', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 21 AND s.source_key = 'mazhilis:1685:adilet:21';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. «AMANAT» партиясының фракциясы. Әлеуметтік-мәдени даму комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, 'b2674a2949eac8adc83856c6010fbfe6ebb14e817026d87edad7b3dd743bc724', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 21 AND s.source_key = 'mazhilis:1685:adilet:21';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. «AMANAT» партиясының фракциясы. Заңнама және сот-құқықтық реформа комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, 'f5e38c94fab39563ea9220d805217f6cfe23baeda7084e78fdb54220edafd8bc', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 36 AND s.source_key = 'mazhilis:34:adilet:36';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. «AMANAT» партиясының фракциясы. Заңнама және сот-құқықтық реформа комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '4dacd1dbff9f3669e7acd03444fb3c806ee780fa4b131d6a146208912a516f02', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 36 AND s.source_key = 'mazhilis:34:adilet:36';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. «AMANAT» партиясының фракциясы. Заңнама және сот-құқықтық реформа комитеті. Комитет Төрайымы.', 'PUBLISHED', CURRENT_TIMESTAMP, '264e7a9697de7438acc68618046094778cf3c5c5ec726a501675721e93d48160', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 77 AND s.source_key = 'mazhilis:50:adilet:77';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. «AMANAT» партиясының фракциясы. Заңнама және сот-құқықтық реформа комитеті. Комитет Төрайымы.', 'PUBLISHED', CURRENT_TIMESTAMP, '045937b5a87b7041e06e4c537d061cd2b79cba1b914e0aeef98e32d453e928fa', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 77 AND s.source_key = 'mazhilis:50:adilet:77';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. «AMANAT» партиясының фракциясы. Экология мәселелері және табиғат пайдалану комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '704ef020e6fe3d0de89f0db8c7fbdd4ad9e4dc1fe077952ff53b4783821f59f3', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 83 AND s.source_key = 'mazhilis:56:adilet:83';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. «AMANAT» партиясының фракциясы. Экология мәселелері және табиғат пайдалану комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, 'b919fbd167557910be5e22828881d81d6c8bb2d895ce7edaf16a4b02cc7280a5', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 83 AND s.source_key = 'mazhilis:56:adilet:83';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. «AMANAT» партиясының фракциясы. Халықаралық істер, қорғаныс және қауіпсіздік комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '200834b5c10bae3f0dc16fbb0f7675003b8fff6a3666e5101f037101102b6723', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 99 AND s.source_key = 'mazhilis:64:adilet:99';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. «AMANAT» партиясының фракциясы. Халықаралық істер, қорғаныс және қауіпсіздік комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, 'fa0d8c2760a4bafcaebfc6644aae88ab573eb095fc935b5d5537b1219806c5d8', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 99 AND s.source_key = 'mazhilis:64:adilet:99';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. «AMANAT» партиясының фракциясы. Экология мәселелері және табиғат пайдалану комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '704ef020e6fe3d0de89f0db8c7fbdd4ad9e4dc1fe077952ff53b4783821f59f3', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 128 AND s.source_key = 'mazhilis:76:adilet:128';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. «AMANAT» партиясының фракциясы. Экология мәселелері және табиғат пайдалану комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, 'b919fbd167557910be5e22828881d81d6c8bb2d895ce7edaf16a4b02cc7280a5', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 128 AND s.source_key = 'mazhilis:76:adilet:128';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. «AMANAT» партиясының фракциясы. Халықаралық істер, қорғаныс және қауіпсіздік комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '200834b5c10bae3f0dc16fbb0f7675003b8fff6a3666e5101f037101102b6723', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 133 AND s.source_key = 'mazhilis:78:adilet:133';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. «AMANAT» партиясының фракциясы. Халықаралық істер, қорғаныс және қауіпсіздік комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, 'fa0d8c2760a4bafcaebfc6644aae88ab573eb095fc935b5d5537b1219806c5d8', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 133 AND s.source_key = 'mazhilis:78:adilet:133';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. «AMANAT» партиясының фракциясы. Қаржы және бюджет комитеті. Комитет Төрайымы.', 'PUBLISHED', CURRENT_TIMESTAMP, '455a243facecd463e3d36c22b58542fdf89d84b9cbe726cb4f887c357bec2e53', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 136 AND s.source_key = 'mazhilis:80:adilet:136';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. «AMANAT» партиясының фракциясы. Қаржы және бюджет комитеті. Комитет Төрайымы.', 'PUBLISHED', CURRENT_TIMESTAMP, '1cd5b701fdf6a464a661d05f4df712f731cb742be1a9722811850c6a72f70b2b', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 136 AND s.source_key = 'mazhilis:80:adilet:136';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. «AMANAT» партиясының фракциясы. Әлеуметтік-мәдени даму комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '8fa7b4a9e7c0ec4c7bdc7811a0fe25904d50ff6b43961adcfd7c858b06c08267', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 141 AND s.source_key = 'mazhilis:84:adilet:141';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. «AMANAT» партиясының фракциясы. Әлеуметтік-мәдени даму комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, 'b2674a2949eac8adc83856c6010fbfe6ebb14e817026d87edad7b3dd743bc724', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 141 AND s.source_key = 'mazhilis:84:adilet:141';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. «AMANAT» партиясының фракциясы. Халықаралық істер, қорғаныс және қауіпсіздік комитеті. Комитет хатшысы.', 'PUBLISHED', CURRENT_TIMESTAMP, '78f67afe99f80df12c811ad4dfb9e10574e4bacba84764e2829e66d47d531003', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 144 AND s.source_key = 'mazhilis:87:adilet:144';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. «AMANAT» партиясының фракциясы. Халықаралық істер, қорғаныс және қауіпсіздік комитеті. Комитет хатшысы.', 'PUBLISHED', CURRENT_TIMESTAMP, 'f85c8bfafd2f6232dd2890b921a0f172af742c08a6c17ffa6b6b759b0d55b6bb', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 144 AND s.source_key = 'mazhilis:87:adilet:144';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. «AMANAT» партиясының фракциясы. Экономикалық реформа және өңірлік даму комитеті. Комитет хатшысы.', 'PUBLISHED', CURRENT_TIMESTAMP, '2c1c22a2bc0c2edb4759580459974ba48850239ee5117a017a1920c82b92756b', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 148 AND s.source_key = 'mazhilis:94:adilet:148';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. «AMANAT» партиясының фракциясы. Экономикалық реформа және өңірлік даму комитеті. Комитет хатшысы.', 'PUBLISHED', CURRENT_TIMESTAMP, '926de498b4f766e16b4ce3fe67108e016a168aad799a5ad3d6fb2c082f505a6a', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 148 AND s.source_key = 'mazhilis:94:adilet:148';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. «AMANAT» партиясының фракциясы. Заңнама және сот-құқықтық реформа комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, 'f5e38c94fab39563ea9220d805217f6cfe23baeda7084e78fdb54220edafd8bc', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 181 AND s.source_key = 'mazhilis:106:adilet:181';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. «AMANAT» партиясының фракциясы. Заңнама және сот-құқықтық реформа комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '4dacd1dbff9f3669e7acd03444fb3c806ee780fa4b131d6a146208912a516f02', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 181 AND s.source_key = 'mazhilis:106:adilet:181';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. «AMANAT» партиясының фракциясы. Экономикалық реформа және өңірлік даму комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, 'ffa655ecbbb3bf59b26be8b1d6a138fa46ce2eaed2a5125cdcfb9cd4d5744378', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 182 AND s.source_key = 'mazhilis:1703:adilet:182';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. «AMANAT» партиясының фракциясы. Экономикалық реформа және өңірлік даму комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '479406bbd0ca21238272915752e4e3129e7cad007e2f1f40e2d44aefe43753a9', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 182 AND s.source_key = 'mazhilis:1703:adilet:182';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. "Ақ жол" Қазақстан демократиялық партиясының фракциясы. Экология мәселелері және табиғат пайдалану комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, 'e6e5cd11486c12950d29de160f7f7df7491c944546781501f16461fdb7fff420', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 5 AND s.source_key = 'mazhilis:33:ak_zhol:5';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. "Ақ жол" Қазақстан демократиялық партиясының фракциясы. Экология мәселелері және табиғат пайдалану комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '3b4310d1f7b0ce8809e591f15ba56d50671719f06c7ffe92552cc8fa26dbdf19', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 5 AND s.source_key = 'mazhilis:33:ak_zhol:5';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. "Ақ жол" Қазақстан демократиялық партиясының фракциясы. Заңнама және сот-құқықтық реформа комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '1210f6a9411f476ffb35347d38781533130d8bb42c5abf0463e22d4adee59693', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 14 AND s.source_key = 'mazhilis:1962:ak_zhol:14';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. "Ақ жол" Қазақстан демократиялық партиясының фракциясы. Заңнама және сот-құқықтық реформа комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, 'f8ddb31c075bfa99796797ca41311c8c05207bd7c0c15e7075f414ce1e5a4c80', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 14 AND s.source_key = 'mazhilis:1962:ak_zhol:14';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. "Ақ жол" Қазақстан демократиялық партиясының фракциясы. . Мәжіліс Төрағасының орынбасары.', 'PUBLISHED', CURRENT_TIMESTAMP, '8c480be15b626ffe7a19540f6ccb1ee0e1f90fbcbc5dfd8d26abb600ec26604b', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 15 AND s.source_key = 'mazhilis:4:ak_zhol:15';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. "Ақ жол" Қазақстан демократиялық партиясының фракциясы. . Мәжіліс Төрағасының орынбасары.', 'PUBLISHED', CURRENT_TIMESTAMP, 'f3a3bda7f8a992a187770826be74f6091519767c3dc8e94a591365eaea406a6b', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 15 AND s.source_key = 'mazhilis:4:ak_zhol:15';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. "Ақ жол" Қазақстан демократиялық партиясының фракциясы. Әлеуметтік-мәдени даму комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, 'f13c1ad707f40fad5bf4bcdd4a48b18653488d1dc26eeef902737d6d5915ee52', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 21 AND s.source_key = 'mazhilis:51:ak_zhol:21';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. "Ақ жол" Қазақстан демократиялық партиясының фракциясы. Әлеуметтік-мәдени даму комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '5dc33aa5b444aef9e4bae0e94cbf259b5d57f5d7acde0c78e68793abb3635eb0', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 21 AND s.source_key = 'mazhilis:51:ak_zhol:21';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. "Ақ жол" Қазақстан демократиялық партиясының фракциясы. Қаржы және бюджет комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '8c7d3b3dceaff2abcb91e65bd373b52efafcd624e0f337320b0e9f559ca0ce1c', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 40 AND s.source_key = 'mazhilis:1971:ak_zhol:40';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. "Ақ жол" Қазақстан демократиялық партиясының фракциясы. Қаржы және бюджет комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '43c596b835825488c2735f1d6205ef35a1ddfa001aeb247d58a4cc069719b8d2', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 40 AND s.source_key = 'mazhilis:1971:ak_zhol:40';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. "Ақ жол" Қазақстан демократиялық партиясының фракциясы. Экономикалық реформа және өңірлік даму комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '77dd1f5891b1f6bebfe6c9282ffb45a61923da964c37afe565d96f3e075f5534', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 42 AND s.source_key = 'mazhilis:1698:ak_zhol:42';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. "Ақ жол" Қазақстан демократиялық партиясының фракциясы. Экономикалық реформа және өңірлік даму комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '5096a34747b880d34dd29c013388b26f3a2bab76781a88f8fd3d4896802fcdbf', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'ak_zhol' AND c.list_order = 42 AND s.source_key = 'mazhilis:1698:ak_zhol:42';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. Қазақстан Халық партиясының фракциясы. Әлеуметтік-мәдени даму комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '1fd5edadb625edc136694a6869cc282a02320c870847456c7e254bba10be1243', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 53 AND s.source_key = 'mazhilis:1963:npk:53';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. Қазақстан Халық партиясының фракциясы. Әлеуметтік-мәдени даму комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '81e38260dd8ca509ade347895e91bebdc1b0699e574f7f2874738007ac08459d', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 53 AND s.source_key = 'mazhilis:1963:npk:53';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. Қазақстан Халық партиясының фракциясы. Экология мәселелері және табиғат пайдалану комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '340b9c3d980161b4f820585f151695f624722f3ec27b91cc671f31a4c8fd4db1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 61 AND s.source_key = 'mazhilis:90:npk:61';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. Қазақстан Халық партиясының фракциясы. Экология мәселелері және табиғат пайдалану комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, 'db7c6a7f770146ddf55803210c46852b7e3954d2de08abc72228a0d88ea8e4b8', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 61 AND s.source_key = 'mazhilis:90:npk:61';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. Қазақстан Халық партиясының фракциясы. Қаржы және бюджет комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, 'ed8a4e3fa780ccaef47e07969f0687ca36acfe10f40ece74164f95958d989461', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 63 AND s.source_key = 'mazhilis:93:npk:63';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. Қазақстан Халық партиясының фракциясы. Қаржы және бюджет комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, 'bb2f742f0f57f58728a3120960b98a38b553fde4a03142be98f2412aedd5451f', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 63 AND s.source_key = 'mazhilis:93:npk:63';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. Қазақстан Халық партиясының фракциясы. Аграрлық мәселелер комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '3eef7cc9b501fe56fdcad11b9a61c6969c3d96293fcafae253e7cb0a2c864128', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 65 AND s.source_key = 'mazhilis:97:npk:65';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. Қазақстан Халық партиясының фракциясы. Аграрлық мәселелер комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, 'b853f59cac12538c34ba58e92c95dcefa9844a1a6123e954d5d45473ca7dfa05', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 65 AND s.source_key = 'mazhilis:97:npk:65';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. Жалпыұлттық социал-демократиялық партиясының фракциясы. Әлеуметтік-мәдени даму комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '8657d4ad99269630309c165368b8df1ac46ff8ed2e6ac79b7898a63daef1cc33', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'osdp' AND c.list_order = 8 AND s.source_key = 'mazhilis:1683:osdp:8';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. Жалпыұлттық социал-демократиялық партиясының фракциясы. Әлеуметтік-мәдени даму комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '3546fd4bebf62d2d15a96ed6c3223b4efc9b8a80a725510e50d68558d65e0193', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'osdp' AND c.list_order = 8 AND s.source_key = 'mazhilis:1683:osdp:8';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. Жалпыұлттық социал-демократиялық партиясының фракциясы. Халықаралық істер, қорғаныс және қауіпсіздік комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, 'b7b179655dc0ec8ff3325b9c08dc8c203109dc5d24661b2a61453735f08183f9', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'osdp' AND c.list_order = 28 AND s.source_key = 'mazhilis:77:osdp:28';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. Жалпыұлттық социал-демократиялық партиясының фракциясы. Халықаралық істер, қорғаныс және қауіпсіздік комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '6734d0273cab7e67af912727b65bd67545a469d61ac145ba287a7ca415d28846', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'osdp' AND c.list_order = 28 AND s.source_key = 'mazhilis:77:osdp:28';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. Жалпыұлттық социал-демократиялық партиясының фракциясы. Экология мәселелері және табиғат пайдалану комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '04a7f468fda66c763e9215337596b5d5e470e8c84753cffa62c43e2520b4658b', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'osdp' AND c.list_order = 29 AND s.source_key = 'mazhilis:1699:osdp:29';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. Жалпыұлттық социал-демократиялық партиясының фракциясы. Экология мәселелері және табиғат пайдалану комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, 'e8e05e114abc49e9d916609a9fbae706631555895c315b89ecb52a1495096bb9', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'osdp' AND c.list_order = 29 AND s.source_key = 'mazhilis:1699:osdp:29';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. Жалпыұлттық социал-демократиялық партиясының фракциясы. Қаржы және бюджет комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '562d734c55f91022c28312dccb820c1557de774d9d61b72a1f35e1311325dc20', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'osdp' AND c.list_order = 30 AND s.source_key = 'mazhilis:85:osdp:30';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. Жалпыұлттық социал-демократиялық партиясының фракциясы. Қаржы және бюджет комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, 'f90524a57f903883b2f31def15ded0aa40dbeeecfe0d32ef61c6adf4262e4112', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'osdp' AND c.list_order = 30 AND s.source_key = 'mazhilis:85:osdp:30';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. "Respublica" партиясының фракциясы. Халықаралық істер, қорғаныс және қауіпсіздік комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, 'e36e315fc10695e5055f3c8dbabb7d0c882cd487c37468f9662e65b04c3358ff', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 43 AND s.source_key = 'mazhilis:63:respublica:43';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. "Respublica" партиясының фракциясы. Халықаралық істер, қорғаныс және қауіпсіздік комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '864a497112b63aa24da38ca976839bbf4cb36d6db327da8852c00cfd0e9225bf', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 43 AND s.source_key = 'mazhilis:63:respublica:43';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. "Respublica" партиясының фракциясы. Заңнама және сот-құқықтық реформа комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, 'fcdd05d79ac4cbe3b05b82dc63d57f2bfdc9693f1d1b1c4aa85192fe9937f692', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 55 AND s.source_key = 'mazhilis:73:respublica:55';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. "Respublica" партиясының фракциясы. Заңнама және сот-құқықтық реформа комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '5ece1685722a719f732db9f5a66ae9533e3ef33c4e541c0e66556450d97852d2', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 55 AND s.source_key = 'mazhilis:73:respublica:55';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. "Respublica" партиясының фракциясы. Әлеуметтік-мәдени даму комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '92ebca7f9c54757d10e653b59b54cc25798c1d03b56c55f6c924fee811276978', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 60 AND s.source_key = 'mazhilis:1964:respublica:60';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. "Respublica" партиясының фракциясы. Әлеуметтік-мәдени даму комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, '9e39d85dc7a48af9329a7b0023833f5917c25514d93a9cfe712a11fbcabc3a54', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 60 AND s.source_key = 'mazhilis:1964:respublica:60';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. "Respublica" партиясының фракциясы. Әлеуметтік-мәдени даму комитеті. Комитет хатшысы.', 'PUBLISHED', CURRENT_TIMESTAMP, 'a208525b1a36652fb3e04b2087ec55585cb40a8bc03331c603d81a357dbdd38e', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 66 AND s.source_key = 'mazhilis:100:respublica:66';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. "Respublica" партиясының фракциясы. Әлеуметтік-мәдени даму комитеті. Комитет хатшысы.', 'PUBLISHED', CURRENT_TIMESTAMP, 'e87542b11ac47a175f44e4ce8446925883130b51742ff09fff01976620bc8df5', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 66 AND s.source_key = 'mazhilis:100:respublica:66';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Мажилиса Парламента РК VIII созыва. "Respublica" партиясының фракциясы. Аграрлық мәселелер комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, 'ee97a92c301087e909d4057e55ff8078e0c4297a3e420603050d5284bfa41fff', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 75 AND s.source_key = 'mazhilis:1702:respublica:75';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'ҚР Парламенті Мәжілісінің VIII шақырылым депутаты. "Respublica" партиясының фракциясы. Аграрлық мәселелер комитеті. Комитет мүшесі.', 'PUBLISHED', CURRENT_TIMESTAMP, 'bc2074aaf4bf38e9452920045a57531a8b1c2679c2b0c5875117e087c0a7258f', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 75 AND s.source_key = 'mazhilis:1702:respublica:75';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Сената Парламента Республики Казахстан. .', 'PUBLISHED', CURRENT_TIMESTAMP, 'ccba53b64ac7db7a42a98af93c3ae6e12603119fb2761f6ba052c00f09e4f923', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 40 AND s.source_key = 'senate:921:adilet:40';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Қазақстан Республикасы Парламенті Сенатының депутаты. .', 'PUBLISHED', CURRENT_TIMESTAMP, 'c59311800586dc21affd0756d8d607d548f528b13357b25327a2ecc99ee97e25', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 40 AND s.source_key = 'senate:921:adilet:40';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Сената Парламента Республики Казахстан. .', 'PUBLISHED', CURRENT_TIMESTAMP, 'ccba53b64ac7db7a42a98af93c3ae6e12603119fb2761f6ba052c00f09e4f923', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 46 AND s.source_key = 'senate:1004:adilet:46';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Қазақстан Республикасы Парламенті Сенатының депутаты. .', 'PUBLISHED', CURRENT_TIMESTAMP, 'c59311800586dc21affd0756d8d607d548f528b13357b25327a2ecc99ee97e25', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 46 AND s.source_key = 'senate:1004:adilet:46';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Сената Парламента Республики Казахстан. .', 'PUBLISHED', CURRENT_TIMESTAMP, 'ccba53b64ac7db7a42a98af93c3ae6e12603119fb2761f6ba052c00f09e4f923', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 94 AND s.source_key = 'senate:1012:adilet:94';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Қазақстан Республикасы Парламенті Сенатының депутаты. .', 'PUBLISHED', CURRENT_TIMESTAMP, 'c59311800586dc21affd0756d8d607d548f528b13357b25327a2ecc99ee97e25', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 94 AND s.source_key = 'senate:1012:adilet:94';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Депутат Сената Парламента Республики Казахстан. .', 'PUBLISHED', CURRENT_TIMESTAMP, 'ccba53b64ac7db7a42a98af93c3ae6e12603119fb2761f6ba052c00f09e4f923', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 126 AND s.source_key = 'senate:663:adilet:126';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Қазақстан Республикасы Парламенті Сенатының депутаты. .', 'PUBLISHED', CURRENT_TIMESTAMP, 'c59311800586dc21affd0756d8d607d548f528b13357b25327a2ecc99ee97e25', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 126 AND s.source_key = 'senate:663:adilet:126';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Член Бюро Политсовета; член совета при Президенте по молодёжной политике, председатель РОО Павлодарский областной филиал «Казахстанский отраслевой профессиональный союз работников малого и среднего бизнеса «YNTYMAQ»', 'PUBLISHED', CURRENT_TIMESTAMP, '51a64b5be933bbd63a0413d6e0ced4d2557c9951377e38515f93cf3fa41e9a7e', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 16 AND s.source_key = 'adilet:16';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Саяси кеңес бюросының мүшесі; Президент жанындағы Жастар саясаты жөніндегі кеңестің мүшесі, «YNTYMAQ» қазақстандық орта және шағын бизнес қызметкерлерінің салалық кәсіподағы» РҚБ Павлодар облыстық филиалының төрайымы', 'PUBLISHED', CURRENT_TIMESTAMP, 'cdc066608e81d9f33d85466c516223131602e0e97dcc413af74855f4e5efb30a', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 16 AND s.source_key = 'adilet:16';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Член Бюро Политсовета; управляющий международным финансовым центром «Астана»', 'PUBLISHED', CURRENT_TIMESTAMP, '73bb2a30e1860cf8c6571d2ec848e64e7c6961b693fcdb85f2defc24975cef5b', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 41 AND s.source_key = 'adilet:41';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Саяси кеңес бюросының мүшесі; «Астана» халықаралық қаржы орталығының басқарушысы', 'PUBLISHED', CURRENT_TIMESTAMP, '5e20c5dbfd62654d5798b14d1f14258c4cc31da19131ffa1457a92ac4f5a43a0', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 41 AND s.source_key = 'adilet:41';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Член Бюро Политсовета; ассоциированный профессор кафедры общего языкознания и литературы Кокшетауского университета им. Ш. Уалиханова', 'PUBLISHED', CURRENT_TIMESTAMP, '918f66fbed29fbcca1b4ac41e30ad5207bf6715529028e41a111cb630ab074ea', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 48 AND s.source_key = 'adilet:48';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Саяси кеңес бюросының мүшесі; Шоқан Уәлиханов атындағы Көкшетау университеті Жалпы тіл білімі және әдебиет кафедрасының қауымдастырылған профессоры', 'PUBLISHED', CURRENT_TIMESTAMP, '601c0fc428a8605abdb0c220b2bc86e1c84d0ee3eafa1bfc5db2fa63ba7551e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 48 AND s.source_key = 'adilet:48';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Председатель партии', 'PUBLISHED', CURRENT_TIMESTAMP, 'd60257b74fa08d09129ccb06c11aa311635799859e7c0c95688417fbb0866f06', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 54 AND s.source_key = 'adilet:54';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Партия төрағасы', 'PUBLISHED', CURRENT_TIMESTAMP, 'f9d6ceac81a8bd5b79a7c515a8c51c262fc758d922db6e6878998b8b374b2dbc', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 54 AND s.source_key = 'adilet:54';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Член Бюро Политсовета; общественный деятель, член Рабочей группы по парламентской реформе при Президенте Республики Казахстан, член Конституционной комиссии', 'PUBLISHED', CURRENT_TIMESTAMP, '489b54629c2fc6fe45e44ae3fefc6df803c29ddbcbef8010e6bd7fc340801af5', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 56 AND s.source_key = 'adilet:56';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Саяси кеңес бюросының мүшесі; Қазақстан Республикасы Президентінің жанындағы Парламенттік реформа жөніндегі жұмыс тобының және Конституциялық комиссиясының мүшесі, қоғам қайраткері', 'PUBLISHED', CURRENT_TIMESTAMP, '3960aba2c52c11175bbc81489d315f201ee4c67349de7c221b10bcb316b2a5c8', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 56 AND s.source_key = 'adilet:56';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Член Бюро Политсовета; Уполномоченный по правам ребёнка в Республике Казахстан', 'PUBLISHED', CURRENT_TIMESTAMP, 'f95746c80b67a7e1a91f6019612ca53d8bef89ff939086e3da20b83601d30745', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 74 AND s.source_key = 'adilet:74';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Саяси кеңес бюросының мүшесі; Қазақстан Республикасындағы бала құқықтары жөніндегі уәкіл', 'PUBLISHED', CURRENT_TIMESTAMP, '3cdf40462ea65d0dad28628333c82d02d48522c07cd8c1fb25e75e7ff9eba22b', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 74 AND s.source_key = 'adilet:74';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Член Бюро Политсовета; Президент международного общества «Қазақ тілі»', 'PUBLISHED', CURRENT_TIMESTAMP, 'a9b77bbacac84241c28f5ea77fb68ff135b80bb73d4fbfabae329dcaae192ca5', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 90 AND s.source_key = 'adilet:90';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Саяси кеңес бюросының мүшесі; Халықаралық «Қазақ тілі» қоғамының президенті', 'PUBLISHED', CURRENT_TIMESTAMP, 'd5fea94042c628736b7d3516fa6b8431679b553566a8d5637c60d999e07890ef', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 90 AND s.source_key = 'adilet:90';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Член Бюро Политсовета; Управляющий директор Группы компаний «Универсал»', 'PUBLISHED', CURRENT_TIMESTAMP, '52915392eb601719abd8cd76ef2a86c3f658f7065498795bd1542becf502f1d5', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 97 AND s.source_key = 'adilet:97';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Саяси кеңес бюросының мүшесі; «Универсал» компаниялар тобының басқарушы директоры', 'PUBLISHED', CURRENT_TIMESTAMP, '4d3ab89dcb45e2a0fc576b1a27e6992cd69216443a02aea407c816a6dcab8037', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 97 AND s.source_key = 'adilet:97';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Член Бюро Политсовета; Председатель Совета директоров «Qarmet» и группы компаний «Allur»', 'PUBLISHED', CURRENT_TIMESTAMP, '78ce5ed8cfd2fb535d9fbf67004e3fab1e8c8329a4ecabd1c0d90d610b4f936c', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 103 AND s.source_key = 'adilet:103';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Саяси кеңес бюросының мүшесі; «Qarmet» және «Allur» компаниялар тобы Директорлар кеңесінің төрағасы', 'PUBLISHED', CURRENT_TIMESTAMP, 'c33a2ba920d44e7efce6c8cfb31d9d63116c6c5727598c1f3e37ebdcb8d3b663', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 103 AND s.source_key = 'adilet:103';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Член Бюро Политсовета; Генеральный директор медиахолдинга Uni-Q Group', 'PUBLISHED', CURRENT_TIMESTAMP, 'b76da3d4d001f4e8bf9f2199509e591d6eba6edf26b87f0004dc6ac48a490f93', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 158 AND s.source_key = 'adilet:158';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Саяси кеңес бюросының мүшесі; Uni-Q Group медиахолдингінің бас директоры', 'PUBLISHED', CURRENT_TIMESTAMP, '4712346ab10e8237455a7b63219cbc8b00ac90646ab3a671f2f4405b771742b6', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 158 AND s.source_key = 'adilet:158';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Член Бюро Политсовета; телеведущая и журналист', 'PUBLISHED', CURRENT_TIMESTAMP, 'ea4a6c0d2a53bc19ac9f03b50e5dee7b7eeb199c717c6436d8a1ef8ecd062588', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 160 AND s.source_key = 'adilet:160';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Саяси кеңес бюросының мүшесі; тележүргізуші және журналист', 'PUBLISHED', CURRENT_TIMESTAMP, 'f409b398a59e6e59f8d44372ba99ec3915fa3778a749f27535247a28ccb5f8b2', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 160 AND s.source_key = 'adilet:160';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Член Бюро Политсовета; Председатель Правления Общественного фонда «Қазақстан халқына»', 'PUBLISHED', CURRENT_TIMESTAMP, '6b31925bbd26353477cacf83eac470c31183a47b7378b3538568ee1e78bc5a13', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 178 AND s.source_key = 'adilet:178';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Саяси кеңес бюросының мүшесі; «Қазақстан халқына» қоғамдық қорының Басқарма төрайымы', 'PUBLISHED', CURRENT_TIMESTAMP, '820f386eda175dfbbef59de9b7a7b418b422f57254485d27782c234652a0723b', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 178 AND s.source_key = 'adilet:178';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Член Бюро Политсовета; политолог', 'PUBLISHED', CURRENT_TIMESTAMP, '46b7b8db3b381ed5a20aa92a831918c2a1df3425515bb2250ff167259bed4505', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 184 AND s.source_key = 'adilet:184';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Саяси кеңес бюросының мүшесі; саясаттанушы', 'PUBLISHED', CURRENT_TIMESTAMP, '2aade9fda470e10ab1dd8d2c581e7cf9f3bbe05bcc2e2d89ca9ed532205bc6d4', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'adilet' AND c.list_order = 184 AND s.source_key = 'adilet:184';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Советник руководителя Центрального аппарата ', 'PUBLISHED', CURRENT_TIMESTAMP, 'f80095bf8ae80b130f1e040f45392cfe6b2a3b633202909584d211d04784fcb3', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 16 AND s.source_key = 'respublica:16';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Орталық аппарат басшысының кеңесшісі', 'PUBLISHED', CURRENT_TIMESTAMP, '110061b71abedc8779fd2461fb5c09846e8e2e334bbaeb345e4585a68fcb9d40', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 16 AND s.source_key = 'respublica:16';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Советник руководителя Центрального аппарата ', 'PUBLISHED', CURRENT_TIMESTAMP, 'f80095bf8ae80b130f1e040f45392cfe6b2a3b633202909584d211d04784fcb3', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 17 AND s.source_key = 'respublica:17';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Орталық аппарат басшысының кеңесшісі', 'PUBLISHED', CURRENT_TIMESTAMP, '110061b71abedc8779fd2461fb5c09846e8e2e334bbaeb345e4585a68fcb9d40', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 17 AND s.source_key = 'respublica:17';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Руководитель центрального аппарата партии', 'PUBLISHED', CURRENT_TIMESTAMP, '5175fe3f2c4633e06b9d3a44cf4acde7e32a60e7c9b3735d431cb471833483d1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 33 AND s.source_key = 'respublica:33';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Партия орталық аппаратының басшысы', 'PUBLISHED', CURRENT_TIMESTAMP, '2e35b0c5a963b91db3b2ef28fe3e9b20cae53b69fef1547985f888a96e5e7353', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 33 AND s.source_key = 'respublica:33';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Член Комитета по международным делам, обороне и безопасности', 'PUBLISHED', CURRENT_TIMESTAMP, 'efeff7949da3792d0fb5bd3b212280b6f3494006888e8a74e1586ea915e13770', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 43 AND s.source_key = 'respublica:43';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Халықаралық істер, қорғаныс және қауіпсіздік комитетінің мүшесі', 'PUBLISHED', CURRENT_TIMESTAMP, 'd06bb043a35edd62da0a32dd059faea0d0e02eaa3fd4979c97ef6bab77d73f8e', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 43 AND s.source_key = 'respublica:43';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Член Комитета по законодательству и судебно-правовой реформе', 'PUBLISHED', CURRENT_TIMESTAMP, '57d29130c4a3d132fbf8dcc8e0aa41a9056e06b4844efc0954a55f4d45c2300e', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 55 AND s.source_key = 'respublica:55';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Заңнама және сот-құқықтық реформа комитетінің мүшесі', 'PUBLISHED', CURRENT_TIMESTAMP, '0ec7c79524b07b9dafea3f0e684c84dfab935f752cab588d3eedb699b2203841', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 55 AND s.source_key = 'respublica:55';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Член Комитета по социально-культурному развитию', 'PUBLISHED', CURRENT_TIMESTAMP, '510885808aab8686c8fe0f7ba32ac319c0d39e1f0a3a22dd3df7bd12d575b93d', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 60 AND s.source_key = 'respublica:60';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Әлеуметтік-мәдени даму комитетінің мүшесі', 'PUBLISHED', CURRENT_TIMESTAMP, 'b395206b1d97782dfc025b96180f411e3cf8a27d60c32bc4841f509fe2580839', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 60 AND s.source_key = 'respublica:60';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Член Комитета по социально-культурному развитию', 'PUBLISHED', CURRENT_TIMESTAMP, '510885808aab8686c8fe0f7ba32ac319c0d39e1f0a3a22dd3df7bd12d575b93d', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 66 AND s.source_key = 'respublica:66';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Әлеуметтік-мәдени даму комитетінің мүшесі', 'PUBLISHED', CURRENT_TIMESTAMP, 'b395206b1d97782dfc025b96180f411e3cf8a27d60c32bc4841f509fe2580839', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 66 AND s.source_key = 'respublica:66';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', ' Советник руководителя Центрального аппарата', 'PUBLISHED', CURRENT_TIMESTAMP, 'cceb65de84ffe66ab473a8648a1b449d408c288d051ad909223da45ad003cd66', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 68 AND s.source_key = 'respublica:68';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Орталық аппарат басшысының кеңесшісі', 'PUBLISHED', CURRENT_TIMESTAMP, '110061b71abedc8779fd2461fb5c09846e8e2e334bbaeb345e4585a68fcb9d40', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 68 AND s.source_key = 'respublica:68';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Председатель партии', 'PUBLISHED', CURRENT_TIMESTAMP, 'd60257b74fa08d09129ccb06c11aa311635799859e7c0c95688417fbb0866f06', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 75 AND s.source_key = 'respublica:75';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Партия төрағасы', 'PUBLISHED', CURRENT_TIMESTAMP, 'f9d6ceac81a8bd5b79a7c515a8c51c262fc758d922db6e6878998b8b374b2dbc', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'respublica' AND c.list_order = 75 AND s.source_key = 'respublica:75';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Юрист и специалист по корпоративному праву, государственному управлению и стратегическому развитию. Заместитель Председателя партии с 2023 года.', 'PUBLISHED', CURRENT_TIMESTAMP, '145bc0bc1d2e57694d5eb0ad96ac4b69032203b6ded28d5a06c8f15ea296e8f3', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 12 AND s.source_key = 'npk:12';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Юрист и специалист по корпоративному праву, государственному управлению и стратегическому развитию. Заместитель Председателя партии с 2023 года.', 'PUBLISHED', CURRENT_TIMESTAMP, '145bc0bc1d2e57694d5eb0ad96ac4b69032203b6ded28d5a06c8f15ea296e8f3', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 12 AND s.source_key = 'npk:12';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Общественный деятель, предприниматель и эксперт в сфере образовательной политики. Развивает женское предпринимательство и систему непрерывного образования.', 'PUBLISHED', CURRENT_TIMESTAMP, 'f025469c95102816510a0a5dffdbda2592c243392f1b9974d9d770499897f0ea', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 42 AND s.source_key = 'npk:42';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Общественный деятель, предприниматель и эксперт в сфере образовательной политики. Развивает женское предпринимательство и систему непрерывного образования.', 'PUBLISHED', CURRENT_TIMESTAMP, 'f025469c95102816510a0a5dffdbda2592c243392f1b9974d9d770499897f0ea', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 42 AND s.source_key = 'npk:42';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Государственный и общественный деятель, специалист по международному праву и корпоративному управлению. Возглавляет Алматинский городской филиал партии.', 'PUBLISHED', CURRENT_TIMESTAMP, '25a60ef89f4e1deb7701da2ff44e11031e5409c26cd8eb0c229190b922262987', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 45 AND s.source_key = 'npk:45';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Государственный и общественный деятель, специалист по международному праву и корпоративному управлению. Возглавляет Алматинский городской филиал партии.', 'PUBLISHED', CURRENT_TIMESTAMP, '25a60ef89f4e1deb7701da2ff44e11031e5409c26cd8eb0c229190b922262987', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 45 AND s.source_key = 'npk:45';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Государственный и общественный деятель, юрист и экономист с более чем 35-летним опытом. Возглавляет Карагандинский областной филиал партии.', 'PUBLISHED', CURRENT_TIMESTAMP, '4f24aaf986c0c1760611bce194bed685da01a0a65a4aabe78eda9af56b2056c9', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 48 AND s.source_key = 'npk:48';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Государственный и общественный деятель, юрист и экономист с более чем 35-летним опытом. Возглавляет Карагандинский областной филиал партии.', 'PUBLISHED', CURRENT_TIMESTAMP, '4f24aaf986c0c1760611bce194bed685da01a0a65a4aabe78eda9af56b2056c9', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 48 AND s.source_key = 'npk:48';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Государственный и общественный деятель, управленец, финансист и предприниматель. С 2026 года возглавляет Народную партию Казахстана.', 'PUBLISHED', CURRENT_TIMESTAMP, 'ecf763aaf71ecacf91e268a2f5fde0a6b5f0340b932a6f4f9a820ebc83512d5c', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 71 AND s.source_key = 'npk:71';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', 'Государственный и общественный деятель, управленец, финансист и предприниматель. С 2026 года возглавляет Народную партию Казахстана.', 'PUBLISHED', CURRENT_TIMESTAMP, 'ecf763aaf71ecacf91e268a2f5fde0a6b5f0340b932a6f4f9a820ebc83512d5c', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'npk' AND c.list_order = 71 AND s.source_key = 'npk:71';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 3 AND s.source_key = 'baitaq:3';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 3 AND s.source_key = 'baitaq:3';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 6 AND s.source_key = 'baitaq:6';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 6 AND s.source_key = 'baitaq:6';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 2 AND s.source_key = 'baitaq:2';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 2 AND s.source_key = 'baitaq:2';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 4 AND s.source_key = 'baitaq:4';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 4 AND s.source_key = 'baitaq:4';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 1 AND s.source_key = 'baitaq:1';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 1 AND s.source_key = 'baitaq:1';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 5 AND s.source_key = 'baitaq:5';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 5 AND s.source_key = 'baitaq:5';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 7 AND s.source_key = 'baitaq:7';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 7 AND s.source_key = 'baitaq:7';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 8 AND s.source_key = 'baitaq:8';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 8 AND s.source_key = 'baitaq:8';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 9 AND s.source_key = 'baitaq:9';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 9 AND s.source_key = 'baitaq:9';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 11 AND s.source_key = 'baitaq:11';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 11 AND s.source_key = 'baitaq:11';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 10 AND s.source_key = 'baitaq:10';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 10 AND s.source_key = 'baitaq:10';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 12 AND s.source_key = 'baitaq:12';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 12 AND s.source_key = 'baitaq:12';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 15 AND s.source_key = 'baitaq:15';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 15 AND s.source_key = 'baitaq:15';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 14 AND s.source_key = 'baitaq:14';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 14 AND s.source_key = 'baitaq:14';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 13 AND s.source_key = 'baitaq:13';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 13 AND s.source_key = 'baitaq:13';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 17 AND s.source_key = 'baitaq:17';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 17 AND s.source_key = 'baitaq:17';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 16 AND s.source_key = 'baitaq:16';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 16 AND s.source_key = 'baitaq:16';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 18 AND s.source_key = 'baitaq:18';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 18 AND s.source_key = 'baitaq:18';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 19 AND s.source_key = 'baitaq:19';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 19 AND s.source_key = 'baitaq:19';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 22 AND s.source_key = 'baitaq:22';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 22 AND s.source_key = 'baitaq:22';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 23 AND s.source_key = 'baitaq:23';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 23 AND s.source_key = 'baitaq:23';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 21 AND s.source_key = 'baitaq:21';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 21 AND s.source_key = 'baitaq:21';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 26 AND s.source_key = 'baitaq:26';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 26 AND s.source_key = 'baitaq:26';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 24 AND s.source_key = 'baitaq:24';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 24 AND s.source_key = 'baitaq:24';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 25 AND s.source_key = 'baitaq:25';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 25 AND s.source_key = 'baitaq:25';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 27 AND s.source_key = 'baitaq:27';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 27 AND s.source_key = 'baitaq:27';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 28 AND s.source_key = 'baitaq:28';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 28 AND s.source_key = 'baitaq:28';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 29 AND s.source_key = 'baitaq:29';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 29 AND s.source_key = 'baitaq:29';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 20 AND s.source_key = 'baitaq:20';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 20 AND s.source_key = 'baitaq:20';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 34 AND s.source_key = 'baitaq:34';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 34 AND s.source_key = 'baitaq:34';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 30 AND s.source_key = 'baitaq:30';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 30 AND s.source_key = 'baitaq:30';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 31 AND s.source_key = 'baitaq:31';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 31 AND s.source_key = 'baitaq:31';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 33 AND s.source_key = 'baitaq:33';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 33 AND s.source_key = 'baitaq:33';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 32 AND s.source_key = 'baitaq:32';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 32 AND s.source_key = 'baitaq:32';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 36 AND s.source_key = 'baitaq:36';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 36 AND s.source_key = 'baitaq:36';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 35 AND s.source_key = 'baitaq:35';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 35 AND s.source_key = 'baitaq:35';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 38 AND s.source_key = 'baitaq:38';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 38 AND s.source_key = 'baitaq:38';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 40 AND s.source_key = 'baitaq:40';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 40 AND s.source_key = 'baitaq:40';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 39 AND s.source_key = 'baitaq:39';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 39 AND s.source_key = 'baitaq:39';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 42 AND s.source_key = 'baitaq:42';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 42 AND s.source_key = 'baitaq:42';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 41 AND s.source_key = 'baitaq:41';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 41 AND s.source_key = 'baitaq:41';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 43 AND s.source_key = 'baitaq:43';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 43 AND s.source_key = 'baitaq:43';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 44 AND s.source_key = 'baitaq:44';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 44 AND s.source_key = 'baitaq:44';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 45 AND s.source_key = 'baitaq:45';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 45 AND s.source_key = 'baitaq:45';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 46 AND s.source_key = 'baitaq:46';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 46 AND s.source_key = 'baitaq:46';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 47 AND s.source_key = 'baitaq:47';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 47 AND s.source_key = 'baitaq:47';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'ru', 'Кандидат в депутаты от партии «Байтақ».', 'PUBLISHED', CURRENT_TIMESTAMP, 'e1abaf71749124eacbb795649352c34a601b59f0af7a893d760de2b2eb25e0e1', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 37 AND s.source_key = 'baitaq:37';
INSERT INTO candidate_source_localization (candidate_id, source_id, language, summary, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, s.source_id, 'kk', '«Байтақ» партиясынан үміткер.', 'PUBLISHED', CURRENT_TIMESTAMP, '2dd1b7c86b1fa4d7136d0c7e066641a482b17d04ecb659970a2f28e5bfc7bf00', '2026-08-19', TRUE
FROM candidate c, source s
WHERE c.party_id = 'baitaq' AND c.list_order = 37 AND s.source_key = 'baitaq:37';

-- 4. Insert Candidate Biographies (Markdown)
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Айбек Аркабаевич Дадебай – государственный и политический деятель Республики Казахстан, Председатель партии «Әділет» с 7 мая 2026 года. Родился 1 апреля 1980 года в городе Алматы. Окончил Казахский университет международных отношений и мировых языков имени Абылай хана по специальности «Документовед-международник», впоследствии получил степень магистра регионоведения. Имеет дипломатический ранг Чрезвычайного и Полномочного Посланника I класса. Свою профессиональную деятельность начал в сфере высшего образования, работая преподавателем кафедры менеджмента международного туризма Казахского государственного университета международных отношений и мировых языков. Значительную часть своей карьеры посвятил государственной службе и вопросам государственного управления. Работал экспертом отдела межпарламентских связей и международного сотрудничества Аппарата Сената Парламента Республики Казахстан, исполнял обязанности помощника Председателя Сената. В 2011–2013 годах был атташе, III секретарем Постоянного представительства Республики Казахстан при Организации Объединённых Наций в Женеве. В последующие годы занимал руководящие должности в системе высших органов государственной власти: возглавлял Секретариат Председателя Сената Парламента Республики Казахстан, работал заместителем начальника Канцелярии Президента Республики Казахстан, заместителем Управляющего делами Президента Республики Казахстан. В январе 2022 года был назначен Управляющим делами Президента Республики Казахстан. На этом посту обеспечивал реализацию масштабных организационных и управленческих реформ, направленных на повышение эффективности государственных институтов. С февраля 2024 года по май 2026 года занимал должность Руководителя Администрации Президента Республики Казахстан, координируя деятельность по реализации ключевых государственных реформ и стратегических инициатив. За многолетнюю государственную службу и вклад в развитие страны награжден орденом «Барыс» I степени и медалью «Ерен еңбегі үшін». Женат. Воспитывает четырех детей.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, 'f47e12db1aa0bc0263e11d035671c347de05a7a6a4bf62c44cec5eafa1fe5dad', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'adilet' AND c.list_order = 54;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'kk', 'BIOGRAPHY', 'Өмірбаяны', 'Айбек Арқабайұлы Дәдебай – Қазақстан Республикасының мемлекеттік және саяси қайраткері. 2026 жылдың 7 мамырынан бастап «Әділет» партиясының төрағасы. 1980 жылғы 1 сәуірде Алматы қаласында дүниеге келген. Абылай хан атындағы Қазақ халықаралық қатынастар және әлем тілдері университетін «Халықаралық құжаттанушы» мамандығы бойынша тәмамдап, кейін өңіртану магистрі дәрежесін алған. І сыныпты Төтенше және Өкілетті Уәкіл дипломатиялық дәрежесі берілген. Еңбек жолын жоғары білім беру саласынан бастап, Қазақ мемлекеттік халықаралық қатынастар және әлем тілдері университетінің халықаралық туризм менеджменті кафедрасында оқытушы болып қызмет еткен. Мансабының елеулі бөлігін мемлекеттік қызмет пен басқару мәселелеріне арнаған. Қазақстан Республикасы Парламенті Сенаты Аппаратының Парламентаралық байланыстар және халықаралық ынтымақтастық бөлімінде сарапшы болып жұмыс істеген, сондай-ақ Сенат Төрағасының көмекшісі міндетін атқарған. 2011–2013 жылдары Қазақстан Республикасының Женева қаласындағы Біріккен Ұлттар Ұйымы жанындағы Тұрақты өкілдігінің атташесі, III хатшысы болды. Кейінгі жылдары мемлекеттік биліктің жоғары органдары жүйесінде басшылық қызметтерде болды: Қазақстан Республикасы Парламенті Сенаты Төрағасының Хатшылығын басқарды, Қазақстан Республикасы Президенті Кеңсесі басшысының орынбасары, Қазақстан Республикасы Президенті Іс басқарушысының орынбасары болып жұмыс істеді. 2022 жылғы қаңтарда Қазақстан Республикасы Президентінің Іс басқарушысы болып тағайындалды. Бұл қызметте мемлекеттік институттардың тиімділігін арттыруға бағытталған ауқымды ұйымдастырушылық және басқарушылық реформаларды жүзеге асырды. 2024 жылғы ақпаннан 2026 жылғы мамырға дейін Қазақстан Республикасы Президенті Әкімшілігінің Басшысы қызметін атқарып, негізгі мемлекеттік реформалар мен стратегиялық бастамаларды іске асыру жұмыстарын үйлестірді. Көпжылдық мемлекеттік қызметі мен елдің дамуына қосқан үлесі үшін I дәрежелі «Барыс» ордені мен «Ерен еңбегі үшін» медалімен марапатталған.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '3f75fb4a8375c66694ec5ef178ef44a256f8b497b3cd5bb81a33e76662090bf6', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'adilet' AND c.list_order = 54;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Бергенев Чингиз Адылгазиевич (родился 21 июня 1988 года) — советник руководителя Центрального аппарата партии Respublica. Окончил Восточно-Казахстанский государственный технический университет имени Д. Серикбаева по специальности «Финансы», имеет степень магистра менеджмента. Также получил юридическое образование в Казахском гуманитарно-юридическом инновационном университете и степень магистра государственного и местного управления в Академии государственного управления при Президенте Республики Казахстан. Трудовую деятельность начал в Центральном аппарате НДП «Нур Отан». В разные годы занимал ответственные должности в Министерстве обороны Республики Казахстан, Управлении делами Президента Республики Казахстан, Счетном комитете по контролю за исполнением республиканского бюджета, работал советником акима Восточно-Казахстанской области, руководителем офиса трансформации АО «Самрук-Энерго», помощником Министра общественного развития Республики Казахстан, а также в Администрации Президента Республики Казахстан.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '59d391a3c6680a03f0e2c7ed7c65fa0715f62786dc18d34001f2c27374401c81', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'respublica' AND c.list_order = 16;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'kk', 'BIOGRAPHY', 'Өмірбаяны', 'Бергенев Чингиз Адылгазыевич (1988 жылғы 21 маусымда туған) – Respublica партиясының орталық аппараты басшысының кеңесшісі. Д. Серікбаев атындағы Шығыс Қазақстан мемлекеттік техникалық университетін «Қаржы» мамандығы бойынша тәмамдап, менеджмент магистрі дәрежесін алған. Сондай-ақ Қазақ гуманитарлық-заң инновациялық университетінде заңгер мамандығын игеріп, Қазақстан Республикасы Президенті жанындағы Мемлекеттік басқару академиясында мемлекеттік және жергілікті басқару мамандығы бойынша магистр дәрежесін иеленген. Еңбек жолында Қазақстан Республикасы Президенті Іс басқармасында, Есеп комитетінде, Шығыс Қазақстан облысы әкімінің кеңесшісі, «Самұрық-Энерго» АҚ трансформация офисінің жетекшісі, ҚР Қоғамдық даму министрінің көмекшісі және Қазақстан Республикасы Президенті Әкімшілігінде қызмет атқарған.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, 'a8f4d5a5903b3218ff4baa80d12647d834f58f1d5fc146dfa7bd5eaf5d8a361e', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'respublica' AND c.list_order = 16;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Болысов Тохтар Коммунарович (родился 28 мая 1994 года) — советник руководителя Центрального аппарата партии Respublica. Родился в городе Алматы. Имеет высшее образование. Окончил Казахский университет международных отношений и мировых языков имени Абылай хана по специальности "Маркетинг", получил степень магистра экономики в Алматинском гуманитарно-экономическом университете, а также степень "PhD" в Карагандинском государственном университете имени Е.А. Букетова. Профессиональную деятельность начал в сфере молодежной политики. В 2013 году работал заместителем начальника отдела международных отношений и анализа Республиканской единой детско-юношеской организации "Жас Ұлан", позднее занимал должность заместителя председателя данной организации. В 2016–2018 годах работал заместителем исполнительного директора "Конгресса молодежи Казахстана", где занимался развитием молодежных инициатив, координацией общественных проектов и поддержкой молодежных организаций. В 2016–2018 годах возглавлял Республиканский штаб молодежных трудовых отрядов "Жасыл ел", реализуя проекты по вовлечению молодежи в трудовую и общественную деятельность. В 2018–2023 годах занимал должность исполнительного директора "Конгресса молодежи Казахстана", координировал деятельность организации, развитие молодежного движения и реализацию республиканских программ в сфере молодежной политики. С 2024 года является внештатным советником Министра науки и высшего образования Республики Казахстан, участвует в экспертной работе по вопросам развития образования, науки и поддержки молодежи. С 2026 года — советник руководителя Центрального аппарата партии "Respublica", где занимается вопросами общественных проектов, взаимодействия с молодежью и развитием партийных инициатив.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, 'b4e3b9e8f2754f9c41954c752c3323c2b9c5882161d11f16154dfe563738fac1', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'respublica' AND c.list_order = 17;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'kk', 'BIOGRAPHY', 'Өмірбаяны', 'Болысов Тохтар Коммунарович (1994 жылғы 28 мамырда туған) – Respublica партиясы Орталық аппараты басшысының кеңесшісі. Алматы қаласында дүниеге келген. Жоғары білімді маман. Абылай хан атындағы Қазақ халықаралық қатынастар және әлем тілдері университетін "Маркетинг" мамандығы бойынша тәмамдаған. Алматы гуманитарлық-экономикалық университетінде экономика магистрі дәрежесін алған, сондай-ақ Е.А. Бөкетов атындағы Қарағанды мемлекеттік университетінде "PhD" ғылыми дәрежесін иеленген. Еңбек жолын жастар саясаты саласында бастаған. 2013 жылы "Жас Ұлан" республикалық бірыңғай балалар мен жасөспірімдер ұйымында Халықаралық байланыстар және талдау бөлімінің бастығының орынбасары қызметін атқарған, кейін аталған ұйым төрағасының орынбасары болған. 2016–2018 жылдары "Қазақстан Жастар Конгресі" заңды тұлғалар бірлестігінде атқарушы директордың орынбасары қызметін атқарып, жастар бастамаларын дамыту, қоғамдық жобаларды үйлестіру және жастар ұйымдарын қолдау бағытында жұмыс жүргізді. Осы кезеңде "Жасыл ел" республикалық жастар еңбек жасақтары штабының жетекшісі қызметін атқарып, жастарды еңбекке және қоғамдық жұмыстарға тартуға бағытталған жобаларды жүзеге асырды. 2018–2023 жылдары "Қазақстан Жастар Конгресінің" атқарушы директоры қызметінде болып, жастар қозғалысын дамытуға және жастар саясаты саласындағы республикалық бағдарламаларды іске асыруға үлес қосты. 2024 жылдан бастап Қазақстан Республикасы Ғылым және жоғары білім министрінің штаттан тыс кеңесшісі болып, білім, ғылым және жастарды қолдау бағытындағы сараптамалық жұмыстарға қатысады. 2026 жылдан бастап "Respublica" партиясы Орталық аппараты басшысының кеңесшісі қызметін атқарып, қоғамдық жобалар, жастармен өзара байланыс және партиялық бастамаларды дамыту бағыттарында жұмыс жүргізуде.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '315930146f2536a1d636be968b34738a159b88823f7c3f5e613bcbfc82147931', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'respublica' AND c.list_order = 17;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Искаков Жанат Маратович родился 14 июля 1977 года в городе Караганде. Имеет высшее образование. Получил образование в области экономики, права и государственного управления. В 1998 году окончил Карагандинский государственный университет имени академика Е.А. Букетова. В 2006 году получил степень бакалавра юриспруденции в Карагандинском экономическом университете Казпотребсоюза. В 2016 году окончил магистратуру Карагандинского государственного университета имени академика Е.А. Букетова, получив степень магистра экономических наук. Трудовую деятельность начал в 1999 году в системе акимата города Караганды, где работал в сферах экономики, промышленности и развития предпринимательства. В дальнейшем занимал должности в структурах, отвечающих за экономическое развитие и поддержку предпринимательства Карагандинской области, где приобрёл значительный опыт в реализации региональной социально-экономической политики. С 2002 года занимал ряд ответственных должностей в аппарате акима Карагандинской области. Работал в направлениях организационной и кадровой политики, анализа и мониторинга социальных программ, последовательно укрепляя управленческий опыт и профессиональные компетенции. В 2009 году был назначен заместителем акима города Караганды, где курировал вопросы социально-экономического развития города, реализации инфраструктурных проектов и повышения благосостояния населения. В последующем занимал должности советника акима Карагандинской области и заместителя руководителя аппарата акима области. В 2011–2013 годах занимал должность акима района имени Казыбек би города Караганды. В этот период руководил реализацией задач, направленных на социально-экономическое развитие района, совершенствование инфраструктуры и создание комфортной городской среды. С 2013 по 2020 годы возглавлял аппарат акима Карагандинской области, где осуществлял координацию деятельности государственных органов, совершенствование административного управления и повышение эффективности региональной системы управления. С 2020 года проходил службу в Администрации Президента Республики Казахстан в должности государственного инспектора, впоследствии занимал руководящие должности в структурах, курирующих вопросы государственного контроля и организационно-территориальной работы. В этот период принимал участие в совершенствовании системы государственного контроля, координации региональной политики и повышении эффективности государственного управления. С июля 2024 года по настоящее время занимает должность руководителя Центрального аппарата Общественного объединения «Партия Respublica». За заслуги перед государством награждён медалью «Ерен еңбегі үшін», орденом «Құрмет», а также рядом юбилейных медалей. Являясь профессиональным руководителем с многолетним опытом государственной службы, вносит значительный вклад в развитие региональной политики, реализацию государственных инициатив и совершенствование системы управления.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '8585431b2190ba2d51b9f31707d5f5331080f36bd0990180bcb9571b6e098306', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'respublica' AND c.list_order = 33;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'kk', 'BIOGRAPHY', 'Өмірбаяны', 'Ысқақов Жанат Маратұлы 1977 жылғы 14 шілдеде Қарағанды қаласында дүниеге келген. Жоғары білімді маман. Экономика, құқық және мемлекеттік басқару салалары бойынша білім алған. 1998 жылы академик Е.А.Бөкетов атындағы Қарағанды мемлекеттік университетін тәмамдаған. 2006 жылы Қазтұтынуодағы Қарағанды экономикалық университетінде «Құқықтану» бағыты бойынша білім алып, заң бакалавры дәрежесіне ие болды. 2016 жылы академик Е.А.Бөкетов атындағы Қарағанды мемлекеттік университетінде экономика ғылымдарының магистрі дәрежесін алды. Еңбек жолын 1999 жылы Қарағанды қаласы әкімдігі жүйесінде бастап, экономика, өнеркәсіп және кәсіпкерлікті дамыту салаларында қызмет атқарды. Кейін Қарағанды облысының экономика және кәсіпкерлікті дамыту құрылымдарында жұмыс істеп, өңірлік әлеуметтік-экономикалық саясатты іске асыру бағытында тәжірибе жинақтады. 2002 жылдан бастап Қарағанды облысы әкімдігі аппаратында түрлі жауапты қызметтер атқарды. Ұйымдастырушылық, кадрлық саясат, әлеуметтік бағдарламаларды талдау және мониторинг жүргізу бағыттарында еңбек етіп, басқарушылық тәжірибесін нығайтты. 2009 жылы Қарағанды қаласы әкімінің орынбасары қызметіне тағайындалып, қаланың әлеуметтік-экономикалық дамуы, инфрақұрылымдық жобалар және халықтың әлеуметтік әл-ауқатын арттыру мәселелерімен айналысты. Кейін Қарағанды облысы әкімі аппараты басшысының орынбасары және кеңесшісі қызметтерін атқарды. 2011–2013 жылдары Қарағанды қаласының Қазыбек би атындағы ауданының әкімі болып қызмет атқарды. Бұл кезеңде ауданның әлеуметтік-экономикалық дамуы, тұрғындарға қолайлы орта қалыптастыру және инфрақұрылымды жетілдіру бағытындағы жұмыстарға жетекшілік етті. 2013–2020 жылдары Қарағанды облысы әкімі аппаратының басшысы лауазымында өңірлік басқару жүйесінің тиімділігін арттыру, мемлекеттік органдардың қызметін үйлестіру және әкімшілік басқару сапасын жетілдіру бағытында жұмыс жүргізді. 2020 жылдан бастап Қазақстан Республикасы Президенті Әкімшілігінде мемлекеттік инспектор қызметін атқарып, кейін Мемлекеттік бақылау және ұйымдастыру-аумақтық жұмыс бағытындағы құрылымдарда басшылық лауазымдарды иеленді. Осы кезеңде мемлекеттік бақылау жүйесін жетілдіру, өңірлік саясатты үйлестіру және мемлекеттік басқару тиімділігін арттыру мәселелерімен айналысты. 2024 жылғы шілде айынан бастап қазіргі уақытта «Respublica» партиясы» қоғамдық бірлестігі Орталық аппаратының басшысы қызметін атқарып келеді. Мемлекет алдындағы еңбегі жоғары бағаланып, «Ерен еңбегі үшін» медалімен, «Құрмет» орденімен және бірқатар мерейтойлық медальдармен наградталған. Мемлекеттік басқару саласында көпжылдық тәжірибесі бар кәсіби басшы ретінде өңірлік даму, мемлекеттік саясатты іске асыру және ұйымдастырушылық басқару бағыттарында нәтижелі еңбек етіп келеді', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '3b329841fea60fc99c4f0affb96421c14ae8b781f94676f09730062d3e7c40d6', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'respublica' AND c.list_order = 33;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Тогизбаева Айдана Кенбаевна родилась 3 марта 1990 года в городе Алматы. Имеет высшее образование в сфере экономики и бизнеса. В 2011 году окончила Евразийский национальный университет имени Л.Н. Гумилева по специальности «Финансы», в 2012 году там же получила степень магистра. В 2017–2019 годах прошла обучение по программе MBA в бизнес-школе City Business School (г. Москва). Трудовую деятельность начала в 2013 году в банковском секторе, занимая должность кредитного менеджера в АО «Kassa Nova». В дальнейшем приобрела опыт в сфере кадрового и организационного управления, работая HR-менеджером, а также занимая руководящие должности в компании «Alageum Electric». С 2018 года работает в системе Национальной палаты предпринимателей Республики Казахстан «Атамекен», где занимала руководящие должности в направлениях развития человеческого капитала, занятости, а также поддержки малого и женского предпринимательства. В этот период участвовала в реализации ряда проектов, направленных на развитие рынка труда и совершенствование предпринимательской экосистемы. Также принимала участие в международных образовательных проектах в качестве эксперта и выступала фасилитатором в рамках проекта Darya Европейского фонда образования (ETF). С 2025 года по настоящее время занимает должность советника руководителя Центрального аппарата Общественного объединения «Партия Respublica». Имеет значительный опыт в сфере развития человеческого капитала, политики занятости и реализации институциональных проектов, активно участвует в инициативах, направленных на социально-экономическое развитие страны.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '914e9c57ac53f11e37ab8f22c443508c451e739105925890c14dc67013e501b4', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'respublica' AND c.list_order = 68;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'kk', 'BIOGRAPHY', 'Өмірбаяны', 'Тогизбаева Айдана Кенбаевна 1990 жылғы 3 наурызда Алматы қаласында дүниеге келген. Жоғары білімді, экономика және бизнес саласының маманы. 2011 жылы Л.Н. Гумилев атындағы Еуразия ұлттық университетін «Қаржы» мамандығы бойынша бітіріп, 2012 жылы сол оқу орнында магистр дәрежесін алған. 2017–2019 жылдары Мәскеу қаласындағы City Business School бизнес мектебінде MBA бағдарламасынан өткен. Еңбек жолын 2013 жылы банк секторында бастап, «Kassa Nova» АҚ-да кредиттік менеджер қызметін атқарды. Кейін кадрлық және ұйымдастырушылық басқару саласында тәжірибе жинақтап, «Alageum Electric» компаниясында HR-менеджер және басшылық лауазымдарда жұмыс істеді. 2018 жылдан бастап Қазақстан Республикасының Ұлттық кәсіпкерлер палатасы «Атамекен» жүйесінде қызмет етіп, адами капиталды дамыту, жұмыспен қамту, шағын және әйелдер кәсіпкерлігін қолдау бағыттарында басшылық қызметтер атқарды. Осы кезеңде еңбек нарығын дамытуға және кәсіпкерлік экожүйені жетілдіруге бағытталған бірқатар жобалардың іске асырылуына қатысқан. Сонымен қатар халықаралық деңгейдегі білім беру жобаларында сарапшы ретінде жұмыс істеп, Еуропалық оқыту қорының (ETF) Darya жобасы аясында фасилитатор қызметін атқарды. 2025 жылдан бастап қазіргі уақытта «Respublica» партиясы» қоғамдық бірлестігі Орталық аппараты басшысының кеңесшісі қызметін атқарады. Адами капиталды дамыту, еңбек нарығы саясаты және институционалдық жобаларды іске асыру салаларында тәжірибесі мол кәсіби маман ретінде елдің әлеуметтік-экономикалық дамуына бағытталған бастамаларға белсенді түрде қатысады', 0, 'PUBLISHED', CURRENT_TIMESTAMP, 'e05865409deb00b4c0c0ca259686ef39d050c5cbd911a2ed9f389f2460a7ea9e', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'respublica' AND c.list_order = 68;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Айдарбек Асанович Кожаназаров родился 26 ноября 1983 года в Кызылординской области. Имеет высшее образование. В 2004 году окончил Казахский экономический университет имени Т. Рыскулова по специальности «Международная экономика». В 2006 году завершил обучение в Университете Данди (Шотландия), получив степень магистра в области управления нефтегазовыми проектами. Трудовую деятельность начал в финансовом и банковском секторе. В 2006–2009 годах занимал руководящие должности в БТА Банке, курируя направление исламского банкинга, а также возглавлял представительство банка в городе Дубай (ОАЭ). В 2009–2015 годах входил в руководящий состав группы компаний «APK Olzha Holding», где занимался вопросами стратегического развития и долгосрочного планирования холдинга. В 2015–2016 годах занимал должность заместителя председателя правления АО «Национальный управляющий холдинг «КазАгро». В 2016–2017 годах возглавлял правление АО «Социально-предпринимательская корпорация «Астана». В 2017–2019 годах являлся генеральным директором агропромышленной компании «Иволга-Холдинг». С 2019 по 2023 год занимал должность генерального директора группы компаний «Олжа Агро». С 2020 года является председателем Регионального совета Палаты предпринимателей Костанайской области, а также членом президиума Национальной палаты предпринимателей Республики Казахстан «Атамекен». С марта 2023 года — депутат Мажилиса Парламента Республики Казахстан VIII созыва, избран по партийному списку партии «Respublica». Является членом Комитета по аграрным вопросам Мажилиса. С января 2023 года занимает должность председателя партии «Respublica», а также является руководителем фракции партии в Мажилисе Парламента. Включён в рейтинг «50 самых влиятельных бизнесменов Казахстана» (Forbes Kazakhstan, 2023). Активно занимается спортом: возглавлял федерации триатлона, джиу-джитсу и грэпплинга Костанайской области, а также принимал участие в соревнованиях «Ironman». За вклад в государственную и общественную деятельность награждён медалью «Ерен еңбегі үшін» (2017), медалью «Народная благодарность» (2020), юбилейной медалью «30 лет Независимости Республики Казахстан» (2021) и орденом «Құрмет» (2022)', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '3bac6d291df642491d068bdc0f1d66afcd2039edc044ebdcba1e6b6d5c4a7326', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'respublica' AND c.list_order = 75;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'kk', 'BIOGRAPHY', 'Өмірбаяны', 'Айдарбек Асанұлы Қожаназаров 1983 жылғы 26 қарашада Қызылорда облысында дүниеге келген. Жоғары білімді. 2004 жылы Т. Рысқұлов атындағы Қазақ экономикалық университетін «Халықаралық экономика» мамандығы бойынша тәмамдаған. 2006 жылы Шотландиядағы Данди университетін бітіріп, мұнай-газ жобаларын басқару саласы бойынша магистр дәрежесін алған. Еңбек жолын қаржы және банк секторында бастап, 2006–2009 жылдары БТА Банкте исламдық банкинг бағыты бойынша басшылық қызметтер атқарды, сондай-ақ Дубай қаласындағы өкілдікті басқарды. 2009–2015 жылдары «APK Olzha Holding» компаниялар тобының басшылық құрамында болып, холдингтің стратегиялық дамуы мен ұзақмерзімді жоспарлау бағыттарына жетекшілік етті. 2015–2016 жылдары «ҚазАгро» ұлттық басқарушы холдингі» АҚ басқарма төрағасының орынбасары қызметін атқарды. 2016–2017 жылдары «Астана» әлеуметтік-кәсіпкерлік корпорациясы» ҰК» АҚ басқарма төрағасы болды. 2017–2019 жылдары «Иволга-Холдинг» агроөнеркәсіптік компаниясының бас директоры қызметін атқарды. 2019–2023 жылдары «Олжа Агро» компаниялар тобының бас директоры болып жұмыс істеді. 2020 жылдан бастап Қостанай облысы Кәсіпкерлер палатасы Өңірлік кеңесінің төрағасы, сондай-ақ Қазақстан Республикасының Ұлттық кәсіпкерлер палатасы «Атамекен» президиумының мүшесі болды. 2023 жылғы наурыздан бастап Қазақстан Республикасы Парламенті Мәжілісінің VIII шақырылым депутаты. «Respublica» партиясының партиялық тізімі бойынша сайланған. Мәжілістің Аграрлық мәселелер комитетінің мүшесі. 2023 жылғы қаңтардан бастап «Respublica» партиясының төрағасы, сондай-ақ Мәжілістегі партия фракциясының жетекшісі қызметін атқарады. «Қазақстанның ең ықпалды 50 бизнесмені» рейтингіне (Forbes Kazakhstan, 2023) енген. Спорт саласында да белсенді: триатлон, джиу-джитсу және грэпплинг федерацияларын басқарған, сондай-ақ «Ironman» жарыстарына қатысқан. Мемлекеттік және қоғамдық қызметтегі еңбегі үшін «Ерен еңбегі үшін» медалімен (2017), «Халық алғысы» медалімен (2020), «Қазақстан Тәуелсіздігіне 30 жыл» медалімен (2021) және «Құрмет» орденімен (2022) марапатталған.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '27b53ecd6777ff2d7e10a06105511daf871774c2ff106ad2dbc917e33d844b60', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'respublica' AND c.list_order = 75;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'ОБЩАЯ ИНФОРМАЦИЯ

Аукенов Мирас Серикбекович — юрист, специалист в области корпоративного права, государственного управления, стратегического развития и общественно-политической деятельности. С 2023 года — заместитель Председателя Народной партии Казахстана.

Работал в банковском секторе, строительстве, промышленности, корпоративном управлении, экспертно-аналитической и государственно-общественной сферах. Руководил проектами правового сопровождения, аналитики и институционального развития.

ОБРАЗОВАНИЕ

• Карагандинский государственный университет имени Е. А. Букетова, юридический факультет, специальность «Юриспруденция»
• РАНХиГС при Президенте Российской Федерации, MBA по направлению «Международный бизнес»

ПРОФЕССИОНАЛЬНАЯ ДЕЯТЕЛЬНОСТЬ

• 2006–2009 — юрист, затем главный юрист АО «Цеснабанк»
• 2009–2011 — заместитель директора юридического департамента строительной компании в Астане
• 2011–2013 — начальник отдела таможенно-правового обеспечения Казахстанской промышленной корпорации
• 2013–2015 — член Правления АО «Кокшетауские минеральные воды», руководил юридическим направлением
• 2015–2022 — исполнительный директор аналитического центра TALAP: организационное развитие, экспертно-аналитические исследования и взаимодействие с государственными органами, бизнесом и экспертным сообществом

ПАРТИЙНАЯ ДЕЯТЕЛЬНОСТЬ

• Член Народной партии Казахстана с 2022 года
• 2022 — советник Председателя партии
• 2022–2023 — руководитель Центрального аппарата партии
• С 2023 года — заместитель Председателя партии; курирует организационное развитие, региональные филиалы, партийное управление, политические проекты, выборные кампании и взаимодействие с государством и гражданским обществом

НАГРАДЫ

• Благодарность Президента Республики Казахстан
• Медаль «Ерен еңбегі үшін»
• Медаль «Халық алғысы»

КЛЮЧЕВЫЕ КОМПЕТЕНЦИИ

• Государственное управление, корпоративное и банковское право
• Корпоративное управление и стратегическое развитие
• Институциональное и организационное развитие
• Политический менеджмент и взаимодействие с государственными органами
• Экспертно-аналитическая деятельность и законотворчество
• Проектное управление', 0, 'PUBLISHED', CURRENT_TIMESTAMP, 'cb76f9ccd4a276666158d6a410cd2ea4784bd4a61e81ae863413b2382b51c938', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'npk' AND c.list_order = 12;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'ОБЩАЯ ИНФОРМАЦИЯ

Куленова Лейла Искандеровна — общественный деятель, предприниматель и эксперт в сфере образовательной политики. Обладает многолетним опытом в предпринимательстве, дошкольном образовании, развитии профессиональных объединений и взаимодействии бизнеса с государственными органами.

Председатель Комитета по развитию женского предпринимательства НПП «Атамекен». Руководитель Казахстанской ассоциации непрерывного образования, сформированной на базе профессионального объединения, созданного по её инициативе в 2012 году.

ОБРАЗОВАНИЕ

• 2001 — Карагандинский государственный университет имени Е. А. Букетова, юридический факультет
• 2018 — Московский государственный педагогический университет, магистратура

ТЕКУЩАЯ ДЕЯТЕЛЬНОСТЬ

• Народная партия Казахстана — заместитель Председателя
• Национальная палата предпринимателей Республики Казахстан «Атамекен» — член Президиума
• Комитет по развитию женского предпринимательства НПП «Атамекен» — председатель
• Казахстанская ассоциация непрерывного образования — руководитель

ПРОФЕССИОНАЛЬНЫЙ ОПЫТ

Трудовую деятельность начала в 2002 году в качестве индивидуального предпринимателя. Сформировала и успешно развила сеть предприятий, внедряя современные подходы к управлению и повышению качества услуг.

В 2005 году открыла первый частный детский сад. В дальнейшем сформировала сеть дошкольных организаций, внедрив современные образовательные, организационные и управленческие стандарты.

В 2012 году выступила инициатором создания профессионального объединения, которое впоследствии трансформировалось в Казахстанскую ассоциацию непрерывного образования — одно из крупнейших отраслевых объединений частного образования в стране. Ассоциация работает как профессиональная экспертная площадка, консолидирует предпринимателей и готовит предложения по развитию системы образования.

КЛЮЧЕВЫЕ ДОСТИЖЕНИЯ

• Участие в разработке и экспертной оценке нормативно-правовых инициатив
• Подготовка предложений по совершенствованию финансирования и регулирования образовательной отрасли
• Руководство проектом «Электронный детский сад» и внедрение автоматизированных решений для образовательных организаций
• Разработка и регистрация более 15 учебно-методических пособий
• Экспертная работа в сфере повышения квалификации педагогов и развития инклюзивного образования
• Консультирование предпринимателей в сфере образования и запуск региональной системы поддержки «Офис Забота»

ГОСУДАРСТВЕННЫЕ И ОБЩЕСТВЕННЫЕ НАГРАДЫ

• Медаль «Ерен еңбегі үшін», 2026 год
• Медаль «Ибрай Алтынсарин», 2017 год
• Медаль «Білім беру ісінің құрметті қызметкері», 2020 год
• Медаль «Ісіне адалдығы үшін», 2019 год
• Благодарственные письма Президента Республики Казахстан, Парламента Республики Казахстан, Министерства просвещения и акимата города Астаны

КЛЮЧЕВЫЕ КОМПЕТЕНЦИИ

• Системное и стратегическое мышление
• Практический управленческий опыт
• Развитие профессиональных сообществ
• Взаимодействие государства, бизнеса и отраслевых организаций
• Долгосрочные и устойчивые управленческие решения', 0, 'PUBLISHED', CURRENT_TIMESTAMP, 'a45b92e55c8c7db7bb400a9b0f9f5bf0af8ff1866e114460902b813607362c96', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'npk' AND c.list_order = 42;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'ОБЩАЯ ИНФОРМАЦИЯ

Кусаинов Бейбит Булатович — казахстанский государственный и общественный деятель, управленец, специалист в области международного права, корпоративного управления, стратегического развития и общественно-политической деятельности.

Заместитель Председателя Народной партии Казахстана, председатель Алматинского городского филиала партии, депутат Маслихата города Алматы VIII созыва и председатель постоянной комиссии по культуре, спорту, внутренней политике, религии и молодёжи. Имеет опыт работы в государственном секторе, международных интеграционных структурах, крупном бизнесе и общественно-политической сфере.

ОБРАЗОВАНИЕ

• 2008 — Казахский национальный университет имени аль-Фараби, факультет международных отношений, специальность «Международное право»
• 2019 — МГУ имени М. В. Ломоносова, MBA по направлению «Деловое администрирование»

ПРОФЕССИОНАЛЬНАЯ ДЕЯТЕЛЬНОСТЬ

• Начал карьеру со стажировки в РГП «Информационно-производственный центр» Комитета регистрационной службы Министерства юстиции Республики Казахстан
• 2006–2007 — помощник председателя совета директоров АО «Алма-Ата Голд Трейд»
• 2007–2008 — юридический консультант налогово-юридического департамента Ernst & Young
• 2008–2010 — генеральный директор ТОО «АКА Транс»
• 2010–2012 — главный специалист департамента энергетической политики и экологии Секретариата Евразийского экономического сообщества
• 2012–2015 — генеральный директор Vendor Holding
• 2015 — руководитель отдела продаж Allies Distribution
• 2015–2017 — коммерческий директор Allies Industrial
• 2015–2020 — генеральный директор ADVANTA INDUSTRIES
• 2018–2022 — директор ТОО «Бетпак Дала-2005»

ПАРТИЙНАЯ И ОБЩЕСТВЕННАЯ ДЕЯТЕЛЬНОСТЬ

• 2022–2025 — заместитель председателя Алматинского городского филиала партии
• С 2025 года — председатель Алматинского городского филиала партии
• Депутат Маслихата города Алматы VIII созыва
• Председатель постоянной комиссии по культуре, спорту, внутренней политике, религии и молодёжи
• С 2026 года — заместитель Председателя Народной партии Казахстана по взаимодействию с государственными органами

КЛЮЧЕВЫЕ КОМПЕТЕНЦИИ

• Государственное управление и международное право
• Корпоративное управление и стратегическое развитие
• Региональная политика и общественно-политическая деятельность
• Взаимодействие с государственными органами
• Развитие бизнеса, инвестиции и коммерческое управление
• Переговоры, международное сотрудничество и организационное развитие', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '03edce3c4bf0dcf27371a48beb8507cf3202ba693dbaef5d62679d34262abc26', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'npk' AND c.list_order = 45;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'ОБЩАЯ ИНФОРМАЦИЯ

Максутов Калел Мукатаевич — казахстанский государственный и общественный деятель, управленец, юрист и экономист. Заместитель Председателя Народной партии Казахстана и председатель Карагандинского областного филиала партии.

Имеет более 35 лет опыта государственной службы и регионального развития. Работал в государственном и региональном управлении, экономике, внутренней и земельной политике, молодёжной и общественной сферах.

ОБРАЗОВАНИЕ

• Атырауский государственный университет имени Халела Досмухамедова, юриспруденция
• Атырауский государственный университет имени Халела Досмухамедова, экономика
• Владеет казахским и русским языками

ПРОФЕССИОНАЛЬНАЯ ДЕЯТЕЛЬНОСТЬ

• Начал трудовую деятельность водителем Каркаралинского автопредприятия
• 1987–1993 — работа в комсомольских органах
• Председатель Комитета по делам молодёжи Карагандинской области
• Заместитель руководителя управления по делам молодёжи, туризма и спорта; заместитель главы Мичуринской районной администрации; заместитель акима Абайского района; руководитель управления информации и общественного согласия
• 1999–2009 — руководящие должности в Атырауской области: заместитель акима города Атырау, аким города Кульсары Жылыойского района, заместитель руководителя управления предпринимательства и промышленности, руководитель управления мобилизационной подготовки, гражданской обороны, аварий и чрезвычайных ситуаций
• 2009–2011 — заместитель акима города Караганды
• Май 2011 — декабрь 2019 — аким Каркаралинского района
• Декабрь 2019 — август 2021 — руководитель Управления земельных отношений Карагандинской области

ПАРТИЙНАЯ ДЕЯТЕЛЬНОСТЬ

• После завершения государственной службы возглавил Карагандинский областной филиал Народной партии Казахстана
• С 2026 года — заместитель Председателя партии; участвует в организационном и региональном развитии, работе филиалов, взаимодействии с государством и гражданским обществом, развитии партийной инфраструктуры

КЛЮЧЕВЫЕ КОМПЕТЕНЦИИ

• Государственное и региональное управление
• Социально-экономическое и территориальное развитие
• Внутренняя и земельная политика
• Местное самоуправление и государственная служба
• Организационное управление и развитие региональных структур
• Взаимодействие с общественными институтами', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '91d9c57f4b6ab5dac9573eda293aa2c39d081e84db868ece20d7f9cd2ee0eacb', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'npk' AND c.list_order = 48;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'ОБЩАЯ ИНФОРМАЦИЯ

Шоканов Нурсултан Нурланович — казахстанский государственный и общественный деятель, управленец, финансист и предприниматель. С 2026 года — Председатель Народной партии Казахстана. Президент Федерации альпинизма и спортивного скалолазания Казахстана.

Обладает более чем двадцатилетним опытом в финансах, корпоративном и государственном управлении, промышленности, нефтесервисном и инвестиционном бизнесе. Руководил крупными производственными, торговыми и инвестиционными компаниями, проектами развития бизнеса, корпоративных финансов и общественно-политических институтов.

ОБРАЗОВАНИЕ

• 2007 — Казахстанский институт менеджмента, экономики и прогнозирования (KIMEP), специальность «Финансы»
• 2018 — IMD Business School, Швейцария, Executive MBA

ПРОФЕССИОНАЛЬНАЯ ДЕЯТЕЛЬНОСТЬ

• 2006–2007 — специалист и старший специалист Ernst & Young: аудит нефтегазовых компаний, корпоративная отчётность и оценка финансовых процессов
• 2007–2008 — консультант «Казахстан Девелопмент Груп»: корпоративное управление, инвестиционное развитие и финансовый консалтинг
• 2008–2009 — консультант, директор административного департамента, директор по корпоративным финансам и заместитель генерального директора «СанДриллинг»
• 2009–2010 — генеральный директор ТОО «Центр Развития Карьеры»: стратегическое руководство и развитие человеческого капитала
• 2010–2019 — руководитель Allies Industrial: промышленное производство, операционное управление, развитие и модернизация предприятий
• 2011 — генеральный директор ТОО ASIA INTER INVEST
• 2012–2019 — генеральный директор ТОО ANTTEC
• 2012–2016 — директор ТОО «Эталон KZ»
• 2012–2013 — генеральный директор ТОО «Монета Монолит Казахстан»
• 2014–2020 — генеральный директор ТОО Allies Distribution
• 2018 — генеральный директор ТОО SYNTECO GROUP
• 2020 — генеральный директор ТОО Fast Meals & Goods
• 2020–2022 — председатель Правления Ассоциации поставщиков промышленных предприятий: поддержка отечественных производителей и взаимодействие бизнеса с государством

ПАРТИЙНАЯ И ОБЩЕСТВЕННАЯ ДЕЯТЕЛЬНОСТЬ

• Член Народной партии Казахстана с 2020 года
• 2022–2025 — руководитель Алматинского городского филиала партии
• 2024–2025 — одновременно председатель Алматинского областного филиала
• Депутат Маслихата города Алматы VIII созыва, председатель комиссии по коммунальной инфраструктуре, строительству, урбанистике, архитектуре, городской мобильности, энергетике и водоснабжению
• С 2026 года — Председатель Народной партии Казахстана; отвечает за стратегию, организационное развитие, региональную и общественно-политическую работу, идеологию и цифровую трансформацию
• Президент Федерации альпинизма и спортивного скалолазания Казахстана; поддерживает массовый спорт, здоровый образ жизни и молодёжные инициативы

КЛЮЧЕВЫЕ КОМПЕТЕНЦИИ

• Стратегические коммуникации и управление
• Корпоративное, государственное и антикризисное управление
• Организационное развитие и региональная политика
• Инфраструктурное и общественно-политическое управление
• Взаимодействие бизнеса и государства, промышленная политика
• Управление производственными предприятиями
• Финансы, инвестиции и корпоративные финансы', 0, 'PUBLISHED', CURRENT_TIMESTAMP, 'c191880c151eabf756ba534e1bf5ba5e1c11eb3088b1cd9646d31a86659cda24', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'npk' AND c.list_order = 71;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Азаматхан Амиртаев Сайлауович родился 21 марта 1978 года в Жамбылской области. Имеет высшее образование. Окончил Республиканскую специализированную физико-математическую школу-интернат имени Жаутыкова, Алматинский институт энергетики и связи по специальности «Вычислительная техника и программное обеспечение», Казахский национальный аграрный университет по специальности «Государственное местное управление». Получил степень Executive MBA в Московской школе управления «Сколково». Профессиональную деятельность начал в сфере информационных технологий. Работал директором Алматинского филиала пейджинговой компании, директором ТОО «Kaznewtech», советником руководства АО «НК «Қазақстан Темір Жолы» по вопросам информатизации. Также занимал должности вице-президента и президента Казахстанской ассоциации софтверных компаний. В 2014-2016 годах — президент ОО «Альянс инвесторов». С 2016 года — президент Республиканского общественного объединения «Экологическое движение «Байтақ-Болашақ». Являлся членом Национального совета общественного доверия при Президенте Республики Казахстан, членом совета директоров АО «Национальный управляющий холдинг «КазАгро», член Национального курултая при Президенте Республики Казахстан. Один из инициаторов развития экологического движения «Байтақ». Занимается вопросами защиты окружающей среды, развития экологической политики, устойчивого развития и повышения экологической культуры общества. Награжден медалью «Шапағат» (2020) и орденом «Құрмет» (2026). Лауреат национальной премии «Народный любимец-2014» в номинации «Меценат года». Женат, воспитывает четверых детей. Владеет казахским, русским и английским языками.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '508bac1b5ad37476bf99eb01e9870f9387aadc234067a399c107b1e55859d810', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 3;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'kk', 'BIOGRAPHY', 'Өмірбаяны', 'Әміртаев Азаматхан Сайлауұлы 1978 жылы 21 наурызда Жамбыл облысында туған. Жоғары білімді. О. А. Жәутіков атындағы республикалық физика-математика мектеп-интернатын, Алматы энергетика және байланыс институтын «Есептеу техникасы және бағдарламалық қамтамасыз ету» мамандығы бойынша, Қазақ ұлттық аграрлық университетін «Мемлекеттік жергілікті басқару» мамандығы бойынша тәмамдаған. Мәскеу қаласындағы «Сколково» басқару мектебінде Executive MBA бағдарламасы бойынша білім алған. Еңбек жолын ақпараттық технологиялар саласында бастап, «Kaznewtech» ЖШС директоры, «Қазақстан темір жолы» ҰК» АҚ информаттандыру бағытындағы кеңесшісі қызметтерін атқарды. Сондай-ақ Қазақстандық бағдарламалық қамтамасыз ету компаниялары қауымдастығының вице-президенті және президенті болды. 2014-2016 жылдары «Инвесторлар альянсы» қоғамдық бірлестігінің президенті қызметін атқарды. 2016 жылдан бері «Байтақ-Болашақ» экологиялық қозғалысы» республикалық қоғамдық бірлестігінің президенті. Қазақстан Республикасы Президенті жанындағы Ұлттық қоғамдық сенім кеңесінің мүшесі (2019-2020), «ҚазАгро» ұлттық басқарушы холдингі» АҚ директорлар кеңесінің мүшесі (2020-2021), Қазақстан Республикасы Президенті жанындағы Ұлттық Құрылтай мүшесі. Қазақстанның «Байтақ» жасылдар партиясының негізін қалаушылардың бірі. Экологиялық саясатты дамыту, қоршаған ортаны қорғау, тұрақты даму және азаматтардың экологиялық мәдениетін арттыру бағытында жұмыс жүргізіп келеді. «Шапағат» медалімен (2020), «Құрмет» орденімен (2026) марапатталған. «Жыл меценаты» номинациясы бойынша «Халық сүйіктісі-2014» ұлттық сыйлығының иегері. Үйленген, төрт бала тәрбиелеп отыр. Қазақ, орыс және ағылшын тілдерін меңгерген.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, 'fd74155f45ef456508d7206c6f90405985f8076aed86c15b35c3dea1423a4b64', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 3;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Амирова Шолпан Кенескызы — эксперт в сфере недропользования, землепользования, природных ресурсов и инвестиционных проектов с более чем 20-летним профессиональным опытом. Прошла путь от главного специалиста государственного органа до руководителя компаний, работающих в сфере освоения природных ресурсов и реализации инвестиционных проектов. В профессиональной деятельности специализируется на сопровождении проектов недропользования, взаимодействии с государственными органами, подготовке контрактов, лицензий, технико-экономических обоснований и инвестиционных программ. При её участии подготовлено и согласовано более 50 контрактов и лицензий на право недропользования, реализован ряд инвестиционных проектов. Трудовую деятельность начала в Департаменте природных ресурсов и регулирования природопользования Атырауской области. В дальнейшем работала в Управлении природных ресурсов Атырауской области, АО «СПК «Атырау», а также занимала руководящие должности в ТОО «Атырау Тау Кен» и «Tau Ken Geology», где отвечала за развитие бизнеса, стратегическое управление и взаимодействие с инвесторами. Имеет два высших образования — инженерно-техническое и юридическое, является сертифицированным медиатором. В 2023 году участвовала в выборах депутатов Атырауского областного маслихата от Казахстанской партии зелёных «Байтақ», подтверждая активную гражданскую позицию и стремление к развитию региона.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '35b0dd7b75fd636117097fbf4158e66765c6fc201fbe65ebe272317f5d05207a', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 6;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Айбеков Елдос Айбекулы — общественный деятель, управленец и эксперт в области образования, цифровых технологий и устойчивого развития. Имеет высшее образование в сфере финансов. Является основателем научно-исследовательского института и автором образовательных проектов, направленных на развитие предпринимательства и экологического мышления. В разные годы работал на государственной службе, в бизнесе и научной сфере. В настоящее время занимает должность заместителя председателя Алматинского областного филиала Казахстанской партии зелёных «Байтақ» и является членом Политического бюро партии. Координирует работу регионального филиала, активно участвует в реализации экологических и общественных инициатив. В своей профессиональной и общественной деятельности уделяет особое внимание развитию экологического образования, внедрению цифровых технологий, продвижению зелёной экономики и принципов устойчивого развития. Награждён государственной медалью Республики Казахстан «Шапағат» за вклад в общественную деятельность и развитие социальных инициатив.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '2ff1d996c4c3ed36495d0b7069ea8a926a2798e975fa1e56f8629f528ec27c5a', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 2;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Амиртаев Сапар Абдраманович родился 19 июля 1962 года в городе Шымкент. Имеет высшее юридическое образование, в 1984 году окончил юридический факультет Казахского государственного университета имени С.М. Кирова. Трудовую деятельность начал в органах внутренних дел Республики Казахстан, где более 19 лет работал на различных следственных и руководящих должностях. Прошел путь от следователя районного отдела внутренних дел до заместителя начальника ГУВД Южно-Казахстанской области по следствию, а также занимал руководящие должности в системе МВД и Департамента финансовой полиции. С 2003 года осуществляет адвокатскую деятельность, являясь членом Южно-Казахстанской, а затем Туркестанской областной коллегии адвокатов. В 2024–2025 годах входил в состав Высшего Судебного Совета Республики Казахстан. В настоящее время продолжает профессиональную деятельность в качестве адвоката Туркестанской областной коллегии адвокатов. Обладает многолетним опытом работы в сфере уголовного права, следствия, защиты прав и законных интересов граждан, а также совершенствования судебно-правовой системы. Женат, воспитал троих детей.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '70c66da28ac028b032cdd668cda1017c46f79447fa00d547fac63f2c7700f0e9', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 4;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Абдуалиева Айгуль Кадесовна — кандидат медицинских наук, эксперт в области экологии, общественного здравоохранения и устойчивого развития, общественный деятель. Имеет более 25 лет профессионального опыта в сфере здравоохранения, экологии, науки и государственного управления. В разные годы работала врачом и руководителем медицинских организаций. В настоящее время является президентом Международной академии экологии, председателем технического комитета по стандартизации ТК 60 «Экология» и председателем Международной ассоциации производителей экологически чистой продукции. Активно участвует в развитии экологической стандартизации, сертификации и внедрении международных практик устойчивого развития в Казахстане. В своей профессиональной и общественной деятельности уделяет особое внимание вопросам экологической культуры, охраны окружающей среды, устойчивого развития и экологического образования. Руководит крупными республиканскими и международными экологическими проектами, является автором более 20 научных и учебно-методических трудов. За вклад в развитие здравоохранения, экологической политики и общественную деятельность награждена государственными и ведомственными наградами.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, 'dad845d2582e6bdb1404b6bd87651ed04d9ea2de5618d74579c846846b6db0d9', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 1;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Аскаров Бекзат Ерикович родился 26 апреля 1988 года в городе Алматы. Имеет высшее образование. Окончил Казахский агротехнический университет имени С. Сейфуллина, Казахский национальный университет искусств, а также Академию «Кокше» по специальности «Юриспруденция». Трудовую деятельность начал в 2008 году в сфере средств массовой информации. Работал журналистом на телеканалах «Астана», «Седьмой канал» и КТК. Позже занимал должности эксперта и главного эксперта в Комитете внутреннего государственного аудита и финансового контроля Министерства финансов Республики Казахстан, где получил опыт в сфере государственного аудита, финансового контроля и государственных закупок. Является сертифицированным государственным аудитором Республики Казахстан. В разные годы работал заместителем председателя Объединения юридических лиц «Международный союз поэтов», методистом АО «Центр электронных финансов», помощником депутата Мажилиса Парламента Республики Казахстан, а также директором департамента Альянса предпринимателей «Parasat». В настоящее время занимается юридической практикой. Специализируется на вопросах государственных закупок, государственного аудита, финансового контроля, представительстве в судах по гражданским и административным делам, а также защите прав и законных интересов граждан и организаций. Сын известного казахского писателя и общественного деятеля Еріка Аскарова. Женат, воспитывает троих детей. Считает своими главными принципами служение стране, верховенство закона и защиту принципов справедливости и ответственности.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '47da50aa6065fcb790ab68f5d9f83d61e25f10bb1db726185656bdd37f220d5f', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 5;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Байзаханов Аслан Адильханович — врач, эксперт в области общественного здравоохранения и общественный деятель. Более 15 лет работает в сфере здравоохранения, обладает большим опытом в области медицинского менеджмента, стратегического развития медицинских организаций и реализации государственных проектов. В разные годы работал преподавателем, руководителем медицинских организаций и структурных подразделений квазигосударственного сектора. В настоящее время является активным членом Алматинского городского филиала Казахстанской партии зелёных «Байтақ». В своей профессиональной и общественной деятельности уделяет особое внимание вопросам общественного здравоохранения, экологической безопасности, эффективного государственного управления и развития гражданского общества. За вклад в развитие отечественного здравоохранения награждён нагрудным знаком «Алтын Дәрігер» и отмечен благодарственными письмами государственных органов и Президента Республики Казахстан.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, 'f8fa219b8e74cc862dd7c86abe9718c44a3aa3eb25f46f413dfbe4911303c9fe', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 7;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Байтемиров Турсынбек Шерниязович – инженер-механик, руководитель в сфере промышленности и водоснабжения. Родился в 1967 году в Западно-Казахстанской области. Окончил Западно-Казахстанский сельскохозяйственный институт по специальности «Инженер-механик». Проходил службу в Воздушно-десантных войсках СССР, является ветераном боевых действий в Нагорном Карабахе. Трудовую деятельность начал на Уральском механическом заводе, затем работал на государственной службе и в промышленной сфере. Возглавлял отдел промышленности Департамента промышленности и топливно-энергетического комплекса Западно-Казахстанской области, занимался предпринимательской деятельностью. В 2019–2025 годах работал на АО «Уральский завод „Зенит“», где занимал руководящие должности в сфере маркетинга и сбыта, а также возглавлял профсоюзную организацию предприятия. Награждён медалью «Почётный машиностроитель Казахстана». С 2025 года является генеральным директором ТОО «БатысСуШар». В своей профессиональной и общественной деятельности уделяет особое внимание развитию инфраструктуры водоснабжения, обеспечению населения качественной питьевой водой, вопросам экологической безопасности и устойчивого развития регионов.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '38840d1def6418b8e95f33b43f0efd4a4f8557bf8c22f56ee4b7a98fc8d92b91', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 8;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Баубек Нариман Аскарович — инженер, эксперт в области науки, экологии и экологических технологий. Имеет образование в сфере менеджмента, химической технологии и радиационной безопасности. Трудовую деятельность начал в Министерстве труда и социальной защиты Республики Казахстан. В дальнейшем занимал руководящие должности в сфере инжиниринга, промышленности и научно-исследовательской деятельности. С 2018 года является директором ТОО «Baiterek Engineering», где руководит научно-исследовательскими проектами в области экологии, рационального природопользования, энергосбережения, управления отходами, очистки загрязнённых вод, снижения выбросов парниковых газов и внедрения наилучших доступных технологий. Автор и соавтор научных публикаций, монографии, а также ряда изобретений и патентов, зарегистрированных в Казахстане, России и Европе. С 2025 года является членом Научно-технического совета Министерства промышленности и строительства Республики Казахстан, с 2026 года — внештатным советником председателя правления Внешнеторговой палаты Республики Казахстан по вопросам развития биофармацевтической отрасли и научно-технического сотрудничества. С 2025 года возглавляет Астанинский городской филиал Казахстанской партии зелёных «Байтақ». В своей общественной деятельности уделяет особое внимание развитию науки и отечественного производства, внедрению современных технологий, экологической безопасности и повышению качества жизни граждан.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, 'aa5f2eaf31d56c109baac673c3fa59b7528667e9949dbcad6c54fb6b62907aaf', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 9;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Габит Бекахметов — казахстанский эксперт и предприниматель в сфере образования, выпускник Duke University (США) и University of Oxford (Великобритания). Более 15 лет занимается развитием образовательных инициатив, направленных на внедрение международных стандартов обучения и подготовку конкурентоспособного поколения молодых лидеров. В разные годы возглавлял Республиканскую физико-математическую школу (РФМШ), курируя развитие филиалов в Астане и Алматы, а также подготовку учащихся к международным предметным олимпиадам. Сегодня является основателем образовательного акселератора Maruf Fellows, консалтинговой компании Paradigm Shift и инициатором инновационных проектов Urban School, EdVille International School и Perspective School. Занимается стратегическим развитием образовательных организаций, подготовкой будущих лидеров, сопровождением поступления студентов в ведущие мировые университеты и внедрением современных образовательных решений. Автор нескольких книг по вопросам образования, развития мышления и будущего общества. Продолжает активно участвовать в развитии и модернизации образовательной системы Казахстана.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, 'a4f590a2d1fac4fc4504c36c3817f5e1855f288b9880bc3697f2415cd27596ea', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 11;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Баяжума Асылбек — политолог, журналист, публицист и общественный деятель, эксперт в области государственной идеологии, международной политики, экологии и устойчивого развития. Имеет более 20 лет опыта государственной службы, пройдя профессиональный путь от районного специалиста до руководящих должностей в областных государственных органах и центральном аппарате министерства. В дальнейшем работал в средствах массовой информации и институтах гражданского общества, занимаясь формированием общественного мнения, анализом государственной политики и продвижением национальных интересов. Является автором многочисленных аналитических публикаций и исследований по вопросам государственного управления, экологии, национальной безопасности, регионального развития и международной политики. В настоящее время возглавляет Акмолинский областной филиал Казахстанской партии зелёных «Байтақ». Под его руководством реализуются общественные проекты по развитию экологической культуры, повышению гражданской активности молодёжи и реализации общенациональной инициативы «Таза Қазақстан». Также занимается научно-исследовательской деятельностью, является автором книг по общественно-политическому развитию Казахстана и известен как поэт.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '6be897290ebc6b9086b8f9f9e7a713285eeb7557e2cabc3e0221b252a47eb465', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 10;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Деркач Марина Владимировна — эксперт в сфере креативного образования, общественный деятель, председатель Ассоциации дополнительного образования при НПП «Атамекен». Родилась в 1979 году в Актобе. Мать четверых сыновей. Основатель авторской Школы развития творческого мышления ArtLab, ставшей первой в Казахстане организацией дополнительного образования, прошедшей международную институциональную аккредитацию. По итогам реализации авторских образовательных программ зафиксировано значительное улучшение показателей здоровья учащихся. Принимала участие в работе экспертной группы при Сенате Парламента Республики Казахстан по вопросам развития креативного образования и формирования законодательной базы креативных индустрий. Является членом правления Евразийской ассоциации креативных индустрий. За вклад в развитие образования и реализацию социальных проектов награждена государственной медалью «Ерен еңбегі үшін», а также была номинирована на первую президентскую премию «АруАна» в категории «Наука и инновации». Свою общественную деятельность связывает с развитием креативного образования, поддержкой детей и молодежи, формированием безопасной образовательной среды и повышением качества человеческого капитала Казахстана.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '6da261042912080d7b56f69b164ea7be246e1751f575400473053f12f60cdd73', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 12;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Досанов Абай Сабитович — управленец с многолетним опытом работы в сфере транспорта, экологии и государственного управления. Имеет три высших образования по специальностям «География и туризм», «Правоведение» и «Организация перевозок, движения и эксплуатация транспорта». Общий трудовой стаж превышает 30 лет. Работал в государственных органах, системе «Кедентранссервис», АО «Вокзал-Сервис» и АО «НК «Қазақстан темір жолы». В настоящее время занимает должность заместителя директора филиала АО «НК «ҚТЖ» – «Дирекция магистральной сети» по вокзальному хозяйству, содержанию зданий и инженерных систем. В своей профессиональной и общественной деятельности уделяет особое внимание развитию транспортной инфраструктуры, обеспечению экологической безопасности, охране окружающей среды, поддержке человека труда и устойчивому развитию регионов Казахстана.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '9d7d0fb4877609a1bb5458d8957b928c09eea7276ba3dc4a3cfc92387e7a8d4a', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 15;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Джаппарова Ардак Сарсенбековна — юрист, магистр права. Высшее юридическое образование получила в Таразском государственном университете имени М.Х. Дулати, затем с отличием окончила магистратуру Астанинского университета по специальности «Право». В настоящее время обучается по программе MBA в университете AlmaU. Трудовую деятельность начала в 2000 году помощником председателя Нотариальной палаты города Астаны. Работала юрисконсультом, частным нотариусом, а с 2007 года является членом Нотариальной палаты города Астаны. С 2025 года занимает должность директора ТОО «СПМК-5». Имеет более 25 лет профессионального опыта в сфере нотариата, защиты прав граждан и юридических лиц, обеспечения законности и правовой безопасности гражданского оборота. Активно поддерживает общественные инициативы, направленные на развитие правовой культуры и укрепление принципов верховенства закона. В своей профессиональной деятельности руководствуется принципами профессионализма, честности, справедливости и ответственности, считая своими главными приоритетами укрепление правового государства, защиту прав и законных интересов граждан и содействие устойчивому развитию Республики Казахстан.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '17d16f5c65228c9495c0f09a79de51abc8447dd42625126724d7f724c90af800', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 14;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Джакишев Алмаз Ажибекович — магистр технической физики и экономики, общественный деятель. С 2023 года занимает должность исполнительного секретаря Восточно-Казахстанского областного филиала Казахстанской партии зелёных «Байтақ». Окончил Восточно-Казахстанский технический университет имени Д. Серикбаева, где получил степени бакалавра и магистра по специальности «Техническая физика», а также Восточно-Казахстанский университет имени С. Аманжолова, получив степень магистра экономики. Трудовую деятельность начал инженером в Восточно-Казахстанском государственном техническом университете. В разные годы возглавлял молодежное крыло «Jas Otan» в Усть-Каменогорске, преподавал робототехнику, работал старшим преподавателем по информационно-коммуникационным технологиям, а также руководителем сектора по работе с учебными заведениями и молодежными организациями Молодежного ресурсного центра города Усть-Каменогорска. Активно занимается общественной и экологической деятельностью. За волонтерскую работу в период пандемии COVID-19 награжден медалью Президента Республики Казахстан «Халық алғысы». Также отмечен благодарственными письмами Президента Республики Казахстан, Министерства экологии и природных ресурсов, партии «Байтақ» и других государственных органов.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '9f1af3d27311bf11221275d2a3211bf4cc1b646337b39a77b5d477a0135f1839', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 13;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Иманбаев Айдос Бейбитулы — юрист, эксперт в сфере исполнительного производства с более чем 20-летним профессиональным опытом. Окончил Карагандинский государственный университет имени Е.А. Букетова по специальности «Юриспруденция». Трудовую деятельность начал судебным исполнителем. В дальнейшем работал в центральном аппарате Комитета по судебному администрированию при Верховном Суде Республики Казахстан, пройдя путь от ведущего специалиста до начальника управления, а также занимал должность в Министерстве юстиции Республики Казахстан. В 2022–2026 годах возглавлял Республиканскую палату частных судебных исполнителей. За время работы внес значительный вклад в развитие системы исполнительного производства, инициировал внедрение цифровых решений, направленных на повышение прозрачности и эффективности исполнения судебных актов, а также совершенствование деятельности института частных судебных исполнителей. Являлся членом Общественного совета при Министерстве юстиции и рабочих групп Парламента по разработке профильных законопроектов. Является специальным советником Президента Международного союза судебных исполнителей по странам СНГ и Азии, автором публикаций в казахстанских и зарубежных изданиях, участником международных профессиональных конференций.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '4b73b0f9e18f4a179be0a1c6a3ad7b0c434e8ba442a0ca4ab3af0b2913ad0f0c', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 17;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'kk', 'BIOGRAPHY', 'Өмірбаяны', 'Иманбаев Айдос Бейбітұлы – заңгер, атқарушылық іс жүргізу саласының сарапшысы. Бұл салада 20 жылдан астам еңбек өтілі бар. Е.А. Бөкетов атындағы Қарағанды мемлекеттік университетін «Құқықтану» мамандығы бойынша тәмамдаған. Еңбек жолын сот орындаушысы қызметінен бастап, кейін ҚР Жоғарғы Соты жанындағы Соттар әкімшілігі комитетінде жетекші маманнан басқарма басшысына дейін көтерілді. Сондай-ақ Қазақстан Республикасы Әділет министрлігінде қызмет атқарды. 2022–2026 жылдары Жеке сот орындаушыларының республикалық палатасының төрағасы болды. Қызмет барысында атқарушылық іс жүргізу жүйесін цифрландыруға, оның ашықтығы мен тиімділігін арттыруға, сондай-ақ жеке сот орындаушылары институтын дамытуға елеулі үлес қосты. Әділет министрлігі жанындағы Қоғамдық кеңестің және Парламенттің заң жобалары жөніндегі жұмыс топтарының мүшесі болды. Халықаралық сот орындаушылар одағы Президентінің ТМД және Азия елдері бойынша арнайы кеңесшісі. Қазақстандық және шетелдік басылымдардың авторы, халықаралық кәсіби конференциялардың тұрақты қатысушысы.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, 'be09f26c1a2825f624591c407bbea53500b024c6c6aed788789f94cae51ad9e4', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 17;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Кажиев Сериккан Ергалиевич родился 19 марта 1967 года в селе Саржал Абайского района области Абай. Окончил Семипалатинский строительный техникум, а затем Центрально-Азиатский университет по специальности «Юриспруденция». Трудовую деятельность начал в строительной сфере. В 1989–2011 годах проходил службу в органах внутренних дел Республики Казахстан, где занимал различные руководящие должности в системе дорожной полиции, завершив службу в должности командира отдельного батальона дорожной полиции №2 ДВД Восточно-Казахстанской области. После выхода на пенсию работал в сфере безопасности и строительства. В 2015–2023 годах возглавлял ТОО «ПОСЖБ». В настоящее время является директором ТОО «СемСтрой-Лидер». Имеет многолетний опыт работы в сфере правоохранительной деятельности, безопасности и строительства. Женат, воспитывает пятерых детей.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, 'f314eb9093b471a39bb19420250fa7f57e8d0bd901779d10a9464ab4fef9a225', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 18;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Каметов Бакыт Хабидуллаевич родился 7 февраля 1967 года в городе Гурьеве (ныне Атырау). Имеет высшее образование. Окончил Атырауский педагогический университет по специальности «Учитель физики и математики», Карагандинскую высшую школу полиции по специальности «Юриспруденция», а также Университет имени Ш. Есенова по специальности «Экономика». Трудовую деятельность начал в органах внутренних дел. В 1990–2006 годах работал участковым инспектором, сотрудником уголовного розыска, заместителем начальника подразделений органов внутренних дел, начальником следственного изолятора и исправительного учреждения, заместителем начальника районного отдела полиции. В последующие годы возглавлял Жайык-Каспийскую межобластную рыбохозяйственную инспекцию, учреждение «Еңбек-Атырау», занимался предпринимательской деятельностью, руководил службой безопасности Атырауского нефтеперерабатывающего завода и крестьянским хозяйством «Тама-Кен». В настоящее время является депутатом Атырауского областного маслихата, членом Казахстанской партии зелёных «Байтақ». Женат, воспитывает четверых детей.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '43a3e2f477240eff74ee5a73ee29aafdc49aeba10eb4d970aeafa5ffe21e3517', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 19;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Кенжебекова Роза Темиркуловна — общественный деятель, опытный специалист железнодорожной отрасли, председатель Женского совета Казахстанской партии зелёных «БАЙТАҚ». Имеет высшее экономическое образование. Более 22 лет работала в железнодорожной отрасли Казахстана, пройдя путь от специалиста до руководителя. Внесла значительный вклад в развитие отрасли, совершенствование производственных процессов и укрепление трудовых коллективов. В настоящее время возглавляет Женский совет партии «БАЙТАҚ», реализует проекты по развитию женского лидерства, экологического просвещения, поддержке семьи и молодёжи, а также продвижению общенациональной инициативы «Таза Қазақстан». В своей общественной деятельности последовательно выступает за защиту окружающей среды, социальную справедливость, укрепление института семьи и расширение участия женщин в общественной и политической жизни. Семейное положение: воспитывает сына.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '7436ee9882a7bee26a13dab0401bf63efdc3ba5279cb955f2928abd94d488a15', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 22;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Керей Бекберген Дуйсенбаевич родился 1 ноября 1971 года в селе Чалдай Щербактинского района Павлодарской области. Окончил Акмолинский сельскохозяйственный институт по специальности «Инженер-землеустроитель». Общий трудовой стаж — 34 года, стаж государственной службы — 31 год. Женат, имеет двоих детей. Профессиональную деятельность начал в сфере земельных отношений. Работал в земельной инспекции и природоохранных органах Павлодарской области. В дальнейшем занимал руководящие должности в Министерстве охраны окружающей среды, Министерстве энергетики, Министерстве экологии, геологии и природных ресурсов Республики Казахстан, курируя вопросы экологической политики, стратегического планирования, зеленой экономики, международного сотрудничества и привлечения инвестиций. В 2022 году работал главным менеджером Департамента инвестиций АО «НГК «Казгеология». С 2023 года занимает руководящие должности в Казахстанской партии зеленых «Байтақ», возглавлял Центральный аппарат и исполнял обязанности исполнительного секретаря партии. В настоящее время — секретарь Казахстанской партии зеленых «Байтақ» по вопросам зеленой экономики. Занимается развитием экологической политики, продвижением принципов зеленой экономики и устойчивого развития. Награжден нагрудным знаком «Экология саласының үздігі», юбилейной медалью «20 лет независимости Республики Казахстан», медалью «Ерен еңбегі үшін» и Почетной грамотой Министерства экологии Республики Казахстан.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, 'd5b6d10f3d3426fe59264bc826397c53e3bcb3887b38e59d8af5f27ddc604eca', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 23;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Кенжалиев Эльнар — инженер-металлург, кандидат технических наук, специалист с более чем 20-летним опытом работы в горно-металлургической и промышленной отраслях, свыше 10 лет занимал руководящие должности. С отличием окончил Казахский национальный технический университет имени К. Сатпаева, затем защитил кандидатскую диссертацию в Институте металлургии и обогащения. Проходил научную стажировку в Израильском технологическом институте (Технион). Автор 32 научных публикаций и ряда патентов Республики Казахстан. В разные годы работал в Институте металлургии и обогащения, корпорации «Казахмыс», Национальной горнорудной компании «Тау-Кен Самрук» и научно-технологическом холдинге «Парасат». Руководил реализацией крупных производственных и инвестиционных проектов в сфере металлургии, горнодобывающей промышленности и инновационных технологий. В настоящее время отвечает за стратегическое развитие и привлечение инвестиций в компании KazNewTech. Последовательно выступает за внедрение экологически безопасных технологий, развитие глубокой переработки сырья, сокращение промышленных отходов, восстановление нарушенных земель и рациональное использование природных ресурсов, считая, что промышленное развитие должно сочетаться с ответственным отношением к окружающей среде.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '6600a9d7e4ae0b8e1538aceaae718c666e73dbe2cf9e2f38669fb3991c61f660', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 21;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Кунгожин Алмаз Мухамбетович — педагог, математик, доктор философии (PhD), руководитель в сфере образования и эксперт в области STEM-образования и олимпиадного движения. Окончил бакалавриат, магистратуру и докторантуру КазНУ имени аль-Фараби, выпускник международной программы «Болашак». Профессиональный путь прошёл от учителя математики и тренера олимпиадного резерва до руководителя ведущих образовательных учреждений. Возглавлял Республиканскую физико-математическую школу в Алматы, в настоящее время занимает должность первого заместителя председателя правления Республиканской физико-математической школы, курируя академическое направление. Неоднократно руководил национальной сборной Казахстана на Международной математической олимпиаде (IMO), Балканской математической олимпиаде (BMO) и Европейской математической олимпиаде для девушек (EGMO). Автор научных публикаций, авторского свидетельства и соавтор сборников олимпиадных задач. В настоящее время является кандидатом в депутаты Национального курултая от Казахстанской партии зелёных «Байтақ». В своей общественной деятельности выступает за развитие качественного образования, экологической культуры и принципов устойчивого развития, рассматривая интеллектуальный потенциал и сохранение природы как основу будущего Казахстана.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '9f94381069b0bcdc05eb04943269b876d0eacf1b911d3e59545af0bd8c1834c6', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 26;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Краснокуцкий Андрей Анатольевич – дата рождения 26 декабря 1986 года в городе Алматы. Здесь прошло моё детство, здесь я учился, начал работать и сделал первые шаги в предпринимательстве. Работать начал ещё школьном возрасте с 12 лет, помогая продавать в магазине “Серебряный диск” и именно тогда впервые понял, насколько важно уметь работать, держать своё слово и уважать людей. Начинали с небольшого бизнеса и заёмных денег в 21 год, мы с друзьями открыли первый магазин по продаже компьютерных игр и аксессуаров были взлеты и падения. В какой-то момент из-за неудачного партнёрства нам пришлось практически начать всё сначала. Но именно этот опыт научил меня главному: неудача - это не конец. Если не опускать руки, анализировать свои ошибки и продолжать двигаться вперёд, любую трудность можно превратить в новую возможность. После того как остался один единственный магазин, начался новый этап. Мы стали участвовать в государственных закупках, реализовывать крупные социальные проекты, поставлять оборудование и постепенно заслужили доверие заказчиков. Так появилась компания ATON+. Сегодня ATON+ - это Казахстанское производство. Мы выпускаем компьютерные корпуса, детские игровые площадки и различные элементы благоустройства Для меня важно видеть конкретный результат своей работы. Когда продукция, созданная нашей командой, появляется в школах, дворах и общественных пространствах по всему Казахстану, я понимаю, что наша работа действительно приносит пользу народу нашей страны. Я всегда верил в технологии и возможности, которые они дают человеку. Если что-то, не знаешь - этому можно научиться. Сегодня мир меняется очень быстро. Искусственный интеллект, цифровые технологии и современные производства открывают перед Казахстаном огромные возможности. Создавать возможность для молодых людей. Создать производство. Создать технологии. Создать рабочие места.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '00718b21cbdb6986b360fc8c649c4082036eeb6fc0759da73bff35e744934af3', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 24;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'kk', 'BIOGRAPHY', 'Өмірбаяны', 'Краснокуцкий Андрей Анатольевич 1986 жылғы 26 желтоқсанда Алматы қаласында дүниеге келген. Менің балалық шағым осы қалада өтті, осы жерде білім алдым, еңбек жолымды бастадым және кәсіпкерліктегі алғашқы қадамдарымды жасадым. Еңбек жолымды мектеп жасында, 12 жасымнан бастап «Серебряный диск» дүкенінде сатуға көмектесуден бастадым. Дәл сол кезде еңбек етудің, берген сөзіңде тұрудың және адамдарды құрметтеудің қаншалықты маңызды екенін алғаш рет түсіндім. Біз шағын бизнестен бастадық. 21 жасымда достарыммен бірге қарыз қаражатқа компьютерлік ойындар мен аксессуарлар сататын алғашқы дүкенімізді аштық. Өрлеу де, құлдырау да болды. Бір кезеңде сәтсіз серіктестіктің салдарынан бәрін қайтадан дерлік басынан бастауға тура келді. Алайда дәл осы тәжірибе маған ең басты нәрсені үйретті: сәтсіздік – бұл соңы емес. Егер мойымай, өз қателіктеріңді талдап, алға қарай жылжуды жалғастырсаң, кез келген қиындықты жаңа мүмкіндікке айналдыруға болады. Бір ғана дүкен қалғаннан кейін жаңа кезең басталды. Біз мемлекеттік сатып алуларға қатысып, ірі әлеуметтік жобаларды жүзеге асыра бастадық, жабдықтар жеткізіп, біртіндеп тапсырыс берушілердің сеніміне ие болдық. Осылайша ATON+ компаниясы құрылды. Бүгінде ATON+ – қазақстандық өндіріс. Біз компьютер корпустарын, балалар ойын алаңдарын және абаттандырудың түрлі элементтерін шығарамыз. Мен үшін өз еңбегімнің нақты нәтижесін көру маңызды. Біздің командамыз шығарған өнімдер Қазақстанның түкпір-түкпіріндегі мектептерде, аулаларда және қоғамдық кеңістіктерде орнатылған кезде, еңбегіміздің еліміздің халқына шын мәнінде пайда әкеліп жатқанын түсінемін. Мен әрдайым технологияларға және олардың адамға беретін мүмкіндіктеріне сендім. Егер бір нәрсені білмесең, оны үйренуге болады. Бүгінде әлем өте жылдам өзгеріп жатыр. Жасанды интеллект, цифрлық технологиялар және заманауи өндірістер Қазақстан үшін орасан зор мүмкіндіктер ашып отыр. Жастарға мүмкіндік жасау. Өндіріс құру. Технологиялар жасау. Жұмыс орындарын құру.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '2aa2f0522da7f3e37fa8b4ae12d47532bc9e88b2ef8cd6766bc65353a8967744', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 24;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Мурат Кудеринов родился 21 сентября 1977 года в Карагандинской области. Имеет высшее юридическое образование. В 1999 году окончил Карагандинский государственный университет имени Е.А. Букетова по специальности «Правоведение». Трудовую деятельность начал в органах прокуратуры, где с 2000 по 2010 годы проходил службу в прокуратуре Карагандинской области. В последующие годы работал юристом в сфере недропользования, руководил филиалом товарной биржи по Карагандинской области, возглавлял юридический отдел АО «Станция Экибастузская ГРЭС-2». С 2015 года является директором ТОО «Наше право.kz», а с 2019 года — председателем Правления Палаты казахстанских юридических консультантов. В 2015 году основал общественное объединение «Туған жер», занимающееся вопросами охраны окружающей среды. Является инициатором десятков судебных процессов по прекращению деятельности предприятий, нарушавших экологическое законодательство Республики Казахстан. С 2022 года состоит в Казахстанской партии зеленых «Байтақ», является исполнительным секретарем Карагандинского областного филиала, членом Политбюро и Политического совета партии. В 2023–2025 годах был депутатом Карагандинского городского маслихата VIII созыва. Женат, воспитывает двоих детей.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '115d120a03dcca2e45a5faf2772ff89921f521e8b0524790112e702d4f722729', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 25;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Кыдырбаев Ерлан Жайлаубаевич родился 4 августа 1976 года в городе Алматы. В 1998 году окончил Казахский государственный аграрный университет по специальности «Ветеринарная медицина». Позже получил образование в университете «Туран» по специальностям «Экономика и менеджмент» (2004) и «Юриспруденция» (2013). В настоящее время является аспирантом кафедры экологии Института биологии Национальной академии наук Кыргызской Республики, где занимается научным исследованием в области биологических методов борьбы с опасными вредителями лесных насаждений. Трудовую деятельность начал в 1998 году. Работал менеджером по продажам, коммерческим директором и руководителем ряда коммерческих организаций, в том числе ТОО «Компания КЕНТ», ТОО «РПА Астана Медиа Сервис», ТОО «TAYER» и ЖСК «ДАР». В настоящее время является специалистом по коммерциализации в ТОО «Олтек Трейд» и ТОО «Азия-Auto Казахстан». С 2026 года — собственник сетевого издания ALEM. В 2021–2023 годах входил в состав Национального научного совета МОН РК по приоритету «Устойчивое развитие агропромышленного комплекса и безопасность сельскохозяйственной продукции». С 2021 года является членом Совета по региональному развитию города Астаны. С 2022 года — член Казахстанской партии зелёных «Байтақ», секретарь Центрального аппарата партии. Женат, воспитывает троих детей. Является инвалидом I группы.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '80bb62fee9a20490f036425846a6ae2dc7664f439e8b5150ff92d083b4f9bdfe', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 27;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Кадырбаева Нургуль Жумахметовна — педагог, учитель начальных классов, многодетная мать и общественный деятель. Окончила университет «Отырар» по специальности «Учитель начальных классов». С 2004 по 2014 год работала учителем начальных классов в средней школе имени Турара Рыскулова. Наряду с педагогической деятельностью активно занимается вопросами воспитания детей, укрепления семейных ценностей и участвует в общественных инициативах. В 2026 году прошла курс повышения квалификации в Казахском агротехническом исследовательском университете имени Сакена Сейфуллина по вопросам экологии, охраны окружающей среды и экологической безопасности. В настоящее время поддерживает общественные инициативы Казахстанской партии зелёных «Байтақ», уделяя особое внимание развитию экологической культуры, укреплению института семьи и воспитанию подрастающего поколения. Лауреат номинаций «Мейірімді ана», «Мерейлі отбасы» и «Өнегелі отбасы».', 0, 'PUBLISHED', CURRENT_TIMESTAMP, 'be7464a38efbcd125eb075cfe224bca50d91bef0568f013bd1051c8f67ee779a', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 28;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Алма Караш — экономист, предприниматель в сфере производства и лёгкой промышленности, общественный деятель. Родилась в Алматинской области. Имеет образование в области экономики, технологии производства, технических наук и права. Трудовую деятельность начала в аппарате акима Алмалинского района Алматы, затем занимала руководящие должности в банках второго уровня Казахстана. С 2013 года развивает собственный бизнес, является учредителем производственной компании ALMATEXTILE и медицинского центра ADAL MEDPHARM. С 2022 года возглавляет филиал Национального объединения предприятий лёгкой промышленности Qaz Textile Industry по городу Алматы и Алматинской области. С 2025 года входит в Региональный совет Палаты предпринимателей «Атамекен» города Алматы и Совет по чистым производствам. С 2025 года является членом Казахстанской партии зелёных «Байтақ» и председателем Алматинского городского филиала партии. Активно занимается вопросами развития зелёной экономики, поддержки отечественного производства, охраны окружающей среды и повышения качества жизни населения. В 2026 году выдвинута кандидатом в депутаты Курултая от партии «Байтақ».', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '78182689652cdb244ed569b840fddfe9968ca53e5769b8225494bbd4299c4560', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 29;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'kk', 'BIOGRAPHY', 'Өмірбаяны', 'Алма Қараш – экономист, өндіріс және жеңіл өнеркәсіп саласының кәсіпкері, қоғам қайраткері. Алматы облысында дүниеге келген. Экономика, өндіріс технологиясы, техникалық ғылымдар және құқық салалары бойынша білім алған. Еңбек жолын Алматы қаласы Алмалы ауданы әкімдігінің экономика бөлімінде бастап, кейін Қазақстанның екінші деңгейлі банктерінде басшылық қызметтер атқарды. 2013 жылдан бері өндіріс және медицина саласындағы жеке кәсіпкерлікпен айналысады. Қазіргі таңда ALMATEXTILE өндірістік компаниясы мен ADAL MEDPHARM медициналық орталығының құрылтайшысы. 2022 жылдан бастап Qaz Textile Industry жеңіл өнеркәсіп кәсіпорындарының ұлттық бірлестігінің Алматы қаласы және Алматы облысы бойынша филиалын басқарады. 2025 жылдан Алматы қаласы Кәсіпкерлер палатасының өңірлік кеңесі мен Таза өндірістер кеңесінің мүшесі. 2025 жылдан Қазақстанның «Байтақ» жасылдар партиясының мүшесі, Алматы қалалық филиалының төрайымы. Экологияны қорғау, жасыл экономиканы дамыту, отандық өндірісті қолдау және тұрғындардың өмір сүру сапасын арттыру бағытында белсенді жұмыс жүргізеді. 2026 жылы «Байтақ» партиясынан Құрылтай депутаттығына кандидат ретінде ұсынылды.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '2a1bb322c103fe93a277bd326dc64b6c1025fe89ca798698938e7681bc01b7c7', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 29;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Камытбекова Сауле Жайлауовна — юрист, магистр права, опытный специалист с многолетним стажем работы в судебной системе и государственных органах. Окончила Шымкентский педагогический институт имени М. Ауэзова, Международный казахско-турецкий университет имени Х.А. Ясави и магистратуру KAZGUU имени М. Нарикбаева по специальности «Правоведение». Профессиональную деятельность начала в сфере образования, затем работала в судебной системе и государственных органах. В разные годы занимала должности в Южно-Казахстанском областном суде, Администраторе судов города Астаны, Министерстве туризма и спорта Республики Казахстан, системе фонда «Самрук-Қазына». В 2008–2017 годах работала судьёй Актюбинского городского суда и Алматинского районного суда города Астаны. С 2017 года работает в Аппарате Парламента Республики Казахстан. В настоящее время занимает руководящую должность в Аппарате Мажилиса, курируя вопросы законодательства и взаимодействия с парламентскими комитетами. Награждена нагрудным знаком «Үш би», а также юбилейными медалями «Қазақстан Республикасының Тәуелсіздігіне 30 жыл» и «Қазақстан Республикасының Парламентіне 30 жыл».', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '432baa047e93f23aed814e36080046efdd6cd2c8df6810255ba07275e0211aa4', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 20;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Руслан Муратулы родился 10 февраля 1989 года в Байдибекском районе Туркестанской области. Имеет высшее образование, инженер-эколог. Окончил Шымкентский колледж по специальности «Строительство» и высшее учебное заведение по специальности «Химические вещества». В настоящее время обучается в магистратуре Южно-Казахстанского университета имени М. Ауэзова по образовательной программе «Технологии охраны окружающей среды». В 2008–2009 годах проходил срочную военную службу в Вооруженных силах Республики Казахстан. Трудовую деятельность начал инженером-строителем, затем работал диспетчером и мастером в сфере газового хозяйства. С 2019 года является директором ТОО «КазОйлЭнерджи». Под его руководством компания участвует в развитии инфраструктуры региона, создании новых рабочих мест и внедрении принципов экологической ответственности в производстве. С 2025 года является внештатным советником акима города Кентау по вопросам инвестиций, а также президентом Федерации джиу-джитсу Туркестанской области. Имеет практический опыт в сфере экологических технологий, производственной инженерии и регионального развития. Женат, воспитывает троих детей.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, 'da2a07d2fb1150e59d5788bc4e968dc78eefc312493cc76c0ddf23b3e3fd1af6', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 34;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Мамытов Нургали Киябаевич — доктор PhD, эксперт в области права, эколог и общественный деятель. Окончил юридический факультет Томского государственного университета. Трудовую деятельность начал в 1982 году следователем прокуратуры. Более 30 лет работал в органах прокуратуры, занимая ответственные должности, в том числе в Генеральной прокуратуре СССР, прокуратуре города Алматы, исполнял обязанности прокурора Северо-Казахстанской и Южно-Казахстанской областей. Позднее работал в Канцелярии Премьер-Министра Республики Казахстан и Администрации Президента Республики Казахстан. Почётный работник органов прокуратуры, кавалер ордена «Құрмет», награждён золотой медалью «За вклад в науку Республики Казахстан». Сертифицированный эксперт по разработке нормативных правовых актов, имеет образование в области экологии. Является автором ряда законопроектов, включая Закон «О реабилитации жертв политических репрессий». Свободно владеет казахским, русским, английским и немецким языками. Активно занимается общественной деятельностью и развитием шахматного спорта: возглавлял Федерацию шахмат Южно-Казахстанской области, инициировал открытие шахматного клуба в Шымкенте. Женат, воспитал троих детей.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '712c94b3d2b5dcd0b7afe5310b17aa710d5b3ae82d2e1c247bc4918e220d6359', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 30;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'kk', 'BIOGRAPHY', 'Өмірбаяны', 'Мамытов Нұрғали Қиябайұлы – заң ғылымдарының PhD докторы, құқық саласының сарапшысы, эколог және қоғам қайраткері. Томск мемлекеттік университетінің заң факультетін тәмамдаған. Еңбек жолын 1982 жылы тергеуші болып бастап, прокуратура органдарында ұзақ жыл қызмет атқарды. КСРО Бас прокуратурасында, Алматы қаласы Алатау ауданының прокуроры, Солтүстік Қазақстан және Оңтүстік Қазақстан облыстары прокурорының міндетін атқарушы болды. Кейін Қазақстан Республикасы Премьер-Министрі Кеңсесінде және Президент Әкімшілігінде жауапты қызметтер атқарды. Прокуратура органдарының құрметті қызметкері, «Құрмет» орденінің иегері, «Қазақстан Республикасының ғылымына қосқан үлесі үшін» алтын медалімен марапатталған. Құқықтық актілерді әзірлеу жөніндегі сертификатталған сарапшы. Экология мамандығы бойынша білім алған. Бірқатар заң жобаларының, соның ішінде «Саяси қуғын-сүргін құрбандарын ақтау туралы» заң жобасының авторларының бірі. Қазақ, орыс, ағылшын және неміс тілдерін меңгерген. Қоғамдық қызметте шахмат спортын дамытуға елеулі үлес қосты: Оңтүстік Қазақстан облыстық шахмат федерациясын басқарды, Шымкент қаласында шахмат клубын ашуға бастамашы болды. Үйленген, үш баласы бар.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '6ad737981824bc5bdf584e730002a7ad78f586c12ea3c1bf10690f38e24bc767', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 30;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Мартель Владимир Александрович — юрист, общественный деятель и секретарь Казахстанской партии зелёных «Байтақ». Окончил юридический факультет Казахского государственного университета. Профессиональную деятельность начал в Министерстве юстиции Республики Казахстан, затем работал в Верховном Суде Республики Казахстан, аппарате акима Акмолинской области и Администрации Президента Республики Казахстан. В 1998–2004 годах занимал должность судьи Алматинского района города Астаны. Руководил юридической компанией, оказывавшей правовые услуги в сфере гражданско-правовых отношений. С 2022 года является активным членом Казахстанской партии зелёных «Байтақ», входит в состав Политического совета и Политического бюро, занимает должность секретаря партии. Является инициатором развития циркулярной экономики в Казахстане, продвижения эффективного управления вторичными ресурсами и сокращения использования одноразового пластика. По его инициативе в Астане был реализован проект по переработке изношенных автомобильных шин. Женат, воспитывает четверых детей. Ведёт здоровый образ жизни.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '50f550b5b182729228b3bd0f8376e176f5dae90c55fe28d815c8e8245ac4143f', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 31;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Мусаев Улан — общественный деятель, педагог и активный защитник прав людей с инвалидностью. Магистр религиоведения, переводчик арабского языка. С детства живёт с диагнозом детский церебральный паралич (ДЦП), однако сумел реализовать себя в общественной, образовательной и благотворительной деятельности. Окончил Казахский национальный университет имени аль-Фараби, где получил степени бакалавра и магистра по специальности «Религиоведение». С 2009 года работает учителем истории в школе-лицее №131 имени Бауыржана Момышулы города Алматы. В том же году основал общественное объединение «Біз сіздермен біргеміз» («Мы с вами вместе»), президентом которого является по настоящее время. Организация объединяет преимущественно людей с инвалидностью и реализует благотворительные, культурные и социальные проекты, направленные на поддержку людей с особыми потребностями. Является автором общественных проектов «Жүректен жүрекке», «Біз сіздермен біргеміз», «Көңілді думан», «Голос молодежи — Золотой микрофон», «Мы — за здоровый образ жизни!», способствующих развитию инклюзивной среды, культуры благотворительности и общественной активности. С 2020 года является советником акима Жетысуского района города Алматы по вопросам людей с инвалидностью. Занимается вопросами доступной среды, взаимодействием с государственными органами и реализацией социальных инициатив. За общественную, педагогическую и благотворительную деятельность неоднократно награждался благодарственными письмами, дипломами и общественными наградами, а также удостоен юбилейной медали «Қазақстан Тәуелсіздігіне 30 жыл».', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '79edb956c2ba913a2be5d42cc7247d175256706bc7c5b648c0635b74aa5312e8', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 33;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Махамбетова Назген Мансурхановна — эколог, руководитель в сфере охраны окружающей среды, эксперт в области экологической безопасности, промышленной экологии и устойчивого развития. Окончила Евразийский национальный университет имени Л.Н. Гумилева, получив степени бакалавра и магистра по специальности «Экология». Профессиональную деятельность начала в частных экологических организациях в качестве инженера-проектировщика и верификатора, занимаясь экологическим проектированием, разработкой природоохранной документации, подготовкой нормативов эмиссий и экологическим сопровождением промышленных предприятий. Позднее работала экспертом Управления экологического контроля Министерства экологии, геологии и природных ресурсов Республики Казахстан, где участвовала в реализации государственной экологической политики, совершенствовании системы экологического контроля и обеспечении соблюдения экологического законодательства. В настоящее время возглавляет отдел охраны окружающей среды ТОО «ПетроҚазақстан Ойл Продактс». Под её руководством реализуются проекты по обеспечению экологической безопасности производства, внедрению современных систем экологического мониторинга, организации производственного экологического контроля и снижению воздействия предприятия на окружающую среду. Активно участвует в общественной деятельности, поддерживая инициативы по развитию экологической культуры, повышению гражданской ответственности и продвижению принципов устойчивого развития. Является кандидатом от Казахстанской партии зелёных «БАЙТАҚ» и выступает за то, чтобы вопросы экологии занимали одно из ключевых мест в государственной политике.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '954ac7a439c3b6b4cddc59dacfc03b2d94213dcf8e76c0068b95e8e608ac606b', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 32;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'kk', 'BIOGRAPHY', 'Өмірбаяны', 'Махамбетова Назген Мансұрханқызы – эколог, қоршаған ортаны қорғау саласының басшысы, экологиялық қауіпсіздік, өнеркәсіптік экология және орнықты даму бағыттарының сарапшысы. Л.Н. Гумилев атындағы Еуразия ұлттық университетін «Экология» мамандығы бойынша бакалавр және магистр дәрежелерімен тәмамдаған. Еңбек жолын жеке экологиялық ұйымдарда инженер-жобалаушы және верификатор ретінде бастап, экологиялық жобалау, табиғат қорғау құжаттарын әзірлеу, эмиссиялар нормативтерін дайындау және өндірістік кәсіпорындарды экологиялық сүйемелдеу салаларында жұмыс істеді. Кейін Қазақстан Республикасы Экология, геология және табиғи ресурстар министрлігінің Экологиялық бақылау басқармасында сарапшы болып қызмет атқарып, мемлекеттік экологиялық саясатты іске асыруға және экологиялық заңнаманың сақталуын қамтамасыз етуге үлес қосты. Қазіргі уақытта «ПетроҚазақстан Ойл Продактс» ЖШС Қоршаған ортаны қорғау бөлімінің бастығы қызметін атқарады. Оның жетекшілігімен өндірістің экологиялық қауіпсіздігін қамтамасыз ету, өндірістік экологиялық бақылауды ұйымдастыру, заманауи мониторинг жүйелерін енгізу және кәсіпорынның қоршаған ортаға әсерін төмендетуге бағытталған жобалар жүзеге асырылуда. Қоғамдық қызметте экологиялық мәдениетті дамыту, азаматтардың экологиялық жауапкершілігін арттыру және орнықты даму қағидаттарын ілгерілету бағытындағы бастамаларды қолдайды. Қазақстанның «БАЙТАҚ» жасылдар партиясынан депутаттыққа кандидат ретінде экологияны мемлекеттік саясаттың негізгі басымдықтарының бірі деп санайды.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '396b7d769833f8a148016c5f394d64eb312c226ffb447403926f7b7ee884ee6e', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 32;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Ордабеков Алтай Еркебекович — юрист, финансист, руководитель и общественный деятель. Имеет два высших образования по специальностям «Юриспруденция» и «Финансы». Более двадцати лет работает в сфере государственного управления, привлечения инвестиций и развития бизнеса. Профессиональную деятельность начал в юридической сфере, затем работал в банковском секторе, инвестиционных организациях и крупных компаниях. В разные годы занимал руководящие должности в Социально-предпринимательской корпорации «Шымкент», управляющей компании специальной экономической зоны «TURKISTAN», а также в компаниях, реализующих инвестиционные, энергетические и инфраструктурные проекты. Принимал непосредственное участие в привлечении инвестиций, сопровождении проектов государственно-частного партнёрства и реализации крупных социальных и производственных проектов, включая проекты в сфере возобновляемых источников энергии. С 2025 года возглавляет Шымкентский городской филиал Казахстанской партии зелёных «БАЙТАҚ». В своей работе уделяет особое внимание вопросам экологии, озеленения города, улучшения качества воздуха, рационального использования водных ресурсов, формирования экологической культуры и вовлечения молодёжи в общественную деятельность. С февраля 2026 года является директором ТОО «BBi Project». Основными принципами своей деятельности считает открытость, ответственность и достижение конкретных результатов, полагая, что доверие людей формируется не обещаниями, а честным ежедневным трудом и реальными делами.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, 'ac183bdae2153943abed57f069fc02c75ca7bda07fedb250d4b68baa4407c06d', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 36;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Ордабеков Айдос Бахытжанулы — юрист, экономист и руководитель в сфере строительства. Имеет два высших образования по специальностям «Правоведение» и «Экономика». Трудовую деятельность начал в 2009 году. Работал в системе здравоохранения, в Управлении строительства города Шымкента и аппарате акима города. В 2019–2022 годах возглавлял отдел инфраструктуры и благоустройства аппарата акима Аль-Фарабийского района, где курировал проекты по развитию городской инфраструктуры, строительству дорог, модернизации инженерных сетей и благоустройству территорий. В дальнейшем занимал руководящие должности в частном строительном секторе. В настоящее время является директором ТОО «Достар Құрылыс». Является членом Казахстанской партии зелёных «Байтақ». Поддерживает принципы охраны окружающей среды, сохранения биологического разнообразия, рационального использования природных ресурсов и устойчивого развития. В своей общественной деятельности уделяет внимание вопросам экологической ответственности и развития региональной инфраструктуры.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '02a9cb5656c02b2b7e3e9f8f1864282c837bb7281de04babd14fac4ac8fc2e04', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 35;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'kk', 'BIOGRAPHY', 'Өмірбаяны', 'Ордабеков Айдос Бахытжанұлы – заңгер, экономист және құрылыс саласының басқарушысы. Құқықтану және экономика мамандықтары бойынша жоғары білім алған. Еңбек жолын 2009 жылы бастаған. Әр жылдары денсаулық сақтау мекемесінде, Шымкент қаласының Құрылыс бөлімінде және қала әкімінің аппаратында қызмет атқарған. 2019–2022 жылдары Әл-Фараби ауданы әкімдігі аппаратының инфрақұрылым және абаттандыру бөлімін басқарып, жол құрылысы, инженерлік желілерді жаңарту және аумақтарды көркейту жобаларын үйлестірді. Кейін құрылыс саласындағы жеке секторда басшылық қызметтер атқарып, қазіргі таңда «Достар Құрылыс» ЖШС-нің директоры. Қазақстанның «Байтақ» жасылдар партиясының мүшесі. Табиғатты қорғау, биологиялық әртүрлілікті сақтау, табиғи ресурстарды ұтымды пайдалану және тұрақты даму қағидаттарын қолдайды. Қоғамдық қызметінде экологиялық жауапкершілік пен өңірлік инфрақұрылымды дамыту мәселелеріне басымдық береді.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '7a941441e3b0943fb72adbae48304d456b56a296ffdc7956e4777ac5f5a474d7', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 35;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Сабурова Нургуль Едигеевна — специалист в области гидрогеологии, инженерной геологии, геоэкологии и недропользования, магистр техники и технологий, эколог. Окончила Атырауский институт нефти и газа и Казахский национальный технический университет имени К.И. Сатпаева, получив квалификации инженера-геолога, гидрогеолога и эколога. Имеет степень магистра техники и технологий, в настоящее время завершает подготовку докторской диссертации в Satbayev University. Трудовую деятельность начала в ТОО «Атыраугидрогеология», пройдя путь от ведущего гидрогеолога до генерального директора. Под её руководством реализовано более 40 проектов по изучению и оценке запасов подземных вод Атырауской и Мангистауской областей, имеющих важное значение для обеспечения населения и промышленности качественными водными ресурсами. Является автором 14 изобретений и патентов в области гидрогеологии, водоснабжения и нефтедобычи. Результаты её научных исследований представлены на международных конференциях и конгрессах. Профессиональную деятельность посвящает вопросам рационального использования подземных вод, охраны окружающей среды и эффективного освоения природных ресурсов.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '40a82e0fdab50e162cb7cdacdfcdbd87ceddd461e3837633b29a11a9ddd1b0c1', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 38;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'kk', 'BIOGRAPHY', 'Өмірбаяны', 'Сабырова Нұргүл Едігеқызы – гидрогеология, инженерлік геология, геоэкология және жер қойнауын пайдалану салаларының маманы, техника және технология магистрі, эколог. Атырау мұнай және газ институтын және Қ.И. Сәтбаев атындағы Қазақ ұлттық техникалық университетін тәмамдап, геолог, гидрогеолог және эколог мамандықтарын игерді. Техника және технология магистрі дәрежесіне ие, қазіргі уақытта Satbayev University докторантурасында докторлық диссертациясын қорғауға дайындалуда. Еңбек жолын «Атыраугидрогеология» ЖШС-де бастап, жетекші гидрогеологтан бас директорға дейінгі кәсіби жолдан өтті. Оның жетекшілігімен Атырау және Маңғыстау облыстарындағы жерасты су қорларын зерттеу және бағалау бойынша 40-тан астам жоба жүзеге асырылып, халық пен өндіріс орындарын сапалы ауыз сумен қамтамасыз етуге үлес қосты. Гидрогеология, сумен жабдықтау және мұнай өндіру салаларында 14 өнертабыстың авторы әрі патент иеленушісі. Ғылыми зерттеулерінің нәтижелері халықаралық конференциялар мен конгрестерде таныстырылған. Кәсіби қызметінде жерасты су ресурстарын ұтымды пайдалану, қоршаған ортаны қорғау және табиғи ресурстарды тиімді игеру мәселелеріне басымдық береді.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, 'd940af2e8bdae81a6d4c76dc2b66948171e61e5acf675fb203e3222129753d96', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 38;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Садинов Самат Камысбаевич родился в 1990 году. Имеет высшее образование по специальности «Электроэнергетика». Общий трудовой стаж — 15 лет. Женат, воспитывает троих детей. Профессиональную деятельность начал в сфере образования. Работая педагогом, уделял внимание не только качественному обучению молодежи, но и формированию патриотизма, ответственности и трудолюбия. Также занимал должность начальника производственного участка, где получил опыт организации производственных процессов, управления коллективом и обеспечения безопасности труда. С марта 2023 года является депутатом Кентауского городского маслихата. В депутатской деятельности занимается решением социальных, коммунальных, экологических и инфраструктурных вопросов жителей города. В настоящее время — заместитель председателя партии зеленых Казахстана «Байтақ» по южным регионам. Занимается вопросами развития экологической политики, зеленой экономики, защиты окружающей среды и повышения экологической культуры населения.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, 'ad4b22d353062ac226bec15fffc735759205c78b5a48fc77517c826b1500cd9f', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 40;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Сагимбаев Таир Амантаевич — специалист в сфере здравоохранения, врач-стоматолог, руководитель в области медицинского менеджмента. Родился 20 июня 1983 года в городе Актау Мангистауской области. В 2005 году окончил Актюбинскую государственную медицинскую академию имени М. Оспанова по специальности «Стоматология», получив квалификацию врача-стоматолога. В 2024 году окончил AlmaU, где получил степень магистра делового администрирования (MBA). Профессиональную деятельность начал в 2006 году врачом-стоматологом. За двадцать лет работы прошёл путь от практикующего врача до руководителя регионального филиала государственной структуры и директора сети медицинских клиник. Обладает значительным опытом в сфере организации здравоохранения, стратегического и антикризисного управления, а также операционного менеджмента. Награждён нагрудным знаком «Отличник стоматологии». Состоит на воинском учёте в звании лейтенанта медицинской службы. Семейное положение: женат, воспитывает сына.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '38906b3c25bb71df3c369357fbe5a67ad1a6ed52ea7abbf3c2afc545dd2bf35e', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 39;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Серикбаев Айбол Усенович родился 3 апреля 1990 года в городе Кызылорда. Имеет высшее образование по специальностям «Техник-землеустроитель» и «Кадастр». Общий трудовой стаж — 16 лет 3 месяца. Женат, воспитывает четверых детей. Профессиональную деятельность начал в сфере землеустройства. Работал инженером-землеустроителем и специалистом в ТОО «Акпан-2003», Кызылординском областном филиале РГП «Научно-производственный центр земельного кадастра», а также в ТОО «КазНефтеГазКонсалтинг». В 2023-2024 годах занимался предпринимательской деятельностью. С 2024 года занимал должность заместителя директора ТОО «RS-ЖОЛ СЕРВИС». С 2025 года — исполнительный секретарь Кызылординского областного филиала партии зеленых «Байтақ» Казахстана. В рамках партийной деятельности участвует в развитии экологических инициатив, продвижении принципов устойчивого развития и защиты окружающей среды.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '1f65e9d5b2637ad0803b5e5e885c1939d12f9628acb68d237b3eb87ad1099e5b', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 42;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'kk', 'BIOGRAPHY', 'Өмірбаяны', 'Серікбаев Айбол Үсенұлы 1990 жылы 3 сәуірде Қызылорда қаласында туған. Жоғары білімді. «Техник-жерге орналастырушы» және «Кадастр» мамандықтары бойынша білім алған. Жалпы еңбек өтілі – 16 жыл 3 ай. Үйленген, төрт бала тәрбиелеп отыр. Еңбек жолын жерге орналастыру саласында бастап, «Ақпан-2003» ЖШС, «Жер кадастры ғылыми-өндірістік орталығы» РМК Қызылорда облыстық филиалы және «КазНефтеГазКонсалтинг» ЖШС мекемелерінде инженер-жерге орналастырушы және маман қызметтерін атқарған. 2023-2024 жылдары жеке кәсіпкерлікпен айналысты. 2024 жылдан бастап «RS-ЖОЛ СЕРВИС» ЖШС директорының орынбасары қызметін атқарды. 2025 жылдан бастап Қазақстанның «Байтақ» жасылдар партиясы Қызылорда облыстық филиалының Атқарушы хатшысы. Партиялық қызмет аясында өңірдегі экологиялық бастамаларды дамытуға, қоршаған ортаны қорғау және жасыл даму бағытындағы жұмыстарды ілгерілетуге үлес қосып келеді.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, 'cfad754f9648b65fdb02b0b130581c43cefbf8333080e97b47b79fc70574644b', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 42;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Сексенова Айман Казиевна — эколог, управленец и общественный деятель. Имеет более 20 лет профессионального опыта в сфере экологии, корпоративного управления и управления персоналом. Обладает международной квалификацией CHRP в области управления человеческими ресурсами, в настоящее время обучается по программе MBA. С 2020 года является директором ТОО Eco Madeniet, где реализует проекты в области охраны окружающей среды, экологического просвещения, устойчивого развития и корпоративной социальной ответственности. С 2023 года — депутат Актюбинского городского маслихата VIII созыва. В настоящее время возглавляет Актюбинский областной филиал Казахстанской партии зелёных «Байтақ». В своей профессиональной и общественной деятельности уделяет особое внимание вопросам экологической безопасности, сохранения природных ресурсов, совершенствования системы обращения с отходами и развития экологической культуры. Награждена государственными и ведомственными наградами за вклад в развитие экологии и общественную деятельность.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '78145a15a75ca6951b6afabf2a4c91ad8c24ffdfc5d7f6ef65faf5a0b1fbbe31', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 41;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Скаков Ануарбек родился 13 октября 1980 года. Имеет высшее юридическое образование, окончил Восточно-Казахстанский государственный университет имени С. Аманжолова по специальности «Юриспруденция». В 2008-2018 годах занимал различные должности в сфере электроэнергетики и энергоснабжения в Восточно-Казахстанской области и городе Астане. С 2018 года — председатель Палаты юридических консультантов города Астаны. В рамках общественной деятельности занимается защитой прав граждан, пострадавших вследствие ядерных испытаний на Семипалатинском испытательном ядерном полигоне. С 2012 года взаимодействует с государственными органами и общественными организациями по вопросам восстановления прав пострадавших граждан. В 2016 году инициировал судебные процессы по восстановлению права на меры социальной поддержки, предусмотренные законодательством РК. В 2023 году выступил инициатором обращения в Конституционный суд Республики Казахстан. Является членом Совета по барьерам Агентства по защите и развитию конкуренции РК (с 2020 года), членом Совета по защите прав предпринимателей и противодействию коррупции Палаты предпринимателей города Астаны (с 2023 года), членом Судебного жюри при Высшем судебном совете РК (с 2025 года). Награжден медалями «Әділет органдары жүйесін дамытуға қосқан үлесі үшін» и «Шапағат».', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '81c23959c34829b3bfca9bb4eeee31e80099fb0a6a9996d31fd240610e0b7844', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 43;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Туртаев Алмат родился 20 апреля 1969 года в семье офицера. Детство и юность провел в Алматы. Окончил Санкт-Петербургский государственный торгово-экономический институт. В 1987–1989 годах проходил службу в рядах Советской армии. Трудовую деятельность начал экономистом в коммерческой компании в Алматы. В 1996 году перешел на работу в Государственный банк развития Республики Казахстан (Государственный экспортно-импортный банк Казахстана), где прошел путь от специалиста до первого заместителя председателя правления. В 1997–1999 годах участвовал в работе Государственной комиссии по переносу столицы Казахстана в Астану. С 2001 года работал в АО «Казкоммерцбанк» в должностях управляющего директора, члена Правления, члена Коммерческой дирекции и руководителя Кредитного комитета. С 2005 года являлся партнером инвестиционных компаний, реализующих проекты в нефтяной, промышленной, продовольственной отраслях и сфере недвижимости. В 2005–2015 годах возглавлял компанию «Москоммерцинвест» в Москве. Имеет большой опыт в сфере инвестиций, финансов, нефтегазовой отрасли, строительства, гостиничного бизнеса и управления недвижимостью. Получил степень MBA в Российской академии народного хозяйства и государственной службы при Президенте Российской Федерации (РАНХиГС). В настоящее время является миноритарным акционером и руководителем компании в сфере консалтинга и управления недвижимостью. Женат, воспитывает троих детей.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '7aff97ebdac0b8fd4279bc2490530c7a9c0f41fd124aa92baa87179501055be7', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 44;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Туртаев Болат — инженер-нефтяник, специалист по разработке месторождений и руководитель производственного подразделения. Имеет 12-летний опыт работы в нефтегазовой отрасли Казахстана. Родился в Алматы. Окончил Республиканскую физико-математическую школу имени О. А. Жаутыкова. Продолжил образование в Великобритании, где окончил Ackworth School и Университет Портсмута по специальности «Нефтяная инженерия» (Petroleum Engineering). Опыт обучения и жизни за рубежом сформировал профессиональный подход к вопросам устойчивого развития и ответственного отношения к окружающей среде. После возвращения в Казахстан начал карьеру инженером в Инженерном центре АО «Разведка Добыча КазМунайГаз» в Актау. Работал в АО «КазНИПИмунайгаз» и ТОО «КМГ Инжиниринг», занимаясь проектированием разработки месторождений, гидродинамическим моделированием и подготовкой геолого-технических мероприятий. Прошел путь от специалиста до ведущего и старшего инженера. В настоящее время возглавляет отдел бурения и капитального ремонта скважин в частной нефтяной компании в Кызылординской области. Отвечает за производственные программы, бюджеты, взаимодействие с подрядными организациями и вопросы промышленной безопасности. Параллельно получает степень MBA в SBS Swiss Business School (Швейцария), сочетая инженерный опыт с управленческими знаниями. Член Казахстанской партии зелёных «Байтақ», кандидат в депутаты Курултая. Выступает за развитие зелёной энергетики, ответственное недропользование, решение вопросов водного дефицита и восстановление экологического баланса регионов. С юности занимается футболом и боксом. В профессиональной деятельности отличается аналитическим мышлением, вниманием к фактам и умением принимать решения в сложных производственных условиях.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '3ee061ce3349bb44287465d083ad3b4eae3ee501dab16f68848b5f22b5981e4c', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 45;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'kk', 'BIOGRAPHY', 'Өмірбаяны', 'Тұртаев Болат – мұнай-газ саласының инженері, кен орындарын игеру жөніндегі маман, өндірістік бөлім басшысы. Қазақстанның мұнай-газ саласында 12 жылдық тәжірибесі бар. Алматы қаласында туған. О. А. Жәутіков атындағы республикалық физика-математика мектебінде білім алған. Кейін Ұлыбританияда білімін жалғастырып, Ackworth School колледжін және Портсмут университетін «Мұнай инженериясы» (Petroleum Engineering) мамандығы бойынша тәмамдаған. Шетелде алған білімі мен тәжірибесі табиғи ресурстарға жауапкершілікпен қарау және экологиялық мәдениетті дамыту бағытындағы көзқарасының қалыптасуына ықпал етті. Қазақстанға оралғаннан кейін еңбек жолын «ҚазМұнайГаз» Барлау Өндіру» АҚ Инженерлік орталығында инженер қызметінен бастады. «ҚазНИПИмұнайгаз» АҚ және «ҚМГ Инжиниринг» ЖШС жобалау ұйымдарында кен орындарын игеру жобалары, гидродинамикалық модельдеу және геологиялық-техникалық іс-шараларды негіздеу бағытында жұмыс істеді. Мамандандырылған инженерден жетекші және аға инженер лауазымдарына дейін өсті. Қазіргі таңда Қызылорда облысындағы жеке мұнай компаниясында ұңғымаларды бұрғылау және күрделі жөндеу бөлімін басқарады. Өндірістік бағдарламалар, бюджеттер, мердігер ұйымдармен жұмыс және өнеркәсіптік қауіпсіздік мәселелеріне жауап береді. Сонымен қатар Швейцариядағы SBS Swiss Business School оқу орнында MBA бағдарламасы бойынша білім алуда. Инженерлік тәжірибе мен басқарушылық білімді ұштастыра отырып, өндірістік және экологиялық мәселелерге кешенді көзқарас қалыптастырған. Қазақстанның «Байтақ» жасылдар партиясының мүшесі, Құрылтай депутаттығына кандидат. Жасыл энергетиканы дамыту, табиғи ресурстарды жауапты пайдалану, су тапшылығы мәселелерін шешу және өңірлердің экологиялық тепе-теңдігін қалпына келтіру бағыттарын қолдайды. Жастайынан футбол және бокс спорт түрлерімен айналысады. Кәсіби қызметінде талдау жасау, нақты деректерге сүйеніп шешім қабылдау және күрделі жағдайларда тиімді жұмыс істеу қабілетімен ерекшеленеді.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '324eba7abe76f4294d8cd504207081de3f82f5f95ac635f62423d4ab9f710da5', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 45;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Файзулин Тамирлан Банияминович родился 20 августа 1990 года в Жетысуской области. Всю жизнь связан с Талдыкорганом, где живёт и работает. Имеет образование в сфере экономики и финансов. В 2010 году окончил Талдыкорганский гуманитарно-экономический колледж по специальности «Финансы», в 2014 году — Казахский экономический университет имени Т. Рыскулова, получив квалификацию экономиста. Профессиональную деятельность начал на государственной службе в акимате города Талдыкоргана, где занимался вопросами поддержки местного предпринимательства. Позже работал в производственной сфере, отвечая за организацию работы участка и управление производственными процессами. С 2019 года занимается предпринимательской деятельностью. Развивает проекты в Жетысуской области в сфере строительства социального жилья, рыбоводства и природного туризма, направленные на развитие региона и создание рабочих мест. Член партии зеленых Казахстана «Байтақ». Возглавляет предвыборный штаб партии по Жетысуской области, кандидат в депутаты Құрылтая. Выступает за устойчивое развитие региона, ответственное использование природных ресурсов и повышение качества жизни населения. Женат, воспитывает двоих детей. Владеет казахским, русским, татарским и английским языками.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, '02b743993ec7968b4331cf998be95de8691f70154e337dd61e1c5e6e75ae038a', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 46;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Ысматуллаев Руслан Серикович родился 1 января 1990 года в Жанакорганском районе Кызылординской области. Имеет высшее образование по специальностям «Техник-землеустроитель», «Кадастр» и «Юриспруденция». Общий трудовой стаж — 14 лет. Женат, воспитывает четверых детей. Профессиональную деятельность начал в сфере землеустройства. Работал инженером-землеустроителем в ТОО «АИС Қызылорда» и ТОО «КазНефтеГазКонсалтинг». В 2015-2019 годах занимал должность главного специалиста отдела земельных отношений города Кызылорды. С 2021 года — директор ТОО «RS-ЖОЛ СЕРВИС». С 2025 года — председатель Кызылординского областного филиала партии зеленых Казахстана «Байтақ». В рамках партийной деятельности занимается развитием экологических инициатив, вопросами защиты окружающей среды и продвижением принципов устойчивого развития региона.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, 'af2764bbcc6e63a43dc1d000f12acc3c74cbe24d5938be85d6e83c5b653b71c7', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 47;
INSERT INTO candidate_content (candidate_id, language, section_type, title, body_markdown, sort_order, review_status, reviewed_at, content_hash, source_revision, active)
SELECT c.candidate_id, 'ru', 'BIOGRAPHY', 'Биография', 'Амалбек Даркенулы — экономист, государственный управленец и общественный деятель. Доктор философии (PhD), имеет значительный опыт работы в сфере государственного управления, привлечения инвестиций, молодежной политики и культуры. В 2015 году окончил Казахский национальный университет имени аль-Фараби по специальности «Мировая экономика», получив степень бакалавра. В 2017 году завершил обучение в магистратуре, а в 2021 году — в докторантуре. Трудовую деятельность начал в АО «ПетроКазахстан» в должности инспектора по кадрам и документообороту. В дальнейшем работал в Министерстве национальной экономики Республики Казахстан, занимал должность заместителя директора Алматинского государственного колледжа сервиса и технологий, а также преподавал в Казахском национальном университете имени аль-Фараби. В 2018–2022 годах занимал должности директора АО «Turkistan Invest», руководителя Молодежного ресурсного центра Туркестанской области и руководителя аппарата акима города Кентау. В этот период участвовал в реализации проектов по привлечению инвестиций, развитию молодежной политики и совершенствованию государственного управления. В 2023–2025 годах работал заместителем директора РГКП «Национальный музей Республики Казахстан» Комитета культуры Министерства культуры и информации Республики Казахстан. В настоящее время является руководителем аппарата акима Толебийского района Туркестанской области.', 0, 'PUBLISHED', CURRENT_TIMESTAMP, 'ea1fd6473da6104821fa0bb9696c14a30d6519685f99179fc0af6211c04df15d', '2026-08-19', TRUE
FROM candidate c
WHERE c.party_id = 'baitaq' AND c.list_order = 37;