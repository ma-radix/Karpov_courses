-- Ищем жильё с кухней и гибкой системой отмены

SELECT
    host_id,
    CASE 
        WHEN multiSearchAnyCaseInsensitive(amenities, ['kitchen']) = 1 AND multiSearchAnyCaseInsensitive(cancellation_policy, ['flexible']) = 1 THEN 'good'
        WHEN multiSearchAnyCaseInsensitive(amenities, ['kitchen']) = 1 AND multiSearchAnyCaseInsensitive(cancellation_policy, ['flexible']) != 1 THEN 'ok'
        ELSE 'not ok'
    END is_comfortable
FROM listings
ORDER BY is_comfortable ASC
LIMIT 5