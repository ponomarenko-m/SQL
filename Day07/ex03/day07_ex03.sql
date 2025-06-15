WITH count_visits AS ( SELECT pizzeria.id AS pizzeria_id, COUNT(person_visits.id) AS count 
    FROM person_visits
    INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
    GROUP BY pizzeria.id
),
count_orders AS (
    SELECT pizzeria.id AS pizzeria_id, COUNT(person_order.id) AS count 
    FROM person_order
    INNER JOIN menu ON menu.id = person_order.menu_id
    INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    GROUP BY pizzeria.id
)
SELECT 
    pizzeria.name, COALESCE(count_visits.count, 0) + COALESCE(count_orders.count, 0) AS total_count
FROM pizzeria
LEFT JOIN count_visits ON pizzeria.id = count_visits.pizzeria_id
LEFT JOIN count_orders ON pizzeria.id = count_orders.pizzeria_id
ORDER BY total_count DESC, pizzeria.name ASC;
