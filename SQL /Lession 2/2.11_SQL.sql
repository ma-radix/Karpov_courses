--Смотрим среднюю выручку от покупателей, в среднем покупающих дорогие товары

SELECT 
   AVG(UnitPrice) AS AvgUnitPrice,
   CustomerID,
   toStartOfMonth(InvoiceDate) AS InvoiceMonth -- округляем дату до начала месяца
FROM retail 
WHERE Description != 'Manual' -- отфильтровываем удалённые позиции
GROUP BY 
    CustomerID,
    InvoiceMonth
HAVING InvoiceMonth = '2011-03-01'
ORDER BY AvgUnitPrice DESC 
LIMIT 20