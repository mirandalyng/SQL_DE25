DESC staging.sweden_holidays; 

FROM
    staging.sweden_holidays
LIMIT
    5;

--YYYY-MM--DD

--addition 

--addition , subtraction
SELECT
    date,
    date + INTERVAL 5 DAY AS plus_5_days,
    typeof(plus_5_days) AS plus_5_days_type, 
    date - interval 5 day AS minus_5_days 
FROM
    staging.sweden_holidays;


--date dunctions
select today(); 

select today() as today, 
date - today as time_after_holiday, 
* 
from 
    staging.sweden_holidays; 

--pick out weekday 
select 
    date, dayname(date) as weekday
from staging.sweden_holidays;

--latest from two dates 
select 
    *, 
    today() as today, 
    greatest(date, today) as later_day 
from staging.sweden_holidays; 

--convert date to string 
select 
    date,
    strftime(date, '%d/%m/%Y') as date_string, 
    typeof(date_string)
from staging.sweden_holidays; 

--convert string to date 
select 
    date, 
    strftime(date, '%d/%m/%Y') as date_string, 
    strptime(date_string, '%d/%m/%Y')::DATE as new_date, 
    typeof(new_date)
from staging.sweden_holidays; 