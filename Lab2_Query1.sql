--DROP DATABASE myDB;

CREATE DATABASE myDB;



DROP TABLE customers;

CREATE TABLE customers
(
	customer_id int, 
	customer_name varchar(255), 
	customer_age int
);
SELECT * FROM customers;

INSERT INTO customers VALUES(1,'Bob',56);
INSERT INTO customers (customer_id, customer_name) VALUES(2,'Rob');
INSERT INTO customers VALUES(3,'Bob',53);



DROP TABLE customers;

CREATE TABLE customers
(
	customer_id int, 
	customer_name varchar(255) NOT NULL, 
	customer_age int NOT NULL, 
	customer_city varchar(255) NULL
);
SELECT * FROM customers;

INSERT INTO customers VALUES(1,'Bob',56,null);
--INSERT INTO customers (customer_id, customer_name) VALUES(2,'Rob');
INSERT INTO customers (customer_id, customer_name, customer_age) VALUES(2,'Rob',51);
INSERT INTO customers VALUES(3,'Bob',53,'Paris');



DROP TABLE customers;

CREATE TABLE customers
(
	customer_id int NOT NULL UNIQUE, 
	customer_name varchar(255) NOT NULL UNIQUE, 
	customer_age int NOT NULL, 
	customer_city varchar(255) NULL
);
SELECT * FROM customers;

INSERT INTO customers VALUES(1,'Bob',56,null);
INSERT INTO customers (customer_id, customer_name, customer_age) VALUES(2, 'Rob', 51);
--INSERT INTO customers VALUES(3, 'Bob', 51, 'Paris');
INSERT INTO customers VALUES(3, 'Don', 51, 'Paris');



DROP TABLE customers;

CREATE TABLE customers
(
	customer_id int PRIMARY KEY,
	customer_name varchar(255) NOT NULL,
	customer_age int NOT NULL,
	customer_city varchar(255) NULL
);
SELECT * FROM customers;

INSERT INTO customers VALUES(1,'Bob',56,null);
INSERT INTO customers (customer_id, customer_name, customer_age) VALUES(2, 'Rob', 51);
INSERT INTO customers VALUES(3, 'Don', 51, 'Paris');
INSERT INTO customers VALUES(3, 'Tom', 50, 'Tokyo');



DROP TABLE customers;

CREATE TABLE customers
(
	customer_id int,
	customer_name varchar(255) NOT NULL,
	customer_age int NOT NULL,
	customer_city varchar(255) NULL,
	UNIQUE (customer_name),
	PRIMARY KEY (customer_id)
);
SELECT * FROM customers;

INSERT INTO customers VALUES(1,'Bob',56,null);
INSERT INTO customers (customer_id, customer_name, customer_age) VALUES(2, 'Rob', 51);
INSERT INTO customers VALUES(3, 'Don', 51, 'Paris');
INSERT INTO customers VALUES(3, 'Tom', 50, 'Rome');



DROP TABLE customers;

CREATE TABLE customers
(
	customer_id int NOT NULL,
	customer_name varchar(255) NOT NULL,
	customer_age int NULL,
	customer_city varchar(255) NOT NULL,
	UNIQUE (customer_name),
	CONSTRAINT PK_ID PRIMARY KEY (customer_id, customer_city)
);
SELECT * FROM customers;

INSERT INTO customers VALUES(1,'Bob',56,'Manitoba');
INSERT INTO customers (customer_id, customer_name, customer_city) VALUES(2, 'Rob', 'Manitoba');
INSERT INTO customers VALUES(3, 'Don', 51, 'Paris');
INSERT INTO customers VALUES(1, 'Kim', 46, 'Tokyo');
--INSERT INTO customers VALUES(1, 'Jim', 56, 'Manitoba');



DROP TABLE customers;

CREATE TABLE customers
(
	customer_id int NOT NULL,
	customer_name varchar(255) NOT NULL,
	customer_age int NULL,
	customer_city varchar(255) NOT NULL
);

ALTER TABLE customers ADD UNIQUE (customer_name);
ALTER TABLE customers ADD PRIMARY KEY (customer_id);

SELECT * FROM customers;

