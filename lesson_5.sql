-- Операторы, фильтрация, сортировка и ограничение
-- Task 1
UPDATE users
SET created_at = NOW(), updated_at = NOW() WHERE created_at IS NULL OR updated_at IS NULL;

-- Task 2
UPDATE `users`
SET created_at = STR_TO_DATE('20.10.2017 8:10', '%d.%m.%Y %h:%i'),
updated_at = STR_TO_DATE('20.10.2017 8:10', '%d.%m.%Y %h:%i');

ALTER TABLE users
MODIFY COLUMN created_at DATETIME, MODIFY COLUMN updated_at DATETIME;

-- Task 3
SELECT * FROM storehouses_products ORDER BY IF (value = 0, 1, 0), value;

-- Task 4
SELECT * FROM users WHERE birthday_at RLIKE 'may|august';

-- Task 5
SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIELD(`id`, 5, 1, 2);

-- Агрегация данных
-- Task 1
SELECT ROUND(AVG(FLOOR((TO_DAYS(NOW()) - TO_DAYS(birthday_at)) / 365.25)),0) AS avg_age FROM users;

-- Task 2
SELECT 
WEEKDAY(birthday_at) as 'day_number',
COUNT(*) as 'birthdays_amount'
FROM users
GROUP BY WEEKDAY(birthday_at)
ORDER BY day_number;

-- Task 3
SELECT EXP(SUM(LOG(value))) AS result FROM users;








