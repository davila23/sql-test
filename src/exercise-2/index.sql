-- For each sensor the most recent value reported for each event type

SELECT e.SensorId, e.EventType, e.Value
FROM Events e
INNER JOIN (
    SELECT SensorId, EventType, MAX(Time) AS MaxTime
    FROM Events
    GROUP BY SensorId, EventType
) em ON e.SensorId = em.SensorId AND e.EventType = em.EventType AND e.Time = em.MaxTime
ORDER BY e.SensorId, e.EventType;