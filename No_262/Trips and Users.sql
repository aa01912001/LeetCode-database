SELECT
    notBannedTotal.request_at AS Day,  ROUND((notBannedTotal.total-COALESCE(completedTotal.total, 0))/notBannedTotal.total, 2) AS 'Cancellation Rate'
FROM
    (
        SELECT
             sum(1) AS total, request_at
        FROM
            Trips AS t
        JOIN Users AS u1 ON (t.client_id = u1.users_id)
        JOIN Users AS u2 ON (t.driver_id = u2.users_id) 
        WHERE NOT((u1.role = 'client' AND u1.banned = 'yes') OR (u2.role = 'driver' AND u2.banned = 'yes'))
        AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
        GROUP BY request_at
    ) AS notBannedTotal
LEFT JOIN
    (
        SELECT
             sum(1) AS total, request_at
        FROM
            Trips AS t
        JOIN Users AS u1 ON (t.client_id = u1.users_id)
        JOIN Users AS u2 ON (t.driver_id = u2.users_id) 
        WHERE NOT((u1.role = 'client' AND u1.banned = 'yes') OR (u2.role = 'driver' AND u2.banned = 'yes')) 
        AND t.status = 'completed'
        AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
        GROUP BY request_at
    ) AS completedTotal
ON 
(notBannedTotal.request_at = completedTotal.request_at);