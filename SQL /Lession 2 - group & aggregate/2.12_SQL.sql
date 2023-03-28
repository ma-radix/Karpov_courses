--Смотрим, как изменилось среднее, минимальное и максимальное количество купленного товара в стране с наибольшей выручкой в течение последних месяцев.

SELECT 
    AVG(Quantity) AS AvgQuantity,
    MIN(Quantity) AS MinQuantity,
    MAX(Quantity) AS MaxQuantity,
    toStartOfMonth(InvoiceDate) AS InvoiceMonth -- округляем дату до начала месяца
FROM retail
WHERE
        Quantity > 0 -- убираем строки с "минусовыми" товарами
    AND
        Description != 'Manual' -- убираем строки с удалёнными товарами
    AND
        Country = 'United Kingdom' -- смотрим только стрвну с наибольшей выручкой
GROUP BY
    InvoiceMonth
ORDER BY AvgQuantity DESC
LIMIT 20