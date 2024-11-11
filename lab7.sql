CREATE DATABASE lab7;


CREATE TABLE countries (
    name VARCHAR(255)
);

CREATE TABLE employees (
    name VARCHAR(255),
    surname VARCHAR(255),
    salary DECIMAL(10, 2),
    department_id INT
);

CREATE TABLE departments (
    department_id INT,
    name VARCHAR(255),
    budget DECIMAL(10, 2)
);

--1task
create index ind_count on countries(name);

--2 task
create index ind_emp on employees(name, surname);

--3 task
create unique index ind_emp_sal on employees(salary);

--4 task
create index ind_emp_sub on employees(substring(name from 1 for 4));

--5 task
create index ind_emp_e on employees(salary);
create index ind_dep_d on departments(budget);

create index ind_emp_e_id on employees(department_id);
create index ind_dep_d_id on departments(department_id);

