-- Смотрим, какая из сдаваемых комнат находится ближе всего к центру Берлина 

SELECT 
    id,
    geoDistance(13.4050, 52.5200, toFloat32OrNull(longitude), toFloat32OrNull(latitude)) AS distance_from_Berlin_center -- координаты центра Берлина ⎼ 52.5200с.ш. 13.4050 в.д.
FROM listings
WHERE room_type = 'Private room'
ORDER BY distance_from_Berlin_center ASC
LIMIT 20