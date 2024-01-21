--Приклеиваем UserID к другой таблице
SELECT
    l.AppPlatform AS AppPlatform,
    l.events AS events,
    l.EventDate AS EventDate,
    l.DeviceID AS DeviceID,
    r.UserID
FROM events AS l
LEFT JOIN devices AS r
ON l.DeviceID = r.DeviceID
ORDER BY l.DeviceID DESC
LIMIT 20