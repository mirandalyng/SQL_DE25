SELECT
    *
FROM
    funny_jokes;

--Shortcut for select * in duckdb 
FROM
    funny_jokes
    /* Ascending order */
SELECT
    *
FROM
    funny_jokes
ORDER BY
    rating;

/* Descending order */
SELECT
    *
FROM
    funny_jokes
ORDER BY
    rating DESC;