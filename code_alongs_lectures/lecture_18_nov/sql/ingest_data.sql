CREATE SCHEMA IF NOT EXISTS staging;

/* Creating table for brands */
CREATE TABLE
    IF NOT EXISTS staging AS (
        SELECT
            *
        FROM
            read_csv_auto ('data/employees.csv')
    );