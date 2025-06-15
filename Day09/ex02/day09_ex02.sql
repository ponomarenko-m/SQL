CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit()
RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO person_audit (created, row_id, name, age, gender, address, type_event)
	VALUES (current_timestamp, OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address, 'D');
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_delete_audit
AFTER DELETE on person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;
