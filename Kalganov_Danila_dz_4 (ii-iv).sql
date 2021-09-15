#ii. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке

SELECT DISTINCT firstname
FROM users;

#iii. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). 
#Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)

#Добавляю недостающую колонку
ALTER TABLE profiles ADD COLUMN is_active SMALLINT DEFAULT 0;

#Не очень понятно, потому что взял из документации: https://dev.mysql.com/doc/refman/8.0/en/date-calculations.html
UPDATE profiles 
SET 
	is_active = 1
WHERE ((YEAR(CURRENT_DATE) - YEAR(birthday)) -                             
    (DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(birthday, '%m%d'))) > 18;

#iv. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)
   
#Добавим сообщения из будущего
INSERT INTO messages VALUES
('1000', '1', '6', 'kekw', '2022-08-19 00:00:00'),
('1001', '6', '1', 'kekw', '2021-09-19 00:00:00')
;

#Удаляет сообщения по дате (как в ТЗ), чтобы еще и по времени проверяло я пока что не могу :D
DELETE FROM messages
WHERE DATE(created_at) > CURRENT_DATE();


	