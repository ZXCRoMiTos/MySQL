#Сделал три таблицы к проекту социальной сети
#Осторожно! (много копипасты)

DROP TABLE IF EXISTS dislikes;
CREATE TABLE dislikes(
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
    media_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    
    FOREIGN KEY (user_id) REFERENCES vk.users(id),
    FOREIGN KEY (media_id) REFERENCES vk.media(id)
);

DROP TABLE IF EXISTS music;
CREATE TABLE music (
	id SERIAL PRIMARY KEY,
	name varchar(255) DEFAULT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
    creator_id BIGINT UNSIGNED NOT NULL,
    media_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);

DROP TABLE IF EXISTS ignore_list;
CREATE TABLE ignore_list (
	user_id BIGINT UNSIGNED NOT NULL,
    ignore_user_id BIGINT UNSIGNED NOT NULL,
	ignore_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
	
    PRIMARY KEY (user_id, ignore_user_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (ignore_user_id) REFERENCES users(id)
);