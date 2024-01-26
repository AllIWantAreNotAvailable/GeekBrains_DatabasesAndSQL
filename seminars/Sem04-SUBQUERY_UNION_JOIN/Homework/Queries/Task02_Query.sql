SELECT
    tmp.MARK AS Mark,
    COUNT(AUTO.REGNUM) AS Count
FROM
    (
     SELECT DISTINCT
         MARK
     FROM
         AUTO) AS tmp
            LEFT JOIN AUTO
                ON tmp.MARK != AUTO.MARK
GROUP BY tmp.MARK
;