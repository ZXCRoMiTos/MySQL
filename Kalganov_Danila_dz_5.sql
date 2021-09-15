#Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

#При создании полей было использовано DEFAULT CURRENT_TIMESTAMP, поэтому можно использовать DEFAULT для вызова функции CURRENT_TIMESTAMP
UPDATE users
SET 
	created_at = DEFAULT,
	updated_at = DEFAULT
	
#Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR
#и в них долгое время помещались значения в формате "20.10.2017 8:10". 
#Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.

#Создаем дополнительные колонки для временного хранения данных
ALTER TABLE users ADD COLUMN created_at_dt DATETIME; 
ALTER TABLE users ADD COLUMN updated_at_dt DATETIME;

#Переносим данные в временные колонки с преобразованием в правильный формат
UPDATE users
SET created_at_dt = STR_TO_DATE(created_at, '%d.%m.%Y %h:%i'),
    updated_at_dt = STR_TO_DATE(updated_at, '%d.%m.%Y %h:%i');

#Убираем сталые колонки и переименовываем временные колонки в основные
ALTER TABLE users 
    DROP created_at, DROP updated_at, 
    RENAME COLUMN created_at_dt TO created_at, RENAME COLUMN updated_at_dt TO updated_at;
   
#В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, 
#если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, 
#чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.
   
INSERT INTO storehouses_products (storehouse_id, product_id, value) VALUES
('1', '1', '4'),
('2', '1', '0'),
('2', '1', '0'),
('1', '2', '3'),
('3', '1', '1')
;

SELECT * FROM storehouses_products
  ORDER BY CASE WHEN value = 0 THEN 2147483647 ELSE value END

#Подсчитайте средний возраст пользователей в таблице users
SELECT AVG(YEAR(CURDATE())-YEAR(birthday_at))
FROM users


#Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
#Следует учесть, что необходимы дни недели текущего года, а не года рождения.
select 
    weekday(date_format(birthday_at , '2021-%m-%d')) as 'day_number',
    count(*) as 'birthdays_qnty'
from users
group by weekday(date_format(birthday_at, '2021-%m-%d'))
order by day_number;

  