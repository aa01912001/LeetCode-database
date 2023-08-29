Problem: 1164. Product Price at a Given Date
Difficulty: Medium

## Problem Description
Table: `Products`
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| new_price     | int     |
| change_date   | date    |
+---------------+---------+
(product_id, change_date) is the primary key of this table.
Each row of this table indicates that the price of some product was changed to a new price at some date.
```

Write an SQL query to find the prices of all products on `2019-08-16`. Assume the price of all products before any change is `10`.

Return the result table in **any order**.

The query result format is in the following example.

**Example 1:**
```
Input: 
Products table:
+------------+-----------+-------------+
| product_id | new_price | change_date |
+------------+-----------+-------------+
| 1          | 20        | 2019-08-14  |
| 2          | 50        | 2019-08-14  |
| 1          | 30        | 2019-08-15  |
| 1          | 35        | 2019-08-16  |
| 2          | 65        | 2019-08-17  |
| 3          | 20        | 2019-08-18  |
+------------+-----------+-------------+
Output: 
+------------+-------+
| product_id | price |
+------------+-------+
| 2          | 50    |
| 1          | 35    |
| 3          | 10    |
+------------+-------+
```

## Thinking
Firstly, we try to get all `product_id` using `SELECT DISTINCT` and left join the following result:

We use window function `FIRST_VALUE` to get the latest price before 2019-08-16.

```sql
SELECT
    product_id,
    FIRST_VALUE(new_price) OVER(PARTITION BY product_id ORDER BY change_date DESC) AS price
FROM Products
WHERE
    change_date <= '2019-08-16'
```

After left join above two results, we can use `COALESCE` to determine whether a product_id doesn't have a row before 2019-08-16 and get final price.