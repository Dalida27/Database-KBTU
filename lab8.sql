CREATE DATABASE lab8; -- 1 task

CREATE TABLE salesman ( -- 2 task
    salesman_id INT PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(255),
    commission DECIMAL(4,2)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(255),
    city VARCHAR(255),
    grade INT,
    salesman_id INT
);

CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(8,2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

INSERT INTO salesman (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', 'Berlin', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);

INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', NULL, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70005, 2400.60, '2012-07-27', 3007, 5001),
(70008, 5760.00, '2012-09-10', 3002, 5001);

create role junior_dev login; -- 3 task

create view nysalesmen as -- 4 task
select * from salesman
where city = 'New York';

create view ordersdetails as -- 5 task
    select o.ord_no, o.purch_amt, o.ord_date,  c.cust_name as customer_name, s.name as salesman_name
    from orders o
join customers c on o.customer_id = c.customer_id
join salesman s on o.salesman_id = s.salesman_id;


GRANT ALL ON DATABASE lab8 TO junior_dev;


create view HighGradeCustomers as -- 6 task
    select *
from customers
where grade = (select max(grade) from customers);


grant select on salesman to junior_dev;
grant select on customers to junior_dev;
grant select on orders to junior_dev;


create view SalesmenByCity as -- 7 task
    select city, count(*) as num_salesman
    from salesman
group by city;



create view SalesmenWithMultipleCustomers as -- 8 task
    select s.salesman_id, s.name
from salesman s
join customers c on s.salesman_id = c.salesman_id
group by s.salesman_id, s.name
having count(c.customer_id) > 1;


create role intern; -- 9 task
grant junior_dev to intern;
