SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    b.type,
    b.volume,
    COALESCE(c.currency_name, 'not defined') AS currency_name,
    COALESCE(
        (SELECT rate_to_usd 
         FROM currency c1 
         WHERE c1.id = c.id AND c1.updated = c.last_updated), 1
    ) AS last_rate_to_usd, -- Получаем последний курс доллара
    b.volume * COALESCE(
        (SELECT rate_to_usd 
         FROM currency c1 
         WHERE c1.id = c.id AND c1.updated = c.last_updated), 1
    ) AS total_volume_in_usd -- Рассчитываем сумму в долларах
FROM (
    SELECT 
        user_id, 
        SUM(money) AS volume, 
        type, 
        currency_id 
    FROM 
        balance -- Агрегируем данные о балансе пользователей
    GROUP BY 
        user_id, type, currency_id
) AS b
FULL JOIN "user" u ON u.id = b.user_id -- Присоединяем данные о пользователях
FULL JOIN (
    SELECT 
        id, 
        name AS currency_name, 
        MAX(updated) AS last_updated 
    FROM 
        currency -- Выбираем последнюю дату обновления курса валюты
    GROUP BY 
        id, name
) AS c ON c.id = b.currency_id -- Присоединяем данные о валюте
ORDER BY 
    1 DESC, 2, 3; -- Сортировка по имени, фамилии и типу баланса
