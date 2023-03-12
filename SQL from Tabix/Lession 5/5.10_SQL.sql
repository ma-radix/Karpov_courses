-- распередляем покупателей на сегменты A-D по среднему чеку

SELECT
    UserID,
    AVG(Rub) AS avg_rub,
    CASE
        WHEN AVG(Rub) < 5 THEN 'A' -- если средний чек меньше 5 рублей, записать в новый столбец "А"
        WHEN AVG(Rub) >= 5 AND AVG(Rub) < 10 THEN 'B'
        WHEN AVG(Rub) >= 10 AND AVG(Rub) < 20 THEN 'C'
        WHEN AVG(Rub) >= 20 THEN 'D'
    END AS user_segment -- назвать новый столбец user_segment
FROM checks
GROUP BY UserID
ORDER BY UserID ASC
LIMIT 20