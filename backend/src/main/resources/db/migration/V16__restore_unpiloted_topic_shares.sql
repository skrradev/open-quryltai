-- Restore the bar on shares for topic codes that never passed the pilot.
--
-- T15 (domestic and gender-based violence) and T16 (animal protection) entered
-- the codebook AFTER the two-annotator pilot. No inter-annotator agreement was
-- ever measured for them, and one annotator cannot produce any: Krippendorff's
-- alpha needs two coders. Their counts come from an exhaustive census and are
-- exact; their proportions are not publishable.
--
-- V9 briefly marked them pilot_verified = TRUE with shares filled in. That is a
-- claim about where the data came from, not a display preference, and it was not
-- true. This migration puts the rows back.
--
-- V9 is corrected here rather than edited in place: it has already been applied,
-- and rewriting an applied migration changes its checksum and breaks Flyway
-- validation — the state V4 and V5 are still stuck in.
--
-- The share column is NULL rather than 0. Zero would read as "the party never
-- mentions it", which is a different and false claim: adilet has three such
-- units, respublica two.

UPDATE party_program_topic
SET pilot_verified = FALSE,
    share = NULL
WHERE topic_code IN ('T15', 'T16');

-- The CHECK constraint in V8 ties the two columns together, so this either
-- applies completely or not at all. Guard against a silent partial anyway.
-- Hidden from jOOQ's code generator, which simulates the schema in H2 and cannot
-- parse a PL/pgSQL block; the guard is real in Postgres.
/* [jooq ignore start] */
DO $$
DECLARE
    leaked INTEGER;
BEGIN
    SELECT count(*) INTO leaked
    FROM party_program_topic
    WHERE topic_code IN ('T15', 'T16')
      AND (pilot_verified OR share IS NOT NULL);

    IF leaked > 0 THEN
        RAISE EXCEPTION 'Unpiloted topic codes still carry a share: % rows', leaked;
    END IF;
END $$;
/* [jooq ignore stop] */
