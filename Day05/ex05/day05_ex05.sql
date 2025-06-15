CREATE UNIQUE INDEX idx_person_order_order_date ON person_order (person_id, menu_id, order_date)
WHERE order_date = '2022-01-01';
-- DROP INDEX idx_person_order_order_date

SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT person_id, menu_id, order_date
FROM person_order
WHERE person_id = 2 AND menu_id = 8 AND order_date = '2022-01-01';