#Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs 
#помещается время и дата создания записи, название таблицы, идентификатор первичного ключа и содержимое поля name.


DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела',
  UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  description TEXT COMMENT 'Описание',
  price DECIMAL (11,2) COMMENT 'Цена',
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_catalog_id (catalog_id)
) COMMENT = 'Товарные позиции';

DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs`(
	id SERIAL,
	created_at DATETIME,
	table_name VARCHAR(32),
	table_id INT,
	name VARCHAR(32)
) ENGINE=ARCHIVE;

DROP TRIGGER IF EXISTS log_users;
delimiter //

CREATE TRIGGER log_users AFTER INSERT ON users FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, table_id, name) VALUES (
	NOW(), 'users', NEW.id, NEW.name);
END //

delimiter ;

DROP TRIGGER IF EXISTS log_catalogs;
delimiter //

CREATE TRIGGER log_catalogs AFTER INSERT ON catalogs FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, table_id, name) VALUES (
	NOW(), 'catalogs', NEW.id, NEW.name);
END //

delimiter ;

DROP TRIGGER IF EXISTS log_products;
delimiter //

CREATE TRIGGER log_products AFTER INSERT ON products FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, table_id, name) VALUES (
	NOW(), 'products', NEW.id, NEW.name);
END //

delimiter ;


DELETE FROM users;
INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');

DELETE FROM catalogs;
INSERT INTO catalogs VALUES
  (NULL, 'Процессоры'),
  (NULL, 'Материнские платы'),
  (NULL, 'Видеокарты'),
  (NULL, 'Жесткие диски'),
  (NULL, 'Оперативная память');

DELETE FROM products;
INSERT INTO products (name, description, price, catalog_id) VALUES
  ('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1),
  ('Intel Core i5-7400', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 12700.00, 1),
  ('AMD FX-8320E', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 4780.00, 1),
  ('AMD FX-8320', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 7120.00, 1),
  ('ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', 19310.00, 2),
  ('Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', 4790.00, 2),
  ('MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', 5060.00, 2);
 
SELECT * FROM logs;


#Создайте SQL-запрос, который помещает в таблицу users миллион записей.

DROP TABLE IF EXISTS test_users; 
CREATE TABLE test_users (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	birthday_at DATE,
	`created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
 	`updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DROP PROCEDURE IF EXISTS insert_into_users ;
delimiter //
CREATE PROCEDURE insert_into_users ()
BEGIN
	DECLARE i INT DEFAULT 10000000;
	WHILE i > 0 DO
		INSERT INTO test_users(name, birthday_at) VALUES (CONCAT('user_', j), NOW());
		SET i = i - 1;
	END WHILE;
END //
delimiter ;

DELETE FROM test_users;
CALL insert_into_users;

SELECT * FROM test_users;

