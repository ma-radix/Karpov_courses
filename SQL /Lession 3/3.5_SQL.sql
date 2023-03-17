--Смотрим, из какого источника пришли пользователи, совершившие наибольшее число покупок

SELECT
    i.Source, -- Источник
    count(c.Rub) AS sumRub --Считаем количество строк с покупками
FROM checks AS c
LEFT JOIN devices AS d -- Не все зарегестрировавшиеся совершали покупки, отбрасывем лишних
ON d.UserID = c.UserID
INNER JOIN installs AS i -- Не все регестрировались
ON i.DeviceID = d.DeviceID
GROUP BY i.Source 
ORDER BY sumRub DESC
LIMIT 100 -- Их всего 27, ну да ладно:)