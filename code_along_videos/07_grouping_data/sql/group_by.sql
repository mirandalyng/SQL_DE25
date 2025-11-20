SELECT
    food,
    SUM(number_of_searches) as total_searches
FROM
    cleanned_food
GROUP BY
    food
ORDER BY
    total_searches desc
LIMIT
    10;

--TOTAL SEARCHES BY YEAR 
SELECT
    year,
    SUM(number_of_searches) as total_searches
FROM
    cleanned_food
GROUP BY
    year
ORDER BY
    year
LIMIT
    10;

-- filter by total seach > 300k
SELECT
    year,
    SUM(number_of_searches) as total_searches
FROM
    cleanned_food
GROUP BY
    year
HAVING
    total_searches > 300000
ORDER BY
    year;

--group by 2 columns 
SELECT
    year,
    food,
    SUM(number_of_searches) as total_searches
FROM
    cleanned_food
GROUP BY
    food,
    year
HAVING
    food in ('pizza', 'sushi')
ORDER BY
    total_searches desc;