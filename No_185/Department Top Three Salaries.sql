SELECT
    Department, Employee, Salary
FROM (
    SELECT
        e.name AS Employee, 
        e.salary AS Salary, 
        d.name AS Department,
        DENSE_RANK() OVER(PARTITION BY d.id order by e.salary desc) salary_rank
    FROM
        Employee AS e
    JOIN
        Department AS d
    ON (e.departmentId = d.id)
) AS rankedResult
WHERE
    salary_rank <= 3;