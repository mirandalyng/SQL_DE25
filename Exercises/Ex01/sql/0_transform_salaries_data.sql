/* 
FOR this task you should USE the same salaries data AS IN lecture 04
AND 05.
CREATE a new TABLE that should contain the transformed data
AND call the TABLE cleaned_salaries.

 */
CREATE TABLE
    IF NOT EXISTS cleaned_salaries AS (
        SELECT
            *
        FROM
            read_csv_auto ('data/salaries.csv')
    );

--a) Transform employment TYPE COLUMN based ON this TABLE
--selecting the employment type 
SELECT DISTINCT
    employment_type
FROM
    cleaned_salaries;

--selecting as the picture and adding a meaning column. 
--Not updating the datebase (you could)
SELECT DISTINCT
    employment_type as abbreviation,
    CASE
        WHEN employment_type = 'CT' THEN 'Contract'
        WHEN employment_type = 'FL' THEN 'Freelance'
        WHEN employment_type = 'PT' THEN 'Part time'
        WHEN employment_type = 'FT' THEN 'Full time'
    END AS meaning,
FROM
    cleaned_salaries;

--b) Do similar for company size, but you have to figure out what the abbreviations could stand for.
--selecting 
SELECT DISTINCT
    company_size
FROM
    cleaned_salaries;

SELECT DISTINCT
    company_size as abbreviation,
    CASE
        WHEN company_size = 'S' then 'Small'
        WHEN company_size = 'M' then 'Medium'
        WHEN company_size = 'L' then 'Large'
    END AS meaning
FROM
    cleaned_salaries;

--  c) Make a salary column with Swedish currency for yearly salary.
SELECT
    ROUND(salary_in_usd / 9.56 * 12) as yearly_salary_in_sek
FROM
    cleaned_salaries;

--d) Make a salary column with Swedish currency for monthly salary.
select
    ROUND(salary_in_usd / 9.56) as yearly_salary_in_sek
from
    cleaned_salaries;

--e) Make a salary_level column with the following categories: low, medium, high, insanely_high. Decide your thresholds for each category. Make it base on the monthly salary in SEK.
select 
  ROUND(salary_in_usd/9.56) as monthly_salary_in_sek, 
  CASE 
    WHEN monthly_salary_in_sek BETWEEN 0 AND 15000 THEN 'Low'
    WHEN monthly_salary_in_sek BETWEEN 15000 AND 45000 THEN 'Medium'
    WHEN monthly_salary_in_sek BETWEEN 46000 AND 76000  THEN 'High'
    WHEN monthly_salary_in_sek > 76000 THEN 'Insainley high'
  END AS salary_level_sek

from cleaned_salaries;

--f) Choose the following columns to include in your table: experience_level, employment_type, job_title, salary_annual_sek, salary_monthly_sek, remote_ratio, company_size, salary_level
--I did this but I didn't update the columns 
--f) How many percentage of the jobs are fully remote, 50 percent remote and fully not remote.
SELECT
    ROUND(100.0 * SUM(remote_ratio = 0) / COUNT(*), 2) AS not_remote_precent,
    ROUND(100.0 * SUM(remote_ratio = 50) / COUNT(*), 2) AS half_remote_precent,
    ROUND(100.0 * SUM(remote_ratio = 100) / COUNT(*), 2) AS fully_remote_precent
FROM
    cleaned_salaries;

--g) Pick out a job title of interest and figure out if company size affects the salary. Make a simple analysis as a comprehensive one requires causality investigations which are much harder to find.
-- h) Feel free to explore other things