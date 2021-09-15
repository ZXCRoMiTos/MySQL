
#В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
#Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.

START TRANSACTION;
INSERT INTO sample.users (SELECT * FROM shop.users WHERE id = 1);
COMMIT;

#Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее 
#название каталога name из таблицы catalogs.

CREATE OR REPLACE VIEW my_func (prod_name, cat_name) AS SELECT p.name, c.name 
FROM products AS p JOIN catalogs AS c ON p.catalog_id = c.id;

SELECT * FROM my_func;

#Создайте двух пользователей которые имеют доступ к базе данных shop. Первому пользователю shop_read должны быть доступны 
#только запросы на чтение данных, второму пользователю shop — любые операции в пределах базы данных shop.

DROP USER IF EXISTS 'shop_reader'@'localhost';
CREATE USER 'shop_reader'@'localhost' IDENTIFIED WITH sha256_password BY '123';
GRANT SELECT ON shop_online.* TO 'shop_reader'@'localhost';

DROP USER IF EXISTS 'shop'@'localhost';
CREATE USER 'shop'@'localhost' IDENTIFIED WITH sha256_password BY '123';
GRANT ALL ON shop_online.* TO 'shop'@'localhost';
GRANT GRANT OPTION ON shop_online.* TO 'shop'@'localhost';

SELECT USER from mysql.user;

#Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
#С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
#с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

DROP PROCEDURE IF EXISTS hello;
delimiter //
CREATE PROCEDURE hello()
BEGIN
	CASE 
		WHEN CURTIME() BETWEEN '06:00:00' AND '12:00:00' THEN
			SELECT 'Доброе утро';
		WHEN CURTIME() BETWEEN '12:00:00' AND '18:00:00' THEN
			SELECT 'Добрый день';
		WHEN CURTIME() BETWEEN '18:00:00' AND '00:00:00' THEN
			SELECT 'Добрый вечер';
		ELSE
			SELECT 'Доброй ночи';
	END CASE;
END //
delimiter ;

CALL hello();

#В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
#Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
#Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. При попытке присвоить полям NULL-значение 
#необходимо отменить операцию.

USE shop

DROP TRIGGER IF EXISTS nullTrigger;
delimiter //
CREATE TRIGGER nullTrigger BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF(ISNULL(NEW.name) AND ISNULL(NEW.desription)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Trigger Warning! NULL in both fields!';
	END IF;
END //
delimiter ;

INSERT INTO products (name, desription, price, catalog_id)
VALUES (NULL, NULL, 5000, 2); -- FAIL ! Trigger Warning












