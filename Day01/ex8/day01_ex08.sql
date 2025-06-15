SELECT order_date, 
    CONCAT(person.name, ' (age:', person.age, ')') AS name_pers
FROM person_order
NATURAL JOIN 
 (SELECT person.id AS person_id, person.name, person.age FROM person)
	person
ORDER BY order_date ASC, name_pers ASC;
