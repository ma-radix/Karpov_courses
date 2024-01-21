--количество покупок плюс сумма покупок в рублях

SELECT 
    UserID,
    count(UserID) AS NumChecks,
    SUM(Rub) AS Revenue
FROM
  checks
GROUP BY
  UserID
ORDER BY
  Revenue DESC
LIMIT 10