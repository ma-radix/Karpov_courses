-- Смотрим средние значения цены жилья, залога и цены за уборку в разбивке по типу жилья

SELECT
    room_type,
    AVG(toFloat32OrNull(replaceRegexpAll(price, '[$,]', ''))) AS price,
    AVG(toFloat32OrNull(replaceRegexpAll(security_deposit, '[$,]', ''))) AS security_deposit,
    AVG(toFloat32OrNull(replaceRegexpAll(cleaning_fee, '[$,]', ''))) AS cleaning_fee
FROM default.listings
GROUP BY room_type
ORDER BY security_deposit DESC
LIMIT 10