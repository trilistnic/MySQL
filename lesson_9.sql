-- Task 1.1
START TRANSACTION;
INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;
DELETE FROM shop.users WHERE id = 1;
COMMIT;

-- Task 1.2
CREATE OR REPLACE VIEW products_catalog_names (product_name, catalog_name) 
AS SELECT p.name, c.name FROM products p 
JOIN catalogs c on p.catalog_id = c.id
ORDER BY p.name;

-- Task 1.3
DROP DATABASE IF EXISTS test;

CREATE DATABASE IF NOT EXISTS test;

USE test;

CREATE TABLE dates(
	id SERIAL PRIMARY KEY,
	created_at DATE
);

INSERT INTO dates VALUES
  (DEFAULT, '2018-08-01'),
  (DEFAULT, '2018-08-04'),
  (DEFAULT, '2018-08-16'),
  (DEFAULT, '2018-08-17');

CREATE TABLE august(
	august_date DATE
);

INSERT INTO august
SELECT ('2018-09-01' - INTERVAL c.number DAY) AS date
FROM (SELECT singles + tens number FROM 
( SELECT 0 singles
UNION ALL SELECT   1 UNION ALL SELECT   2 UNION ALL SELECT   3
UNION ALL SELECT   4 UNION ALL SELECT   5 UNION ALL SELECT   6
UNION ALL SELECT   7 UNION ALL SELECT   8 UNION ALL SELECT   9
) singles JOIN 
(SELECT 0 tens
UNION ALL SELECT  10 UNION ALL SELECT  20 UNION ALL SELECT  30
) tens) c  
WHERE c.number BETWEEN 1 and 31
ORDER BY number DESC;

START TRANSACTION;
SELECT a.august_date, NOT ISNULL(d.created_at) AS correct
FROM august a
LEFT JOIN dates d
ON a.august_date = d.created_at;
COMMIT;

-- Task 1.4
INSERT INTO dates VALUES
  (DEFAULT, '2018-08-02'),
  (DEFAULT, '2018-08-05'),
  (DEFAULT, '2018-08-18'),
  (DEFAULT, '2018-08-19');

START TRANSACTION;
SET @lim := (SELECT COUNT(*) - 5 FROM dates);
PREPARE del FROM 'DELETE FROM dates ORDER BY created_at LIMIT ?';
EXECUTE del USING @lim;
COMMIT;

-- Task 3.1
DELIMITER //
DROP FUNCTION IF EXISTS hello //
CREATE FUNCTION hello ()
RETURNS TEXT DETERMINISTIC
BEGIN
	RETURN CASE
		WHEN HOUR(CURTIME()) BETWEEN 6 AND 11 THEN "Доброе утро"
		WHEN HOUR(CURTIME()) BETWEEN 12 AND 17 THEN "Добрый день"
		WHEN HOUR(CURTIME()) BETWEEN 18 AND 23 THEN "Добрый вечер"
		ELSE "Доброй ночи"
	END;
END//

DELIMITER ;
SELECT hello () AS hello;

-- Task 3.2
USE shop;

DELIMITER //

DROP TRIGGER IF EXISTS products_insert//
CREATE TRIGGER products_insert BEFORE INSERT ON products FOR EACH ROW
BEGIN
	IF NEW.name IS NULL AND NEW.description IS NULL
		THEN SIGNAL SQLSTATE '45000' SET message_text = "not correct"; 
  END IF;
END; //

DROP TRIGGER IF EXISTS products_update//
CREATE TRIGGER products_update BEFORE UPDATE ON products FOR EACH ROW
BEGIN
	IF NEW.name IS NULL AND NEW.description IS NULL
		THEN SIGNAL SQLSTATE '45000' SET message_text = "not correct"; 
  END IF;
END; //

DELIMITER ;

-- Task 3.3
USE test;

DELIMITER //
DROP FUNCTION IF EXISTS Fibonacci //
CREATE FUNCTION Fibonacci (num INT)
RETURNS INT DETERMINISTIC
BEGIN
	DECLARE i INT DEFAULT 1;
	DECLARE total_t INT DEFAULT 0;
	DECLARE total_p INT DEFAULT 0;
	DECLARE total_c INT DEFAULT 1;
	IF num <= 0 THEN SET total_c = 0;
	END IF;
	cycle: WHILE i < num DO
		SET i = i + 1;
		SET total_t = total_c;
		SET total_c = total_p + total_c;
		SET total_p = total_t;
	END WHILE cycle;
	RETURN total_c;
END//

DELIMITER ;
SELECT Fibonacci (10);
