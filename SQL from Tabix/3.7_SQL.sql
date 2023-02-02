-- Смотрим на общую выручку, минимальный, максимальный и средний чек по источникам

SELECT 
    i.Source,
    MIN (Rub),
    MAX(Rub),
    AVG(Rub),
    SUM(Rub)
    
FROM checks AS c
LEFT JOIN devices AS d
ON d.UserID = c.UserID
INNER JOIN installs AS i
ON i.DeviceID = d.DeviceID

GROUP BY i.Source
LIMIT 30