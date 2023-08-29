SELECT DISTINCT
    pids.product_id, COALESCE(pd.price, 10) AS price
FROM
    (
        SELECT DISTINCT
            product_id
        FROM
            Products
    ) pids
LEFT JOIN
    (
        SELECT
            product_id,
            FIRST_VALUE(new_price) OVER(PARTITION BY product_id ORDER BY change_date DESC) AS price
        FROM Products
        WHERE
            change_date <= '2019-08-16'
    ) pd
ON (pids.product_id = pd.product_id);