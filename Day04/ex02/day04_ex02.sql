CREATE VIEW v_generated_dates AS
SELECT CAST(generated_date AS DATE)
FROM GENERATE_SERIES('2022-01-01'::date, '2022-01-31'::date, '1 day')
	AS generated_date