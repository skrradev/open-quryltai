CREATE TABLE political_party (
    party_id VARCHAR(32) PRIMARY KEY,
    name_kk VARCHAR(255) NOT NULL,
    name_ru VARCHAR(255) NOT NULL,
    source_name VARCHAR(255) NOT NULL,
    display_order SMALLINT NOT NULL UNIQUE
);

INSERT INTO political_party (party_id, name_kk, name_ru, source_name, display_order)
VALUES
    ('adilet', 'Әділет', 'Әділет', 'Әділет', 1),
    ('respublica', 'Respublica', 'Respublica', 'Respublica', 2),
    ('npk', 'Қазақстан Халық партиясы', 'Народная партия Казахстана', 'НПК', 3),
    ('auyl', 'Ауыл', 'Ауыл', 'Ауыл', 4),
    ('ak_zhol', 'Ақ жол', 'Ак жол', 'Ақ жол', 5),
    ('baitaq', 'Байтақ', 'Байтақ', 'Байтақ', 6),
    ('osdp', 'Жалпыұлттық социал-демократиялық партия',
     'Общенациональная социал-демократическая партия', 'ОСДП', 7);
