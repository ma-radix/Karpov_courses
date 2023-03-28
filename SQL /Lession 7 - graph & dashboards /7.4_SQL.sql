-- Рисуем динамику изменения числа активных пользователей в месяц по трём странам

SELECT
    Country,
    COUNT(DISTINCT CustomerID) AS count_users,
    toStartOfMonth(CAST(InvoiceDate AS Date)) AS month
FROM default.retail
WHERE Country IN ('United Kingdom', 'Australia', 'Netherlands')
GROUP BY Country, month