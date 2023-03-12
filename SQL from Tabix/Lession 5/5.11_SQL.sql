--считаем, сколько доходов приносит каждый сегмент и сколько клиентов в нём

SELECT 
    user_segment,
    sum(ch.Rub) AS sum_rub,
    count(us.UserID) AS count_users
FROM (
    SELECT
        UserID,
        CASE
            WHEN AVG(Rub) < 5 THEN 'A'
            WHEN AVG(Rub) >= 5 AND AVG(Rub) < 10 THEN 'B'
            WHEN AVG(Rub) >= 10 AND AVG(Rub) < 20 THEN 'C'
            WHEN AVG(Rub) >= 20 THEN 'D'
        END AS user_segment
    FROM checks
    GROUP BY UserID
) as us
JOIN checks as ch
USING UserID

GROUP BY user_segment
ORDER BY sum_rub DESC
LIMIT 20