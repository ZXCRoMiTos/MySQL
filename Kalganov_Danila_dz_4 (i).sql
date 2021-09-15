#i. Заполнить все таблицы БД vk данными (по 10-100 записей в каждой таблице)
#Я заполнял ручками, поэтому по 10 записей :)

#Конструкция из интернетов, которая очищает id
SET FOREIGN_KEY_CHECKS = 0; #Страшная и непонятная строка
TRUNCATE TABLE users; 
TRUNCATE TABLE media_types;
TRUNCATE TABLE media;
TRUNCATE TABLE profiles;
TRUNCATE TABLE photo_albums;
TRUNCATE TABLE photos;
TRUNCATE TABLE friend_requests;
TRUNCATE TABLE communities;
TRUNCATE TABLE users_communities;
TRUNCATE TABLE likes;
TRUNCATE TABLE messages;

INSERT INTO users (firstname, lastname, email, password_hash , phone) VALUES
('Katrin', 'Lamber', 'katrinlamber@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', '1505333137'),
('Daniel', 'Armstrong', 'danielarmstrong@yandex.ru', '8ada660e06b787f245667943dc948dafab997e25', '1405836464'),
('Bob', 'Jons', 'bobjons@gmail.com', 'c06d06da9666a219db15cf575aff2824', '1386705369'),
('John', 'Biden', 'americanpresident@usa.com', 'c06d06da9666a219db15cf575aff2824', '1689076123'),
('John', 'Smith', 'thismyemail@gmail.com', '606a11a1b008518af963b7f3cbe0bc6d', '1678456091'),
('Olivia', 'Moore', 'oliviamoore@gmail.com', '0043565a7ac10beb26349844644c4b63', '1830567775'),
('Алексей', 'Петров', 'luchishiyakter@gmail.com', '3a12b5da81e52375aaa1078cd6091c7d85829b73', '7890665231'),
('Азул', 'Ашбаталивев', 'moyabratva@mail.ru', '0f8b3fe6e139dd0842f39e5dcb38a39a', '7890655743'),
('Вася', 'Пупкин', 'pipka@gmail.com', '347ac8177433e27fe2889dc0e8d9ff881304b317', '7888543120'),
('Lui', 'Paster', 'health@gmail.com', '0e6b4ae464014e6f9a2cf2af2375131b', '1890776543')
;

#Хотел сразу заполнить профили, но столкнулся с проблемой того, что нужны id фоток, которые сначала нужно занести как тип в media_types.
#После нужно как бы созать эту фотку в media и только после этого сослаться на нее. Как я понимаю...
INSERT INTO media_types (name) VALUES
('text'),
('video'),
('music'),
('image')
;

#Теперь нужно добавить аватрки пользователей. Не помню, чтобы мы создавали переменную size на уроке, поэтому не знаю, в каком виде
# нужно передавать это количество. Пусть будут байты.
INSERT INTO media (media_type_id, user_id, filename, `size`) VALUES
('4', '1', 'lalala.jpg', '198000'),
('4', '5', 'weekend.jpg', '209000'),
('4', '3', 'inauguration.png', '201000'),
('4', '4', 'afakfkl.png', '197000'),
('4', '9', 'sasliki.png', '230980'),
('4', '2', 'in london.jpg', '213000'),
('4', '6', 'kekw.jpg', '220000'),
('4', '10', 'agsagasga.png', '198520'),
('4', '8', 'naprirode.png', '201892'),
('4', '7', 'рыбалка.png', '208234')
;

#Возникли небольшие затупы по поводу даты, но все решается одним запросом в Google :)
INSERT INTO profiles (user_id, gender, birthday, photo_id, hometown) VALUES
('6', 'w', '2001-02-23', '7', 'Los-Angeles'),
('10', 'm', '1973-04-22', '8', 'Paris'),
('9', 'm', '1993-07-30', '5', 'Москва'),
('7', 'm', '1989-01-25', '10', 'Владивосток'),
('4', 'm', '2001-03-21', '4', 'Sietl'),
('2', 'm', '1968-12-04', '6', 'Washington'),
('3', 'm', '1998-04-25', '3', 'Miami'),
('5', 'm', '1993-12-05', '2', 'Chicago'),
('8', 'm', '1997-02-01', '9', 'Кыргызия'),
('1', 'w', '2010-05-13', '1', 'New-York')
;

#Добавил кучу разных фоток для альбомов
INSERT INTO media (media_type_id, user_id, filename, `size`) VALUES
('4', '9', 'пляж в крыму.png', '1280000'),
('4', '9', 'яночка.jpg', '980000'),
('4', '9', 'ресторан.png', '1310521'),
('4', '9', 'креветки.png', '1500634'),
('4', '1', 'catbullet.png', '2010034'),
('4', '1', 'popcat.png', '1980023'),
('4', '1', 'politecat.png', '1563908'),
('4', '1', 'nyancat.png', '2154034'),
('4', '1', 'cryingcat.png', '1680987'),
('4', '3', 'asfasfaf.png', '1814912'),
('4', '3', 'sdhdshsdgda.jpg', '1581825'),
('4', '3', 'dfhdfesgda.jpeg', '1781556'),
('4', '10', 'London.jpg', '1277391'),
('4', '10', 'Canada.jpg', '1484128'),
('4', '10', 'Germain.jpg', '1295179'),
('4', '10', 'Moscow.jpg', '1155065'),
('4', '10', 'Brazil.jpg', '1832754'),
('4', '9', 'Катя.jpg', '1832754'),
('4', '9', 'Оля.jpg', '1579559'),
('4', '9', 'Вика.jpg', '1994576')
;

