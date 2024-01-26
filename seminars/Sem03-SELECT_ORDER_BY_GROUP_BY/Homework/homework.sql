CREATE TABLE salespeople
(
snum INT NOT NULL PRIMARY KEY,
sname VARCHAR(30) NOT NULL,
city VARCHAR(30) NOT NULL,
comm VARCHAR(30) NOT NULL
);

CREATE TABLE customers
(
cnum INT NOT NULL PRIMARY KEY,
cname VARCHAR(30) NOT NULL,
city VARCHAR(30) NOT NULL,
rating INT NOT NULL,
snum INT NOT NULL
)
;

CREATE TABLE orders
(
onum INT NOT NULL PRIMARY KEY,
amt DECIMAL NOT NULL,
odate DATE NOT NULL,
cnum INT NOT NULL,
snum INT NOT NULL
)
;

INSERT INTO salespeople (snum, sname, city, comm)
VALUES
(1001, 'Peel', 'London', '.12'),
(1002, 'Serres', 'San Jose', '.13'),
(1004, 'Motika', 'London', '.11'),
(1007, 'Rifkin', 'Barcelona', '.15'),
(1003, 'Axelrod', 'New York', '.10')
;

SELECT * FROM salespeople
;

INSERT INTO customers (cnum, cname, city, rating, snum)
VALUES
(2001, 'Hofman', 'London', 100, 1001),
(2002, 'Giovanni', 'Rome', 200, 1003),
(2003, 'Liu', 'San Jose', 200, 1002),
(2004, 'Grass', 'Berlin', 300, 1002),
(2006, 'Clemens', 'London', 100, 1001),
(2008, 'Cisneros', 'San Jose', 300, 1007),
(2007, 'Pereira', 'Rome', 100, 1004)
;

SELECT * FROM customers
;

INSERT INTO orders (onum, amt, odate, cnum, snum)
VALUES
(3001, 18.69, '1990/03/10', 2008, 1007),
(3003, 767.19, '1990/03/10', 2001, 1001),
(3002, 1900.10, '1990/03/10', 2007, 1004),
(3005, 5160.45, '1990/03/10', 2003, 1002),
(3006, 1098.16, '1990/04/10', 2008, 1007),
(3009, 1713.23, '1990/04/10', 2002, 1003),
(3007, 75.75, '1990/04/10', 2004, 1002),
(3008, 4723.00, '1990/05/10', 2006, 1001),
(3010, 1309.95, '1990/06/10', 2004, 1002),
(3011, 9891.88, '1990/06/10', 2006, 1001)
;

SELECT * FROM orders
;

-- Tasks:

-- № 1
SELECT
	city,
    sname,
    snum,
    comm
FROM 
	salespeople
    customers
;

-- № 2
SELECT
	cname,
	rating
FROM 
	customers
WHERE
	city LIKE 'San Jose'
;

-- № 3
SELECT DISTINCT
	snum
FROM
	orders 
ORDER BY 
	snum
;

-- № 4
SELECT
	cname
FROM 
	customers
WHERE
	cname LIKE '%G%'
;

-- 5
SELECT * FROM orders
WHERE amt > 1000
;

-- 6
SELECT min(amt) AS 'минимальная сумма'
FROM orders
;

-- 7
SELECT cname FROM customers
WHERE rating>100 AND city != 'Rome'
;

-- -----------------------

CREATE TABLE workers
(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30) NOT NULL,
surname VARCHAR(50) NOT NULL,
speciality VARCHAR(30) NOT NULL,
seniority INT NOT NULL,
salary INT NOT NULL,
age INT NOT NULL
)
;

INSERT INTO workers (name, surname, speciality, seniority, salary, age)
VALUES
('Вася', 'Васькин', 'начальник', 40, 100000, 60),
('Петя', 'Петькин', 'начальник', 8, 70000, 30),
('Катя', 'Каткина', 'инженер', 2, 70000, 25),
('Саша', 'Сашкин', 'инженер', 12, 50000, 35),
('Иван', 'Иванов', 'рабочий', 40, 30000, 59),
('Петр', 'Петров', 'рабочий', 20, 25000, 40),
('Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'рабочий', 8, 19000, 28),
('Юра', 'Юркин', 'рабочий', 5, 15000, 25),
('Максим', 'Воронин', 'рабочий', 2, 11000, 22),
('Юра', 'Галкин', 'рабочий', 3, 12000, 24),
('Люся', 'Люськина', 'уборщик', 10, 10000, 49)
;

SELECT * FROM workers;

-- Tasks:
-- № 1 (по возрастанию)
SELECT * FROM workers
ORDER BY salary
;

-- (по убыванию)
SELECT * FROM workers
ORDER BY salary DESC
;

-- № 2
SELECT * FROM workers
ORDER BY salary
LIMIT 7, 5
;

-- или 
SELECT * FROM (SELECT * FROM workers ORDER BY salary DESC LIMIT 5) workers
ORDER BY salary
;

-- 3
SELECT 
	speciality
FROM
	workers
ORDER BY 
	speciality
HAVING 
	sum(salary) > 100000
;
