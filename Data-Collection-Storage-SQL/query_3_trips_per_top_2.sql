/*For November 1-7, 2017, the most popular taxi companies were Flash Cab and
Taxi Affiliation Services. Find the number of rides for these two companies
and name the resulting variable trips_amount. Join the rides for all other
companies in the group "Other."*/
SELECT CASE
    WHEN cabs.company_name NOT LIKE 'Flash Cab' AND cabs.company_name NOT LIKE 'Taxi Affiliation Services' THEN 'Other'
    ELSE cabs.company_name
    END AS company,
    COUNT(trips.start_ts) AS trips_amount
FROM cabs
JOIN trips ON trips.cab_id = cabs.cab_id
WHERE CAST(trips.start_ts AS date) BETWEEN '2017-11-01' AND '2017-11-07'
GROUP BY company
ORDER BY trips_amount;
