SELECT a.pizza_name, pizzeria1.name AS pizzeria_name1, pizzeria2.name AS pizzeria_name2, a.price
FROM menu a
JOIN menu b ON a.pizzeria_id <> b.pizzeria_id
            AND a.pizza_name = b.pizza_name
			AND a.price = b.price
JOIN pizzeria pizzeria1 ON a.pizzeria_id = pizzeria1.id
JOIN pizzeria pizzeria2 ON b.pizzeria_id = pizzeria2.id
WHERE a.id < b.id
ORDER BY a.pizza_name;
