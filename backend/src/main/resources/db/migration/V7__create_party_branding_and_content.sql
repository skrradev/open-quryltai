ALTER TABLE political_party
    ADD COLUMN brand_color CHAR(7) CHECK (brand_color ~ '^#[0-9A-F]{6}$');

UPDATE political_party SET brand_color = '#290081' WHERE party_id = 'adilet';
UPDATE political_party SET brand_color = '#124B8B' WHERE party_id = 'ak_zhol';
UPDATE political_party SET brand_color = '#085C4B' WHERE party_id = 'auyl';
UPDATE political_party SET brand_color = '#1F7036' WHERE party_id = 'baitaq';
UPDATE political_party SET brand_color = '#DC0F2D' WHERE party_id = 'npk';
UPDATE political_party SET brand_color = '#0040B0' WHERE party_id = 'osdp';
UPDATE political_party SET brand_color = '#4A78EC' WHERE party_id = 'respublica';

ALTER TABLE political_party ALTER COLUMN brand_color SET NOT NULL;
