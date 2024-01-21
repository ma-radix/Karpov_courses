-- Смотрим, какую цену за ночь уствнавливает в среднем каждый хозяин (у него может быть несколько объявлений)

SELECT 
    host_id,
    groupArray(id), -- собираем массив из сгруппированных данных
    AVG(toFloat32OrNull(replaceRegexpAll(price, '[$,]', ''))) AS avg_price -- функция replaceRegexpAll(где, что заменить, на что заменить) ищет все вхождения паттерна и заменяет их (здесь ищет $ и ,)
FROM default.listings
GROUP BY host_id
ORDER BY 
    avg_price DESC,
    host_id DESC
LIMIT 30