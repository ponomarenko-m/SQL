SELECT COALESCE(person.name, '-'),
    visit_day.visit_date,
	COALESCE(pizzeria.name, '-')
FROM person
FULL JOIN (SELECT visit_date, person_id, pizzeria_id
            FROM person_visits
            WHERE visit_date IS NULL OR visit_date BETWEEN '2022-01-01' AND '2022-01-03'
			) AS visit_day ON person.id = visit_day.person_id
FULL JOIN pizzeria ON visit_day.pizzeria_id = pizzeria.id
ORDER BY 1, 2, 3;
