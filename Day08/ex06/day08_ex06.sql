-- Session 1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Session 2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Session 1
SELECT SUM(rating) FROM pizzeria;
-- Session 2
INSERT INTO pizzeria VALUES (11, 'Kazan Pizza 2', 4.0);
COMMIT;

-- Session 1
SELECT SUM(rating) FROM pizzeria;
COMMIT;
SELECT SUM(rating) FROM pizzeria;
--Sesion 2
SELECT SUM(rating) FROM pizzeria;
