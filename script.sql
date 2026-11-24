-- Este arquivo é carregado no banco definido por MYSQL_DATABASE no Docker.
-- Para executar manualmente, selecione o banco alvo antes de importar o arquivo.

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_nome` varchar(20) DEFAULT NULL,
  `user_sobrenome` varchar(40) DEFAULT NULL,
  `user_email` varchar(120) DEFAULT NULL,
  `user_senha` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `peripherals` (
  `per_id` int NOT NULL AUTO_INCREMENT,
  `per_nome` varchar(100) DEFAULT NULL,
  `per_marca` varchar(50) DEFAULT NULL,
  `per_categoria` varchar(30) DEFAULT NULL,
  `per_imagem` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`per_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `reviews` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `specifications` (
  `spec_id` int NOT NULL AUTO_INCREMENT,
  `per_id` int DEFAULT NULL,
  `spec_nome` varchar(50) DEFAULT NULL,
  `spec_valor` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`spec_id`),
  KEY `per_id` (`per_id`),
  CONSTRAINT `specifications_ibfk_1` FOREIGN KEY (`per_id`) REFERENCES `peripherals` (`per_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Produtos de demonstração: não duplica registros se o esquema for importado novamente.
INSERT INTO `peripherals` (`per_nome`, `per_marca`, `per_categoria`, `per_imagem`)
SELECT 'Cloud II', 'HyperX', 'Headset', '/static/img/headset.webp'
WHERE NOT EXISTS (
  SELECT 1 FROM `peripherals` WHERE `per_nome` = 'Cloud II' AND `per_marca` = 'HyperX'
);

INSERT INTO `peripherals` (`per_nome`, `per_marca`, `per_categoria`, `per_imagem`)
SELECT 'G Pro X Superlight 2', 'Logitech G', 'Mouse', NULL
WHERE NOT EXISTS (
  SELECT 1 FROM `peripherals` WHERE `per_nome` = 'G Pro X Superlight 2' AND `per_marca` = 'Logitech G'
);

INSERT INTO `peripherals` (`per_nome`, `per_marca`, `per_categoria`, `per_imagem`)
SELECT 'DeathAdder V3', 'Razer', 'Mouse', NULL
WHERE NOT EXISTS (
  SELECT 1 FROM `peripherals` WHERE `per_nome` = 'DeathAdder V3' AND `per_marca` = 'Razer'
);

INSERT INTO `peripherals` (`per_nome`, `per_marca`, `per_categoria`, `per_imagem`)
SELECT 'G Pro X TKL', 'Logitech G', 'Teclado', NULL
WHERE NOT EXISTS (
  SELECT 1 FROM `peripherals` WHERE `per_nome` = 'G Pro X TKL' AND `per_marca` = 'Logitech G'
);

INSERT INTO `peripherals` (`per_nome`, `per_marca`, `per_categoria`, `per_imagem`)
SELECT 'Kumara K552', 'Redragon', 'Teclado', NULL
WHERE NOT EXISTS (
  SELECT 1 FROM `peripherals` WHERE `per_nome` = 'Kumara K552' AND `per_marca` = 'Redragon'
);

INSERT INTO `peripherals` (`per_nome`, `per_marca`, `per_categoria`, `per_imagem`)
SELECT 'QuadCast S', 'HyperX', 'Microfone', NULL
WHERE NOT EXISTS (
  SELECT 1 FROM `peripherals` WHERE `per_nome` = 'QuadCast S' AND `per_marca` = 'HyperX'
);

INSERT INTO `peripherals` (`per_nome`, `per_marca`, `per_categoria`, `per_imagem`)
SELECT 'AM8', 'FIFINE', 'Microfone', NULL
WHERE NOT EXISTS (
  SELECT 1 FROM `peripherals` WHERE `per_nome` = 'AM8' AND `per_marca` = 'FIFINE'
);
