-- Рисуем, как менялась средняя сумма заказа в конкретных странах по месяцам

SELECT 
    Country,
    AVG(TotalPriceSum) AS avgPrice,
    Month
FROM (
    SELECT
        Country,
        SUM(Quantity * UnitPrice) AS TotalPriceSum,
        InvoiceNo,
        toStartOfMonth(CAST(InvoiceDate AS Date)) AS Month
    FROM default.retail
    WHERE Quantity > 0 
        AND Country IN 
        ('United Kingdom', 'Germany', 'France', 'Spain', 'Netherlands', 'Belgium', 'Switzerland', 'Portugal', 'Australia', 'USA')
    GROUP BY InvoiceNo, Country, Month
    )
GROUP BY Country, Month