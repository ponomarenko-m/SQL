INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT 
    GENERATE_SERIES(
        (SELECT MAX(id) + 1 FROM person_order), 
        (SELECT MAX(id) + (SELECT COUNT(*) FROM person) FROM person_order), 
        1
    ),
    GENERATE_SERIES((SELECT min(id) FROM person), (SELECT max(id) FROM person)),
    (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
    '2022-02-25'