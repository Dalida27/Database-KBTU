CREATE DATABASE lab3; -- 1 task
\c lab3 postgres 1230208


CREATE TABLE departments (    -- 2 task
  code INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  budget DECIMAL NOT NULL
);

CREATE TABLE employees (
  ssn INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  lastname VARCHAR(255) NOT NULL ,
  department INTEGER NOT NULL ,
  city VARCHAR(255),
  FOREIGN KEY (department) REFERENCES departments(code)
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  lastname VARCHAR(255) NOT NULL ,
  city VARCHAR(255)
);

INSERT INTO departments(code,name,budget) VALUES(14,'IT',65000);
INSERT INTO departments(code,name,budget) VALUES(37,'Accounting',15000);
INSERT INTO departments(code,name,budget) VALUES(59,'Human Resources',240000);
INSERT INTO departments(code,name,budget) VALUES(77,'Research',55000);
INSERT INTO departments(code,name,budget) VALUES(45,'Management',155000);
INSERT INTO departments(code,name,budget) VALUES(11,'Sales',85000);

INSERT INTO employees(ssn,name,lastname,department, city) VALUES('123234877','Michael','Rogers',14, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('152934485','Anand','Manikutty',14, 'Shymkent');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('222364883','Carol','Smith',37, 'Astana');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('326587417','Joe','Stevens',37, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('332154719','Mary-Anne','Foster',14, 'Astana');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('332569843','George','ODonnell',77, 'Astana');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('546523478','John','Doe',59, 'Shymkent');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('631231482','David','Smith',77, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('654873219','Zacary','Efron',59, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('745685214','Eric','Goldsmith',59, 'Atyrau');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('845657245','Elizabeth','Doe',14, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('845657246','Kumar','Swamy',14, 'Almaty');



INSERT INTO customers(name,lastname, city) VALUES('John','Wills', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('Garry','Foster', 'London');
INSERT INTO customers(name,lastname, city) VALUES('Amanda','Hills', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('George','Doe', 'Tokyo');
INSERT INTO customers(name,lastname, city) VALUES('David','Little', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('Shawn','Efron', 'Astana');
INSERT INTO customers(name,lastname, city) VALUES('Eric','Gomez', 'Shymkent');
INSERT INTO customers(name,lastname, city) VALUES('Elizabeth','Tailor', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('Julia','Adams', 'Astana');



SELECT lastname from employees; -- 3 task

SELECT DISTINCT lastname from employees; -- 4 task

SELECT * FROM employees WHERE lastname = 'Smith'; --5 task

SELECT * FROM employees WHERE lastname = 'Smith' OR lastname = 'Doe'; --6 task

SELECT * FROM employees WHERE department = 14; --7 task

SELECT * FROM employees WHERE department = 37 OR department = 77; --8 task


SELECT sum(budget) FROM departments; -- 9 task

SELECT department, COUNT(*) AS number_of_employees FROM employees GROUP BY department; -- 10 task

SELECT department FROM employees GROUP BY department HAVING COUNT(*) > 2; -- 11 task

SELECT name FROM departments ORDER BY budget DESC OFFSET 1 LIMIT 1; -- 12 task

SELECT e.name, e.lastname FROM employees e
JOIN departments d on e.department = d.code
WHERE d.budget = (SELECT MIN(budget) FROM departments); -- 13 task


SELECT name FROM employees WHERE city = 'Almaty' -- 14 task
UNION
SELECT name FROM customers WHERE city = 'Almaty';

SELECT * FROM departments WHERE budget > 60000 ORDER BY budget ASC , code DESC; -- 15 task


UPDATE departments -- 16 task
SET budget = budget * 0.1 WHERE budget = (SELECT MIN(budget) FROM departments);


UPDATE employees -- 17 task
SET department = 14
WHERE department = 77;

DELETE FROM employees WHERE department = 14; -- 18 task

DELETE FROM employees; -- 19 task

SELECT * FROM employees;
SELECT * FROM customers;
SELECT * FROM departments;






