--tast 2 
select
    title,
    regexp_replace (lower(trim(title)), '_', ' ', 'g') as clean_title,
from
    staging.squad;

SELECT
    title,
    context
from
    staging.squad
where
    not regexp_matches (context, title);

update staging.squad
SET
    title = regexp_replace (lower(trim(title)), '_', ' ', 'g'),
    context = regexp_replace (lower(trim(context)), '_', ' ', 'g')
WHERE
    title IN title
    and context IN context;

--task 3
SELECT
    context,
    title
from
    staging.squad
WHERE
    context LIKE title || '%';

/* 
debbies solution 
get the position the substring appears in 
add NOT and get the 0 
--task 2 
 */
select
    title,
    context,
    INSTR (context, title)
from
    staging.squad
where
    not regexp_matches (context, title);

--task 3
SELECT
    *
FROM
    staging.squad
WHERE
    context LIKE CONCAT (title, '%');

--if you use regular expression fuction _ will be a literal character 
SELECT
    *
FROM
    staging.squad
WHERE
    regexp_matches (context, CONCAT ('^', title));

--task 4 
--two key values text and [] , answer start that matches with a value 
--create a new (not to the table but  show in the result) which is the first answer from the AI model
--without pattern matching or regular expression 

SELECT 
  answers[18:], --slicing from 18
  answers[18], --indexing 
  --identifying empty answers 
  CASE 
    WHEN answers[18] = ',' THEN NULL 
    ELSE answers[18:] 
    END AS striped_answers, 
    --identifying the position of the first '
    INSTR(striped_answers,'''') AS first_quotation_index, -- a single quotation needs to be typed as ''
    striped_answers[:first_quotation_index -1] as first_answer,
    answers
FROM 
  staging.squad; 

--task 5 
--generate the same result as task 4 but 
--using pattern matching 
SELECT 
  --regexp extract 
  regexp_extract(answers, '''([^'']+)'',') AS first_answer,
  
  answers
FROM staging.squad; 

