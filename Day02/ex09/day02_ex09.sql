SELECT person.name
FROM person_order
INNER JOIN person ON person.id = person_order.person_id
INNER JOIN menu ON menu.id = person_order.menu_id
WHERE person.gender = 'female' AND menu.pizza_name = 'cheese pizza'

INTERSECT

SELECT person.name
FROM person_order
INNER JOIN person ON person.id = person_order.person_id
INNER JOIN menu ON menu.id = person_order.menu_id
WHERE person.gender = 'female' AND menu.pizza_name = 'pepperoni pizza'
ORDER BY 1;