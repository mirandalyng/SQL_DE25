--select all customers and actors starting with A (firstname) 
--using union
SELECT
    'customer' AS TYPE,
    c.first_name,
    c.last_name,
FROM
    customer c
WHERE
    c.first_name LIKE 'A%'
UNION
SELECT
    'Actor',
    a.first_name,
    a.last_name,
from
    actor a
WHERE
    a.first_name LIKE 'A%';

-- find overlapping names between actors and customers 
SELECT
    a.first_name,
    a.last_name
FROM
    actor a
INTERSECT
SELECT
    c.first_name,
    c.last_name
FROM
    customer c;

--find all with initials JD and redord its type (actor, )
SELECT
    'actor' as "type",
    a.first_name,
    a.last_name
FROM
    actor a
WHERE
    a.first_name LIKE 'J%'
    AND a.last_name LIKE 'D%'
UNION ALL
SELECT
    'customer' as "type",
    c.first_name,
    c.last_name
FROM
    customer c
WHERE
    c.first_name LIKE 'J%'
    AND c.last_name LIKE 'D%'