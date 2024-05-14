DROP DATABASE myDB;
CREATE DATABASE myDB;

DROP TABLE employees;
CREATE TABLE employees
(
	employee_id int PRIMARY KEY, 
	department_id int,
	job_id varchar(255),
	first_name varchar(255),
	last_name varchar(255),
	salary float(25)
);

INSERT INTO employees VALUES(1, 1, 'Developer', 'John', 'Doe', 50000);
INSERT INTO employees VALUES(2, 1, 'Lead', 'Jack', 'Hill', 60000);
INSERT INTO employees VALUES(3, 1, 'Manager', 'Josef', 'Karl', 65000);
INSERT INTO employees VALUES(4, 2, 'Analyst', 'Noah', 'Simmons', 40000);
INSERT INTO employees VALUES(5, 2, 'Analyst', 'Alice', 'Samson', 40000);
INSERT INTO employees VALUES(6, 2, 'Manager', 'Rafael', 'Knox', 50000);
INSERT INTO employees VALUES(7, 3, 'Executive', 'Amy', 'Swanson', 35000);
INSERT INTO employees VALUES(8, 1, 'Developer', 'Frank', 'Robert', 50000);
INSERT INTO employees VALUES(9, 1, 'Lead', 'Mike', 'Nathan', 60000);
INSERT INTO employees VALUES(10, 1, 'Manager', 'Lucas', 'Fox', 65000);
INSERT INTO employees VALUES(11, 2, 'Analyst', 'Akira', 'Momo', 45000);
INSERT INTO employees VALUES(12, 2, 'Analyst', 'Frieren', 'Haruka', 46000);
INSERT INTO employees VALUES(13, 3, 'Executive', 'Moly', 'Cooper', 35000);
INSERT INTO employees VALUES(14, 3, 'Manager', 'Amanda', 'Raj', 45000);


DROP TABLE departments;
CREATE TABLE departments
(
	department_id int PRIMARY KEY, 
	department_name varchar(255)
);

INSERT INTO departments VALUES(1, 'Development');
INSERT INTO departments VALUES(2, 'QA'); 
INSERT INTO departments VALUES(3, 'HR');


DROP TABLE managers;
CREATE TABLE managers
(
	employee_id int,
	department_id int,
	first_name varchar(255),
	last_name varchar(255)
);

INSERT INTO managers VALUES(3, 1, 'Josef', 'Karl');
INSERT INTO managers VALUES(6, 2, 'Rafael', 'Knox');
INSERT INTO managers VALUES(10, 1, 'Lucas', 'Fox');
INSERT INTO managers VALUES(14, 3, 'Amanda', 'Raj');


SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM managers;


--Displaying the salary of Alice
SELECT salary FROM employees WHERE first_name = 'Alice';


-- displaying the employee names whose salary is more than 40000
SELECT first_name, last_name FROM employees WHERE salary>40000;


-- displaying the employee names whose salary is greater than Alice's salary
SELECT first_name, last_name FROM employees WHERE salary > (SELECT salary FROM employees WHERE first_name = 'Alice');


-- displaying the employees whose job_id is same as Alice
SELECT first_name, last_name, salary FROM employees WHERE job_id = (SELECT job_id FROM employees WHERE first_name= 'Alice');


-- displaying the employees whose jod_id is same as Alice 
-- but salary is greater
SELECT first_name, last_name FROM employees WHERE job_id = (SELECT job_id FROM employees WHERE first_name= 'Alice')
												AND 
												salary > (SELECT salary FROM employees WHERE first_name= 'Alice');


-- lowest salary in the company
SELECT min(salary) FROM employees;


-- employees who get the lowest salary in the company
SELECT first_name, last_name FROM employees WHERE salary = (SELECT min(salary) FROM employees);


-- minimum salaries of each department 
SELECT department_id, min(salary) FROM employees GROUP BY department_id;


-- departments whose minimum salary is greater than the minimum salary of HR dept
SELECT department_id, min(salary) FROM employees GROUP BY department_id 
		HAVING min(salary) > 
		(
			SELECT min(salary) FROM employees WHERE department_id = 
				(SELECT department_id FROM departments WHERE department_name= 'HR')
		);


-- different salaries of department 3
SELECT salary FROM employees WHERE department_id=3;


-- employees whose salary is more than any employee of department 3
SELECT first_name, last_name, salary FROM employees WHERE salary > 
				ANY (SELECT salary FROM employees WHERE department_id= 3);


-- employees whose salary is more than all employee of department 3
SELECT first_name, last_name, salary FROM employees WHERE salary > 
				ALL (SELECT salary FROM employees WHERE department_id= 3);


-- employees who are not managers
SELECT first_name, last_name, job_id FROM employees WHERE employee_id
								 NOT IN (SELECT employee_id FROM managers);


-- display the names and salaries of managers
SELECT first_name, last_name, salary FROM employees WHERE job_id= 'manager';
SELECT first_name, last_name, salary FROM employees WHERE employee_id 
						IN (SELECT employee_id FROM managers);


-- employees who have more salary than at least one other employee
SELECT e1.employee_id 
		FROM employees e1, employees e2
		WHERE
		e1.salary > e2.salary;

SELECT DISTINCT e1.employee_id
		FROM employees e1, employees e2
		WHERE
		e1.salary > e2.salary;