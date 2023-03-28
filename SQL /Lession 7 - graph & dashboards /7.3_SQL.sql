-- строим барчарт (гистограммки на каждого) количества польнователей на страну. Как прикрепить график пока не поняла:(

SELECT 
    COUNT(DISTINCT CustomerID) AS count_users,
    Country
FROM default.retail
GROUP BY Country
ORDER BY Country ASC

-- Поняла, прикорепила отдельной фоткой к папке:)