/* Print the company_name field. Find the number of taxi rides for each taxi
company for November 15-16, 2017, name the resulting field trips_amount,
and print it, too. Sort the results by the trips_amount field in descending
order. */
SELECT
    cabs.company_name AS company_name,
    COUNT(trips.start_ts) AS trips_amount
FROM
    cabs
JOIN
    trips ON trips.cab_id = cabs.cab_id
WHERE
    CAST(trips.start_ts AS date) BETWEEN '2017-11-15' AND '2017-11-16'
GROUP BY
    cabs.company_name
ORDER BY
    trips_amount DESC;
