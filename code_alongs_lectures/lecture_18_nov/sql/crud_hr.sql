/* =================
DDL - CREATE
=================*/
/* 
Task 1 
----------
create schema  
 */
CREATE SCHEMA IF NOT EXISTS staging;

--create sequence to generate values for id employee_id later
CREATE SEQUENCE IF NOT EXISTS id_sequence START 1;

--create table IN schema staging 
--create columnns 
--use the seq in employment id and set default and nextval
CREATE TABLE
    IF NOT EXISTS staging.employees (
        employee_id INTEGER DEFAULT nextval ('id_sequence'),
        department VARCHAR,
        employment_year INTEGER
    );

/*
Task 2
CRUD - CREATE  
-----------
 */
-- insert 3 rows manually 
INSERT INTO
    staging.employees (department, employment_year)
VALUES
    ('Sales', 2001),
    ('Logistics', 2002),
    ('IT', 2002);

--insert with read_csv() function
--ref: https://duckdb.org/docs/stable/guides/file_formats/csv_import
INSERT INTO
    staging.employees (department, employment_year)
SELECT
    *
FROM
    read_csv ('data/employees.csv');

/* =============
CRUD - READ  
==============*/
SELECT
    *
FROM
    staging.employees;

--LIMIT 10; - show the first 10
--OFFSET 10 ; - don't show the frist 10 
-----------------------------------------
--Task 3
/*  =============
CRUD - UPDATE
modifying existing data 
==============
 */
--update the id 98 and 99 to 2023 
UPDATE staging.employees
SET
    employment_year = 2023
WHERE
    employee_id IN (98, 99);

-- WHERE employee_id = 98 OR employee_id = 99
-- clean and companct code use IN
---------------------------------------------
--Task 4 
/* ===============
DDL - ALTER 
============== */
-- add information about the pension plan
--Add column to table 
ALTER TABLE staging.employees
ADD COLUMN pension_plan VARCHAR DEFAULT 'plan 1'
/* ===============
CRUD - UPDATE 
============== */
UPDATE staging.employees
SET
    pension_plan = 'plan 2'
WHERE
    employment_year > 2015;

-------------------------------
/* ===============
CRUD - DELETE 
============== */
--Task 5 
--Always check the rows you plan to delete first
SELECT
    *
FROM
    staging.employees
WHERE
    employee_id = 1;

--remove id = 1
DELETE FROM staging.employees
WHERE
    employee_id = 1;