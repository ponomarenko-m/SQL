CREATE OR REPLACE FUNCTION  fnc_person_visits_and_eats_on_date(pperson varchar default 'Dmitriy', 
																pprice numeric default 500,
																pdate date default '2022-01-08')
RETURNS TABLE (pizzeria_name VARCHAR) 
AS $$
BEGIN
	RETURN QUERY
	SELECT pizzeria.name
	FROM pizzeria
	JOIN menu ON pizzeria.id = menu.pizzeria_id
	JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
	JOIN person ON person.id = person_visits.person_id
	WHERE
		person.name = pperson
		AND person_visits.visit_date = pdate
		AND menu.price < pprice;
END;
$$ LANGUAGE plpgsql;

-- DROP FUNCTION fnc_person_visits_and_eats_on_date();

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
