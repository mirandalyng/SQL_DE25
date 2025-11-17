--sort salary in usd in ascending order 
-- BY DEFAULT 
SELECT
    *
FROM
    data_jobs
ORDER BY
    salary_in_usd;

--sort salary in usd in DESCENDING order 
-- adding desc 
SELECT
    *
FROM
    data_jobs
ORDER BY
    salary_in_usd DESC;

-- sort by salary in usd DESC and emloyee_resiident ASC
SELECT
    *
FROM
    data_jobs
ORDER BY
    salary_in_usd DESC,
    employee_residence ASC;