-- Ищем покупателей, сумма покупок которых превыщает 10'000

SELECT 
    UserID,
    SUM(Rub) AS Revenue
FROM
  checks
GROUP BY
  UserID
HAVING Revenue > 10000
ORDER BY
  UserID DESC
LIMIT 10