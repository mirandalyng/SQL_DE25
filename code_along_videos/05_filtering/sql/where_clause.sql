SELECT
    COUNT(*)
FROM
    data_jobs;

SELECT
    COUNT(*)
FROM
    data_jobs
WHERE
    salary_in_usd < 50000;

--see wich entry levels exists 
SELECT DISTINCT
    experience_level
FROM
    data_jobs;

--find entry level jobs
SELECT
    *
FROM
    data_jobs
WHERE
    experience_level = 'EN';

--find the median salary for the entry level jobs 
SELECT
    MEDIAN (salary_in_usd) AS median_salary_usd,
    AVG(salary_in_usd) AS avg_salary_usd
FROM
    data_jobs
WHERE
    experience_level = 'EN';

--find the median salary for the MID  level jobs 
SELECT
    MEDIAN (salary_in_usd) AS median_salary_usd,
    AVG(salary_in_usd) AS avg_salary_usd
FROM
    data_jobs
WHERE
    experience_level = 'MI';