-- смотрим объявления, где оценка выше среднего, но число отзывов меньше 3

SELECT
    id,
    reviews_per_month,
    toFloat64OrNull(review_scores_rating) AS review_scores_ratings
FROM listings
WHERE
    review_scores_ratings >
        (SELECT AVG(toFloat64OrNull(review_scores_rating)) 
        FROM listings)
AND
    reviews_per_month < 3
ORDER BY
    reviews_per_month DESC,
    review_scores_ratings DESC
LIMIT 20