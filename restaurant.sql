# SQL Manager 2010 for MySQL 4.5.0.9
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : restaurant


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

SET FOREIGN_KEY_CHECKS=0;

DROP DATABASE IF EXISTS `restaurant`;

CREATE DATABASE `restaurant`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `restaurant`;

#
# Structure for the `dish` table : 
#

CREATE TABLE `dish` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `price` int(11) NOT NULL DEFAULT '0',
  `description` varchar(100) DEFAULT NULL,
  `enabled` binary(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `dish_type` table : 
#

CREATE TABLE `dish_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `dish_dish_type` table : 
#

CREATE TABLE `dish_dish_type` (
  `id_dish` bigint(20) NOT NULL,
  `id_dish_type` bigint(20) NOT NULL,
  PRIMARY KEY (`id_dish`,`id_dish_type`),
  KEY `id_dish` (`id_dish`),
  KEY `id_dish_type` (`id_dish_type`),
  CONSTRAINT `dish_dish_type_fk_dish` FOREIGN KEY (`id_dish`) REFERENCES `dish` (`id`),
  CONSTRAINT `dish_dish_type_fk_dish_type` FOREIGN KEY (`id_dish_type`) REFERENCES `dish_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `product` table : 
#

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `dish_product` table : 
#

CREATE TABLE `dish_product` (
  `id_dish` bigint(20) NOT NULL,
  `id_product` bigint(20) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id_dish`,`id_product`),
  KEY `id_dish` (`id_dish`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `dish_product_fk_dish` FOREIGN KEY (`id_dish`) REFERENCES `dish` (`id`),
  CONSTRAINT `dish_product_fk_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `sex` table : 
#

CREATE TABLE `sex` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `person` table : 
#

CREATE TABLE `person` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `id_sex` bigint(20) DEFAULT NULL,
  `tel` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `tel` (`tel`),
  UNIQUE KEY `email` (`email`),
  KEY `id_sex` (`id_sex`),
  CONSTRAINT `person_fk_sex` FOREIGN KEY (`id_sex`) REFERENCES `sex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `employee` table : 
#

CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_person` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_person` (`id_person`),
  CONSTRAINT `employee_fk_person` FOREIGN KEY (`id_person`) REFERENCES `person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `occupation_type` table : 
#

CREATE TABLE `occupation_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `position` table : 
#

CREATE TABLE `position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `position_rank` table : 
#

CREATE TABLE `position_rank` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `employee_position` table : 
#

CREATE TABLE `employee_position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_employee` bigint(20) NOT NULL,
  `id_position` bigint(20) NOT NULL,
  `id_position_rank` bigint(20) DEFAULT NULL,
  `id_occupation_type` bigint(20) NOT NULL,
  `occupation` float(3,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_employee` (`id_employee`,`id_position`,`occupation`,`id_occupation_type`),
  KEY `id_employee_2` (`id_employee`),
  KEY `id_position` (`id_position`),
  KEY `employee_position_fk_occ_type` (`id_occupation_type`),
  KEY `id_position_rank` (`id_position_rank`),
  CONSTRAINT `employee_position_fk_pos_rank` FOREIGN KEY (`id_position_rank`) REFERENCES `position_rank` (`id`),
  CONSTRAINT `employee_position_fk_employee` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id`),
  CONSTRAINT `employee_position_fk_occ_type` FOREIGN KEY (`id_occupation_type`) REFERENCES `occupation_type` (`id`),
  CONSTRAINT `employee_position_fk_position` FOREIGN KEY (`id_position`) REFERENCES `position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `table` table : 
#

CREATE TABLE `table` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `seats` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `order` table : 
#

CREATE TABLE `order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_table` bigint(20) NOT NULL,
  `id_employee` bigint(20) NOT NULL,
  `price` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id_table` (`id_table`),
  KEY `id_employee` (`id_employee`),
  CONSTRAINT `order_fk_employee` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id`),
  CONSTRAINT `order_fk_table` FOREIGN KEY (`id_table`) REFERENCES `table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `order_dish` table : 
#

CREATE TABLE `order_dish` (
  `id_order` bigint(20) NOT NULL,
  `id_dish` bigint(20) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id_order`,`id_dish`),
  KEY `id_order` (`id_order`),
  KEY `id_dish` (`id_dish`),
  CONSTRAINT `order_dish_fk_dish` FOREIGN KEY (`id_dish`) REFERENCES `dish` (`id`),
  CONSTRAINT `order_dish_fk_order` FOREIGN KEY (`id_order`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `role` table : 
#

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `user` table : 
#

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `id_person` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `id_person` (`id_person`),
  UNIQUE KEY `id_person_2` (`id_person`),
  CONSTRAINT `user_fk_person` FOREIGN KEY (`id_person`) REFERENCES `person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `user_role` table : 
#

CREATE TABLE `user_role` (
  `id_user` bigint(20) NOT NULL,
  `id_role` bigint(20) NOT NULL,
  PRIMARY KEY (`id_user`,`id_role`),
  KEY `id_user` (`id_user`),
  KEY `id_role` (`id_role`),
  CONSTRAINT `user_role_fk_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`),
  CONSTRAINT `user_role_fk_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;