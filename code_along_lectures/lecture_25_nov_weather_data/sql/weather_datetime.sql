/* 
## Task 2
What are the data TYPES of the following COLUMNS:
- sunriseTime
- sunsetTime 
- temperatureHighTime 
- temperatureLowTime 
- windGustTime 
- precipIntensityMaxTime 
 */
--TYPE OF
SELECT
    typeof (sunriseTime),
    typeof (sunsetTime),
    typeof (temperatureHighTime),
    typeof (temperatureLowTime),
    typeof (windGustTime),
    typeof (precipIntensityMaxTime)
FROM
    staging.weather;

--Debbies solution
--with DESC 
DESC
SELECT
    sunriseTime,
    sunsetTime,
    temperatureHighTime,
    temperatureLowTime,
    windGustTime,
    precipIntensityMaxTime
FROM
    staging.weather
    ---------------------------------------------------------------------------
    /* 
    ## Task 3
    SHOW the number of records / ROWS FOR each combination of Country / Region
    AND Province / State.How many records are there FOR each combination ? IN the following tasks,
    ANALYZE ONLY records IN Sweden.
     */
SELECT
    "Country/Region" AS Country,
    "Province/State" AS State,
    count("Country/Region") AS counted_regions,
    count("Province/State") AS counted_states
FROM
    staging.weather
GROUP BY
    Country,
    State
    /* 
    Task 3 Debbies solution 
    
    -- each row in the dataset contains weather data 
    --for each combination of Country/Regrion 
    --Province/State and date (time-column)
    --it's important to understand which columns 
    --can be used to uniqe identify each row 
    --use aggregation function toghether with group by 
     */
SELECT
    "Country/Region" AS Country,
    "Province/State" AS State,
    COUNT(*) AS Nr_Records,
FROM
    staging.weather
GROUP BY
    Country,
    State
ORDER BY
    Country,
    State
    ---------------------------------------------------------------------------
    /*
    ## Task 4
    SHOW the COLUMNS below AS TIMESTAMP (WITH TIME ZONE) data TYPE
    AND WITH the timezone IN Sweden: 
    - sunriseTime 
    - sunsetTime 
     */
SELECT
    "Country/Region",
    to_timestamp (sunriseTime) AS sunrise_time,
    to_timestamp (sunsetTime) AS sunset_time,
    typeof (to_timestamp (sunsetTime)) AS sunset_type,
    typeof (to_timestamp (sunriseTime)) AS sunrise_type
FROM
    staging.weather
WHERE
    "Country/Region" = 'Sweden'
    --Task 3 Debbies solution
SELECT
    "Country/Region",
    to_timestamp (sunriseTime) AS sunrise_utc,
    to_timestamp (sunriseTime) AT TIME ZONE 'Europe/Stockholm' AS sunrise_swetime,
    to_timestamp (sunsetTime) AS sunset_utc,
FROM
    staging.weather
WHERE
    "Country/Region" = 'Sweden'
    /* ##
    Task 4
    SHOW the COLUMNS below AS TIMESTAMP (WITH TIME ZONE) data TYPE
    AND WITH the timezone IN Sweden:
    - sunriseTime 
    - sunsetTime 
     */
SELECT
    "Country/Region",
    to_timestamp (sunriseTime) AS sunrise_utc,
    to_timestamp (sunriseTime) AT TIME ZONE 'Europe/Stockholm' AS sunrise_swetime,
    to_timestamp (sunsetTime) AS sunset_utc,
FROM
    staging.weather
WHERE
    "Country/Region" = 'Sweden'
    --the new year and months columns incolves subtractning part of timestamp 
    --to pick up the date with the largest gap within a month involves the use 
    --of aggregation function 
    --the gap can be calculated directly in unixtime 
SELECT
    "Country/Region",
    to_timestamp (sunriseTime) AS sunrise_time,
    to_timestamp (sunsetTime) AS sunset_time,
    extract(
        'year'
        FROM
            sunrise_time
    ) AS year,
    extract(
        'month'
        FROM
            sunrise_time
    ) AS MONTH,
    --monthname(sunset_time) as month
FROM
    staging.weather
WHERE
    "Country/Region" = 'Sweden';

--with date_part 
SELECT
    date_part ('year', to_timestamp (sunriseTime)) AS year,
    date_part ('month', to_timestamp (sunsetTime)) AS MONTH,
    to_timestamp (MAX(sunriseTime)),
    to_timestamp (MAX(sunsetTime)),
    --calculate from UNIX 
    --devide by 3600 (to tansform to show the gap in hours)
    ROUND(MAX(sunsetTime - sunriseTime) / 3600, 2) AS gap_in_hours,
FROM
    staging.weather
WHERE
    "Country/Region" = 'Sweden'
GROUP BY
    year,
    MONTH
ORDER BY
    year,
    MONTH;

-- task 6 
SELECT
    to_timestamp (windGustTime) AS time_stamp_mosty_windy,
    --you can also use date_part 
    extract(
        'hour'
        FROM
            time_stamp_mosty_windy
    ) AS most_windy_hour,
    CONCAT (
        'It''s dangerous to use the crane at kl. ',
        most_windy_hour,
        '.'
    )
FROM
    staging.weather
WHERE
    "Country/Region" = 'Sweden';

-- task 6 
SELECT
    to_timestamp (windGustTime) AS time_stamp_mosty_windy,
    --strftime() - string format time , transforms timestamp to string
    --use the format, like '%H' to design the presentation
    --strptime() - string parse time, transform string to timestamp
    strftime (time_stamp_mosty_windy, '%H') AS most_windy_hour,
    CONCAT (
        'It''s dangerous to use the crane at kl. ',
        most_windy_hour
    )
FROM
    staging.weather
WHERE
    "Country/Region" = 'Sweden';