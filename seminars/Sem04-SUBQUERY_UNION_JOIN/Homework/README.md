# Урок 4. SQL – работа с несколькими таблицами


> [Табличка](https://drive.google.com/file/d/1PQn576YVakvlWrIgIjSP9YEf5id4cqYs/view?usp=sharing)
> 

## Задание 1.


> Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA
> 


### Решение
```SQL
SELECT
    COLOR AS Color,
    COUNT(REGNUM) AS Count
FROM
    AUTO
WHERE
    MARK IN ('BMW', 'LADA')
GROUP BY COLOR
;
```


**Output:**
|Mark|Color                        |Count |
|----|-----------------------------|------|
|BMW |ЗЕЛЕНЫЙ                      |1     |
|BMW |СИНИЙ                        |2     |
|LADA|ЗЕЛЕНЫЙ                      |1     |
|LADA|КРАСНЫЙ                      |1     |
|LADA|СИНИЙ                        |1     |



## Задание 2.


> Вывести на экран марку авто и количество AUTO не этой марки
>  


### Решение
```SQL
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
```


**Output:**
|Color  |Count|
|-------|-----|
|ЗЕЛЕНЫЙ|2    |
|КРАСНЫЙ|1    |
|СИНИЙ  |3    |



## Задание №3.


> Даны 2 таблицы, созданные следующим образом:
> ```SQL
> CREATE TABLE test_a (id INTEGER, data VARCHAR(1));
> INSERT INTO test_a(id, data) VALUES (
>                                      (10, 'A'),
>                                      (20, 'A'),
>                                      (30, 'F'),
>                                      (40, 'D'),
>                                      (50, 'C')
>                                     )
> ;
> 
> CREATE TABLE test_b (id INTEGER);
> 
> insert into test_b(id) values(
>                               (10),
>                               (30),
>                               (50)
>                              )
> ;
> ```
> Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b,
> НЕ используя ключевого слова NOT.
>  


### Решение
```SQL
SELECT
    test_a.*
FROM
    test_a
    LEFT JOIN test_b ON test_a.id = test_b.id
WHERE
    test_b.id IS NULL
;
```


**Output:**
|id |data|
|---|----|
|20 |A   |
|40 |D   |
