DROP FUNCTION fnc_persons_male();
DROP FUNCTION fnc_persons_female();

CREATE OR REPLACE FUNCTION fnc_persons(pgender varchar default 'female')
RETURNS TABLE
(	id bigint,
	name varchar,
	age integer,
	gender varchar,
	address varchar
) AS $$
	SELECT *
	FROM person
	WHERE gender = pgender;
$$ LANGUAGE SQL;

SELECT *
FROM fnc_persons(pgender := 'male');

SELECT *
FROM fnc_persons();
