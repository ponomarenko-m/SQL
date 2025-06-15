UPDATE menu
SET price = ROUND ((price * 90) / 100)
WHERE pizza_name = 'greek pizza';
