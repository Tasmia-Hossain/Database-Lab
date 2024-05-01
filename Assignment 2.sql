DROP DATABASE myDB;

CREATE DATABASE myDB;

DROP TABLE Passenger;

CREATE TABLE Passenger
(
	Passenger_ID int NOT NULL, 
	Passenger_FName varchar(255),
	Passenger_LName varchar(255) NOT NULL,
	Passenger_Age int,
	Destination varchar(255)
);


ALTER TABLE Passenger ADD CONSTRAINT PK_ID PRIMARY KEY (Passenger_ID, Passenger_LName);

ALTER TABLE Passenger ADD CONSTRAINT Check_Passenger CHECK (Passenger_Age>18);

ALTER TABLE Passenger ADD CONSTRAINT def_const DEFAULT 'Kyoto' FOR Destination;

INSERT INTO Passenger VALUES (1, 'Ken', 'Kaneki', 21, 'Tokyo');
INSERT INTO Passenger VALUES (2, 'Hideyoshi', 'Nagachika', 26, 'Tokyo');
INSERT INTO Passenger VALUES (3, 'Frank', 'Robertson', 46, 'Madrid');
INSERT INTO Passenger VALUES (4, 'Indrajit', 'Roy', 37, 'Delhi');
INSERT INTO Passenger VALUES (5, 'Abul', 'Kashem', 57, 'Lahore');

SELECT * FROM Passenger ORDER BY Passenger_Age DESC;

SELECT * FROM Passenger WHERE Passenger_Age BETWEEN 25 AND 40;

SELECT Passenger_FName FROM Passenger WHERE Passenger_LName LIKE '%o%';

ALTER TABLE Passenger DROP CONSTRAINT Check_Passenger;

ALTER TABLE Passenger DROP CONSTRAINT def_const;