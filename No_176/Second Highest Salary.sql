SELECT IFNULL(
   (SELECT
        salaryRank.SecondHighestSalary
    FROM (
        SELECT
            salary AS SecondHighestSalary,
            DENSE_RANK() OVER(ORDER BY salary DESC) rank_number
        FROM 
            Employee

    ) AS salaryRank
    WHERE salaryRank.rank_number = 2
    LIMIT 1)
, NULL) AS SecondHighestSalary