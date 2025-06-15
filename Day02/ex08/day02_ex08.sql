SELECT person.name
FROM person_visits
INNER JOIN menu ON menu.id = person_visits.id
INNER JOIN person ON person.id = person_visits.id
WHERE (person.gender = 'male') 
	AND (address IN ('Moscow', 'Samara'))
	AND (menu.pizza_name IN ('mushroom pizza', 'pepperoni pizza'))
ORDER BY person.name DESC;
