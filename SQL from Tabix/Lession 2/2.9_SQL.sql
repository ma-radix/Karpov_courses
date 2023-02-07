-- ищем среднее количество купленных товаров и и среднюю цену купленного товара в разбивке по странам

SELECT
    Country,
    AVG(Quantity) AS avg_quantity,
    AVG(UnitPrice) AS avg_price
FROM retail
WHERE Description != 'Manual' -- отфильтровываем строки с удалёнными товарами
GROUP BY Country
ORDER BY avg_price DESC
LIMIT 20