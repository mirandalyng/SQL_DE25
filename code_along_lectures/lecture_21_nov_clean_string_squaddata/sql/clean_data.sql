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