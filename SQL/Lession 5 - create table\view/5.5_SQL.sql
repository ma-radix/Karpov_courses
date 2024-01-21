--смотрим отдельно сдающиеся комнаты, которые ближе к центру относительно среднего

WITH 
    (SELECT AVG(geoDistance(13.4050, 52.5200, toFloat64OrNull(longitude), toFloat64OrNull(latitude)))
    FROM listings
    WHERE room_type = 'Private room') AS avg_distance

SELECT
    id,
    host_id,
    geoDistance(13.4050, 52.5200, toFloat64OrNull(longitude), toFloat64OrNull(latitude)) AS distance
    
FROM listings

WHERE
    geoDistance(13.4050, 52.5200, toFloat64OrNull(longitude), toFloat64OrNull(latitude)) < avg_distance
AND 
    room_type = 'Private room'
ORDER BY distance DESC
LIMIT 20