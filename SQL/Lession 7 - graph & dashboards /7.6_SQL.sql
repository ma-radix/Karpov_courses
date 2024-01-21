-- Смотрим среднюю сумму заказа по каждой из стран

SELECT 
    Country,
    AVG(TotalPriceSum) AS avgPrice
FROM (
    SELECT
        Country,
        SUM(Quantity * UnitPrice) AS TotalPriceSum,
        InvoiceNo
    FROM default.retail
    WHERE Quantity > 0
    GROUP BY InvoiceNo, Country
    )
GROUP BY Country