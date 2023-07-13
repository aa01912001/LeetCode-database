Problem: 176. Second Highest Salary
Difficulty: Medium

## Problem Description
Table: `Employee`
```
+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key column for this table.
Each row of this table contains information about the salary of an employee.
```

Write an SQL query to report the second highest salary from the `Employee` table. If there is no second highest salary, the query should report `null`.

The query result format is in the following example.

**Example 1:**
```
Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
```

## Thinking
Firstly, we use `DENSE_RANK` to get the rank sequence for each employee along with their salary. Next, we just need to select  salary where his rank number equals to 2 from the result we just got.

**Notice**: because there might be some employees having same salary, we have to use `LIMIT 1` to get only one result.
