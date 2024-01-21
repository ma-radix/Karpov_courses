--смотрим, в каком году и месяце зарегестрировалось больше всего хостов(кто сдаёт жильё)

SELECT
    COUNT(DISTINCT host_id) AS host_id_array,
    toStartOfMonth(toDate32OrNull(host_since)) AS registration_date -- округляем к началу месяца, предворительно приведя к типу даты с возможностью получения Null
FROM listings 
GROUP BY registration_date
ORDER BY host_id_array DESC
LIMIT 20
