DROP VIEW v_Cars_low_cost
;

CREATE VIEW v_Cars_low_cost
AS
SELECT
    *
FROM
    Cars
WHERE
    cost < 30000
;