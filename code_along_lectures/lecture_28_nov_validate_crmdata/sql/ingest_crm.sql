----------------------------------------
---TASK 1
----------------------------------------
CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE
    IF NOT EXISTS staging.crm_new AS (
        SELECT
            *
        FROM
            read_csv_auto ('data/crm_new.csv')
    );

CREATE TABLE
    IF NOT EXISTS staging.crm_old AS (
        SELECT
            *
        FROM
            read_csv_auto ('data/crm_old.csv')
    );

----------------------------------------
---TASK 2
----------------------------------------
--\ backslah before the dot is to tell that there is 1 dot 
--Using UNION ALL to combine the two tables 
SELECT
    *
FROM
    staging.crm_new
WHERE
    NOT regexp_matches (email, '[A-Za-z0-9]+@[A-Za-z0-9]+\.[A-Za-z]')
    OR NOT region IN ('EU', 'US')
    OR NOT status IN ('active', 'inactive')
UNION ALL
SELECT
    *
FROM
    staging.crm_old
WHERE
    NOT regexp_matches (email, '[A-Za-z0-9]+@[A-Za-z0-9]+\.[A-Za-z]')
    OR NOT region IN ('EU', 'US')
    OR NOT status IN ('active', 'inactive');

----------------------------------------
---TASK 3 
----------------------------------------
CREATE SCHEMA IF NOT EXISTS constrained;

CREATE TABLE
    IF NOT EXISTS constrained.crm_old (
        customer_id INTEGER UNIQUE,
        name VARCHAR NOT NULL,
        email VARCHAR NOT NULL CHECK (email LIKE '%@%.%'),
        region VARCHAR CHECK (region IN ('EU', 'US')),
        status VARCHAR CHECK (status IN ('active', 'inactive'))
    );

CREATE TABLE
    IF NOT EXISTS constrained.crm_new (
        customer_id INTEGER UNIQUE,
        name VARCHAR NOT NULL,
        email VARCHAR CHECK (
            regexp_matches (email, '[A-Za-z0-9]+@[A-Za-z0-9]+\.[A-Za-z]')
        ),
        region VARCHAR CHECK (region IN ('EU', 'US')),
        status VARCHAR CHECK (status IN ('active', 'inactive'))
    );

---------------------------------------------------------------------------------------
--INSERT INTO ---
---------------------------------------------------------------------------------------
--insert into the new file by using the data that exists from the csv - file 
INSERT INTO
    constrained.crm_old
SELECT
    *
FROM
    staging.crm_old
WHERE
    regexp_matches (email, '[A-Za-z0-9]+@[A-Za-z0-9]+\.[A-Za-z]')
    AND region IN ('EU', 'US')
    AND status IN ('active', 'inactive');

INSERT INTO
    constrained.crm_new
SELECT
    *
FROM
    staging.crm_new
WHERE
    regexp_matches (email, '[A-Za-z0-9]+@[A-Za-z0-9]+\.[A-Za-z]')
    AND region IN ('EU', 'US')
    AND status IN ('active', 'inactive');

----------------------------------------
---TASK 4
----------------------------------------
--how many customers are only in the old crm system?
--7 Customers are only in the old system 
SELECT
    customer_id
FROM
    staging.crm_old
EXCEPT
SELECT
    customer_id
FROM
    staging.crm_new;

--customers only recorded in the new CRM system
--6 customers are only in the new system 
SELECT
    customer_id
FROM
    staging.crm_new
EXCEPT
SELECT
    customer_id
FROM
    staging.crm_old;

--customers recorded in both CRM system
-- 7 common customers 
SELECT
    customer_id
FROM
    staging.crm_new
INTERSECT
SELECT
    customer_id
FROM
    staging.crm_old;

----------------------------------------
---TASK 5
----------------------------------------
--subquery 1: customer only in the old crm system 
(
    SELECT
        *
    FROM
        staging.crm_old
    EXCEPT
    SELECT
        *
    FROM
        staging.crm_new
)
UNION
-- subquery 2: customer only in the new crm system
(
    SELECT
        *
    FROM
        staging.crm_new
    EXCEPT
    SELECT
        *
    FROM
        staging.crm_old
)
UNION
--subquery 3: customers violating constraints in old crm system 
(
    SELECT
        *
    FROM
        staging.crm_old
    WHERE
        NOT regexp_matches (email, '[A-Za-z0-9]+@[A-Za-z0-9]+\.[A-Za-z]')
        OR NOT region IN ('EU', 'US')
        OR NOT status IN ('active', 'inactive')
)
UNION
--subquery 4: customers violating constraints in new crm system
(
    SELECT
        *
    FROM
        staging.crm_new
    WHERE
        NOT regexp_matches (email, '[A-Za-z0-9]+@[A-Za-z0-9]+\.[A-Za-z]')
        OR NOT region IN ('EU', 'US')
        OR NOT status IN ('active', 'inactive')
)
----------------------------------------
--Task 2 - DEBBIES SOLUTION 
------------------------------
--find invalid emails 
--Use LIKE operator with wildcard for the crm_old
SELECT
    *
FROM
    staging.crm_old
WHERE
    NOT email LIKE '%@%.%';

--% wildcard 
--something, dot something 
----------------------------------------
--regexp for the new data 
--because the above code queries cannot deal with the new data 
SELECT
    *
FROM
    staging.crm_new
WHERE
    regexp_matches (email, '[A-Za-z0-9\_]+@[A-Za-z0-9\_]+\.[A-Za-z]');

----------------------------------------
--combine all three conditions
--same as I did