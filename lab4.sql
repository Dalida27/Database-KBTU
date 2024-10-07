CREATE DATABASE lab4; -- 1 task
\c lab3 postgres 1230208

CREATE TABLE Warehouses(   --2 task
    code integer,
    location varchar(255),
    capacity integer
);

create table Boxes(
    code char(4),
    contents varchar(255),
    value real,
    warehouse integer
);



insert into warehouses(code, location, capacity) -- 3 task
values
    (1, 'Chicago', 3),
    (2, 'Chicago', 4),
    (3, 'New York', 7),
    (4, 'Las Angeles', 2),
    (5, 'San Francisco', 8);

insert into boxes(code, contents, value, warehouse)
values
    ('0MN7', 'Rocks', 180, 3),
    ('4H8P', 'Rocks', 250, 1),
    ('4RT3', 'Scissors', 190, 4),
    ('7G3H', 'Rocks', 200, 1),
    ('8JN6', 'Papers', 75, 1),
    ('8Y6U', 'Papers', 50, 3),
    ('9J6F', 'Papers', 175, 2),
    ('LL08', 'Rocks', 140, 4),
    ('P0H6', 'Scissors', 125, 1),
    ('P2T6', 'Scissors', 150, 2),
    ('TU55', 'Papers', 90, 5);


select * from warehouses; --4 task

select * from boxes where value > 150; -- 5 task

select distinct contents from boxes; -- 6 task

select warehouse, count(*) as boxcount from boxes group by warehouse; -- 7 task

select warehouse, count(*) as boxcount from boxes group by warehouse having count(*) > 2; -- 8 task


insert into warehouses(code, location, capacity) VALUES (6, 'New York', 3); -- 9 task


insert into boxes(code, contents, value, warehouse) VALUES ('H5RT', 'Papers', 200, 2); -- 10 task


update boxes set value = value * 0.5 where value = (select distinct value from boxes order by value desc limit 1 offset 2); -- 11 task

delete from boxes where value < 150; -- 12 task

delete from boxes where warehouse in (select code from warehouses where location = 'New York') returning *; -- 13 task



select * from warehouses;
select * from boxes;
drop table boxes;
drop table warehouses;
