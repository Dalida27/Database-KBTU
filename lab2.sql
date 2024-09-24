CREATE DATABASE lab2; -- 1 task
\c lab2 postgres 1230208

CREATE TABLE countries( -- 2 task
    country_id SERIAL PRIMARY KEY,
    country_name TEXT,
    region_id INTEGER,
    population INTEGER
);


INSERT INTO countries(country_name, region_id, population) -- 3 task
VALUES ('Brazil', 1, 215000000);


INSERT INTO countries(country_name) -- 4 task
VALUES ('Italy');


INSERT INTO countries(region_id) -- 5 task
VALUES (NULL);


INSERT INTO countries (country_name, region_id, population) -- 6 task
VALUES
    ('USA', 4, 345820699 ),
    ('Russia', 5, 144200000),
    ('China', 6, 1418631278);


ALTER TABLE countries -- 7 task
ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';


INSERT INTO countries(region_id, population) -- 8 task
VALUES (7, 19000000);


INSERT INTO countries DEFAULT VALUES; -- 9 task

CREATE TABLE countries_new (LIKE countries); -- 10 task


INSERT INTO countries_new -- 11 task
SELECT * FROM countries;


UPDATE countries   -- 12 task
SET region_id = 1
WHERE region_id IS NULL;


SELECT country_name, population * 1.1 AS "New Population" -- 13 task
FROM countries;


DELETE FROM countries --14 task
WHERE population < 100000;


DELETE FROM countries_new -- 15 task
USING countries
WHERE countries_new.country_id = countries.country_id
RETURNING *;


DELETE FROM countries  -- 16 task
RETURNING *;

SELECT * FROM countries;
SELECT * FROM countries_new;
DROP TABLE countries;
DROP TABLE countries_new;
