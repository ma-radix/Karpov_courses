-- Считаем количество уникальных DeviceID из installs, для которых есть записи в events на пратформе android

SELECT 
    COUNT(DISTINCT i.DeviceID),
    i.Platform
FROM installs AS i
LEFT SEMI JOIN events AS ev -- показать только те строки, для которых нашлось соответствие в другой таблице, но не приклеивать другую таблицу
ON i.DeviceID = ev.DeviceID

WHERE Platform = 'android'

GROUP BY i.Platform
LIMIT 20