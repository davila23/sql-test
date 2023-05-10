--  For each sensor/event type pair a row containing the delta value between the most recent event and the event just prior.


INSERT INTO Events (SensorId, EventType, Value, Time) 
VALUES 
(23476234, 0, 4.33, '2013-01-07 15:31:37'),
(238746238, 1, 2.7, '2013-01-07 15:32:05'),
(23476234, 6, 9.2, '2013-01-07 15:32:26'),
(2367498, 0, 4.3, '2013-01-07 15:32:56'),
(23476234, 0, 8.44, '2013-01-07 15:33:17'),
(2367498, 0, 5.34, '2013-01-07 15:33:41');


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