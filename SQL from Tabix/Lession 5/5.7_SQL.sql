-- Ищем доступные объявления, у которых число отзывов(уникальный посетитель на уникальное жильё) от пользователей выше среднего

WITH 
    (SELECT AVG(unic_rewiewers)-- агрегационнные функции не вкладываются друг в дружку:(
    FROM (
        SELECT 
            COUNT(DISTINCT listing_id, reviewer_id) AS unic_rewiewers
        FROM reviews
        GROUP BY listing_id
        )
    ) AS avg_unic_rewiewers

SELECT 
    cs.listing_id AS listing_id,
    COUNT(DISTINCT r.reviewer_id) AS unic_reviewers_id 
    
FROM (
    SELECT DISTINCT listing_id
    FROM calendar_summary
    WHERE available = 't') AS cs
INNER JOIN 
    reviews AS r
USING listing_id -- можно использовать вместо ON, если названия столбцов одинаковые

GROUP BY listing_id
HAVING unic_reviewers_id > avg_unic_rewiewers
    
ORDER BY listing_id ASC
LIMIT 20