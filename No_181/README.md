題號: 181. Employees Earning More Than Their Managers
難度: Easy

## Problem Description
Table: `Logs`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| salary      | int     |
| managerId   | int     |
+-------------+---------+
id is the primary key column for this table.
Each row of this table indicates the ID of an employee, their name, salary, and the ID of their manager.
```

Write an SQL query to find the employees who earn more than their managers.

Return the result table in any **order**.

The query result format is in the following example.

**Example 1:**
```
Input: 
Employee table:
+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |
| 4  | Max   | 90000  | Null      |
+----+-------+--------+-----------+
Output: 
+----------+
| Employee |
+----------+
| Joe      |
+----------+
Explanation: Joe is the only employee who earns more than his manager.
```

## Thinking
In this problem, we can select from two same tables `Employee` and assign different alias `e1` and `e2` to them. Now, we can easily get target salary by following conditions:

`e1.salary > e2.salary AND e2.id = e1.managerId`
