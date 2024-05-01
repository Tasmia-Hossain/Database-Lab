DROP DATABASE myDB;
CREATE DATABASE myDB;

DROP TABLE student;
CREATE TABLE student
(
	id int primary key,
	fname varchar(255),
	lname varchar(255),
	cgpa float(10),
	city varchar(255)
);

INSERT INTO student VALUES (1, 'Paul', 'Anderson', 3.6 , 'Rome');
INSERT INTO student VALUES (2, 'Peter', 'Jackson', 3.3 , 'Venice');
INSERT INTO student VALUES (4, 'Tom', 'Russel', 3.7 , 'Madrid');
INSERT INTO student VALUES (3, 'Hugh', 'Albon', 3.1 , 'Brisbon');
INSERT INTO student VALUES (5, 'Betty', 'Nesord', 3.8 , 'London');
INSERT INTO student VALUES (6, 'Karim', 'Khan', 3.1 , 'London');
INSERT INTO student VALUES (7, 'Rahim', 'Khan', 3.2 , 'London');
INSERT INTO student VALUES (8, 'Rudy', 'Kahn', 3.2 , 'Munich');

SELECT * FROM student;
SELECT cgpa FROM student;

SELECT COUNT(*) FROM student;

SELECT AVG(cgpa) FROM student;
SELECT MAX(cgpa) FROM student;
SELECT MIN(cgpa) FROM student;
SELECT SUM(cgpa) FROM student;

SELECT AVG(cgpa) AS AvgCGPA FROM student;
SELECT MAX(cgpa) AS MaxCGPA FROM student;
SELECT MIN(cgpa) AS MinCGPA FROM student;
SELECT SUM(cgpa) AS CGPA_SUM FROM student;

SELECT TOP 1 cgpa FROM student ORDER BY id ASC;
SELECT TOP 1 cgpa FROM student ORDER BY id DESC;


DROP TABLE order_table;
CREATE TABLE order_table
(
	order_id int primary key, 
	customer_id int,
	customer_name varchar(255),
	product_id int,
	cost float(10),
	city varchar(255)
);

INSERT INTO order_table VALUES(1, 1, 'Anderson', 2 , 10, 'Rome');
INSERT INTO order_table VALUES(2, 1, 'Anderson', 3 , 13, 'Rome');
INSERT INTO order_table VALUES(3, 1, 'Anderson', 4 , 15, 'Rome');
INSERT INTO order_table VALUES(4, 2, 'Russel', 2 , 10, 'Milan');
INSERT INTO order_table VALUES(5, 2, 'Russel', 3 , 13, 'Milan');
INSERT INTO order_table VALUES(6, 3, 'Sainz', 2 , 10, 'London');

SELECT customer_name, SUM(cost) AS SumOfCost FROM order_table GROUP BY customer_name;
SELECT customer_name, AVG(cost) AS AvgCost FROM order_table GROUP BY customer_name;
SELECT customer_name, MAX(cost) AS MaxCost FROM order_table GROUP BY customer_name;

SELECT customer_name, AVG(cost) AS AvgCost FROM order_table GROUP BY customer_name HAVING AVG(cost)>=11;
SELECT customer_name, AVG(cost) AS AvgCost FROM order_table WHERE city='Rome' OR city='Milan' GROUP BY customer_name HAVING AVG(cost)>=11;
SELECT customer_name, AVG(cost) AS AvgCost FROM order_table WHERE citY IN ('Rome') GROUP BY customer_name HAVING AVG(cost)>=11;


DROP TABLE city;
CREATE TABLE city
(
	city_id int primary key, 
	city_name varchar(255),
	country_name varchar(255)
);

INSERT INTO city VALUES(1, 'Rome', 'Italy');
INSERT INTO city VALUES(4, 'Milan', 'Italy');
INSERT INTO city VALUES(2, 'Venice', 'Italy');
INSERT INTO city VALUES(3, 'Liverpool', 'UK');
INSERT INTO city VALUES(5, 'Manchester', 'UK');
INSERT INTO city VALUES(6, 'London', 'UK');
INSERT INTO city VALUES(7, 'Brisbon', 'UK');

SELECT customer_name, AVG(cost) as AvgCost FROM order_table WHERE city IN (SELECT city_name FROM city WHERE country_name='Italy') GROUP BY customer_name HAVING AVG(cost)>=11;

