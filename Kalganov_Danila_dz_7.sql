USE shop

#Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

SELECT u.name
FROM users AS u
INNER JOIN orders AS o ON (o.user_id = u.id)
GROUP BY u.name
HAVING COUNT(o.id) > 0

#Выведите список товаров products и разделов catalogs, который соответствует товару.

SELECT p.name, c.name
FROM products AS p
INNER JOIN catalogs AS c ON (p.catalog_id = c.id)
GROUP BY p.id