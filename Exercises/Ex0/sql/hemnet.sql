CREATE TABLE
    IF NOT EXISTS hemnet_data AS (
        SELECT
            *
        FROM
            read_csv_auto ('data/hemnet_data_clean.csv')
    );

--wildcard % 
SELECT
    *
FROM
    hemnet_data
WHERE
    address LIKE '%40';

--e) Find out the 5 most expensive homes sold.
SELECT
    *
FROM
    hemnet_data
ORDER BY
    final_price DESC
LIMIT
    5;

--f) Find out the 5 cheapest homes sold.
SELECT
    *
FROM
    hemnet_data
ORDER BY
    final_price ASC
LIMIT
    5;

-- g) Find out statistics on minimum, mean, median and maximum prices of homes sold.
SELECT
    MAX(final_price) AS max_price,
    MIN(final_price) AS min_price,
    AVG(final_price) AS avg_price,
    MEDIAN (final_price) AS median_price
FROM
    hemnet_data;

--i) How many unique communes are represented in the dataset.
SELECT
    COUNT(DISTINCT commune) AS unique_communes
FROM
    hemnet_data
    --j) How many percentage of homes cost more than 10 million?
SELECT
    100.0 * COUNT(*) / (
        SELECT
            COUNT(*)
        FROM
            hemnet_data
    ) AS percent_over_10m
FROM
    hemnet_data
WHERE
    final_price > 10000000;