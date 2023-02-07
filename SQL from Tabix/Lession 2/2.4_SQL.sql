--количество покупок на каждого клиента

SELECT
  UserID,
  count(UserID) AS NumChecks
FROM
  checks
GROUP BY
  UserID
  ORDER BY
  NumChecks DESC
LIMIT 10