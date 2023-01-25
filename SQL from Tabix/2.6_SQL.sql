--Смотрим динамику трат клиентов, для этого считаем минимальный, средний и максимальный чеки в разбивке по датам.

SELECT 
    BuyDate,
    MIN(Rub) AS MinCheck,
    MAX(Rub) AS MaxCheck,
    AVG(Rub) AS AvgCheck
FROM checks
GROUP BY 
    BuyDate
ORDER BY 
    BuyDate DESC
LIMIT 10