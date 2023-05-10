--- 5.       The same as 3 but only over the most recent 24 hour time span.

SELECT e1.SensorId, e1.EventType, e1.Value - e2.Value AS DeltaValue
FROM Events e1
INNER JOIN Events e2 ON e1.SensorId = e2.SensorId AND e1.EventType = e2.EventType AND e1.Time = (
    SELECT MAX(Time)
    FROM Events
    WHERE SensorId = e1.SensorId AND EventType = e1.EventType AND Time < e1.Time AND Time >= DATEADD(hour, -24, GETDATE())
) AND e2.Time >= DATEADD(hour, -24, GETDATE());
