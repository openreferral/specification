# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: open-referral.cc2fhv18kp05.us-east-1.rds.amazonaws.com (MySQL 5.6.37-log)
# Database: hsda
# Generation Time: 2019-03-31 20:33:01 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table accessibility_for_disabilities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `accessibility_for_disabilities`;

CREATE TABLE `accessibility_for_disabilities` (
  `id` varchar(38) NOT NULL,
  `location_id` varchar(38) DEFAULT NULL,
  `accessibility` varchar(50) DEFAULT NULL,
  `details` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table apps
# ------------------------------------------------------------

DROP TABLE IF EXISTS `apps`;

CREATE TABLE `apps` (
  `id` varchar(100) NOT NULL,
  `name` varchar(1500) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `app_key` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `depth` int(11) DEFAULT NULL,
  `taxonomy_id` varchar(50) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table contact
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contact`;

CREATE TABLE `contact` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `organization_id` varchar(100) DEFAULT NULL,
  `service_id` varchar(100) DEFAULT NULL,
  `service_at_location_id` varchar(100) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `department` varchar(500) DEFAULT NULL,
  `email` varchar(750) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table eligibility
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eligibility`;

CREATE TABLE `eligibility` (
  `id` varchar(50) NOT NULL,
  `service_id` varchar(50) DEFAULT NULL,
  `eligibility` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fee
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fee`;

CREATE TABLE `fee` (
  `id` varchar(38) NOT NULL,
  `service_id` varchar(38) DEFAULT NULL,
  `fee` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table funding
# ------------------------------------------------------------

DROP TABLE IF EXISTS `funding`;

CREATE TABLE `funding` (
  `id` varchar(38) NOT NULL,
  `organization_id` varchar(38) DEFAULT NULL,
  `service_id` varchar(38) DEFAULT NULL,
  `source` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table holiday_schedule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `holiday_schedule`;

CREATE TABLE `holiday_schedule` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `service_id` varchar(100) DEFAULT NULL,
  `location_id` varchar(100) DEFAULT NULL,
  `service_at_location_id` varchar(100) DEFAULT NULL,
  `closed` varchar(50) DEFAULT NULL,
  `opens_at` varchar(75) DEFAULT NULL,
  `closes_at` varchar(75) DEFAULT NULL,
  `start_date` varchar(75) DEFAULT NULL,
  `end_date` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table interpretation_services
# ------------------------------------------------------------

DROP TABLE IF EXISTS `interpretation_services`;

CREATE TABLE `interpretation_services` (
  `id` varchar(38) NOT NULL,
  `service_id` varchar(38) DEFAULT NULL,
  `language` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table language
# ------------------------------------------------------------

DROP TABLE IF EXISTS `language`;

CREATE TABLE `language` (
  `id` varchar(38) NOT NULL,
  `service_id` varchar(38) DEFAULT NULL,
  `location_id` varchar(38) DEFAULT NULL,
  `language` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table location
# ------------------------------------------------------------

DROP TABLE IF EXISTS `location`;

CREATE TABLE `location` (
  `id` varchar(38) NOT NULL,
  `organization_id` varchar(38) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `alternate_name` varchar(500) DEFAULT NULL,
  `description` text,
  `transportation` varchar(500) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table meta_table_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `meta_table_description`;

CREATE TABLE `meta_table_description` (
  `id` varchar(38) NOT NULL,
  `name` varchar(1000) DEFAULT NULL,
  `language` varchar(1000) DEFAULT NULL,
  `character_set` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table metadata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `metadata`;

CREATE TABLE `metadata` (
  `id` varchar(38) NOT NULL DEFAULT '',
  `resource_id` varchar(38) DEFAULT NULL,
  `last_action_date` datetime DEFAULT NULL,
  `last_action_type` varchar(150) DEFAULT NULL,
  `field_name` varchar(750) DEFAULT NULL,
  `previous_value` varchar(750) DEFAULT NULL,
  `replacement_value` varchar(750) DEFAULT NULL,
  `updated_by` varchar(750) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table organization
# ------------------------------------------------------------

DROP TABLE IF EXISTS `organization`;

CREATE TABLE `organization` (
  `id` varchar(38) NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `alternate_name` varchar(500) DEFAULT NULL,
  `description` text,
  `email` varchar(500) DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL,
  `tax_status` varchar(100) DEFAULT NULL,
  `tax_id` varchar(50) DEFAULT NULL,
  `year_incorporated` varchar(50) DEFAULT NULL,
  `legal_status` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table payment_accepted
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payment_accepted`;

CREATE TABLE `payment_accepted` (
  `id` varchar(38) NOT NULL,
  `service_id` varchar(38) DEFAULT NULL,
  `payment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table phone
# ------------------------------------------------------------

DROP TABLE IF EXISTS `phone`;

CREATE TABLE `phone` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `location_id` varchar(100) DEFAULT NULL,
  `service_id` varchar(100) DEFAULT NULL,
  `organization_id` varchar(100) DEFAULT NULL,
  `contact_id` varchar(100) DEFAULT NULL,
  `service_at_location_id` varchar(100) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `extension` int(10) unsigned DEFAULT '0',
  `type` varchar(100) DEFAULT NULL,
  `department` varchar(250) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table physical_address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `physical_address`;

CREATE TABLE `physical_address` (
  `id` varchar(38) NOT NULL,
  `location_id` varchar(38) DEFAULT NULL,
  `attention` varchar(500) DEFAULT NULL,
  `address_1` varchar(250) DEFAULT NULL,
  `address_2` varchar(250) DEFAULT NULL,
  `address_3` varchar(250) DEFAULT NULL,
  `address_4` varchar(250) DEFAULT NULL,
  `city` varchar(250) DEFAULT NULL,
  `region` varchar(250) DEFAULT NULL,
  `state_province` varchar(100) DEFAULT NULL,
  `postal_code` varchar(50) DEFAULT NULL,
  `country` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table postal_address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `postal_address`;

CREATE TABLE `postal_address` (
  `id` varchar(38) NOT NULL,
  `location_id` varchar(38) DEFAULT NULL,
  `attention` varchar(500) DEFAULT NULL,
  `address_1` varchar(250) DEFAULT NULL,
  `address_2` varchar(250) DEFAULT NULL,
  `address_3` varchar(250) DEFAULT NULL,
  `address_4` varchar(250) DEFAULT NULL,
  `city` varchar(250) DEFAULT NULL,
  `region` varchar(250) DEFAULT NULL,
  `state_province` varchar(100) DEFAULT NULL,
  `postal_code` varchar(50) NOT NULL,
  `country` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table program
# ------------------------------------------------------------

DROP TABLE IF EXISTS `program`;

CREATE TABLE `program` (
  `id` varchar(38) NOT NULL,
  `organization_id` varchar(38) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `alternate_name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table regular_schedule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `regular_schedule`;

CREATE TABLE `regular_schedule` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `service_id` varchar(100) DEFAULT NULL,
  `location_id` varchar(100) DEFAULT NULL,
  `service_at_location_id` varchar(100) DEFAULT NULL,
  `weekday` varchar(75) DEFAULT '0',
  `opens_at` varchar(75) DEFAULT NULL,
  `closes_at` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table required_document
# ------------------------------------------------------------

DROP TABLE IF EXISTS `required_document`;

CREATE TABLE `required_document` (
  `id` varchar(38) NOT NULL,
  `service_id` varchar(38) DEFAULT NULL,
  `document` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table service
# ------------------------------------------------------------

DROP TABLE IF EXISTS `service`;

CREATE TABLE `service` (
  `id` varchar(38) NOT NULL,
  `organization_id` varchar(38) DEFAULT NULL,
  `program_id` varchar(38) DEFAULT NULL,
  `location_id` varchar(38) DEFAULT NULL,
  `name` varchar(1000) DEFAULT NULL,
  `alternate_name` varchar(1000) DEFAULT NULL,
  `description` text,
  `url` varchar(1000) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `interpretation_services` varchar(1500) DEFAULT NULL,
  `application_process` varchar(1000) DEFAULT NULL,
  `wait_time` varchar(100) DEFAULT NULL,
  `fees` varchar(250) DEFAULT NULL,
  `accreditations` varchar(250) DEFAULT NULL,
  `licenses` varchar(250) DEFAULT NULL,
  `taxonomy_ids` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table service_area
# ------------------------------------------------------------

DROP TABLE IF EXISTS `service_area`;

CREATE TABLE `service_area` (
  `id` varchar(38) NOT NULL,
  `service_id` varchar(38) DEFAULT NULL,
  `service_area` varchar(1000) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table service_at_location
# ------------------------------------------------------------

DROP TABLE IF EXISTS `service_at_location`;

CREATE TABLE `service_at_location` (
  `id` varchar(38) NOT NULL,
  `service_id` varchar(38) DEFAULT NULL,
  `location_id` varchar(38) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table service_taxonomy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `service_taxonomy`;

CREATE TABLE `service_taxonomy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` varchar(100) DEFAULT NULL,
  `taxonomy_id` varchar(100) DEFAULT NULL,
  `taxonomy_detail` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table taxonomy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `taxonomy`;

CREATE TABLE `taxonomy` (
  `id` varchar(100) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `parent_id` varchar(100) DEFAULT NULL,
  `parent_name` varchar(100) DEFAULT NULL,
  `vocabulary` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` varchar(100) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(500) NOT NULL,
  `github_id` varchar(45) NOT NULL,
  `github_login` varchar(45) NOT NULL,
  `user_key` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
