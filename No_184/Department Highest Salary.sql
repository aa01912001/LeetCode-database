SELECT
    dName AS Department, eName AS Employee, salary AS Salary
FROM (
    SELECT 
        e.name AS eName, 
        e.salary, 
        d.name AS dName, 
        RANK() OVER (PARTITION BY d.id ORDER BY e.salary DESC) AS salary_rank
    FROM
        Employee AS e
    JOIN 
        Department AS d
    ON (e.departmentId = d.id)
) highestSalaryEmployee
WHERE
    salary_rank = 1;