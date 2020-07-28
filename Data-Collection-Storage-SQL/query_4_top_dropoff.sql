/*Find out where rides most often end. Find the average daily number of
drop-offs in each Chicago neighborhood in the month that we have data for
(November 2017)*/
SELECT
    t1.dropoff_location_name AS dropoff_location_name, AVG(t1.cnt) AS average_trips
FROM
    (
    SELECT n.name AS dropoff_location_name,
    COUNT(t.end_ts) AS cnt,
    EXTRACT(DAY FROM t.end_ts) AS day
    FROM trips t
    JOIN
         neighborhoods n ON n.neighborhood_id = t.dropoff_location_id
    GROUP BY
         day, dropoff_location_name
    ) AS t1
GROUP BY
    dropoff_location_name
ORDER BY
    average_trips DESC;
