FROM
    actor;

FROM
    film;

from
    film_actor;

FROM
    address;

FROM
    city;

from
    country;

FROM
    category;

from
    customer;

SELECT
    COUNT(*) AS number_movies,
    COUNT(DISTINCT title) as unique_number_of_titles
FROM
    film;

SELECT DISTINCT
    rating
FROM
    main.film;

DESC TABLE film_actor;

FROM
    customer;

-- alias c as customer 
--different querys 
SELECT
    'customer' AS TYPE,
    c.first_name,
    c.last_name,
FROM
    customer c
WHERE
    c.first_name LIKE 'D%';