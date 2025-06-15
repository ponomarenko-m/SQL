(SELECT pizzeria.name, COUNT(*) AS count, 'visit' AS action_type
FROM person_visits
INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
GROUP BY pizzeria.name
ORDER BY action_type ASC, count DESC
LIMIT 3)

UNION

(SELECT pizzeria.name, COUNT(*) AS count, 'order' AS action_type
FROM person_order
INNER JOIN menu ON menu.id = person_order.menu_id
INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY pizzeria.name
ORDER BY action_type ASC, count DESC
LIMIT 3)

ORDER BY action_type ASC, count DESC;
