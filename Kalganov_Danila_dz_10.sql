DROP DATABASE IF EXISTS project;
CREATE DATABASE project;
USE project;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY, #id, по которому будет искать пользвателя
	`login` VARCHAR(32), #логин, который пользователь задал при регистрации
	`password` VARCHAR(64), #пароль в зашифрованном виде
	email VARCHAR(64) UNIQUE, #уникальная почта
	create_at DATETIME DEFAULT NOW() #время создания пользователя
);
	
DELETE FROM users;
INSERT INTO users (`login`, `password`, `email`) VALUES
('Oanevi', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'xoiframmeddeuppe-6433@yopmail.com'),
('Quesdem', 'e0c9035898dd52fc65c41454cec9c4d2611bfb37', 'wulommettoibro-7831@yopmail.com'),
('Recemb', '7e240de74fb1ed08fa08d38063f6a6a91462a815', 'vihaproukeisou-7899@yopmail.com'),
('Elia', '70c881d4a26984ddce795f6f71817c9cf4480e79', 'cujetodoiwau-9034@yopmail.com'),
('Rissyaa', 'df51e37c269aa94d38f93e537bf6e2020b21406c', 'troiquaugrattutro-6972@yopmail.com'),
('Vrosanet', 'f7a9e24777ec23212c54d7a350bc5bea5477fdbb', 'baupruquequaxi-6628@yopmail.com'),
('Rystyn', 'e93b4e3c464ffd51732fbd6ded717e9efda28aad', 'mocrossuppomi-3450@yopmail.com'),
('Usseha', 'b480c074d6b75947c02681f31c90c668c46bf6b8', 'prekovegroinnoi-6345@yopmail.com'),
('Zuridale', '2882f38e575101ba615f725af5e59bf2333a9a68', 'yifissennelo-3471@yopmail.com'),
('Xiean', '3495ff69d34671d1e15b33a63c1379fdedd3a32a', 'lowucaluga-6236@yopmail.com');

DROP TABLE IF EXISTS avatars;
CREATE TABLE avatars (
	id SERIAL PRIMARY KEY, #id, по которому будем искать аватарку
	user_id BIGINT UNSIGNED NOT NULL UNIQUE, #чей аватар
	filename VARCHAR(128) UNIQUE, #название, по которому на сервере будет поиск аватара
	
	FOREIGN KEY (user_id) REFERENCES users(id)
);

DELETE FROM avatars;
INSERT INTO avatars (user_id, filename) VALUES
('1', 'kotik.jpg'),
('2', 'dartveider.png'),
('3', 'TokyoGhoul.jpg'),
('4', 'adasdasf.png'),
('5', 'avatarka.jpg'),
('6', 'priroda.jpg'),
('7', 'photo12.png'),
('8', 'kekw.jpg'),
('9', 'askasfaksj.jpg'),
('10', 'lol.png');

DROP TABLE IF EXISTS skins;
CREATE TABLE skins (
	id SERIAL PRIMARY KEY, #id, по которому будем искать скин
	user_id BIGINT UNSIGNED NOT NULL UNIQUE, #чей скин
	skin_filename VARCHAR(128) UNIQUE, #название, по которому на сервере будет поиск скина
	cloak_filename VARCHAR(128) UNIQUE, #название, по которому на сервере будет поиск плаща
	HD BIT DEFAULT 0, #определяет будет скин пиксельный или HD
	
	FOREIGN KEY (user_id) REFERENCES users(id)
);

DELETE FROM skins;
INSERT INTO skins (user_id, skin_filename, cloak_filename , HD) VALUES
('1', 'fox', NULL, 1),
('2', 'asfasf', NULL, 0),
('3', 'Putin', 'red', 1),
('4', 'kletka', NULL, 0),
('5', 'kakjasf', NULL, 0),
('6', 'monster', 'fired', 1),
('7', 'trapper', NULL, 0),
('8', 'lol', NULL, 0),
('9', 'keks', 'blue', 1),
('10', 'rabbit', 'new', 0);

DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
	user_id BIGINT UNSIGNED NOT NULL UNIQUE, #пользователь
	nickname VARCHAR(16) UNIQUE, #его nickname
	gender CHAR(1), #пол
	birthday DATE, #дата рождения
	avatar_id BIGINT UNSIGNED NULL, #ссылка на аватар
	skin_id BIGINT UNSIGNED NULL, #ссылка на скин
	balance INT, #сколько валюты у пользователя на балансе
	status BIT DEFAULT 1, #аккаунт активный или нет
	authenticator BIT DEFAULT 0, #подключена ли Google Authenticator
	
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (avatar_id) REFERENCES avatars(id),
	FOREIGN KEY (skin_id) REFERENCES skins(id)
);

