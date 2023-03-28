-- Смотрим, какой пользователь в Нидердландах купил больше всего товаров 

SELECT
    CustomerID,
    SUM(Quantity) AS sumQuantity
FROM default.retail
WHERE Quantity > 0 AND Country = 'Netherlands'
GROUP BY CustomerID
ORDER BY sumQuantity DESC

-- P.S. Долбанутый какой-то пользователь:))