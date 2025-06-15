SELECT DISTINCT menu.pizza_name, menu.price, pizzeria.name AS pizzeria_name
FROM menu, pizzeria
WHERE NOT EXISTS (
	SELECT menu_id
	FROM person_order
	WHERE person_order.menu_id = menu.id
) AND menu.pizzeria_id = pizzeria.id
ORDER BY menu.pizza_name, menu.price;
