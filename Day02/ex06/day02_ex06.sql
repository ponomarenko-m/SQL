SELECT pizza_name, pizzeria.name AS pizzeria_name
FROM person_order
INNER JOIN menu ON menu.id = person_order.menu_id
INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
INNER JOIN person ON person.id = person_order.person_id
WHERE person.name = 'Anna' OR person.name = 'Denis'
ORDER BY pizza_name, pizzeria_name;
