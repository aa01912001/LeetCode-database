Problem: 197. Rising Temperature
Difficulty: Easy

## Problem Description
Table: `Weather`
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the primary key for this table.
This table contains information about the temperature on a certain day.
```

Write an SQL query to find all dates' `Id` with higher temperatures compared to its previous dates (yesterday).

Return the result table in **any order**.

The query result format is in the following example.

**Example 1:**
```
Input: 
Weather table:
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+
Output: 
+----+
| id |
+----+
| 2  |
| 4  |
+----+
Explanation: 
In 2015-01-02, the temperature was higher than the previous day (10 -> 25).
In 2015-01-04, the temperature was higher than the previous day (20 -> 30).
```

## Thinking
We can use following query to compare `Weather` table itself.

```sql!
SELECT
    w1.id
FROM
    Weather AS w1, Weather AS w2
```

In where condition, we use DATEDIFF function to find out yesterday of a certain date.

```sql!
WHERE
    w1.temperature > w2.temperature
AND DATEDIFF(w1.recordDate, w2.recordDate) = 1;
```