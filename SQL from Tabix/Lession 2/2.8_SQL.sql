--Находим страны с наибольшей выручкой

SELECT
    Country,
    SUM(UnitPrice * Quantity) AS Revenue -- количество проданного товара умножаем на его цену и сумируем по странам
FROM retail
GROUP BY Country
ORDER BY Country DESC
LIMIT 20