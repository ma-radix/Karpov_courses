-- Смотрим, сколько товаров в среднем просматривают пользователи с разных платформ, пришедшие с разных источников

SELECT 
    i.Source,
    i.Platform,
    AVG(ev.events) AS AvgCountEvents -- среднее количество просмотров
    
FROM events AS ev
JOIN installs AS i
ON ev.DeviceID = i.DeviceID

GROUP BY
    i.Source,
    i.Platform
    
ORDER BY AvgCountEvents DESC
LIMIT 30