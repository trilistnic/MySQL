-- Task 1
SELECT m.from_user_id AS id, u.firstname, u.lastname, COUNT(m.from_user_id) AS amount
FROM users u 
JOIN messages m ON u.id = m.from_user_id
WHERE m.to_user_id = 3
GROUP BY id
ORDER BY amount  DESC LIMIT 1;

-- Task 2
SELECT SUM(pl.like_type) AS like_amount
FROM posts p  
JOIN posts_likes pl ON p.id = pl.post_id
JOIN profiles p2 ON p.user_id = p2.user_id
WHERE FLOOR((TO_DAYS(NOW()) - TO_DAYS(p2.birthday)) / 365.25) < 30;

-- Task 3
SELECT 
CASE (p.gender)
	WHEN 'f' THEN 'female'
	WHEN 'm' THEN 'male'
	ELSE 'not defined'
	END  AS gender, 
SUM(pl.like_type) AS amount
FROM posts_likes pl
JOIN profiles p ON p.user_id = pl.user_id
WHERE p.gender RLIKE 'm|f'
GROUP BY p.gender
ORDER BY amount DESC LIMIT 1;