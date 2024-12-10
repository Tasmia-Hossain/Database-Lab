DROP DATABASE myDB;
CREATE DATABASE myDB;

DROP TABLE Students;
CREATE TABLE Students(
	ID int NOT NULL identity(1,1) PRIMARY KEY,
	Email varchar(50) UNIQUE CHECK (Email like '%@aust.edu'),
	LastName varchar(255) NOT NULL,
	FirstName varchar(255) DEFAULT 'Mr. ',
	Age int CHECK(Age>=20)
);

INSERT INTO Students VALUES('1@aust.edu','Abcd','XYZ',22);
INSERT INTO Students VALUES('2@nsu.edu','Abce','XYY',21); /* invalid */
INSERT INTO Students VALUES('4@aust.edu','ERT',24); /* invalid */
INSERT INTO Students VALUES('5@aust.edu','Abcd','XYZ',24);
INSERT INTO Students VALUES('7@aust.edu','Abcd','jkl',19); /* invalid */
INSERT INTO Students(Email,LastName,Age) VALUES('6@aust.edu','Abcd',24);

SELECT * FROM Students;

DROP TABLE customerInfo;
CREATE TABLE customerInfo(
	CustomerID	int,
	CustomerName varchar(50),
	ContactName	varchar(50),
	CustomerAddress	varchar(50),
	City varchar(50),
	PostalCode	varchar(50),
	Country varchar(50)
);

INSERT INTO customerInfo VALUES(1, 'Alfreds Futterkiste',	'Maria Anders','Obere Str. 57',	'Berlin','12209','Germany');
INSERT INTO CustomerInfo VALUES(2,	'Ana Trujillo Emparedados y helados','Ana Trujillo'	,'Avda. de la Constitución 2222','México D.F.','05021', 'Mexico');
INSERT INTO CustomerInfo VALUES(3,	'Antonio Moreno Taquería',	'Antonio Moreno','Mataderos 2312','México D.F.', '05023',	'Mexico');
INSERT INTO CustomerInfo VALUES(4, 'Around the Horn','Thomas Hardy','120 Hanover Sq.','London','WA1 1DP','UK');
INSERT INTO CustomerInfo VALUES(5,	'Berglunds snabbköp', 'Christina Berglund',	'Berguvsvägen 8','Luleå','S-958 22','Sweden');
INSERT INTO CustomerInfo(CustomerID, CustomerName, CustomerAddress	,City,PostalCode,Country) VALUES(6,'Maria Anders','Obere Str. 57','Berlin','12209','Germany');
INSERT INTO CustomerInfo(CustomerID, CustomerName,ContactName,City,PostalCode,Country) VALUES(7,	'Maria Anders','Abc',	'Berlin','12209', 'Germany');
INSERT INTO CustomerInfo(CustomerID, CustomerName,ContactName,customerAddress,City,PostalCode) VALUES(8,	'Maria Anders'	,'Abc',	'Obere Str. 57','Berlin','12209');

SELECT * FROM customerInfo;

/* In SQL, a view is a virtual table based on the result-set of an SQL statement. */
CREATE VIEW [Germany Customers] AS SELECT * FROM customerInfo WHERE Country='Germany';
SELECT * FROM [Germany Customers];

/* A stored procedure is a prepared SQL code that one can save, so the code can be reused over and over again. */
CREATE PROCEDURE dbo.customerDetail
	@CustomerID INT
AS
BEGIN
	SELECT * FROM customerInfo WHERE CustomerID = @CustomerID;
END;
Exec dbo.customerDetail @CustomerID=2;
