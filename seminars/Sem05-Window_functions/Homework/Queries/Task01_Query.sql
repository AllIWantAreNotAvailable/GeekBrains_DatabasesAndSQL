CREATE VIEW v_Cars_low_cost
AS
SELECT
    *
FROM
    Cars
WHERE
    cost < 25000
;