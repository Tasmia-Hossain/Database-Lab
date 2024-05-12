DROP DATABASE myDB

CREATE DATABASE myDB;

DROP TABLE persons;

CREATE TABLE persons(
	P_Id int PRIMARY KEY,
	LastName varchar(255),
	FirstName varchar(255),
	Address varchar(255),
	City varchar(255)
);

SELECT * FROM persons;


DROP TABLE orders;

CREATE TABLE orders(
	o_Id int PRIMARY KEY,
	orderNo int,
	P_Id int
);

SELECT * FROM orders;

INSERT INTO persons VALUES(1, 'Hansen', 'Ola', 'Timoteivn 10', 'Sandnes');
INSERT INTO persons VALUES(2, 'Svendson', 'Tove', 'Borgvn 23', 'Sandnes');
INSERT INTO persons VALUES(3, 'Pattersen', 'Kari', 'Storgt 20', 'Stavanger');

INSERT INTO orders VALUES(1, 77895, 3);
INSERT INTO orders VALUES(2, 44678, 3);
INSERT INTO orders VALUES(3, 22456, 1);
INSERT INTO orders VALUES(4, 24562, 1);
INSERT INTO orders VALUES(5, 34764, 15);


/* The inner join keyword returns rows when there is at least one match in both tables.*/
SELECT * FROM persons INNER JOIN orders ON persons.P_Id=orders.P_Id;
SELECT * FROM persons INNER JOIN orders ON persons.P_Id=orders.P_Id ORDER BY persons.P_Id;


/* The RIGHT JOIN returns all records of right table, even if there are no matches in the left table. */
SELECT * FROM persons RIGHT JOIN orders ON persons.P_Id=orders.P_Id;
SELECT * FROM persons RIGHT JOIN orders ON persons.P_Id=orders.P_Id order by persons.P_Id;
SELECT * FROM persons RIGHT JOIN orders ON persons.P_Id=orders.P_Id order by orders.P_Id;


/* The FULL JOIN returns rows when there is a match in one of the tables */
SELECT * FROM persons FULL JOIN orders ON persons.P_Id=orders.P_Id;
SELECT * FROM persons FULL JOIN orders ON persons.P_Id=orders.P_Id ORDER BY persons.P_Id;
SELECT * FROM persons FULL JOIN orders ON persons.P_Id=orders.P_Id ORDER BY orders.P_Id;


/* A cross join is a type of join that returns the Cartesian product 
   of rows from the tables in the join. In other words, it combines 
   each row from the first table with each row from the second table.*/
SELECT * FROM persons CROSS JOIN orders;


/*The UNION operator is used to combine the result-set of two or more SELECT statements.*/
SELECT P_Id FROM persons UNION SELECT P_Id FROM orders;
SELECT P_Id FROM persons UNION ALL SELECT P_Id FROM orders;


/* The INTERSECT clause in SQL is used to combine two SELECT statements 
   but the dataset returned by the INTERSECT statement will be the intersection 
   of the data sets of the two SELECT statements */
SELECT P_Id FROM persons INTERSECT SELECT P_Id FROM orders;
SELECT P_Id, LastName FROM persons WHERE P_Id BETWEEN 1 AND 2 INTERSECT SELECT P_Id, LastName FROM persons WHERE LastName LIKE '%sen';


/* The EXCEPT operator in SQL is used to retrieve all the unique records 
   from the left operand (query), except the records that are present in 
   the result set of the right operand (query).*/
SELECT P_Id FROM persons EXCEPT SELECT P_Id FROM orders;
SELECT P_Id, LastName FROM persons WHERE P_Id BETWEEN 1 AND 2 EXCEPT SELECT P_Id, LastName FROM persons WHERE LastName LIKE '%sen';