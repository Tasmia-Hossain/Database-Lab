--DROP DATABASE myDB;

CREATE DATABASE myDB;

CREATE TABLE student
(
	ID int PRIMARY KEY,
	Fname varchar(255),
	Lname varchar(255),
	CGPA float(10),
	City varchar(255)
);

INSERT INTO student VALUES (1, 'Paul', 'Anderson', 3.6 , 'Rome');
INSERT INTO student VALUES (2, 'Peter', 'Jackson', 3.3 , 'Venice');
INSERT INTO student VALUES (4, 'Tom', 'Russel', 3.7 , 'Madrid');
INSERT INTO student VALUES (3, 'Hugh', 'Albon', 3.1 , 'Brisbon');
INSERT INTO student VALUES (5, 'Betty', 'Nesord', 3.8 , 'London');
INSERT INTO student VALUES (6, 'Karim', 'Khan', 3.1 , 'London');
INSERT INTO student VALUES (7, 'Rahim', 'Khan', 3.2 , 'London');
INSERT INTO student VALUES (8, 'Rudy', 'Khan', 3.2 , 'Munich');

SELECT * FROM student;

SELECT * FROM student ORDER BY CGPA ASC;
SELECT * FROM student ORDER BY CGPA DESC;

SELECT TOP 2 * FROM student;

SELECT Fname,Lname,CGPA FROM student WHERE Lname LIKE '%son';
SELECT Fname,Lname,CGPA FROM student WHERE Lname LIKE '%so%';
SELECT Fname,Lname,CGPA FROM student WHERE Fname LIKE '___im';
SELECT Fname,Lname,CGPA FROM student WHERE Lname LIKE 'K__n';

SELECT * FROM student WHERE City IN ('Rome','Venice');

SELECT * FROM student WHERE CGPA BETWEEN 3.1 AND 3.5;



CREATE TABLE city
(
	city_id int PRIMARY KEY, 
	city_name varchar(255),
	country_name varchar(255)
);

INSERT INTO city VALUES (1,'Rome','Italy');
INSERT INTO city VALUES (4, 'Milan', 'Italy');
INSERT INTO city VALUES (2, 'Venice', 'Italy');
INSERT INTO city VALUES (3, 'Liverpool', 'UK');
INSERT INTO city VALUES (5, 'Manchester', 'UK');
INSERT INTO city VALUES (6, 'London', 'UK');
INSERT INTO city VALUES (7, 'Brisbon', 'UK');

SELECT * FROM student WHERE city IN (SELECT city_name FROM city WHERE country_name='Italy');