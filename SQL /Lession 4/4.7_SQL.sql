-- Ищем разницу между минимальной и максимальной ценой, установленной у каждого хозяина на его объявлениях

SELECT 
    host_id,
    groupArray(id),
    MAX(toFloat32OrNull(replaceRegexpAll(price, '[$,]', ''))) - MIN(toFloat32OrNull(replaceRegexpAll(price, '[$,]', ''))) AS diff
FROM default.listings
GROUP BY 
    host_id
ORDER BY 
    diff DESC,
    host_id DESC
LIMIT 30