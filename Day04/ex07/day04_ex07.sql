WITH selected_person AS (
    SELECT id FROM person WHERE name = 'Dmitriy'
),
selected_pizzeria AS (
    SELECT pizzeria_id
    FROM menu
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    WHERE price < 800 AND pizzeria.name != 'Papa Johns'
    LIMIT 1
)

INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
SELECT
    (SELECT max(id) + 1 FROM person_visits),
    selected_person.id,
    selected_pizzeria.pizzeria_id,
    '2022-01-08'
FROM selected_person, selected_pizzeria
WHERE NOT EXISTS (
    SELECT id
    FROM person_visits
    WHERE person_id = selected_person.id
      AND pizzeria_id = selected_pizzeria.pizzeria_id
      AND visit_date = '2022-01-08'
);

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
