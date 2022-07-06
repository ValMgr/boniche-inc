CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT KEY,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'guest',
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `members` (
    `id` int(11) NOT NULL AUTO_INCREMENT KEY,
    `firstname` varchar(255) NOT NULL,
    `lastname` varchar(255) NOT NULL,
    `age` int(11) NOT NULL,
    `pseudo` varchar(255) NOT NULL,
    `country` varchar(255) NOT NULL,
    `city` varchar(255) NOT NULL,
    `description` longtext NOT NULL,
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `games`(
    `id` int(11) NOT NULL AUTO_INCREMENT KEY,
    `name` varchar(255) NOT NULL,
    `description` longtext NOT NULL,
    `currently_playing` tinyint(1) NOT NULL DEFAULT 0,
    `min_players` varchar(255),
    `max_players` varchar(255),
    `server_ip` varchar(255),
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `categories`(
    `id` int(11) NOT NULL AUTO_INCREMENT KEY,
    `name` varchar(255) NOT NULL,
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `games_categories`(
    `game_id` int(11) NOT NULL,
    `category_id` int(11) NOT NULL,
    PRIMARY KEY (`game_id`, `category_id`),
    CONSTRAINT `games_categories_game_id_fk`
        FOREIGN KEY (`game_id`) REFERENCES `games` (`id`),
    CONSTRAINT `games_categories_category_id_fk`
        FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB;


ALTER USER 'root' IDENTIFIED WITH mysql_native_password BY 'pipiboulent';
FLUSH PRIVILEGES;