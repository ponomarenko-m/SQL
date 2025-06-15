CREATE UNIQUE INDEX idx_menu_uniqe ON menu (pizzeria_id,pizza_name);
-- DROP index idx_menu_uniqe

SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT pizzeria_id, pizza_name
FROM menu
WHERE pizzeria_id = 1 AND pizza_name = 'supreme pizza';
