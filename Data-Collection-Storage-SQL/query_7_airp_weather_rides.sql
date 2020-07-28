/*Retrieve from the trips table all the rides that started in the Loop
and ended at O'Hare on a Saturday. Get the weather conditions for each ride.
Use the method you applied in the previous task. Also retrieve the duration of
each ride. Ignore rides for which data on weather conditions is not available.*/

SELECT
    t1.start_ts AS start_ts, t1.weather_conditions, t1.duration_seconds
FROM (
    SELECT DATE_TRUNC('hour',ts) as ts,
        CASE
        WHEN description LIKE '%rain%' OR description LIKE '%storm%' THEN 'Bad'
        ELSE 'Good'
        END AS weather_conditions,
        t.start_ts AS start_ts,
        t.duration_seconds AS duration_seconds,
        t.pickup_location_id AS pickup,
        t.dropoff_location_id AS dropoff
    FROM weather_records w
    JOIN trips t ON DATE_TRUNC('hour',t.start_ts) = w.ts
    JOIN neighborhoods n ON n.neighborhood_id = t.pickup_location_id
    WHERE w.description IS NOT NULL) AS t1
WHERE
    pickup = 50 AND dropoff = 63 AND EXTRACT(ISODOW FROM t1.start_ts) = 6
ORDER BY start_ts
