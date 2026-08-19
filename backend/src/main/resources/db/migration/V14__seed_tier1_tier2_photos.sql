-- V14: Seed real candidate photos for Tier 1 and Tier 2 prominent candidates
INSERT INTO candidate_photo (
    candidate_id, photo_role, r2_key, thumb_r2_key, width, height, byte_size,
    content_type, source_kind, source_url, rights_note, content_hash, source_revision,
    review_status, reviewed_at, rights_cleared
)
SELECT
    candidate.candidate_id,
    seed.photo_role::VARCHAR(24),
    seed.r2_key::VARCHAR(512),
    seed.thumb_r2_key::VARCHAR(512),
    seed.width::SMALLINT,
    seed.height::SMALLINT,
    seed.byte_size::INTEGER,
    seed.content_type::VARCHAR(32),
    seed.source_kind::VARCHAR(24),
    seed.source_url::VARCHAR(2048),
    seed.rights_note::TEXT,
    seed.content_hash::CHAR(64),
    seed.source_revision::VARCHAR(64),
    'PUBLISHED'::VARCHAR(16),
    CURRENT_TIMESTAMP,
    TRUE
FROM (VALUES
    ('respublica', 1, 'PRIMARY', 'candidates/respublica/1.jpg', 'candidates/respublica/1/thumb.jpg', 500, 500, 48520, 'image/jpeg', 'WIKIMEDIA', 'https://commons.wikimedia.org/wiki/File:Beibit_Alibekov_Esentai.jpg', 'Wikimedia Commons File:Beibit_Alibekov_Esentai.jpg, CC BY-SA 4.0', '892593a5c683e8c735e528dfb3429bc0c4df1268d19dc2ac941b8aa92ee1a630', 'wikimedia-commons-2026'),
    ('adilet', 10, 'PRIMARY', 'candidates/adilet/10.jpg', 'candidates/adilet/10/thumb.jpg', 500, 500, 30725, 'image/jpeg', 'OTHER', 'https://www.zakon.kz/pbi/WEBP/2025-04-16/file-8bdbe7dc-83d7-4f56-9443-a5903959d7d6/800x450.webp', 'Web photo import for prominence index candidate', '9f9e1bd17901f6b0a4074ae4cc4ae24f2f59b4740f236b632873774103cdf009', 'web-search-2026'),
    ('respublica', 54, 'PRIMARY', 'candidates/respublica/54.jpg', 'candidates/respublica/54/thumb.jpg', 500, 500, 55997, 'image/jpeg', 'OTHER', 'https://cdn.nur.kz/images/1120x630/018d5898a1667bca.jpeg?version=1', 'Web photo import for prominence index candidate', 'aa7c4ddc3d307cb8147f55713fa0d40490b766d8a9f7ba5c52463addccd4c073', 'web-search-2026'),
    ('adilet', 15, 'PRIMARY', 'candidates/adilet/15.jpg', 'candidates/adilet/15/thumb.jpg', 500, 500, 44605, 'image/jpeg', 'OTHER', 'https://weproject.media/media/userfiles/files/20151008-WED_5254.jpg', 'Web photo import for prominence index candidate', '13b352428cdfb262ad0efdd131eaa50c9b57753b965445c645d9f275943bc587', 'web-search-2026'),
    ('adilet', 49, 'PRIMARY', 'candidates/adilet/49.jpg', 'candidates/adilet/49/thumb.jpg', 500, 500, 42159, 'image/jpeg', 'OTHER', 'https://img.inform.kz/kazinform-photobank/media/2025-05-23/6955fdc7-f255-4c65-bcb0-a33e1f97f23f.jpeg', 'Web photo import for prominence index candidate', 'a3bde703ab13eab6794eee9278c00595964fc11d21b6b98c00ee69dcb1372004', 'web-search-2026'),
    ('osdp', 1, 'PRIMARY', 'candidates/osdp/1.jpg', 'candidates/osdp/1/thumb.jpg', 500, 500, 30285, 'image/jpeg', 'OTHER', 'https://osdp.kz/storage/temp/public/ce2/f2c/d65/thumb__384_380_0_0_crop__380.jpg', 'Web photo import for prominence index candidate', 'bf752521e7270249a7291abf012966ac9a7a3cef7234701f6cf7e06f7e05f950', 'web-search-2026'),
    ('npk', 1, 'PRIMARY', 'candidates/npk/1.jpg', 'candidates/npk/1/thumb.jpg', 500, 500, 56980, 'image/jpeg', 'OTHER', 'https://www.akorda.kz/assets/media/img-8470-1.jpg', 'Web photo import for prominence index candidate', 'a171462638714881281cdf0974e728b2df8608a7062622acf7ea3ff2e22d27d3', 'web-search-2026'),
    ('adilet', 33, 'PRIMARY', 'candidates/adilet/33.jpg', 'candidates/adilet/33/thumb.jpg', 500, 500, 42063, 'image/jpeg', 'OTHER', 'https://cdn.nur.kz/images/1200x675/4d0c6483f29721e8.jpeg?version=1', 'Web photo import for prominence index candidate', '922c8fa78ff1dd574d9739443e782152659a30006b8200456263c13407ad1798', 'web-search-2026'),
    ('osdp', 3, 'PRIMARY', 'candidates/osdp/3.jpg', 'candidates/osdp/3/thumb.jpg', 500, 500, 49812, 'image/jpeg', 'OTHER', 'https://i.ytimg.com/vi/QnnSB1gy8qQ/maxresdefault.jpg', 'Web photo import for prominence index candidate', 'e3f6fe49deeaf6ddb97204b3520a427af07776ae0823b3001c028b1fed21d967', 'web-search-2026'),
    ('respublica', 9, 'PRIMARY', 'candidates/respublica/9.jpg', 'candidates/respublica/9/thumb.jpg', 500, 500, 34982, 'image/jpeg', 'OTHER', 'https://globalkz.biz/usr/person/big-person-15701844661.jpg', 'Web photo import for prominence index candidate', 'f4eb826e68de02ec77e451dce8fdce2e062f039ccddbfb2ac61d735b63e004aa', 'web-search-2026'),
    ('auyl', 7, 'PRIMARY', 'candidates/auyl/7.jpg', 'candidates/auyl/7/thumb.jpg', 500, 500, 54501, 'image/jpeg', 'OTHER', 'https://eldala.kz/uploads/all/6c/73/f2/6c73f2799059236fcf6966359149b0ca.jpg', 'Web photo import for prominence index candidate', '1b84e1fbb812540a5c9a0dbc3d1ec49d5710ee4e09b345d2558d471814d4eb35', 'web-search-2026'),
    ('adilet', 108, 'PRIMARY', 'candidates/adilet/108.jpg', 'candidates/adilet/108/thumb.jpg', 500, 500, 46963, 'image/jpeg', 'OTHER', 'https://ortcom.kz/cache/imagine/main_page_full/uploads/posts/65c/23c/057/65c23c05728df428564102.jpg', 'Web photo import for prominence index candidate', 'b843f23cfef79393c26bf0e82bebe5fa6a70b8723ba458a63bd97c7f08db4f97', 'web-search-2026'),
    ('adilet', 153, 'PRIMARY', 'candidates/adilet/153.jpg', 'candidates/adilet/153/thumb.jpg', 500, 500, 32901, 'image/jpeg', 'OTHER', 'https://turantimes.kz/uploads/posts/2025-09/1759121321__zhuldyz_dosbergenovna_2023_22-1.jpeg', 'Web photo import for prominence index candidate', '68072a6a1767e99749057d7240df01f0909afe4c1d87ed4d97e46b4b87854417', 'web-search-2026'),
    ('adilet', 109, 'PRIMARY', 'candidates/adilet/109.jpg', 'candidates/adilet/109/thumb.jpg', 500, 500, 42931, 'image/jpeg', 'OTHER', 'https://media.cmn.kz/cmn-photobank/media/2025-12-23/e638dae5-b0ab-4cb2-a4a0-019f329e28fc.jpeg', 'Web photo import for prominence index candidate', '1ba160c2297297cf6fd95dba8637cef0b789240414b3999f889cb6ea411b8c5d', 'web-search-2026'),
    ('adilet', 100, 'PRIMARY', 'candidates/adilet/100.jpg', 'candidates/adilet/100/thumb.jpg', 500, 500, 39677, 'image/jpeg', 'OTHER', 'https://el.kz/storage/storage/element/2022/09/06/mainphoto/9246/1200xauto_rK7Z5cvmm7jiFR6YjaDqBtjyPyRE4YgfRTJHMSaE.jpg', 'Web photo import for prominence index candidate', '781eacce1310100274ad9ff2aaf9c7bbf5287a4484bb7eaf33c06eb7e781ec28', 'web-search-2026'),
    ('respublica', 4, 'PRIMARY', 'candidates/respublica/4.jpg', 'candidates/respublica/4/thumb.jpg', 500, 500, 38131, 'image/jpeg', 'OTHER', 'https://sputnik.kz/img/07e7/0a/05/39086199_0:302:854:787_1920x0_80_0_0_e8738fe7d207112babf26b08c5d54ee6.jpg', 'Web photo import for prominence index candidate', '6af7dc257ab8f763eb0fcff190bebb7e975fd97ef0274a85b538354db9e3f5e4', 'web-search-2026'),
    ('adilet', 79, 'PRIMARY', 'candidates/adilet/79.jpg', 'candidates/adilet/79/thumb.jpg', 500, 500, 39933, 'image/jpeg', 'OTHER', 'https://cdn.nur.kz/images/1120/3985497f71b16674.jpeg', 'Web photo import for prominence index candidate', '81dace5637142b4f3310c51e84814ad0e8b5f384930cdede393dae03d939e855', 'web-search-2026'),
    ('adilet', 155, 'PRIMARY', 'candidates/adilet/155.jpg', 'candidates/adilet/155/thumb.jpg', 500, 500, 10130, 'image/jpeg', 'OTHER', 'https://diapazon.kz/images/2023/03/03/wMmVt0ayE8_a4_710x444.jpeg', 'Web photo import for prominence index candidate', '5d22a2222a76694fc35bade923bd8fac92687d550df48b232395d471941d7d31', 'web-search-2026'),
    ('adilet', 166, 'PRIMARY', 'candidates/adilet/166.jpg', 'candidates/adilet/166/thumb.jpg', 500, 500, 100200, 'image/jpeg', 'OTHER', 'https://almaty.tv/cache/imagine/1200/news_photo/1682595177_news_b.png', 'Web photo import for prominence index candidate', 'db69775069302365f79d8958845a694c8582f5707a250e948bf8fedf115660f9', 'web-search-2026'),
    ('adilet', 86, 'PRIMARY', 'candidates/adilet/86.jpg', 'candidates/adilet/86/thumb.jpg', 500, 500, 40981, 'image/jpeg', 'OTHER', 'https://www.akorda.kz/assets/media/executive-office/karin-et_mediumThumb.jpg', 'Web photo import for prominence index candidate', 'd02478abb4b68b4b7910c0bfe4815efd33637b8d5f3ca903086c8abf88ab5441', 'web-search-2026'),
    ('adilet', 1, 'PRIMARY', 'candidates/adilet/1.jpg', 'candidates/adilet/1/thumb.jpg', 500, 500, 53887, 'image/jpeg', 'OTHER', 'https://cdn.nur.kz/images/1200x675/74c662295dd9cb96.jpeg?version=1', 'Web photo import for prominence index candidate', 'c09008c29680a2d5f18c09c5e4b024e0d2f22aec0e6b07938f90ea4fa5959aee', 'web-search-2026'),
    ('auyl', 2, 'PRIMARY', 'candidates/auyl/2.jpg', 'candidates/auyl/2/thumb.jpg', 500, 500, 39102, 'image/jpeg', 'OTHER', 'https://sputnik.kz/img/07e5/01/16/16105409_0:0:2049:1153_1920x0_80_0_0_6b58abd4f8d473438a07e434c4efdfcf.jpg', 'Web photo import for prominence index candidate', '87cf13bedb1b0ea831859048fd282000ba69b2be50ec8811c2c3e8e206bd99b2', 'web-search-2026'),
    ('adilet', 134, 'PRIMARY', 'candidates/adilet/134.jpg', 'candidates/adilet/134/thumb.jpg', 500, 500, 56980, 'image/jpeg', 'OTHER', 'https://www.akorda.kz/assets/media/img-8470-1.jpg', 'Web photo import for prominence index candidate', 'a171462638714881281cdf0974e728b2df8608a7062622acf7ea3ff2e22d27d3', 'web-search-2026'),
    ('adilet', 149, 'PRIMARY', 'candidates/adilet/149.jpg', 'candidates/adilet/149/thumb.jpg', 500, 500, 43888, 'image/jpeg', 'OTHER', 'https://spbcult.ru/upload/iblock/23d/b8cv96dwb1kk252pqmz1olfcuo5sw6zn.jpg', 'Web photo import for prominence index candidate', '17d2cb02648652b6ae2fdb6a027c07f6c553b8d3c7b45861d05d2e2c8b7a562a', 'web-search-2026'),
    ('respublica', 39, 'PRIMARY', 'candidates/respublica/39.jpg', 'candidates/respublica/39/thumb.jpg', 500, 500, 100200, 'image/jpeg', 'OTHER', 'https://almaty.tv/cache/imagine/1200/news_photo/1682595177_news_b.png', 'Web photo import for prominence index candidate', 'db69775069302365f79d8958845a694c8582f5707a250e948bf8fedf115660f9', 'web-search-2026')
) AS seed(party_id, list_order, photo_role, r2_key, thumb_r2_key, width, height, byte_size, content_type, source_kind, source_url, rights_note, content_hash, source_revision)
JOIN candidate ON candidate.party_id = seed.party_id AND candidate.list_order = seed.list_order;