DELETE FROM profiles;
INSERT INTO profiles VALUES
('1', 'RoMiTos', 'm', '2004-01-15', 1, 1, 104200, 1, 1),
('2', 'Vika1997', 'w', '1997-12-01', 2, 2, 100, 1, 0),
('3', 'Pavel337', 'm', '2010-08-05', 3, 3, 0, 0, 0),
('4', 'lolol', 'w', '1987-02-25', 4, 4, 32200, 1, 1),
('5', 'chert', 'w', '2001-07-13', 5, 5, 1432, 1, 1),
('6', 'tawerka', 'm', '2011-04-18', 6, 6, 594, 1, 0),
('7', 'Mike', 'm', '1977-11-03', 7, 7, 0, 1, 0),
('8', 'rogozavr', 'w', '2005-09-29', 8, 8, 0, 0, 0),
('9', 'killer', 'w', '2003-05-16', 9, 9, 0, 1, 1),
('10', 'ilner', 'w', '1996-02-09', 10, 10, 1409, 1, 0);

DROP TABLE IF EXISTS donate_category;
CREATE TABLE donate_category(
	id SERIAL PRIMARY KEY, #номер категории
	name VARCHAR(128) #название категории
);

DELETE FROM donate_category;
INSERT INTO donate_category VALUES
(NULL, 'Привелегии'),
(NULL, 'Киты'),
(NULL, 'Блоки'),
(NULL, 'Существа'),
(NULL, 'Косметические вещи'),
(NULL, 'Улучшения'),
(NULL, 'Разбан'),
(NULL, 'Механизмы'),
(NULL, 'Особые предметы'),
(NULL, 'Специальные возможности');

DROP TABLE IF EXISTS products;
CREATE TABLE products(
	id SERIAL PRIMARY KEY, #номер продукта
	category_id BIGINT UNSIGNED NOT NULL, #категория продукта
	name VARCHAR(64), #имя продукта
	price INT UNSIGNED NOT NULL, #цена продукта
	discount INT UNSIGNED DEFAULT 0, #какая скидка на продукт в процентах
	discription VARCHAR(256), #описание товара
	
	FOREIGN KEY (category_id) REFERENCES donate_category(id)
);

DELETE FROM products;
INSERT INTO products VALUES
(NULL, 1, 'Лорд', 2500, 5, 'Получает суффикст Лорд, а также увеличивает количество ограничений до двух раз. Позволяет взять специальный кит.'),
(NULL, 1, 'Спонсор', 5000, 10, 'Получает суффикст Спонсор, а также доступ ко всем коммандам.'),
(NULL, 2, 'Оружие', 500, 0, 'Включает в себя зачарованный меч и топор, а также арбалет.'),
(NULL, 2, 'Книги', 500, 0, 'Включает в себя 5 случайных зачарованных книг.'),
(NULL, 3, 'Обсидиан', 100, 5, '64 блока обсидиана.'),
(NULL, 3, 'Книжные полки', 250, 15, '16 книжных полок.'),
(NULL, 4, 'Скелеты', 500, 0, 'Позволяет призывать склетов.'),
(NULL, 4, 'Зомби', 500, 0, 'Позволяет призывать зомби.'),
(NULL, 5, 'Кепка', 300, 25, 'Позволяет надеть на персонажа кепку.'),
(NULL, 6, 'Ускоренное копание', 1000, 15, 'Герой получает эффект копатель.'),
(NULL, 6, 'Удачливый рудокоп', 2387, 5, 'Из руд выпадает больше ресурсов.'),
(NULL, 7, 'Разбан на сервере', 5000, 0, 'Разбан аккаунта на сервере.'),
(NULL, 8, 'Солнечная панель', 2500, 10, 'Генерирует энергию от солнца.'),
(NULL, 9, 'Авада Кедавра', 1000, 5, 'Мгновенно убивает игрока. Можно использовать один раз.'),
(NULL, 10, 'Полет', 2000, 0, 'Позволяет игровому персонажу летать.');

DROP TABLE IF EXISTS donate_log;
CREATE TABLE donate_log(
	id SERIAL, #номер записи
	user_id BIGINT UNSIGNED NOT NULL, #пользователь, который произвел покупку
	product_id BIGINT UNSIGNED NOT NULL, #продукт, который он преобрел
	create_at DATETIME DEFAULT NOW(),
	
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (product_id) REFERENCES products(id)
);

DROP TABLE IF EXISTS donate_log_copy;
CREATE TABLE donate_log_copy(
	user_id BIGINT UNSIGNED NOT NULL, #пользователь, который произвел покупку
	product_id BIGINT UNSIGNED NOT NULL, #продукт, который он преобрел
	create_at DATETIME DEFAULT NOW()
) ENGINE=ARCHIVE;

DROP TRIGGER IF EXISTS copy_log;
DELIMITER //
CREATE TRIGGER copy_log AFTER INSERT ON donate_log FOR EACH ROW
BEGIN
	INSERT INTO donate_log_copy (user_id, product_id) VALUES
	(NEW.user_id, NEW.product_id);
END//
DELIMITER ;

DELETE FROM donate_log;
INSERT INTO donate_log (user_id, product_id) VALUES
(1, 1),
(1, 4),
(1, 8),
(2, 11),
(3, 5),
(4, 8),
(7, 14),
(7, 3),
(7, 11),
(9, 2);

