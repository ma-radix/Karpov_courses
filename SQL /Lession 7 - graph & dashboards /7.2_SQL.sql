-- создаём таблицу (хз, почему здесь:))

CREATE TABLE IF NOT EXISTS test.retail ( -- создать, если не существует (видимо, проверить не судьба)
    InvoiceNo String,
    StockCode String,
    Description String,
    Quantity Int32,
    InvoiceDate DateTime('Europe/London'),
    UnitPrice Decimal64(3), -- Decimal - тип дробных числа с сохранением точности операций (кол-во знаков после запятой). Может принимать отрицательные значения. Здесь - 64 бита с 3-мя знаками после запятой.
    CustomerID UInt32,
    Country String
)
ENGINE = MergeTree
ORDER BY InvoiceDate, CustomerID