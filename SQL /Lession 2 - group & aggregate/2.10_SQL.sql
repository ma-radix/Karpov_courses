--Считаем выручку по месяцам, чтобы понятьь её динамику

SELECT 
    toStartOfMonth(InvoiceDate) AS InvoiceMonth, --Округление даты к началу месяца (к 1-му числу) P.S. Прикольная штука:)
    SUM(UnitPrice * Quantity) AS Revenue -- Считаем общую выручку, умножая количество товара на его цену
FROM retail
WHERE Description != 'Manual'
GROUP BY InvoiceMonth
ORDER BY Revenue DESC 
LIMIT 20