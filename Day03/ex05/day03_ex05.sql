SELECT pizzeria.name AS pizzeria_name
FROM person_visits
INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
INNER JOIN person ON person.id = person_visits.person_id
WHERE person.name = 'Andrey'

EXCEPT

SELECT pizzeria.name AS pizzeria_name
FROM person_order
INNER JOIN menu ON menu.id = person_order.menu_id
INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
INNER JOIN person ON person.id = person_order.person_id
WHERE person.name = 'Andrey'

ORDER BY pizzeria_name;
