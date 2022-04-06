USE vk;

-- Задание 1
-- заполняем таблицу users
INSERT IGNORE INTO users (first_name, last_name, email, phone, password_hash, created_at)
SELECT name, surname, email, phone, pass, created_at FROM test1.users ORDER BY RAND() LIMIT 10;

-- заполняем таблицу profiles
INSERT INTO profiles (user_id, gender, birthday, photo_id, city, country)
SELECT vk.users.id, test1.users.gender, test1.users.birthday, test1.users.photo_id, test1.users.hometown, 'Russia' 
FROM vk.users
INNER JOIN test1.users ON vk.users.email = test1.users.email
ORDER BY id;

-- заполняем таблицу messages
INSERT INTO messages VALUES 
(DEFAULT, FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1), 'Hi!', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1), 'Hi!', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1), 'Hi!', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1), 'Hi!', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1), 'Hi!', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1), 'Hi!', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1), 'Hi!', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1), 'Hi!', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1), 'Hi!', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1), 'Hi!', DEFAULT, DEFAULT, DEFAULT);


-- заполняем таблицу friend_requests
INSERT IGNORE INTO friend_requests VALUES 
(FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1), DEFAULT),
(FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1), DEFAULT),
(FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1), DEFAULT),
(FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1), DEFAULT),
(FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1), DEFAULT),
(FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1), DEFAULT),
(FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1), DEFAULT),
(FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1), DEFAULT),
(FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1), DEFAULT),
(FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1), DEFAULT);

-- заполняем таблицу communities
INSERT INTO communities VALUES 
(DEFAULT, 'Group', 'Best_Group', FLOOR(RAND()*(10-1)+1)),
(DEFAULT, 'Group', 'Best_Group', FLOOR(RAND()*(10-1)+1)),
(DEFAULT, 'Group', 'Best_Group', FLOOR(RAND()*(10-1)+1)),
(DEFAULT, 'Group', 'Best_Group', FLOOR(RAND()*(10-1)+1)),
(DEFAULT, 'Group', 'Best_Group', FLOOR(RAND()*(10-1)+1)),
(DEFAULT, 'Group', 'Best_Group', FLOOR(RAND()*(10-1)+1)),
(DEFAULT, 'Group', 'Best_Group', FLOOR(RAND()*(10-1)+1)),
(DEFAULT, 'Group', 'Best_Group', FLOOR(RAND()*(10-1)+1)),
(DEFAULT, 'Group', 'Best_Group', FLOOR(RAND()*(10-1)+1)),
(DEFAULT, 'Group', 'Best_Group', FLOOR(RAND()*(10-1)+1));

-- заполняем таблицу communities_users
INSERT IGNORE INTO communities_users VALUES 
(FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1)),
(FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1)),
(FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1)),
(FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1)),
(FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1)),
(FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1)),
(FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1)),
(FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1)),
(FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1)),
(FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(10-1)+1));

-- заполняем таблицу media
INSERT INTO media VALUES 
(DEFAULT, FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(4-1)+1), 'data', FLOOR(RAND()*(1000-1)+1), DEFAULT, DEFAULT),
(DEFAULT, FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(4-1)+1), 'data', FLOOR(RAND()*(1000-1)+1), DEFAULT, DEFAULT),
(DEFAULT, FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(4-1)+1), 'data', FLOOR(RAND()*(1000-1)+1), DEFAULT, DEFAULT),
(DEFAULT, FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(4-1)+1), 'data', FLOOR(RAND()*(1000-1)+1), DEFAULT, DEFAULT),
(DEFAULT, FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(4-1)+1), 'data', FLOOR(RAND()*(1000-1)+1), DEFAULT, DEFAULT),
(DEFAULT, FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(4-1)+1), 'data', FLOOR(RAND()*(1000-1)+1), DEFAULT, DEFAULT),
(DEFAULT, FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(4-1)+1), 'data', FLOOR(RAND()*(1000-1)+1), DEFAULT, DEFAULT),
(DEFAULT, FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(4-1)+1), 'data', FLOOR(RAND()*(1000-1)+1), DEFAULT, DEFAULT),
(DEFAULT, FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(4-1)+1), 'data', FLOOR(RAND()*(1000-1)+1), DEFAULT, DEFAULT),
(DEFAULT, FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(4-1)+1), 'data', FLOOR(RAND()*(1000-1)+1), DEFAULT, DEFAULT);



-- Задание 2
SELECT DISTINCT first_name FROM users ORDER BY first_name;

-- Задание 3
ALTER TABLE profiles ADD COLUMN is_active BOOLEAN DEFAULT TRUE;

UPDATE profiles
SET is_active = 0
WHERE (YEAR(CURDATE())-YEAR(birthday)) < 18;

-- Задание 4
DELETE FROM messages
WHERE created_at > now();
