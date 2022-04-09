-- Task 1
SELECT 
from_user_id, 
(SELECT firstname FROM users WHERE id = from_user_id) AS firtname,
(SELECT lastname FROM users WHERE id = from_user_id) AS lastname,
COUNT(from_user_id) AS amount
FROM messages
WHERE to_user_id = 3
GROUP BY from_user_id
ORDER BY amount  DESC LIMIT 1;


-- Task 2
SELECT SUM(like_type) AS like_amount
FROM posts_likes
WHERE post_id IN (
SELECT id
FROM posts
WHERE user_id IN (SELECT user_id FROM profiles WHERE FLOOR((TO_DAYS(NOW()) - TO_DAYS(birthday)) / 365.25) < 10)
);


-- Task 3
SELECT 
CASE (profiles.gender)
	WHEN 'f' THEN 'female'
	WHEN 'm' THEN 'male'
	WHEN 'x' THEN 'not defined'
	END  AS gender, 
SUM(like_type) AS amount
FROM posts_likes
INNER JOIN profiles ON profiles.user_id = posts_likes.user_id
WHERE gender RLIKE 'm|f'
GROUP BY gender
ORDER BY amount DESC LIMIT 1;
