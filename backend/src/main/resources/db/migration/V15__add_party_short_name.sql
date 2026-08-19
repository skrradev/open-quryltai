-- Short party names for charts.
--
-- Five of the seven parties are already short enough to sit on an axis
-- ("Әділет", "Ауыл", "Respublica"); two are not. "Общенациональная социал-
-- демократическая партия" is 46 characters and was being clipped mid-word in
-- every chart that named it.
--
-- These are data, not UI strings: party names are localized from database
-- columns rather than the message bundle, and the abbreviation itself changes
-- with the language — the People's Party is НПК in Russian and ҚХП in Kazakh,
-- the same split its two logo files already encode.
--
-- Filled for every party rather than only the long two, so a consumer never has
-- to decide between a short name and a fallback.

-- One action per statement: jOOQ's DDL simulation, which the code generator runs
-- over these migrations, cannot parse a multi-action ALTER TABLE.
ALTER TABLE political_party ADD COLUMN short_name_ru VARCHAR(64);
ALTER TABLE political_party ADD COLUMN short_name_kk VARCHAR(64);

UPDATE political_party SET short_name_ru = name_ru, short_name_kk = name_kk;

UPDATE political_party SET short_name_ru = 'НПК',  short_name_kk = 'ҚХП'  WHERE party_id = 'npk';
UPDATE political_party SET short_name_ru = 'ОСДП', short_name_kk = 'ЖСДП' WHERE party_id = 'osdp';

ALTER TABLE political_party ALTER COLUMN short_name_ru SET NOT NULL;
ALTER TABLE political_party ALTER COLUMN short_name_kk SET NOT NULL;

COMMENT ON COLUMN political_party.short_name_ru IS
    'Axis-length name. Equals name_ru unless the full name does not fit a chart.';
