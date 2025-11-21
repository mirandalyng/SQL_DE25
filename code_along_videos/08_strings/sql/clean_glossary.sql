CREATE SCHEMA IF NOT EXISTS refineed;

CREATE TABLE
    IF NOT EXISTS refineed.sql_glossary as (
        SELECT
            upper(trim(sql_word)) as sql_word,
            regexp_replace (trim(description), ' +', ' ', 'g') as description,
            example
        FROM
            staging.sql_glossary
    );