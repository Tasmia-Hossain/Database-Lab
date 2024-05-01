CREATE DATABASE myDB;
CREATE TABLE Persons(PersonID int,LastName varchar(255),FirstName varchar(255),Address varchar(255),City varchar(255));
INSERT INTO Persons VALUES(1,'Hansen','Ola','Timoteivn 10','Sandnes');
INSERT INTO Persons VALUES(2,'Svendson','Tove','Borgvn 23','Sandnes');
INSERT INTO Persons VALUES(3,'Petterson','Kari','Storgt 20','Stavanger');
INSERT INTO Persons(PersonID,LastName,FirstName,Address) VALUES(4,'Nilsen','Johan','Bakken 2');
INSERT INTO Persons(PersonID,LastName,FirstName) VALUES(5,'Tjessem','Jakob');

SELECT * FROM Persons;
SELECT DISTINCT City FROM Persons;
SELECT * FROM Persons WHERE City='Sandnes';
SELECT * FROM Persons WHERE FirstName='Tove' AND LastName='Svendson';
SELECT * FROM Persons WHERE FirstName='Tove' OR FirstName='Ola';
SELECT * FROM Persons WHERE LastName='Svendson' AND (FirstName='Tove' OR FirstName='Ola');

ALTER TABLE Persons ADD Salary int;
ALTER TABLE Persons DROP Salary;
ALTER TABLE Persons ALTER COLUMN PersonID varchar(255);
ALTER TABLE Persons ALTER COLUMN PersonID int;

UPDATE Persons SET Address='Nissestien 67',City='Sandnes' WHERE LastName='Tjessem' AND FirstName='Jakob';

DELETE FROM Persons WHERE LastName='Tjessem' AND FirstName='Jakob';

SELECT * INTO Person_custom FROM Persons;
SELECT * FROM Person_custom;

DROP TABLE Person_custom;

TRUNCATE TABLE Person_custom;