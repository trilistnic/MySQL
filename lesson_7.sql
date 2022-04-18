-- Task 1

USE test;

INSERT INTO orders VALUES
  (DEFAULT, 1, DEFAULT, DEFAULT),
  (DEFAULT, 2, DEFAULT, DEFAULT),
  (DEFAULT, 5, DEFAULT, DEFAULT),
  (DEFAULT, 5, DEFAULT, DEFAULT);

SELECT *
FROM users
WHERE id IN (SELECT user_id FROM orders)
;

-- Task 2

SELECT * FROM products;

SELECT * FROM catalogs;

SELECT 
	name, 
	(SELECT name FROM catalogs WHERE catalog_id = id) AS catalog_part 
FROM products;

-- Task 3

DROP DATABASE IF EXISTS test;

CREATE DATABASE test;

USE test;

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
	id SERIAL PRIMARY KEY, 
    `from` VARCHAR(20),
    `to` VARCHAR(20)
);

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
	id SERIAL PRIMARY KEY, 
    label VARCHAR(20),
    name VARCHAR(20)
);

INSERT INTO flights VALUES
			(DEFAULT, 'moscow', 'omsk'),
			(DEFAULT, 'novgorod', 'kazan'),
			(DEFAULT, 'irkutsk', 'moscow'),
			(DEFAULT, 'omsk', 'irkutsk'),
			(DEFAULT, 'moscow', 'kazan');
			
INSERT INTO cities VALUES
			(DEFAULT, 'moscow', 'Москва'),
			(DEFAULT, 'irkutsk', 'Иркутск'),
			(DEFAULT, 'novgorod', 'Новгород'),
			(DEFAULT, 'kazan', 'Казань'),
			(DEFAULT, 'omsk', 'Омск');		

SELECT 
	id, 
	(SELECT name FROM cities WHERE label = `from`) AS `from`,
	(SELECT name FROM cities WHERE label = `to`) AS `to`
FROM flights;
