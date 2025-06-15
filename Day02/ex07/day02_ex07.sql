SELECT pizzeria.name
FROM person_visits
INNER JOIN person ON person.id = person_visits.person_id
INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
INNER JOIN menu ON menu.id = pizzeria.id
WHERE person.name = 'Dmitriy' AND price > 800 AND visit_date = '2022-01-08';
