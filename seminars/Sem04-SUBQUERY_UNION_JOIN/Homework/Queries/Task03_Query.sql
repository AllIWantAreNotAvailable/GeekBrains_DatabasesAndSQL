SELECT
    test_a.*
FROM
    test_a
    LEFT JOIN test_b ON test_a.id = test_b.id
WHERE
    test_b.id IS NULL
;