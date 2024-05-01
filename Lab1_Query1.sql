CREATE DATABASE myDB;
CREATE TABLE customer(customer_id int,name varchar(255),age int);
SELECT * FROM customer;

/* INSERT INTO*/
INSERT INTO customer(customer_id,name,age) values(1,'Bob',55);
INSERT INTO customer(customer_id,name) values(2,'Rob');
INSERT INTO customer values(3,'BOB',54);

/*SELECT*/
SELECT name FROM customer;
SELECT DISTINCT name FROM customer;
SELECT TOP 2 * FROM customer;
SELECT name FROM customer WHERE age=55;

/*UPDATE*/
UPDATE customer SET age=56 WHERE name='Bob';
UPDATE customer SET age=51 WHERE name='Rob';

/*DELETE*/
DELETE FROM customer WHERE name='Bob';
DELETE FROM customer;

/*DROP TABLE*/
DROP TABLE customer;