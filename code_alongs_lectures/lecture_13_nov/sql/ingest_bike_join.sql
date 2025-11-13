CREATE SCHEMA IF NOT EXISTS staging;

/* Creating table for brands */
CREATE TABLE
    IF NOT EXISTS staging.joined_table AS (
        SELECT
            *
        FROM
            read_csv_auto ('bike_data/join_table.csv')
    );