WITH a2 AS (
    SELECT 
           player_id, MIN(event_date) AS event_date
    FROM
        Activity
    GROUP BY player_id
)

SELECT 
    ROUND(COUNT(a1.player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM
    Activity AS a1, a2
WHERE
    a2.player_id = a1.player_id
AND a1.event_date 
AND DATE_ADD(a2.event_date, INTERVAL 1 DAY) = a1.event_date;