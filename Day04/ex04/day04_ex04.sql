CREATE VIEW v_symmetric_union AS
SELECT person_id
FROM person_visits
WHERE visit_date = '2022-01-02' AND visit_date NOT IN (
	SELECT visit_date
	FROM person_visits
	WHERE visit_date = '2022-01-06'
)
UNION
SELECT person_id
FROM person_visits
WHERE visit_date = '2022-01-06' AND visit_date NOT IN (
	SELECT visit_date
	FROM person_visits
	WHERE visit_date = '2022-01-02'
)
ORDER BY person_id;
