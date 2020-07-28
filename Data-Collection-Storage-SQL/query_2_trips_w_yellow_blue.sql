/*Find the number of rides for every taxi company whose name contains the
words "Yellow" or "Blue" for November 1-7, 2017.*/
SELECT
    cabs.company_name AS company_name,
    COUNT(trips.start_ts) AS trips_amount
FROM
    cabs
JOIN
    trips ON trips.cab_id = cabs.cab_id
WHERE
    (cabs.company_name LIKE '%Yellow%' OR cabs.company_name LIKE '%Blue%') AND
    CAST(trips.start_ts AS date) BETWEEN '2017-11-01' AND '2017-11-07'
GROUP BY
    cabs.company_name
ORDER BY
    trips_amount DESC;
