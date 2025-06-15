SELECT person.name, menu.pizza_name, menu.price, 
	ROUND (menu.price - ((menu.price * person_discounts.discount)/100), 2) AS discount_price, 
	pizzeria.name AS pizzeria_name
FROM person_order
INNER JOIN menu ON menu.id = person_order.menu_id
INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
INNER JOIN person ON person.id = person_order.person_id
INNER JOIN person_discounts ON person_discounts.person_id = person.id 
	AND person_discounts.pizzeria_id = menu.pizzeria_id
ORDER BY person.name, menu.pizza_name;
