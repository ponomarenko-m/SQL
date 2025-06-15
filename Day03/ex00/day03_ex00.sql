SELECT pizza_name, price, pizzeria.name AS pizzeria_name, person_visits.visit_date
FROM menu
INNER JOIN person_visits ON person_visits.pizzeria_id = menu.pizzeria_id
INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
INNER JOIN person ON person.id = person_visits.person_id
WHERE price BETWEEN 800 AND 1000 AND person.name = 'Kate'
ORDER BY pizza_name, price, pizzeria_name;
