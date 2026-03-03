-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.28 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for communication_db
CREATE DATABASE IF NOT EXISTS `communication_db` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `communication_db`;

-- Dumping structure for table communication_db.brand
CREATE TABLE IF NOT EXISTS `brand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table communication_db.brand: ~2 rows (approximately)
INSERT INTO `brand` (`id`, `name`) VALUES
	(1, 'Atlas'),
	(2, 'Rathna'),
	(3, 'SPS');

-- Dumping structure for table communication_db.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `p_id` int NOT NULL,
  `stock_id` int NOT NULL,
  `bill_id` int DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `p_id` (`p_id`),
  KEY `FK_cart_stock` (`stock_id`),
  CONSTRAINT `FK_cart_product` FOREIGN KEY (`p_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FK_cart_stock` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table communication_db.cart: ~4 rows (approximately)
INSERT INTO `cart` (`id`, `p_id`, `stock_id`, `bill_id`, `unit_price`, `qty`, `total`) VALUES
	(2, 1, 1, 2, 15, 2, 30),
	(3, 2, 2, 2, 140, 5, 700),
	(58, 3, 3, 7, 18, 20, 180),
	(59, 3, 3, 7, 17, 10, 170);

-- Dumping structure for table communication_db.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table communication_db.category: ~0 rows (approximately)
INSERT INTO `category` (`id`, `name`) VALUES
	(1, 'Stationary');

-- Dumping structure for table communication_db.discount_type
CREATE TABLE IF NOT EXISTS `discount_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table communication_db.discount_type: ~2 rows (approximately)
INSERT INTO `discount_type` (`id`, `name`) VALUES
	(0, 'Default'),
	(1, 'Personal');

-- Dumping structure for table communication_db.gb_seller
CREATE TABLE IF NOT EXISTS `gb_seller` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table communication_db.gb_seller: ~4 rows (approximately)
INSERT INTO `gb_seller` (`id`, `name`, `mobile`) VALUES
	(1, 'Owner', 'N/A'),
	(2, 'Sandun', '0123456789'),
	(3, 'Nirmala', '0123456789'),
	(4, 'Nishadi', '0123456789');

-- Dumping structure for table communication_db.grn
CREATE TABLE IF NOT EXISTS `grn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `goods_by` int NOT NULL,
  `bill_id` int NOT NULL,
  `value` int DEFAULT NULL,
  `paid` int DEFAULT NULL,
  `details` varchar(100) DEFAULT NULL,
  `grn_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_grn_gb_seller` (`goods_by`),
  CONSTRAINT `FK_grn_gb_seller` FOREIGN KEY (`goods_by`) REFERENCES `gb_seller` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table communication_db.grn: ~5 rows (approximately)
INSERT INTO `grn` (`id`, `goods_by`, `bill_id`, `value`, `paid`, `details`, `grn_date`) VALUES
	(1, 2, 1, 4200, 4500, NULL, '2022-07-01'),
	(2, 4, 2, 750, 500, NULL, '2022-07-25'),
	(3, 2, 3, 300, 0, NULL, '2022-07-26'),
	(4, 3, 4, 10000, 0, NULL, '2022-07-30'),
	(5, 3, 5, 5500, 10000, NULL, '2022-07-30');

-- Dumping structure for table communication_db.grn_stock
CREATE TABLE IF NOT EXISTS `grn_stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pending_by` int NOT NULL,
  `grn_bill_id` int NOT NULL,
  `product_id` int NOT NULL,
  `buy_price` double DEFAULT NULL,
  `sell_price` double DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `item_total` double DEFAULT NULL,
  `ex_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stock_product1_idx` (`product_id`),
  KEY `FK_grn_stock_gb_seller` (`pending_by`),
  CONSTRAINT `FK_grn_stock_gb_seller` FOREIGN KEY (`pending_by`) REFERENCES `gb_seller` (`id`),
  CONSTRAINT `fk_stock_product10` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table communication_db.grn_stock: ~0 rows (approximately)

-- Dumping structure for table communication_db.history
CREATE TABLE IF NOT EXISTS `history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `d_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table communication_db.history: ~0 rows (approximately)

-- Dumping structure for table communication_db.payment
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pay_date` datetime DEFAULT NULL,
  `cash` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  `balance` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table communication_db.payment: ~6 rows (approximately)
INSERT INTO `payment` (`id`, `pay_date`, `cash`, `total`, `balance`) VALUES
	(1, '2022-07-17 20:03:57', 100, 75, 25),
	(2, '2022-07-17 20:16:59', 120, 120, 0),
	(3, '2022-07-18 17:25:19', 1000, 855, 145),
	(4, '2022-07-20 03:23:43', 1320, 1308, 12),
	(5, '2022-07-27 13:36:01', 170, 163, 7),
	(6, '2022-07-30 12:05:34', 1100, 1100, 0);

