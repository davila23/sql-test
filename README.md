# sql-test
SQL Test
Time Limit: One Hour

Imagine a network of N sensors sending events back to a reporting database.
There are many types of events.  Each can be represented by a tuple of sensor ID, event type, value, time stamp.
The database table that collects the events has the following structure:
 
CREATE TABLE Events
(
SensorId BIGINT,
EventType INT,
Value FLOAT,
Time TIMESTAMP
);
 
Below is some example data:
 
SensorId   EventType Value      Time
23476234   0         4.33       2013-01-07 15:31:37
238746238  1         2.7        2013-01-07 15:32:05
23476234   6         9.2        2013-01-07 15:32:26
2367498    0         4.3        2013-01-07 15:32:56
23476234   0         8.44       2013-01-07 15:33:17
2367498    0         5.34       2013-01-07 15:33:41
 
Using ANSII compatible SQL, write queries that produce the following result sets:
 
1.       For each sensor a row containing the number of events reported over the most recent 24 hour time span.


2.       For each sensor the most recent value reported for each event type.



3.       For each sensor/event type pair a row containing the delta value between the most recent event and the event just prior.



4.       For each event type a row containing sensor ID and value for each value that is more than two standard deviations from the mean for that event type.

Here “two standard deviations” is understood as two values away from the mean. So for example, in the EventType=0, we have the values:    4.3, 4.33, 5.34, 8.44.  
If we insert the mean ( 5.6)   in the list, we have:   4.3, 4.33, 5.34, 5.6, 8.44.  
Therefore, 
8.44 is 1 STDV from 5.6
5.34 is 1 STDV from 5.6
4.33 is 2 STDV from 5.6
4.3 is 3 STDV from 5.6
And so the answer for EventType 0 is 4.33.  

The query that would give us such calculations would be:

5.       The same as 3 but only over the most recent 24 hour time span.

To the last query, we can simply add the clause at the very end:

..finalset.Time >  (select  DATEADD(hour,-24,max(Time))
 from Events)


6.       What method would you use to see what execution plan your code is using?


7.       What methodology do you use to ensure your code is as efficient and scalable as possible? 


--------


NOTE: first run setup.sql, then you can run 1 by 1 the queries located in /src/exercise-n
