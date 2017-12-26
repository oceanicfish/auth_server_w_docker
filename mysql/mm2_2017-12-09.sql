# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.37)
# Database: mm2
# Generation Time: 2017-12-09 04:17:25 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table authorities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `authorities`;

CREATE TABLE `authorities` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_auth_username` (`username`,`authority`),
  CONSTRAINT `fk_authorities_users` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table DOCTOR
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DOCTOR`;

CREATE TABLE `DOCTOR` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` text,
  `birthday` int(10) DEFAULT NULL,
  `gender` text,
  `professional` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `DOCTOR` WRITE;
/*!40000 ALTER TABLE `DOCTOR` DISABLE KEYS */;

INSERT INTO `DOCTOR` (`id`, `name`, `birthday`, `gender`, `professional`)
VALUES
	(1,'tom',2147483647,'male','surgon'),
	(2,'jerry',2147483647,'female','none'),
	(3,'Tony Stark',2147483647,'male','Iron Man'),
	(4,'Peter Parker',2147483647,'male','Spider Man'),
	(5,'Logan',1234567890,'male','Wolverine'),
	(12,'Natasha',0,'female','Black Widow');

/*!40000 ALTER TABLE `DOCTOR` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table DP_DOCTOR
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DP_DOCTOR`;

CREATE TABLE `DP_DOCTOR` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(50) DEFAULT NULL,
  `picture` varchar(200) DEFAULT NULL,
  `specialty` varchar(50) NOT NULL DEFAULT '',
  `organizationID` int(11) DEFAULT NULL,
  `country` varchar(50) NOT NULL DEFAULT '',
  `Region` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `rating` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `DP_DOCTOR` WRITE;
/*!40000 ALTER TABLE `DP_DOCTOR` DISABLE KEYS */;

INSERT INTO `DP_DOCTOR` (`id`, `name`, `title`, `picture`, `specialty`, `organizationID`, `country`, `Region`, `city`, `latitude`, `longitude`, `rating`)
VALUES
	(1,'Kenneth Krauss','Dr.',NULL,'Cardiologist',3750,'PH','Cebu','Mandaue City',10.314687,123.891863,NULL),
	(2,'Gina Wang','Dr.','https://d1cesmq0xhh7we.cloudfront.net/a08ff7f0-8a80-4881-964a-6615fec3b255zoom.jpg','Cardiologist',12,'US','New York','New York City',40.737648,-73.981826,NULL);

/*!40000 ALTER TABLE `DP_DOCTOR` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `role`)
VALUES
	(1,'ROLE_USER'),
	(2,'ROLE_DOCTOR'),
	(3,'ROLE_ADMIN');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) DEFAULT NULL,
  `password` varchar(256) NOT NULL DEFAULT '',
  `enabled` tinyint(1) DEFAULT NULL,
  `roles` varchar(100) NOT NULL DEFAULT '',
  `mobile` varchar(25) NOT NULL DEFAULT '',
  `firstname` varchar(35) NOT NULL DEFAULT '',
  `lastname` varchar(35) NOT NULL DEFAULT '',
  `birthday` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`user_id`, `username`, `password`, `enabled`, `roles`, `mobile`, `firstname`, `lastname`, `birthday`)
VALUES
	(1,'user@example.com','$2a$10$D4OLKI6yy68crm.3imC9X.P2xqKHs5TloWUcr6z5XdOqnTrAK84ri',1,'ROLE_USER','008615640321450','yang','wei',316396800),
	(2,'doctor@example.com','$2a$10$D4OLKI6yy68crm.3imC9X.P2xqKHs5TloWUcr6z5XdOqnTrAK84ri',1,'ROLE_USER, ROLE_DOCTOR','008615640321450','yang','wei',316396800),
	(3,'admin@example.com','$2a$10$D4OLKI6yy68crm.3imC9X.P2xqKHs5TloWUcr6z5XdOqnTrAK84ri',1,'ROLE_USER, ROLE_ADMIN','008615640321450','yang','wei',316396800);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