-- Dumping structure for table communication_db.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `brand_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_brand1_idx` (`brand_id`),
  KEY `FK_product_category` (`category_id`),
  CONSTRAINT `fk_product_brand1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  CONSTRAINT `FK_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table communication_db.product: ~5 rows (approximately)
INSERT INTO `product` (`id`, `name`, `brand_id`, `category_id`) VALUES
	(1, 'Chooty Ten', 1, 1),
	(2, '80 pg A5 single rule', 1, 1),
	(3, 'Chooty Ten (Black)', 1, 1),
	(4, '40 pg A5 Squre rule', 2, 1),
	(5, '80 pg CR Single rule', 2, 1);

-- Dumping structure for table communication_db.profit
CREATE TABLE IF NOT EXISTS `profit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stock_balance` double DEFAULT NULL,
  `today_income` double DEFAULT NULL,
  `month_income` double DEFAULT NULL,
  `total_income` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table communication_db.profit: ~1 rows (approximately)
INSERT INTO `profit` (`id`, `stock_balance`, `today_income`, `month_income`, `total_income`) VALUES
	(1, 17575, 100, 446, 446);

-- Dumping structure for view communication_db.profit_bill
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `profit_bill` (
	`stock_id` INT(10) NOT NULL,
	`buy_price` DOUBLE NULL,
	`sell_price` INT(10) NULL,
	`qty` INT(10) NULL,
	`total` INT(10) NULL,
	`pay_date` DATETIME NULL
) ENGINE=MyISAM;

-- Dumping structure for table communication_db.profit_data
CREATE TABLE IF NOT EXISTS `profit_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sid` int NOT NULL,
  `pname` varchar(50) NOT NULL,
  `bname` varchar(50) NOT NULL,
  `stock_val` double NOT NULL,
  `income` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table communication_db.profit_data: ~6 rows (approximately)
INSERT INTO `profit_data` (`id`, `sid`, `pname`, `bname`, `stock_val`, `income`) VALUES
	(1, 1, 'Chooty Ten', 'Atlas', 0, 198),
	(2, 2, '80 pg A5 single rule', 'Atlas', 2040, 145),
	(3, 3, 'Chooty Ten (Black)', 'Atlas', 735, 3),
	(4, 4, '40 pg A5 Squre rule', 'Rathna', 300, 0),
	(5, 5, '80 pg CR Single rule', 'Rathna', 9000, 100),
	(6, 6, '40 pg A5 Squre rule', 'Rathna', 5500, 0);

-- Dumping structure for table communication_db.q_type
CREATE TABLE IF NOT EXISTS `q_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table communication_db.q_type: ~8 rows (approximately)
INSERT INTO `q_type` (`id`, `name`) VALUES
	(1, '5 pack'),
	(2, '10 pack'),
	(3, '12 pack'),
	(4, '25 pack'),
	(5, '50 pack'),
	(6, '100 pack'),
	(7, '200 pack'),
	(8, '500 pack');

-- Dumping structure for table communication_db.sell_products
CREATE TABLE IF NOT EXISTS `sell_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_id` int NOT NULL,
  `product_id` int NOT NULL,
  `stock_id` int NOT NULL,
  `sell_price` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_id` (`payment_id`),
  KEY `product_id` (`product_id`),
  KEY `FK_sell_products_stock` (`stock_id`),
  CONSTRAINT `FK__payment` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`),
  CONSTRAINT `FK__product_in_sell` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FK_sell_products_stock` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table communication_db.sell_products: ~10 rows (approximately)
INSERT INTO `sell_products` (`id`, `payment_id`, `product_id`, `stock_id`, `sell_price`, `qty`, `total`) VALUES
	(1, 1, 1, 1, 15, 5, 75),
	(2, 2, 2, 2, 120, 1, 120),
	(3, 3, 1, 1, 15, 1, 15),
	(4, 3, 2, 2, 137, 4, 550),
	(5, 3, 2, 2, 145, 2, 290),
	(6, 4, 1, 1, 15, 50, 750),
	(7, 4, 1, 1, 14, 10, 140),
	(8, 4, 1, 1, 13, 10, 130),
	(9, 4, 1, 1, 12, 24, 288),
	(10, 5, 2, 2, 145, 1, 145),
	(11, 5, 3, 3, 18, 1, 18),
	(12, 6, 5, 5, 110, 10, 1100);

