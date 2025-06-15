CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10) 
RETURNS TABLE(fibonacci_number BIGINT) 
AS $$
BEGIN
    RETURN QUERY 
    WITH RECURSIVE fibonacci_sequence(x, y) AS (
        SELECT 0::BIGINT, 1::BIGINT
        UNION ALL
        SELECT y, x + y 
        FROM fibonacci_sequence 
        WHERE y < pstop
    )
    SELECT x AS fibonacci_number
    FROM fibonacci_sequence;
END;
$$ LANGUAGE PLPGSQL;


SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();

