CREATE DATABASE lab6; -- 1 task


create table locations( -- 2 task
    location_id serial primary key,
    street_address varchar(255),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);

create table departments(
    department_id serial primary key,
    department_name varchar(50) unique,
    budget integer,
    location_id integer references locations
);

create table employees(
    employee_id serial primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary integer,
    department_id integer references departments
);

select e.first_name, e.last_name, e.department_id, d.department_name from employees e
    inner join departments d on e.department_id = d.department_id; --3 task


select e.first_name, e.last_name, e.department_id, d.department_name from employees e -- 4 task
    inner join departments d on e.department_id = d.department_id
    where d.department_id = 80 or d.department_id = 40;


select e.first_name, e.last_name, d.department_name, l.city, l.state_province from employees e -- 5 task
    inner join departments d on e.department_id = d.department_id
    inner join locations l on d.location_id = l.location_id;


select d.department_name from departments d -- 6 task
    left join employees e on d.department_id = e.department_id;

select e.first_name, e.last_name, d.department_id, d.department_name from employees e -- 7 task
    left join departments d on e.department_id = d.department_id;

