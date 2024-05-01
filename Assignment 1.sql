CREATE DATABASE myDB;
CREATE TABLE Passenger(Passenger_ID int,Passenger_FName varchar(255),Passenger_LName varchar(255),Passenger_Age int,Destination varchar(255));
INSERT INTO Passenger Values(1, 'Ken', 'Kaneki', 21, 'Tokyo');
INSERT INTO Passenger Values(2, 'Hideyoshi', 'Nagachika', 26, 'Tokyo');
INSERT INTO Passenger Values(3, 'Frank', 'Robertson', 46, 'Madrid');
INSERT INTO Passenger Values(4, 'Indrajit', 'Roy', 37, 'Delhi');
INSERT INTO Passenger Values(5, 'Abul', 'Kashem', 57, 'Lahore');

SELECT DISTINCT Destination FROM Passenger;

UPDATE Passenger SET Destination='Delhi' WHERE Passenger_FName='Frank';

DELETE FROM Passenger WHERE Destination='Tokyo';

SELECT Passenger_FName FROM Passenger WHERE Passenger_Age>30;

ALTER TABLE Passenger DROP COLUMN Passenger_Age;

ALTER TABLE Passenger ADD Source varchar(255);

UPDATE Passenger SET Source='Paris';

SELECT * FROM Passenger;

