CREATE VIEW v_Cars_skoda_and_audi
AS
SELECT
    *
FROM
    Cars
WHERE
    name IN ('Skoda', 'Audi')
;