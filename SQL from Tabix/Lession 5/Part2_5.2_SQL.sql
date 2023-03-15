-- создаём таблицу

CREATE TABLE test.reviews (
    listing_id UInt32,
    id UInt32,
    created_at DateTime('Europe/Moscow'),
    reviewer_id UInt32,
    reviewer_name String,
    comments String
)

ENGINE = MergeTree
ORDER BY (listing_id, id)