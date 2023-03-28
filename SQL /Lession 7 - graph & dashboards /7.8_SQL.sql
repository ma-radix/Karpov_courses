-- Смотрим, сколько товаров пользователи добавляют в корзину в разных странах

SELECT
    Country,
    AVG(sumQuantity) AS avgQuantity
FROM (
    SELECT
        Country,
        SUM(Quantity) AS sumQuantity,
        InvoiceNo
    FROM default.retail
    WHERE Quantity > 0
    GROUP BY InvoiceNo, Country
    )
GROUP BY Country