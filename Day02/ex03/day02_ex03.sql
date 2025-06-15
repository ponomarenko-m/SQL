WITH days AS (
	SELECT visit_date
	FROM person_visits
	WHERE person_id = 1 OR person_id = 2
)

SELECT CAST(missing_days AS DATE)
FROM generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day') AS missing_days
LEFT JOIN days ON missing_days = visit_date
WHERE days.visit_date IS NULL
ORDER BY missing_days ASC;
