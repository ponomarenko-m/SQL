CREATE FUNCTION func_minimum(VARIADIC arr NUMERIC[]) 
RETURNS NUMERIC 
AS $$
BEGIN
    RETURN (SELECT MIN(value) FROM unnest(arr) AS value);
END;
$$ LANGUAGE PLPGSQL;


-- DROP FUNCTION func_minimum(NUMERIC[]);


SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
