-- Смотрим, в каких частях города средняя цена за ночь наиболее низкая

SELECT
    neighbourhood_cleansed,
    AVG(toFloat32OrNull(replaceRegexpAll(price, '[$,]', ''))) AS price
FROM listings
GROUP BY neighbourhood_cleansed
ORDER BY price ASC
LIMIT 20