--  For each sensor/event type pair a row containing the delta value between the most recent event and the event just prior.


SELECT e1.SensorId, e1.EventType, e1.Value - e2.Value AS DeltaValue
FROM Events e1
INNER JOIN Events e2 ON e1.SensorId = e2.SensorId 
                      AND e1.EventType = e2.EventType 
                      AND e1.Time > e2.Time
LEFT JOIN Events e3 ON e1.SensorId = e3.SensorId 
                      AND e1.EventType = e3.EventType 
                      AND e3.Time > e2.Time 
                      AND e3.Time < e1.Time
WHERE e3.SensorId IS NULL
AND e1.Value > e2.Value