SELECT CAST(missing_days AS DATE)
FROM generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day') AS missing_days
LEFT JOIN (
  SELECT visit_date
  FROM person_visits
  WHERE person_id = 1 OR person_id = 2) ON missing_days = visit_date
WHERE visit_date IS NULL
ORDER BY missing_days ASC;
