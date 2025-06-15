CREATE INDEX idx_person_name ON person (UPPER(name));
-- DROP INDEX idx_person_name;

SET enable_seqscan = OFF; 
EXPLAIN ANALYSE

SELECT name
FROM person
WHERE UPPER(name) = 'Elvira';
