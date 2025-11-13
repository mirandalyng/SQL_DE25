/* want to delete bad jokes 
and to make sure which to delete 
do a select first to 
double check the rows */
SELECT
    *
FROM
    funny_jokes
WHERE
    rating < 5;

/* Deleting it  */
DELETE FROM funny_jokes
WHERE
    rating < 5;