DROP TABLE IF EXISTS consultants;
CREATE TABLE consultants(
	id SERIAL PRIMARY KEY, #номер консультанта
	firstname VARCHAR(32), #имя кольсунтанта
	lastname VARCHAR(32), #фамилия консультанта
	email VARCHAR(32) UNIQUE #email консультанта
);

DELETE FROM consultants;
INSERT INTO consultants VALUES
(NULL, 'Светлана', 'Каплан', 'kaplan@gmail.com'),
(NULL, 'Игорь', 'Будько', 'podderzhka@mail.ru'),
(NULL, 'Александр', 'Филипов', 'filipovaleksandr@mail.ru'),
(NULL, 'Мартынова', 'Светлана', 'oloolo@mail.ru'),
(NULL, 'Светлана', 'Елизарова', 'kekw@gmail.com'),
(NULL, 'Полина', 'Гусева', 'polinka@gmail.com'),
(NULL, 'Наталья', 'Павлова', 'nataliyapoderzhka@mail.ru'),
(NULL, 'Зинаида', 'Савостьина', 'sfafafaf@mail.ru'),
(NULL, 'Ирина', 'Ворошилова', 'delovayapochta@gmail.com'),
(NULL, 'Марина', 'Забирова', 'marinaikea@mail.ru');

DROP TABLE IF EXISTS messages;
CREATE TABLE messages(
	id SERIAL, #номер сообщения
	switch BIT COMMENT '0: from_consultant, to_user 2: from_user, to_consultant', #определяет кто кому пишет
	user_id BIGINT UNSIGNED NOT NULL, #пользователь
	consult_id BIGINT UNSIGNED NOT NULL, #консультант
	text VARCHAR(256), #текст сообщения
	create_at DATETIME DEFAULT NOW(),
	
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (consult_id) REFERENCES consultants(id)
);

DELETE FROM messages;
INSERT INTO messages VALUES
(NULL, 0, 1, 2, 'Здравствуйте, чем могу вам помочь?', NOW()),
(NULL, 0, 3, 2, 'Здравствуйте, чем могу вам помочь?', NOW()),
(NULL, 0, 4, 2, 'Здравствуйте, чем могу вам помочь?', NOW()),
(NULL, 1, 4, 2, 'Подскажите, а полет навсегда или на определенное время?', NOW()),
(NULL, 0, 4, 2, 'Полет выдается навсегда.', NOW()),
(NULL, 0, 6, 5, 'Здравствуйте, чем могу вам помочь?', NOW()),
(NULL, 0, 7, 5, 'Здравствуйте, чем могу вам помочь?', NOW()),
(NULL, 0, 1, 5, 'Здравствуйте, чем могу вам помочь?', NOW()),
(NULL, 0, 3, 5, 'Здравствуйте, чем могу вам помочь?', NOW()),
(NULL, 0, 9, 8, 'Здравствуйте, чем могу вам помочь?', NOW());

DROP TABLE IF EXISTS review;
CREATE TABLE review(
	id SERIAL, #номер отзыва
	user_id BIGINT UNSIGNED NOT NULL, #пользователь, который пишет отзыв
	product_id BIGINT UNSIGNED NOT NULL, #продукт, на который пишут отзыв
	points ENUM('5', '4', '3', '2', '1'), #оценка от 1 до 5
	text VARCHAR(255), #текст отзыва
	create_at DATETIME DEFAULT NOW(),
	
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (product_id) REFERENCES products(id)
);

DELETE FROM review;
INSERT INTO review (user_id, product_id, points, `text`) VALUES
(1, 4, 5, 'Полезно.'),
(1, 8, 5, 'Полезно.'),
(2, 5, 4, ''),
(1, 3, 5, ''),
(1, 12, 5, ''),
(2, 4, 5, 'asfasfо.'),
(1, 4, 3, ''),
(1, 3, 5, 'Полезно.'),
(4, 4, 2, 'afasf'),
(8, 11, 5, 'Полезно.');

CREATE VIEW top_donator AS
SELECT dl.user_id, prof.nickname, SUM(price) AS 'Общая сумма покупок' FROM donate_log AS dl
JOIN products AS prod ON dl.product_id = prod.id
JOIN profiles AS prof ON dl.user_id = prof.user_id
GROUP BY dl.user_id;

CREATE VIEW best_consulnant AS
SELECT CONCAT(firstname, ' ', lastname) AS 'Лучший консультант' FROM messages AS m
JOIN consultants AS c ON m.consult_id = c.id
WHERE switch = 0
GROUP BY consult_id
ORDER BY consult_id 
LIMIT 1;

DROP PROCEDURE IF EXISTS all_sales_for_user;
DELIMITER //
CREATE PROCEDURE all_sales_for_user(IN param BIGINT)
BEGIN
	SELECT p.id AS 'product_id', p.name AS 'product_name' FROM donate_log AS dl
	JOIN products AS p ON dl.product_id = p.id
	WHERE user_id = param;
END//
DELIMITER ;

