-- Ищем ID только тех пользователей, которые совершили хотя бы одну покупку в октябре 2019 

SELECT 
    d.DeviceID,
    toStartOfMonth(CAST(c.BuyDate AS dateTime)) AS BuyDate -- приводим строку BuyDate к типу даты и округляем до начала месяца
FROM checks AS c
LEFT JOIN devices AS d
ON d.UserID = c.UserID

GROUP BY 
    DeviceID, 
    BuyDate
HAVING BuyDate = '2019-10-01'
ORDER BY d.DeviceID ASC
LIMIT 30