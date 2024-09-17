CREATE DATABASE lab1; -- 1 task

\c lab1 postgres 1230208

CREATE TABLE users ( -- 2 task
    id SERIAL,
    firstname VARCHAR(50),
    lastname VARCHAR(50)
);

ALTER TABLE users -- 3 task
ADD COLUMN isadmin INTEGER
CHECK ( isadmin IN (1, 0) );

ALTER TABLE users -- 4 task
DROP CONSTRAINT users_isadmin_check;
ALTER TABLE users
ALTER COLUMN isadmin TYPE BOOLEAN
USING isadmin::BOOLEAN;

ALTER TABLE users -- 5 task
ALTER COLUMN isadmin SET  DEFAULT false;

ALTER TABLE users -- 6 task
ADD CONSTRAINT add_primary PRIMARY KEY (id);

CREATE TABLE tasks( -- 7 task
    id SERIAL,
    name VARCHAR(50),
    user_id INTEGER
);

DROP TABLE tasks; -- 8 task 

DROP DATABASE lab1; -- 9 task






