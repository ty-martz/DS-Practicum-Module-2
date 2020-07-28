/*For each hour, retrieve the weather condition records from the
weather_records table. Using the CASE operator, break all hours into two
groups: "Bad" if the description field contains the words '"rain" or "storm,"
and "Good" for others*/

SELECT DATE_TRUNC('hour',ts) as ts, CASE
    WHEN description LIKE '%rain%' OR description LIKE '%storm%' THEN 'Bad'
    ELSE 'Good'
    END AS weather_conditions
FROM weather_records
