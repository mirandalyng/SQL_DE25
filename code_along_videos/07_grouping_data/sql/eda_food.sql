FROM
    food;

SELECT DISTINCT
    id
FROM
    food;

--201 distinct intems 
SELECT
    COUNT(DISTINCT id)
FROM
    food;

SELECT
    COUNT(*) AS NUMBER_ROWS
FROM
    food;

--describe food 
DESC food;

--filter week id between 04 and 06 
SELECT
    *
FROM
    food
WHERE
    week_id BETWWEEN '2004-04'
    AND '2004-06';