-- Dumping structure for table communication_db.services
CREATE TABLE IF NOT EXISTS `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` double DEFAULT NULL,
  `service_date` date DEFAULT NULL,
  `s_type_id` int NOT NULL,
  `details` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_services_s_type1_idx` (`s_type_id`),
  CONSTRAINT `fk_services_s_type1` FOREIGN KEY (`s_type_id`) REFERENCES `s_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table communication_db.services: ~0 rows (approximately)

-- Dumping structure for table communication_db.stock
CREATE TABLE IF NOT EXISTS `stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `grn_id` int NOT NULL,
  `product_id` int NOT NULL,
  `buy_price` double DEFAULT NULL,
  `sell_price` double DEFAULT NULL,
  `stocked` int DEFAULT NULL,
  `item_total` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `ex_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stock_product1_idx` (`product_id`),
  KEY `FK_stock_grn` (`grn_id`),
  CONSTRAINT `FK_stock_grn` FOREIGN KEY (`grn_id`) REFERENCES `grn` (`id`),
  CONSTRAINT `fk_stock_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table communication_db.stock: ~6 rows (approximately)
INSERT INTO `stock` (`id`, `grn_id`, `product_id`, `buy_price`, `sell_price`, `stocked`, `item_total`, `qty`, `ex_date`) VALUES
	(1, 1, 1, 12, 15, 100, 1200, 0, NULL),
	(2, 1, 2, 120, 145, 25, 3000, 17, NULL),
	(3, 2, 3, 15, 18, 50, 750, 49, NULL),
	(4, 3, 4, 100, 125, 3, 300, 3, NULL),
	(5, 4, 5, 100, 120, 100, 10000, 90, NULL),
	(6, 5, 4, 55, 65, 100, 5500, 100, NULL);

-- Dumping structure for view communication_db.stock_bill
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `stock_bill` (
	`id` INT(10) NOT NULL,
	`product_name` VARCHAR(45) NULL COLLATE 'utf8_general_ci',
	`brand_name` VARCHAR(45) NULL COLLATE 'utf8_general_ci',
	`category_name` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`buy_price` DOUBLE NULL,
	`sell_price` DOUBLE NULL,
	`stocked` INT(10) NULL,
	`qty` INT(10) NULL,
	`seller_name` VARCHAR(45) NULL COLLATE 'utf8_general_ci',
	`grn_date` DATE NULL
) ENGINE=MyISAM;

-- Dumping structure for table communication_db.s_type
CREATE TABLE IF NOT EXISTS `s_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table communication_db.s_type: ~0 rows (approximately)

-- Dumping structure for table communication_db.useage
CREATE TABLE IF NOT EXISTS `useage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `use_date` date DEFAULT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_useage_product1_idx` (`product_id`),
  CONSTRAINT `fk_useage_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table communication_db.useage: ~0 rows (approximately)

-- Dumping structure for table communication_db.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table communication_db.user: ~0 rows (approximately)
INSERT INTO `user` (`id`, `name`, `password`) VALUES
	(1, 'Chamila', '123456');

-- Dumping structure for view communication_db.profit_bill
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `profit_bill`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `profit_bill` AS select `sell_products`.`stock_id` AS `stock_id`,`stock`.`buy_price` AS `buy_price`,`sell_products`.`sell_price` AS `sell_price`,`sell_products`.`qty` AS `qty`,`sell_products`.`total` AS `total`,`payment`.`pay_date` AS `pay_date` from ((`sell_products` left join `payment` on((`sell_products`.`payment_id` = `payment`.`id`))) left join `stock` on((`sell_products`.`stock_id` = `stock`.`id`)));

-- Dumping structure for view communication_db.stock_bill
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `stock_bill`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `stock_bill` AS select `stock`.`id` AS `id`,`product`.`name` AS `product_name`,`brand`.`name` AS `brand_name`,`category`.`name` AS `category_name`,`stock`.`buy_price` AS `buy_price`,`stock`.`sell_price` AS `sell_price`,`stock`.`stocked` AS `stocked`,`stock`.`qty` AS `qty`,`gb_seller`.`name` AS `seller_name`,`grn`.`grn_date` AS `grn_date` from (((((`stock` left join `product` on((`stock`.`product_id` = `product`.`id`))) left join `brand` on((`product`.`brand_id` = `brand`.`id`))) left join `category` on((`product`.`category_id` = `category`.`id`))) left join `grn` on((`stock`.`grn_id` = `grn`.`id`))) left join `gb_seller` on((`grn`.`goods_by` = `gb_seller`.`id`)));

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
