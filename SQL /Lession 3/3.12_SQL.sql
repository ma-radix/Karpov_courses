-- Ищем уникальные DeviceID тех пользователей, которые просматривали контент не скачивая приложение

SELECT DISTINCT
    ev.DeviceID
FROM 
    events AS ev
LEFT ANTI JOIN installs AS i -- отбираем только те строки, совпадений для которых не нашлось в таблице installs
USING DeviceID -- другой способ прописать ключ для join, работает, если названия столбцов одинаковые

ORDER BY ev.DeviceID DESC 
LIMIT 20