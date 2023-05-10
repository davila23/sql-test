-- For each sensor a row containing the number of events reported over the most recent 24 hour time span.

SELECT SensorId, COUNT(*) AS NumEvents
FROM Events
WHERE Time >= datetime('now', '-1 day')
GROUP BY SensorId
ORDER BY NumEvents DESC;