INSERT INTO customers VALUES(1,'Bob',56,'Manitoba');
INSERT INTO customers (customer_id, customer_name, customer_city) VALUES(2, 'Rob', 'Manitoba');
INSERT INTO customers VALUES(3, 'Don', 51, 'Paris');
--INSERT INTO customers VALUES(3, 'Tom', 51, 'Paris');



DROP TABLE customers;

CREATE TABLE customers
(
	customer_id int NOT NULL,
	customer_name varchar(255) NOT NULL,
	customer_age int NULL,
	customer_city varchar(255) NOT NULL
);

ALTER TABLE customers ADD UNIQUE (customer_name);
ALTER TABLE customers ADD CONSTRAINT PK_ID PRIMARY KEY (customer_id,customer_city);

SELECT * FROM customers;

INSERT INTO customers VALUES(1,'Bob',56,'Manitoba');
INSERT INTO customers (customer_id, customer_name, customer_city) VALUES(2, 'Rob', 'Manitoba');
INSERT INTO customers VALUES(3, 'Don', 51, 'Paris');
INSERT INTO customers VALUES(1, 'Kim', 46, 'Tokyo');



DROP TABLE customers;
DROP TABLE products;
DROP TABLE orders;

CREATE TABLE customers
(
	customer_id int PRIMARY KEY,
	customer_name varchar(255) NOT NULL,
	customer_age int NULL,
	customer_city varchar(255) NOT NULL
);

CREATE TABLE products
(
	product_id int PRIMARY KEY,
	product_name varchar(255)
);

CREATE TABLE orders
(
	order_id int PRIMARY KEY,
	customer_id int FOREIGN KEY references customers(customer_id),
	product_id int FOREIGN KEY references products(product_id),
	product_quantity int
);

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;

INSERT INTO products VALUES (1,'Lamp');
INSERT INTO products VALUES (2,'Pen');

INSERT INTO customers VALUES (1, 'Bob', 56, 'Manitoba');
INSERT INTO customers VALUES (2, 'Rob', 49, 'Osaka');
INSERT INTO customers VALUES (3, 'Don', 51, 'Paris');
INSERT INTO customers VALUES (4, 'Kim', 46, 'Tokyo');

INSERT INTO orders VALUES (1,2,1,10);
--INSERT INTO orders VALUES (1,5,1,10);



DROP TABLE persons;

CREATE TABLE persons
(
	PID int NOT NULL CHECK(PID>0),
	First_Name varchar(255),
	Last_Name varchar(255) NOT NULL,
	Age int NOT NULL,
	Salary int NOT NULL,
	Credit_Score int NOT NULL
);

ALTER TABLE persons ADD CHECK (Age>18);
ALTER TABLE persons ADD CONSTRAINT Check_Persons CHECK(Salary>50000 AND Credit_Score>700);

SELECT * FROM persons;

INSERT INTO persons VALUES (1,'Ken','Kaneki',27,53000,740);
--INSERT INTO persons VALUES (2,'Hideyoshi','Nagachika',27,48000,740);

ALTER TABLE persons DROP CONSTRAINT Check_Persons;
INSERT INTO persons VALUES (2,'Hideyoshi','Nagachika',27,48000,740);



CREATE TABLE students
(
	ID int NOT NULL,
	Semester int DEFAULT 1,
	CGPA float(53) NOT NULL
);

ALTER TABLE students ADD CONSTRAINT def_const DEFAULT 0.0 FOR CGPA;

SELECT * FROM students;

INSERT INTO students (ID) VALUES (1);
INSERT INTO students (ID,Semester) VALUES (1,2);
INSERT INTO students (ID,Semester,CGPA) VALUES (1,2,3.5);

ALTER TABLE students DROP CONSTRAINT def_const;
--INSERT INTO students (ID,Semester) VALUES (2,4);



CREATE TABLE faculty
(
	ID int IDENTITY(1,1) PRIMARY KEY,
	Name varchar(255) NOT NULL,
	Designation varchar(255) NOT NULL
);

SELECT * FROM faculty;

INSERT INTO faculty VALUES ('Md. Siam Ansary', 'Lecturer');
INSERT INTO faculty VALUES ('Prof. Dr. A', 'Professor');

DROP TABLE persons;
DROP TABLE students;
DROP TABLE faculty;