INSERT INTO photo_albums (name, user_id) VALUES
('Ялта 2021', '9'),
('Memes', '1'),
('photo', '3'),
('my weekend', '10'),
('MyProgressInMySQL', '2'),
('MyWeekendIn2020', '7'),
('детки', '9'),
('орные мемы', '8'),
('secretUSA', '4'),
('svfasasfasf', '6')
;

#Присваиваю фотки к альбомам
INSERT INTO photos (album_id, media_id) VALUES
('1', '11'),
('1', '13'),
('7', '29'),
('1', '14'),
('4', '27'),
('2', '15'),
('2', '16'),
('2', '18'),
('3', '20'),
('3', '21'),
('3', '22'),
('2', '19'),
('4', '23'),
('4', '24'),
('1', '12'),
('4', '25'),
('4', '26'),
('7', '28'),
('7', '30'),
('2', '17')
;

INSERT INTO friend_requests (initiator_user_id, target_user_id, status) VALUES
('1', '10', 'requested'),
('10', '2', 'requested'),
('2', '9', 'requested'),
('9', '3', 'requested'),
('3', '4', 'requested'),
('3', '8', 'requested'),
('8', '4', 'requested'),
('5', '6', 'requested'),
('4', '7', 'requested'),
('7', '5', 'requested'),
('1', '5', 'requested'),
('2', '7', 'requested'),
('2', '1', 'requested'),
('5', '9', 'requested')
;

INSERT INTO communities (name, admin_user_id) VALUES
('USA Community', '4'),
('Загнивающие пиндосы!', '7'),
('Meme`s', '1'),
('Sell`s promocode', '10'),
('Уралсталь официальная группа!!!', '8'),
('Football new`s', '5'),
('Настольные игры!', '9'),
('Self-development courses', '6'),
('Cat meme`s', '1'),
('my group!', '3')
;

INSERT INTO users_communities (user_id, community_id) VALUES
('1', '1'),
('2', '1'),
('3', '1'),
('5', '1'),
('6', '1'),
('8', '2'),
('9', '2'),
('2', '3'),
('3', '3'),
('6', '3'),
('8', '3'),
('10', '3'),
('7', '4'),
('8', '4'),
('9', '4'),
('1', '4'),
('3', '4'),
('4', '4'),
('6', '4'),
('9', '5'),
('3', '6'),
('6', '6'),
('7', '6'),
('1', '6'),
('10', '9'),
('4', '9')
;

#Пару текстовых постиков для разнообразия
INSERT INTO media (media_type_id, user_id, body) VALUES
('1', '8', 'В Москве сотрудник банка украл 12 млн. рублей и пытался сбежать из страны.'),
('1', '7', 'Польская метательница копья Мария Андрейчик продала с аукциона свою серебряную медаль Токио-2020, чтобы профинансировать операцию на сердце восьмимесячному мальчику.')
;

INSERT INTO likes (user_id, media_id) VALUES
('2', '16'),
('2', '18'),
('3', '25'),
('2', '19'),
('8', '29'),
('2', '23'),
('2', '32'),
('3', '6'),
('8', '28'),
('8', '30'),
('2', '17'),
('7', '31'),
('3', '23'),
('7', '32'),
('9', '31')
;

INSERT INTO messages (from_user_id, to_user_id, body) VALUES
('1', '6', 'So, have you decided where would you like to go on next holiday?'),
('6', '1', 'I think that I will go to my grandparents as usual. I will help them about the house.'),
('6', '1', 'And what about you?'),
('7', '8', 'Ты уже видел мой новый фильм?'),
('1', '6', 'I think that I will go to the seaside with my friends. Will you go with us?'),
('6', '1', 'What will you do there?'),
('9', '8', 'Пошли пить пиво!'),
('1', '6', 'If the weather is fine, we will swim all the time. And I think we will go to an aqua park and maybe we will visit some excursions.'),
('8', '7', 'Еще не видел, но обязательно гляну (нет) :D'),
('6', '1', 'Oh, great. I think that I will join you.'),
('8', '9', 'Возьми корону, лимон и дуй ко мне.'),
('1', '6', 'Ok, I will call you.')
;

#Поизменял статусы для разнообразия
UPDATE friend_requests 
SET `status` = 'approved'
WHERE initiator_user_id = 1 and target_user_id = 5;

UPDATE friend_requests 
SET `status` = 'approved'
WHERE initiator_user_id = 2 and target_user_id = 9;

UPDATE friend_requests 
SET `status` = 'approved'
WHERE initiator_user_id = 7 and target_user_id = 5;

UPDATE friend_requests 
SET `status` = 'declined'
WHERE initiator_user_id = 4 and target_user_id = 7;
