--change name of id into food 
--remove goodle topic column 
--change value into number_of_searches 
--change week_id into week 
--extract a year column
SELECT
    id AS food,
    week_id AS week,
    value AS number_of_searches
FROM
    food;

SELECT
    id AS food,
    week_id AS week,
    SUBSTRING(week, 1, 4) AS year,
    value AS number_of_searches
FROM
    food;

CREATE TABLE
    IF NOT EXISTS cleanned_food AS (
        SELECT
            id as food,
            week_id as week,
            SUBSTRING(week, 1, 4) as year,
            value as number_of_searches
        FROM
            food
    );