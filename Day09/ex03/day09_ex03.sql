DROP TRIGGER trg_person_insert_audit on person;
DROP FUNCTION fnc_trg_person_insert_audit();

DROP TRIGGER trg_person_update_audit on person;
DROP FUNCTION fnc_trg_person_update_audit();

DROP TRIGGER trg_person_delete_audit on person;
DROP FUNCTION fnc_trg_person_delete_audit();

-- DROP FUNCTION fnc_trg_person_audit();
-- DROP TRIGGER trg_person_audit on person;

truncate person_audit;  

CREATE OR REPLACE FUNCTION fnc_trg_person_audit()
RETURNS TRIGGER AS $$
BEGIN
	IF (TG_OP = 'INSERT')
	THEN
		INSERT INTO person_audit (created, row_id, name, age, gender, address, type_event)
    	VALUES (current_timestamp, NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address, 'I');
	ELSEIF (TG_OP = 'UPDATE')
	THEN
		INSERT INTO person_audit (created, row_id, name, age, gender, address, type_event)
		VALUES (current_timestamp, OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address, 'U');
	ELSE
		INSERT INTO person_audit (created, row_id, name, age, gender, address, type_event)
		VALUES (current_timestamp, OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address, 'D');
	END IF;
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_audit
AFTER INSERT OR UPDATE OR DELETE on person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_audit();

INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;
