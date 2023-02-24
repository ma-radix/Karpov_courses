/* Ищем жильё в Берлине:
    - ближе к центру, чем всё сдаваемое жильё в среднем
    - дешевле 100$ за сутки с учётом сборов за уборку
    - есть WiFi
    - есть отзывы позже 1-го сентября 2018 года включительно
*/
SELECT
    host_id,
    toFloat32OrNull(replaceRegexpAll(price, '[$,]', '')) + toFloat32OrNull(replaceRegexpAll(cleaning_fee, '[$,]', '')) / 7 AS price_per_day -- сборы за уборку фиксируются за неделю
FROM (
    WITH 
        (SELECT AVG(geoDistance(13.4050, 52.5200, toFloat64OrNull(longitude), toFloat64OrNull(latitude))) 
        FROM listings)  AS avg_distance -- координаты центра Берлина ⎼ (52.5200с.ш. 13.4050в.д.)
    SELECT *
    FROM listings
    WHERE
        geoDistance(13.4050, 52.5200, toFloat64OrNull(longitude), toFloat64OrNull(latitude)) < avg_distance
)

WHERE 
    (toFloat32OrNull(replaceRegexpAll(price, '[$,]', '')) + toFloat32OrNull(replaceRegexpAll(cleaning_fee, '[$,]', '')) / 7) < 100
    AND
    multiSearchAnyCaseInsensitive(amenities, ['Wifi']) > 0 
        -- функция multiSearchAnyCaseInsensitive(столбец, ['искомая подстрока']) ищет подстроку в строке вне зависимости от регистра и выдаёт 0 в случае, если подстрока найдена не была
    AND
    toDateOrZero(last_review) - toDateOrZero('2018-09-01') >= 0
ORDER BY toFloat32OrNull(review_scores_rating) DESC
LIMIT 20