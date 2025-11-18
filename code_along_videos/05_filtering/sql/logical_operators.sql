SELECT
    job_title,
    experience_level,
    --Want the salary in SEK 
    ROUND((9.44 * salary_in_usd) / 12) AS salary_sek_mounth
FROM
    data_jobs
    --Filter the salary 
WHERE
    (salary_sek_mounth > 200000)
    AND (salary_sek_mounth < 300000)
    --order by DESCENTING
ORDER BY
    salary_sek_mounth DESC;

--------------------------------------------
--BETWEEN 
--AND operator 
SELECT
    job_title,
    experience_level,
    --Want the salary in SEK 
    ROUND((9.44 * salary_in_usd) / 12) AS salary_sek_mounth
FROM
    data_jobs
    --Filter the salary 
WHERE
    salary_sek_mounth BETWEEN 200000 AND 300000
    --order by DESCENTING
ORDER BY
    salary_sek_mounth DESC;

--------------------------------------------
--OR operator 
SELECT
    COUNT(*)
FROM
    data_jobs
WHERE
    experience_level = 'Senior level'
    OR experience_level = 'Expert level';

--------------------------------------------
--NOT operator
SELECT
    COUNT(*)
FROM
    data_jobs
WHERE
    NOT (
        experience_level = 'Senior level'
        OR experience_level = 'Expert level'
    );