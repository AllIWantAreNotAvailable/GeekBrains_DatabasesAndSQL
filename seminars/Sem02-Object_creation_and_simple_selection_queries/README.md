# Задание №1

> Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
>


## Этап 1 - Создание новой БД

```SQL
CREATE DATABASE sem02_homework;
```


## Этап 2 - Создаем таблицу в БД

```SQL
USE sem02_homework;

CREATE TABLE Sales
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    bucket VARCHAR(50)
)
;
```


## Этап 3 - Заполнение данными

```SQL
USE sem02_homework
;

-- Добавляем один кортеж, так как id у нас AUTO_INCREMENT, то исключаем этот сталбец из кортежа
INSERT INTO Sales (`order_date`, `bucket`)
VALUES ('2021-01-01', '101 to 300')
;

-- Добавляем оставшиеся записи
INSERT INTO Sales (order_date, bucket)
VALUES
	('2021-01-02', '101 to 300'),
	('2021-01-03', 'less then equal to 100'),
	('2021-01-04', '101 to 300'),
	('2021-01-05', 'greater than 300')
;
```


## Резульат

```SQL
SELECT 
	*
FROM
	Sales
;
```

|id |order_date|bucket                |
|---|----------|----------------------|
|1  |2021-01-01|101 to 300            |
|2  |2021-01-02|101 to 300            |
|3  |2021-01-03|less then equal to 100|
|4  |2021-01-04|101 to 300            |
|5  |2021-01-05|greater than 300      |


# Задание №2

> Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
>

## Резульат

> Не до конца ясна суть задачи и разьяснения данные по задаче на семинаре... значение формулировки "Сгруппируйте" в данном контексте остается загадкой... за группировку отвечает оператор GROUP BY и адекватной (информативной) группировки с предоставленными данными не добиться.
>

```SQL
USE sem02_homework
;

SELECT 
	id,
    order_date,
    bucket,
    CASE
		WHEN bucket LIKE '%less%' THEN 'Маленький заказ'
        WHEN bucket LIKE '%greater%' THEN 'Большой заказ'
        ELSE 'Средний заказ'
    END AS 'order_type'
FROM 
	Sales
;
```

|id |order_date|bucket                |order_type    |
|---|----------|----------------------|---------------|
|1  |2021-01-01|101 to 300            |Средний заказ  |
|2  |2021-01-02|101 to 300            |Средний заказ  |
|3  |2021-01-03|less then equal to 100|Маленький заказ|
|4  |2021-01-04|101 to 300            |Средний заказ  |
|5  |2021-01-05|greater than 300      |Большой заказ  |


# Задание №3

> Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
>

## Этап 1

> Создание таблицы
>

```SQL
USE sem02_homework
;

CREATE TABLE Orders
(
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(3),
    amount DECIMAL(10, 2),
    order_status VARCHAR(9)
)
;
```


## Этап 2

> Заполнение таблицы данными
>

```SQL
USE sem02_homework
;

INSERT INTO Orders (employee_id, amount, order_status)
VALUES
	('e03', 15.00, 'OPEN'),
	('e01', 25.00, 'OPEN'),
	('e05', 100.00, 'CLOSED'),
	('e02', 22.18, 'OPEN'),
	('e04', 9.50, 'CANCELLED'),
	('e04', 99.99, 'OPEN')
;
```

### Результат

|order_id|employee_id|amount|order_status|
|--------|-----------|------|------------|
|1       |e03        |15.00 |OPEN        |
|2       |e01        |25.00 |OPEN        |
|3       |e05        |100.00|CLOSED      |
|4       |e02        |22.18 |OPEN        |
|5       |e04        |9.50  |CANCELLED   |
|6       |e04        |99.99 |OPEN        |


## Этап 3

> Полный статус заказа
>

```SQL
USE sem02_homework
;

SELECT
	order_id,
    order_status,
    CASE
		WHEN order_status = 'OPEN' THEN 'Order is in open state'
        WHEN order_status = 'CLOSED' THEN 'Order is closed'
        ELSE 'Order is cancelled'
    END AS 'order_summary'
FROM
	Orders
;
```

### Результат

|order_id|order_status|order_summary         |
|--------|------------|----------------------|
|1       |OPEN        |Order is in open state|
|2       |OPEN        |Order is in open state|
|3       |CLOSED      |Order is closed       |
|4       |OPEN        |Order is in open state|
|5       |CANCELLED   |Order is cancelled    |
|6       |OPEN        |Order is in open state|


# Задание №4

>Чем NULL отличается от 0
>

Отличие NULL от любого другого типа заключается в том, что NULL представляет собой отсутсвие какого-либо значения.