USE course_project_SPDM;

-- Процедура для единоразового заполнения 3х таблиц с информацией о пользователе: users, user_account, user_roles
-- Также процедура заполняет таблицу с логами:
-- ID пользователя, дата и время создания, действие, описание успеха или ошибки, проставляет флаг о наличии ошибки.
-- в Процедуре используется транзакция для отката в случае ошибки. 

DROP PROCEDURE IF EXISTS spdm_add_user;

DELIMITER //

CREATE PROCEDURE spdm_add_user (first_name VARCHAR(255), last_name VARCHAR(255), email VARCHAR(255), phone VARCHAR(12), birth_date DATE,
								login VARCHAR(255), password_hash VARCHAR(255), 
								name VARCHAR(255), description TEXT)
								
BEGIN 
	DECLARE transaction_rollback BOOL DEFAULT 0;
	DECLARE error_text VARCHAR(255);
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
		SET transaction_rollback = 1;
	
		GET STACKED DIAGNOSTICS CONDITION 1
			error_text = MESSAGE_TEXT;
	END;

	START TRANSACTION;

	INSERT INTO users VALUES (DEFAULT, first_name, last_name, email, phone, DEFAULT, DEFAULT, DEFAULT, birth_date);
	
	INSERT INTO user_account VALUES (LAST_INSERT_ID(), login, password_hash, DEFAULT);

	INSERT INTO user_roles VALUES (LAST_INSERT_ID(), name, description, DEFAULT, DEFAULT);
	
	IF transaction_rollback
	THEN 
		ROLLBACK;
		INSERT INTO log_file_users VALUES
		(LAST_INSERT_ID(), DEFAULT, 'ADD USER', CONCAT(first_name, ' ', last_name, ': ', error_text), 1);
	ELSE
		INSERT INTO log_file_users VALUES
		(LAST_INSERT_ID(), DEFAULT, 'ADD USER', CONCAT(first_name, ' ', last_name, ': ', 'USER CREATED'), DEFAULT);
		COMMIT;
	END IF;	
END//

DELIMITER ;

/* Пример использования:
			
CALL spdm_add_user('Ivan', 'Martynov', 'ivan@mail.com', '89219212121', '1987-12-01',
					'Ivan', '81dc9bdb52d04dc20036dbd8313ed052',
					'Junior', 'Can use submodels');

SELECT * FROM log_file_users;
*/


-- Процедура, которая позволяет узнать статус расчетов по логину пользователя
-- Выводится основная информация:
-- ID расчета, название расчета, статус расчета.

DROP PROCEDURE IF EXISTS simulation_status;

DELIMITER //

CREATE PROCEDURE simulation_status (login VARCHAR(255), OUT status VARCHAR(255))
BEGIN
	SELECT 
	s.id, s.name, ss.name
    FROM simulations s
    JOIN user_account ua
      ON s.owner_id = ua.user_id 
    JOIN simulation_statuses ss 
      ON s.status_id = ss.id 
    WHERE ua.login = login;  
END//

DELIMITER ;

-- Пример использования:

-- CALL simulation_status('Dmitryi', @status);


-- Тригер для добавления в таблицу notification информации для дальнейшей рассылки статуса по почте.
-- Если статус расчета изменяется на Finished или Failed, то в таблицу notification вносится информация:
-- email адрес создателя расчета, название расчета и его новый статус.

DROP TRIGGER IF EXISTS spdm_user_notification;

DELIMITER //

CREATE TRIGGER spdm_user_notification AFTER UPDATE ON simulations
FOR EACH ROW
BEGIN
	IF NEW.status_id = 4 OR NEW.status_id = 5 THEN 
		INSERT INTO notification VALUES
		(DEFAULT, 
		(SELECT u.email FROM users u WHERE u.id = NEW.owner_id), 
		NEW.name, 
		(SELECT ss.name FROM simulation_statuses ss WHERE ss.id = NEW.status_id), 
		DEFAULT);
	END IF;
END //

DELIMITER ;

-- Пример использования:

-- UPDATE simulations SET status_id = 4 WHERE id = 9;

-- SELECT * FROM notification;
