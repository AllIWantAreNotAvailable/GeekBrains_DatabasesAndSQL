# Задача №1

> Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными
>

```SQL
SELECT
    *
FROM
    smartphones
;
```

|id |ProductName|Manufacturer|ProductCount|Price   |
|---|-----------|------------|------------|--------|
|1  |iPhone X   |Apple       |3           |76000.00|
|2  |iPhone 8   |Apple       |2           |51000.00|
|3  |Galaxy S9  |Samsung     |2           |56000.00|
|4  |Galaxy S9  |Samsung     |1           |41000.00|
|5  |P 20 Pro   |Huawei      |5           |36000.00|


# Задача №2

> Выведите название, производителя и цену для товаров, количество которых превышает 2
>

```SQL
SELECT
	ProductName,
    Manufacturer,
    Price
FROM
	smartphones
WHERE
	ProductCount > 2
;
```

|ProductName|Manufacturer|Price   |
|-----------|------------|--------|
|iPhone X   |Apple       |76000.00|
|P 20 Pro   |Huawei      |36000.00|


# Задача №3

> Выведите весь ассортимент товаров марки “Samsung”
>

```SQL
SELECT
	ProductName,
    Manufacturer,
    Price
FROM
	smartphones
WHERE
	Manufacturer = 'Samsung'
;
```

|ProductName|Manufacturer|Price   |
|-----------|------------|--------|
|Galaxy S9  |Samsung     |56000.00|
|Galaxy S9  |Samsung     |41000.00|
