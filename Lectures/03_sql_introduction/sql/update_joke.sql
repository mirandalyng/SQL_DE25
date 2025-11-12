/* updates the rating of the joke on id 7 */
UPDATE funny_jokes
SET
    rating = 10
WHERE
    id = 7;

/* after updating the joke id 7 */
SELECT
    *
FROM
    funny_jokes
WHERE
    id = 7;