--LEFT JOIN 
--which actor has played which film_id 
SELECT
    a.actor_id,
    a.first_name,
    a.last_name,
    fa.film_id
FROM
    actor a
    LEFT JOIN film_actor fa ON fa.actor_id = a.actor_id;

--which actor has played wich film
--join 3 tables 
SELECT
    a.first_name,
    a.last_name,
    f.title
FROM
    actor a
    LEFT JOIN film_actor fa ON fa.actor_id = a.actor_id
    LEFT JOIN film f ON f.film_id = fa.film_id;

--INNER JOIN 
--get all films with associated category 
--start with from filmcategory wich has id for film and categroy 
--innerjoin the categorys and inner join on the film to get title 
SELECT
    f.title,
    c.name as category
FROM
    film_category fc
    INNER JOIN category c ON fc.category_id = c.category_id
    INNER JOIN film f ON f.film_id = fc.film_id;

--CROSS JOIN 
SELECT
    COUNT(*)
FROM
    film;

SELECT
    COUNT(*)
FROM
    category;

SELECT
    COUNT(*)
FROM
    film f
    INNER JOIN category c ON category_id;

SELECT
    f.title,
    c.name AS category
FROM
    film f
    INNER JOIN category c ON category_id;

--in which adress, city and country does the staff live in; 
-----------
--adress_id , first_name , last_name, 
FROM
    staff;

--adress_id, adress, city_id 
FROM
    address;

--city_id, city , country_id 
FROM
    city;

-- country_id, country 
FROM
    country;

---------
SELECT
    *
FROM
    staff s
    LEFT JOIN address a ON s.address_id = a.address_id
    LEFT JOIN city c ON a.city_id = c.city_id
    LEFT JOIN country ctr ON ctr.country_id = c.country_id;

SELECT
    s.first_name,
    s.last_name,
    a.address,
    c.city,
    ctr.country
FROM
    staff s
    LEFT JOIN address a ON s.address_id = a.address_id
    LEFT JOIN city c ON a.city_id = c.city_id
    LEFT JOIN country ctr ON ctr.country_id = c.country_id;