Problem: 180. Consecutive Numbers
Difficulty: Medium

## Problem Description
Table: `Logs`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
id is the primary key for this table.
id is an autoincrement column.
```

Write an SQL query to find all numbers that appear at least three times consecutively.

Return the result table in **any order**.

The query result format is in the following example.

**Example 1:**
```
Input: 
Logs table:
+----+-----+
| id | num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+
Output: 
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
Explanation: 1 is the only number that appears consecutively for at least three times.
```

## Thinking
Here we can use `LEAD` function to get next two column values of two rows in the rear of a certain column. So, we store this result for each row as `threeContinuousNums` using `WITH AS`. And finally we get the distinct **num** from `threeContinuousNums` where three numbers in same row are the same.
