SELECT
    user_id, ROUND(AVG(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END), 2) AS confirmation_rate
FROM
    Signups
LEFT JOIN
    Confirmations
USING (user_id)
GROUP BY user_id;