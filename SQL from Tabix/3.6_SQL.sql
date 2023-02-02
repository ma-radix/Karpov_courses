-- Смотрим, сколько уникальных пользователей из каких источников совершили покупки в нашем приложении

SELECT 
    i.Source, -- Источник
    COUNT (DISTINCT c.UserID) AS Unic_UserID
    
FROM checks AS c
LEFT JOIN devices AS d
ON d.UserID = c.UserID
INNER JOIN installs AS i
ON i.DeviceID = d.DeviceID

GROUP BY i.Source
LIMIT 100