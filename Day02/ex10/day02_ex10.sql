SELECT a.name AS person_name1,
	b.name AS person_name2,
	a.address AS common_address
FROM person a
LEFT JOIN person b ON a.address = b.address
WHERE a.id > b.id
ORDER BY person_name1, person_name2, common_address;
