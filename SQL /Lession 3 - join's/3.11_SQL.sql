-- Считаем, какая доля пользователей просматривала контент относительно скачавших приложение

SELECT
    i.Platform,
    COUNT(DISTINCT i.DeviceID) AS Count_Installs_Devices, -- количество скачавших приложение
    COUNT(DISTINCT ev.DeviceID) AS Count_Events_Devices, -- количество просматривающих контент
    Count_Events_Devices / Count_Installs_Devices AS conversion -- считаем долю (не процент!)
FROM 
    installs AS i
LEFT JOIN 
    events AS ev
ON 
    i.DeviceID = ev.DeviceID
GROUP BY i.Platform
LIMIT 20