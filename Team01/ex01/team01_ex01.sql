insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

SELECT 
    user_data.name,
    user_data.lastname,
    user_data.currency_name,
    user_data.money * user_data.rate_to_usd AS currency_in_usd
FROM (
    SELECT 
        COALESCE(u.name, 'not defined') AS name,
        COALESCE(u.lastname, 'not defined') AS lastname,
        curr_data.name AS currency_name,
        b.money,
        COALESCE(
            (SELECT rate_to_usd 
             FROM currency c_prev 
             WHERE c_prev.id = b.currency_id 
               AND c_prev.updated <= b.updated 
             ORDER BY c_prev.updated DESC 
             LIMIT 1),
            (SELECT rate_to_usd 
             FROM currency c_next 
             WHERE c_next.id = b.currency_id 
               AND c_next.updated > b.updated 
             ORDER BY c_next.updated ASC 
             LIMIT 1)
        ) AS rate_to_usd
    FROM 
        balance b
    INNER JOIN (
        SELECT DISTINCT id, name
        FROM currency
    ) AS curr_data 
    ON b.currency_id = curr_data.id
    LEFT JOIN 
        "user" u 
    ON b.user_id = u.id
) AS user_data
ORDER BY 
    user_data.name DESC,
    user_data.lastname ASC,
    user_data.currency_name ASC;
