/*Retrieve the identifiers of the O'Hare and Loop neighborhoods
from the neighborhoods table.*/

SELECT * FROM neighborhoods
WHERE
    name LIKE '%Hare' OR name LIKE 'Loop'
