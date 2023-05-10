--  For each event type a row containing sensor ID and value for each value that is more than two standard deviations from the mean for that event type.

/* Here “two standard deviations” is understood as two values away from the mean. So for example, in the EventType=0, we have the values:    4.3, 4.33, 5.34, 8.44.  
If we insert the mean ( 5.6)   in the list, we have:   4.3, 4.33, 5.34, 5.6, 8.44.  
Therefore, 
8.44 is 1 STDV from 5.6
5.34 is 1 STDV from 5.6
4.33 is 2 STDV from 5.6
4.3 is 3 STDV from 5.6
And so the answer for EventType 0 is 4.33.  */


SELECT e.SensorId, e.EventType, e.Value
FROM Events e
INNER JOIN (
SELECT EventType, AVG(Value) AS MeanValue, STDEV(Value) AS StdDevValue
FROM Events
GROUP BY EventType
) agg ON e.EventType = agg.EventType
WHERE ABS(e.Value - agg.MeanValue) > 2 * agg.StdDevValue
AND e.Value > 0;
