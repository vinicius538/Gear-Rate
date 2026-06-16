CREATE DATABASE `gear_rate`;
USE `gear_rate`;

CREATE TABLE `peripherals` (
  `per_id` int NOT NULL AUTO_INCREMENT,
  `per_nome` varchar(100) DEFAULT NULL,
  `per_marca` varchar(50) DEFAULT NULL,
  `per_categoria` varchar(30) DEFAULT NULL,
  `per_imagem` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`per_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `reviews` (
  `rev_id` int NOT NULL AUTO_INCREMENT,
  `rev_text` text,
  `rev_rate` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `per_id` int DEFAULT NULL,
  `rev_data` date DEFAULT (curdate()),
  PRIMARY KEY (`rev_id`),
  KEY `user_id` (`user_id`),
  KEY `per_id` (`per_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`per_id`) REFERENCES `peripherals` (`per_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `specifications` (
  `spec_id` int NOT NULL AUTO_INCREMENT,
  `per_id` int DEFAULT NULL,
  `spec_nome` varchar(50) DEFAULT NULL,
  `spec_valor` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`spec_id`),
  KEY `per_id` (`per_id`),
  CONSTRAINT `specifications_ibfk_1` FOREIGN KEY (`per_id`) REFERENCES `peripherals` (`per_id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_nome` varchar(20) DEFAULT NULL,
  `user_sobrenome` varchar(40) DEFAULT NULL,
  `user_email` varchar(120) DEFAULT NULL,
  `user_senha` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
