--LIKE operator in WHERE clause -> filter rows
--LIKE operator in wildcards to seatch for pattern 
SELECT
    example,
    lower(trim(example)) as cleaned_example
FROM
    staging.sql_glossary;

--seach for select 
SELECT
    example,
    lower(trim(example)) as cleaned_example
FROM
    staging.sql_glossary
WHERE
    cleaned_example LIKE 'select%';

--wildbard % mathces 0 or more characters 
--wildcard _  represents 1 charachter 
SELECT
    example,
    trim(example) as cleaned_example
FROM
    staging.sql_glossary
WHERE
    cleaned_example LIKE 'S_LECT%';

--regular expression 
SELECT
    lower(trim(description)) as cleaned_description
FROM
    staging.sql_glossary
WHERE
    regexp_matches (cleaned_description, '^c');

--starting with c or s 
SELECT
    trim(description) as cleaned_description
FROM
    staging.sql_glossary
WHERE
    regexp_matches (cleaned_description, '^[CS]');

-- \b makes it match exact word 
SELECT
    lower(description) as cleaned_description
FROM
    staging.sql_glossary
WHERE
    regexp_matches (cleaned_description, 'select\b');

--[a-f] matches range of characters 
--^[af] matches starging with characters a-f
SELECT
    lower(trim(description)) as cleaned_description
FROM
    staging.sql_glossary
WHERE
    regexp_matches (cleaned_description, '^[a-f]');

--[^a-f] matches any charachter NOT in range a-f 
--^[^a-f] starting with characters not in range a-f 
SELECT
    lower(trim(description)) as cleaned_description
FROM
    staging.sql_glossary
WHERE
    regexp_matches (cleaned_description, '^[^a-f]');

SELECT
    description,
    regexp_replace (trim(description), ' +', ' ', 'g') as cleaned_description
FROM
    staging.sql_glossary;