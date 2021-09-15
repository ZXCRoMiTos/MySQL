USE vk

#Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
#который больше всех общался с выбранным пользователем (написал ему сообщений).

SELECT CONCAT(firstname, ' ', lastname) AS name
FROM messages
JOIN users ON users.id = from_user_id 
WHERE to_user_id = 1
GROUP BY from_user_id 
ORDER BY COUNT(*) DESC
LIMIT 1;

#Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.

SELECT COUNT(l.media_id) AS 'Likes where year < 10' FROM likes AS l
WHERE media_id IN (
	SELECT id FROM media AS m
	JOIN profiles AS p ON p.user_id = m.user_id
	WHERE (YEAR(NOW()) - YEAR(birthday)) < 10);
	
#Определить кто больше поставил лайков (всего): мужчины или женщины.

SELECT gender FROM profiles AS p
JOIN likes AS l ON p.user_id = l.user_id
GROUP BY gender
ORDER BY COUNT(*) DESC
LIMIT 1;

