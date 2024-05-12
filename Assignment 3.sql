DROP DATABASE myDB;

CREATE DATABASE myDB;

DROP TABLE salesman;
CREATE TABLE salesman
(
	sId int PRIMARY KEY,
	sName varchar(255),
	sCity varchar(255),
	sCommission int
);

DROP TABLE customer;
CREATE TABLE customer
(
	cID int PRIMARY KEY,
	cName varchar(255),
	cCity varchar(255),
	sId int FOREIGN KEY REFERENCES salesman(sId)
);

SELECT cName,sName FROM customer INNER JOIN salesman ON (customer.cCity=salesman.sCity);

SELECT cName FROM salesman INNER JOIN customer ON (customer.sId=salesman.sId);

SELECT sName FROM salesman INNER JOIN customer ON (customer.sID=salesman.sID) EXCEPT SELECT sName FROM salesman INNER JOIN customer ON (customer.cCity=salesman.sCity);

SELECT cName,sName FROM customer LEFT JOIN salesman ON (customer.sId=salesman.sId); 

SELECT sName, count(customer.sId) AS No_of_customer FROM salesman LEFT JOIN customer ON (customer.sId=salesman.sId) GROUP BY sName;

SELECT pName, price, cName FROM product INNER JOIN company ON (company.cId=product.cId);

SELECT cName,avg(price) AS Avg_price FROM company left join products ON (company.cId=product.cId);

SELECT fName,lName,dName FROM employee inner join department ON (department.dId=employee.dId);

SELECT fName,lName FROM employee inner join department ON (department.dId=employee.dId) WHERE dBudget>50000;

SELECT dName,count(*) AS num_of_emp FROM employee inner join department ON (department.dId=employee.dId) GROUP BY dName HAVING count(*)>2;