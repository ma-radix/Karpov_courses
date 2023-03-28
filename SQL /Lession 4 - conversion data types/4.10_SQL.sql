-- Смотрим, в каких районах города средняя стоимость жилья, сдаваемого целиком, является наибольшей

SELECT
    neighbourhood_cleansed,
    AVG(toFloat32OrNull(square_feet)) AS square_feet
FROM default.listings
WHERE room_type = 'Entire home/apt' -- тип нужного нам жилья
GROUP BY neighbourhood_cleansed
ORDER BY square_feet DESC
LIMIT 20