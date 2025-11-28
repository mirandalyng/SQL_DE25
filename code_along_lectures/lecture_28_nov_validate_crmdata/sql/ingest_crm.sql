----------------------------------------
---TASK 1
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
--\ backslah before the dot is to tell that there is 1 dot 
--Using UNION ALL to combine the two tables 
SELECT
    *
from
    staging.crm_new
where
    not regexp_matches (email, '[A-Za-z0-9]+@[A-Za-z0-9]+\.[A-Za-z]')
    OR region not in ('EU', 'US')
    OR status not in ('active', 'inactive')
UNION ALL
SELECT
    *
from
    staging.crm_old
where
    not regexp_matches (email, '[A-Za-z0-9]+@[A-Za-z0-9]+\.[A-Za-z]')
    OR region not in ('EU', 'US')
    OR status not in ('active', 'inactive');

----------------------------------------
---TASK 3 
CREATE SCHEMA IF NOT EXISTS constrained;

CREATE TABLE
    IF NOT EXISTS contrained.cmr_new_cleaned;

CREATE TABLE
    IF NOT EXISTS contrained.cmr_old_cleaned;

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