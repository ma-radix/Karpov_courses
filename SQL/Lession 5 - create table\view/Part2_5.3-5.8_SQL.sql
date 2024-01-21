-- меняем тип данных столбца -- 5.3

ALTER TABLE test.reviews MODIFY COLUMN created_at Date

----------------------------
-- удаляем строки с пустыми значениями -- 5.4

ALTER TABLE test.reviews DELETE WHERE comments=''

----------------------------
-- создаём обычное представление с параметрами -- 5.5

CREATE VIEW test.reviews_number AS (SELECT reviewer_id, COUNT(id) reviews_count FROM test.reviews GROUP BY reviewer_id)

----------------------------
-- создаём новый столбец с параметрами -- 5.6

LTER TABLE test.reviews ADD COLUMN reviewer_score UInt8 AFTER reviewer_name

----------------------------
-- ещё один новый столбец -- 5.7

ALTER TABLE test.reviews ADD COLUMN price Float32 AFTER comments

----------------------------
-- удваиваем значения некоторых строк в колонке -- 5.8

ALTER TABLE test.reviews UPDATE price=price*2 WHERE created_at>'2019-01-01'
