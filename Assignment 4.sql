DROP DATABASE myDB;
CREATE DATABASE myDB;

DROP TABLE Salesmans;
CREATE TABLE Salesmans
(
	salesman_id int PRIMARY KEY,
	name varchar(255),
	city varchar(255),
	commission float(25)
);

INSERT INTO Salesmans VALUES(5001, 'James Hoog', 'New York', 0.15);
INSERT INTO Salesmans VALUES(5002, 'Nail Knite', 'Paris', 0.13);
INSERT INTO Salesmans VALUES(5005, 'Pit Alex', 'London', 0.11);
INSERT INTO Salesmans VALUES(5006, 'Mc Lyon', 'Paris', 0.14);
INSERT INTO Salesmans VALUES(5007, 'Paul Adam', 'Rome', 0.13);
INSERT INTO Salesmans VALUES(5003, 'Lauson Hen', 'San Jose', 0.12);


DROP TABLE Customer;
CREATE TABLE Customer
(
	customer_id int PRIMARY KEY,
	customer_name varchar(255),
	city varchar(255),
	grade int,
	salesman_id int
);

INSERT INTO Customer VALUES(3002, 'Nick Rimando', 'New York', 100, 5001);
INSERT INTO Customer VALUES(3007, 'Brad Davis', 'New York', 200, 5001);
INSERT INTO Customer VALUES(3005, 'Graham Zusi', 'California', 200, 5002);
INSERT INTO Customer VALUES(3008, 'Julian Green', 'London', 300, 5002);
INSERT INTO Customer VALUES(3004, 'Fabian Johnson', 'Paris', 300, 5006);
INSERT INTO Customer VALUES(3009, 'Geoff Cameron', 'Berlin', 100, 5003);
INSERT INTO Customer VALUES(3003, 'Jozy Altidor', 'Moscow', 200, 5007);
INSERT INTO Customer VALUES(3001, 'Brad Guzan', 'London', NULL, 5005);


DROP TABLE Orders;
CREATE TABLE Orders
(
	order_id int PRIMARY KEY,
	purchase_amount float(25),
	customer_id int,
	salesman_id int
);

INSERT INTO Orders VALUES(7001, 150.5, 3005, 5002);
INSERT INTO Orders VALUES(7009, 270.5, 3001, 5005);
INSERT INTO Orders VALUES(7002, 65.5, 3002, 5001);
INSERT INTO Orders VALUES(7004, 110, 3009, 5003);
INSERT INTO Orders VALUES(7007, 948.5, 3005, 5002);
INSERT INTO Orders VALUES(7005, 2400, 3007, 5001);
INSERT INTO Orders VALUES(7008, 5760, 3002, 5001);
INSERT INTO Orders VALUES(7010, 1983, 3004, 5006);
INSERT INTO Orders VALUES(7003, 2480, 3009, 5003);
INSERT INTO Orders VALUES(7012, 250.5, 3008, 5002);
INSERT INTO Orders VALUES(7011, 76, 3003, 5007);
INSERT INTO Orders VALUES(7013, 3045, 3002, 5001);


SELECT * FROM Salesmans;
SELECT * FROM Customer;
SELECT * FROM Orders;

SELECT * FROM Orders WHERE salesman_id = (SELECT salesman_id FROM Salesmans WHERE name = 'Paul Adam');

SELECT * FROM Orders WHERE salesman_id IN (SELECT salesman_id FROM Salesmans WHERE city = 'Paris');

SELECT COUNT(*) FROM Customer WHERE city = 'New York' 
		AND grade > (SELECT AVG(grade) FROM Customer WHERE city = 'New York');


SELECT s.salesman_id, s.name, COUNT(c.customer_id) AS customer_count
	FROM Salesmans s JOIN Customer c ON s.salesman_id = c.salesman_id
	GROUP BY s.salesman_id, s.name HAVING COUNT(c.customer_id) > 1;

SELECT s.salesman_id, s.name, COUNT(c.customer_id) AS num_customers 
	FROM Salesmans s JOIN Customer c ON s.salesman_id = c.salesman_id 
	GROUP BY s.salesman_id, s.name HAVING COUNT(c.customer_id) = 1;


SELECT salesman_id FROM (SELECT salesman_id, customer_id, COUNT(*) AS order_count
    FROM Orders GROUP BY salesman_id, customer_id) AS orders_per_customer
	GROUP BY salesman_id HAVING COUNT(*) > 1;


SELECT * FROM Orders WHERE purchase_amount < ALL (SELECT MAX(purchase_amount) 
	FROM Orders WHERE customer_id IN (SELECT customer_id FROM Customer WHERE city = 'London'));



SELECT * FROM Customer WHERE city != 'London' AND grade NOT IN 
			(SELECT grade FROM Customer WHERE city = 'London');


SELECT customer_id, customer_name, grade FROM Customer WHERE city != 'Paris' 
			AND grade NOT IN (SELECT grade FROM Customer WHERE city = 'Paris');



SELECT COUNT(*) FROM Customer WHERE city != 'California' AND grade NOT IN 
				(SELECT grade FROM Customer WHERE city = 'California');
