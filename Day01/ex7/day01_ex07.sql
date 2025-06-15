SELECT order_date, CONCAT (name, ' ', '(age:', age, ')') AS name_pers
FROM person_order
JOIN person ON person.id = person_id
ORDER BY name_pers ASC, person_order ASC;
