-- Рисуем динамику изменения числа активных пользователей в месяц по всем странам, кроме Великобритании (потому что у неё слишком много и остальных не видно:))

SELECT
    Country,
    COUNT(DISTINCT CustomerID) AS count_users,
    toStartOfMonth(CAST(InvoiceDate AS Date)) AS month
FROM default.retail
WHERE Country != 'United Kingdom'
GROUP BY Country, month