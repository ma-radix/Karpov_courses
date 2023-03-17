--смотрим среднюю частоту ответа в разбивке по хозяевм и суперхозяевам(опытными хозяевами с хорошими отзывами)

SELECT 
    host_is_superhost,
    AVG(toInt32OrNull(replaceAll(host_response_rate,'%',''))) AS avg_host_response_rate -- значение частоты ответа хранилось в формате строки со значком % 
FROM ( 
    SELECT 
        DISTINCT 
            host_response_rate,
            host_is_superhost,
            host_id
    FROM listings)
GROUP BY 
    host_is_superhost
ORDER BY avg_host_response_rate DESC 
LIMIT 20