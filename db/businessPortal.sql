-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.50-0ubuntu0.14.04.1


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema businessPortal
--

CREATE DATABASE IF NOT EXISTS businessPortal;
USE businessPortal;

--
-- Definition of table `businessPortal`.`address`
--

DROP TABLE IF EXISTS `businessPortal`.`address`;
CREATE TABLE  `businessPortal`.`address` (
  `id` bigint(10) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zipCode` varchar(45) DEFAULT NULL,
  `stateName` varchar(45) DEFAULT NULL,
  `cityName` varchar(45) DEFAULT NULL,
  `countyName` varchar(45) DEFAULT NULL,
  `countryId` bigint(3) NOT NULL,
  `stateId` bigint(10) NOT NULL,
  `cityId` bigint(10) NOT NULL,
  `countyId` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_address_country1_idx` (`countryId`),
  KEY `fk_address_state1_idx` (`stateId`),
  KEY `fk_address_city1_idx` (`cityId`),
  KEY `fk_address_county1_idx` (`countyId`),
  CONSTRAINT `fk_address_city1` FOREIGN KEY (`cityId`) REFERENCES `city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_address_country1` FOREIGN KEY (`countryId`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_address_county1` FOREIGN KEY (`countyId`) REFERENCES `county` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_address_state1` FOREIGN KEY (`stateId`) REFERENCES `state` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`address`
--

/*!40000 ALTER TABLE `address` DISABLE KEYS */;
LOCK TABLES `address` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`audit_action`
--

DROP TABLE IF EXISTS `businessPortal`.`audit_action`;
CREATE TABLE  `businessPortal`.`audit_action` (
  `id` bigint(10) NOT NULL,
  `userId` bigint(10) DEFAULT NULL,
  `permissionId` bigint(3) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `host` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`audit_action`
--

/*!40000 ALTER TABLE `audit_action` DISABLE KEYS */;
LOCK TABLES `audit_action` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `audit_action` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`bank`
--

DROP TABLE IF EXISTS `businessPortal`.`bank`;
CREATE TABLE  `businessPortal`.`bank` (
  `id` bigint(3) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `countryId` bigint(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`bank`
--

/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
LOCK TABLES `bank` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`city`
--

DROP TABLE IF EXISTS `businessPortal`.`city`;
CREATE TABLE  `businessPortal`.`city` (
  `id` bigint(10) NOT NULL,
  `stateId` bigint(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `state_country_id` bigint(3) NOT NULL,
  PRIMARY KEY (`id`,`state_country_id`),
  KEY `fk_city_state1_idx` (`state_country_id`),
  CONSTRAINT `fk_city_state1` FOREIGN KEY (`state_country_id`) REFERENCES `state` (`country_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`city`
--

/*!40000 ALTER TABLE `city` DISABLE KEYS */;
LOCK TABLES `city` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`correspondent`
--

DROP TABLE IF EXISTS `businessPortal`.`correspondent`;
CREATE TABLE  `businessPortal`.`correspondent` (
  `id` bigint(3) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`correspondent`
--

/*!40000 ALTER TABLE `correspondent` DISABLE KEYS */;
LOCK TABLES `correspondent` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `correspondent` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`country`
--

DROP TABLE IF EXISTS `businessPortal`.`country`;
CREATE TABLE  `businessPortal`.`country` (
  `id` bigint(3) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `shortName` varchar(5) DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL,
  `alternativeName1` varchar(255) DEFAULT NULL,
  `alternativeName2` varchar(255) DEFAULT NULL,
  `alternativeName3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`country`
--

/*!40000 ALTER TABLE `country` DISABLE KEYS */;
LOCK TABLES `country` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`country_translation`
--

DROP TABLE IF EXISTS `businessPortal`.`country_translation`;
CREATE TABLE  `businessPortal`.`country_translation` (
  `id` int(11) NOT NULL,
  `languageId` bigint(10) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `countryId` bigint(3) NOT NULL,
  PRIMARY KEY (`id`,`countryId`),
  KEY `fk_country_translation_country1_idx` (`countryId`),
  CONSTRAINT `fk_country_translation_country1` FOREIGN KEY (`countryId`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`country_translation`
--

/*!40000 ALTER TABLE `country_translation` DISABLE KEYS */;
LOCK TABLES `country_translation` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `country_translation` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`county`
--

DROP TABLE IF EXISTS `businessPortal`.`county`;
CREATE TABLE  `businessPortal`.`county` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `shortName` varchar(45) DEFAULT NULL,
  `stateId` bigint(3) NOT NULL,
  PRIMARY KEY (`id`,`stateId`),
  KEY `fk_county_state2_idx` (`stateId`),
  CONSTRAINT `fk_county_state2` FOREIGN KEY (`stateId`) REFERENCES `state` (`country_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`county`
--

/*!40000 ALTER TABLE `county` DISABLE KEYS */;
LOCK TABLES `county` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `county` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`county_has_city`
--

DROP TABLE IF EXISTS `businessPortal`.`county_has_city`;
CREATE TABLE  `businessPortal`.`county_has_city` (
  `id` bigint(20) NOT NULL,
  `cityId` bigint(10) NOT NULL,
  `countyId` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_county_has_city_city1_idx` (`cityId`),
  KEY `fk_county_has_city_county1_idx` (`countyId`),
  CONSTRAINT `fk_county_has_city_city1` FOREIGN KEY (`cityId`) REFERENCES `city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_county_has_city_county1` FOREIGN KEY (`countyId`) REFERENCES `county` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`county_has_city`
--

/*!40000 ALTER TABLE `county_has_city` DISABLE KEYS */;
LOCK TABLES `county_has_city` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `county_has_city` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`currency`
--

DROP TABLE IF EXISTS `businessPortal`.`currency`;
CREATE TABLE  `businessPortal`.`currency` (
  `id` bigint(3) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `symbol` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`currency`
--

/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
LOCK TABLES `currency` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`document`
--

DROP TABLE IF EXISTS `businessPortal`.`document`;
CREATE TABLE  `businessPortal`.`document` (
  `id` bigint(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `image` mediumblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`document`
--

/*!40000 ALTER TABLE `document` DISABLE KEYS */;
LOCK TABLES `document` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`enterprise`
--

DROP TABLE IF EXISTS `businessPortal`.`enterprise`;
CREATE TABLE  `businessPortal`.`enterprise` (
  `id` bigint(3) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `currencyId` bigint(3) DEFAULT NULL,
  `countryId` bigint(3) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `atcNumber` varchar(45) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `invoiceAddress` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`enterprise`
--

/*!40000 ALTER TABLE `enterprise` DISABLE KEYS */;
LOCK TABLES `enterprise` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `enterprise` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`exchange_rate`
--

DROP TABLE IF EXISTS `businessPortal`.`exchange_rate`;
CREATE TABLE  `businessPortal`.`exchange_rate` (
  `id` bigint(10) NOT NULL,
  `countryId` bigint(10) DEFAULT NULL,
  `amount` float(20,2) DEFAULT NULL,
  `beginingDate` datetime DEFAULT NULL,
  `endingDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`exchange_rate`
--

/*!40000 ALTER TABLE `exchange_rate` DISABLE KEYS */;
LOCK TABLES `exchange_rate` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `exchange_rate` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`ip_address`
--

DROP TABLE IF EXISTS `businessPortal`.`ip_address`;
CREATE TABLE  `businessPortal`.`ip_address` (
  `id` bigint(3) NOT NULL,
  `ipAddress` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`ip_address`
--

/*!40000 ALTER TABLE `ip_address` DISABLE KEYS */;
LOCK TABLES `ip_address` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `ip_address` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`ip_black_list`
--

DROP TABLE IF EXISTS `businessPortal`.`ip_black_list`;
CREATE TABLE  `businessPortal`.`ip_black_list` (
  `id` bigint(3) NOT NULL,
  `ipAddress` varchar(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`ip_black_list`
--

/*!40000 ALTER TABLE `ip_black_list` DISABLE KEYS */;
LOCK TABLES `ip_black_list` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `ip_black_list` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`language`
--

DROP TABLE IF EXISTS `businessPortal`.`language`;
CREATE TABLE  `businessPortal`.`language` (
  `id` bigint(3) NOT NULL,
  `iso` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`language`
--

/*!40000 ALTER TABLE `language` DISABLE KEYS */;
LOCK TABLES `language` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `language` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`no_working_days`
--

DROP TABLE IF EXISTS `businessPortal`.`no_working_days`;
CREATE TABLE  `businessPortal`.`no_working_days` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`no_working_days`
--

/*!40000 ALTER TABLE `no_working_days` DISABLE KEYS */;
LOCK TABLES `no_working_days` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `no_working_days` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`parameter_type`
--

DROP TABLE IF EXISTS `businessPortal`.`parameter_type`;
CREATE TABLE  `businessPortal`.`parameter_type` (
  `id` bigint(3) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`parameter_type`
--

/*!40000 ALTER TABLE `parameter_type` DISABLE KEYS */;
LOCK TABLES `parameter_type` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `parameter_type` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`payment_method`
--

DROP TABLE IF EXISTS `businessPortal`.`payment_method`;
CREATE TABLE  `businessPortal`.`payment_method` (
  `id` bigint(10) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`payment_method`
--

/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
LOCK TABLES `payment_method` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`payment_network`
--

DROP TABLE IF EXISTS `businessPortal`.`payment_network`;
CREATE TABLE  `businessPortal`.`payment_network` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `paymentNetworkTypeId` bigint(10) NOT NULL,
  `addressId` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payment_network_payment_network_type1_idx` (`paymentNetworkTypeId`),
  KEY `fk_payment_network_address1_idx` (`addressId`),
  CONSTRAINT `fk_payment_network_address1` FOREIGN KEY (`addressId`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_network_payment_network_type1` FOREIGN KEY (`paymentNetworkTypeId`) REFERENCES `payment_network_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`payment_network`
--

/*!40000 ALTER TABLE `payment_network` DISABLE KEYS */;
LOCK TABLES `payment_network` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `payment_network` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`payment_network_type`
--

DROP TABLE IF EXISTS `businessPortal`.`payment_network_type`;
CREATE TABLE  `businessPortal`.`payment_network_type` (
  `id` bigint(3) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`payment_network_type`
--

/*!40000 ALTER TABLE `payment_network_type` DISABLE KEYS */;
LOCK TABLES `payment_network_type` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `payment_network_type` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`payment_type`
--

DROP TABLE IF EXISTS `businessPortal`.`payment_type`;
CREATE TABLE  `businessPortal`.`payment_type` (
  `id` bigint(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`payment_type`
--

/*!40000 ALTER TABLE `payment_type` DISABLE KEYS */;
LOCK TABLES `payment_type` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `payment_type` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`permission`
--

DROP TABLE IF EXISTS `businessPortal`.`permission`;
CREATE TABLE  `businessPortal`.`permission` (
  `id` bigint(3) NOT NULL,
  `action` varchar(45) DEFAULT NULL,
  `entity` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `permissionGroupId` bigint(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_permission_permission_group1_idx` (`permissionGroupId`),
  CONSTRAINT `fk_permission_permission_group1` FOREIGN KEY (`permissionGroupId`) REFERENCES `permission_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`permission`
--

/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
LOCK TABLES `permission` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`permission_data`
--

DROP TABLE IF EXISTS `businessPortal`.`permission_data`;
CREATE TABLE  `businessPortal`.`permission_data` (
  `id` bigint(10) NOT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `permissionId` bigint(3) NOT NULL,
  `languageId` bigint(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_permission_data_permission1_idx` (`permissionId`),
  KEY `fk_permission_data_language1_idx` (`languageId`),
  CONSTRAINT `fk_permission_data_language1` FOREIGN KEY (`languageId`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_permission_data_permission1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`permission_data`
--

/*!40000 ALTER TABLE `permission_data` DISABLE KEYS */;
LOCK TABLES `permission_data` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `permission_data` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`permission_group`
--

DROP TABLE IF EXISTS `businessPortal`.`permission_group`;
CREATE TABLE  `businessPortal`.`permission_group` (
  `id` bigint(3) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`permission_group`
--

/*!40000 ALTER TABLE `permission_group` DISABLE KEYS */;
LOCK TABLES `permission_group` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `permission_group` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`permission_group_data`
--

DROP TABLE IF EXISTS `businessPortal`.`permission_group_data`;
CREATE TABLE  `businessPortal`.`permission_group_data` (
  `id` bigint(10) NOT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `permissionGroupId` bigint(3) NOT NULL,
  `languageId` bigint(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_permission_group_data_permission_group1_idx` (`permissionGroupId`),
  KEY `fk_permission_group_data_language1_idx` (`languageId`),
  CONSTRAINT `fk_permission_group_data_language1` FOREIGN KEY (`languageId`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_permission_group_data_permission_group1` FOREIGN KEY (`permissionGroupId`) REFERENCES `permission_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`permission_group_data`
--

/*!40000 ALTER TABLE `permission_group_data` DISABLE KEYS */;
LOCK TABLES `permission_group_data` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `permission_group_data` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`permission_has_profile`
--

DROP TABLE IF EXISTS `businessPortal`.`permission_has_profile`;
CREATE TABLE  `businessPortal`.`permission_has_profile` (
  `id` bigint(3) NOT NULL,
  `permission_id` bigint(3) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_permission_has_profile_profile1_idx` (`profile_id`),
  KEY `fk_permission_has_profile_permission1_idx` (`permission_id`),
  CONSTRAINT `fk_permission_has_profile_permission1` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_permission_has_profile_profile1` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`permission_has_profile`
--

/*!40000 ALTER TABLE `permission_has_profile` DISABLE KEYS */;
LOCK TABLES `permission_has_profile` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `permission_has_profile` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`person`
--

DROP TABLE IF EXISTS `businessPortal`.`person`;
CREATE TABLE  `businessPortal`.`person` (
  `id` bigint(10) NOT NULL,
  `firstName` varchar(80) DEFAULT NULL,
  `middleName` varchar(80) DEFAULT NULL,
  `lastName` varchar(80) DEFAULT NULL,
  `secondSurname` varchar(80) DEFAULT NULL,
  `phoneNumber` varchar(45) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `addressId` bigint(10) NOT NULL,
  PRIMARY KEY (`id`,`addressId`),
  KEY `fk_person_address1_idx` (`addressId`),
  CONSTRAINT `fk_person_address1` FOREIGN KEY (`addressId`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`person`
--

/*!40000 ALTER TABLE `person` DISABLE KEYS */;
LOCK TABLES `person` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `person` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`preference`
--

DROP TABLE IF EXISTS `businessPortal`.`preference`;
CREATE TABLE  `businessPortal`.`preference` (
  `id` bigint(10) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`preference`
--

/*!40000 ALTER TABLE `preference` DISABLE KEYS */;
LOCK TABLES `preference` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `preference` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`preference_field`
--

DROP TABLE IF EXISTS `businessPortal`.`preference_field`;
CREATE TABLE  `businessPortal`.`preference_field` (
  `id` bigint(3) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `preferenceId` bigint(10) NOT NULL,
  `preferenceTypeId` bigint(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_preference_field_preference1_idx` (`preferenceId`),
  KEY `fk_preference_field_preference_type1_idx` (`preferenceTypeId`),
  CONSTRAINT `fk_preference_field_preference1` FOREIGN KEY (`preferenceId`) REFERENCES `preference` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_preference_field_preference_type1` FOREIGN KEY (`preferenceTypeId`) REFERENCES `preference_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`preference_field`
--

/*!40000 ALTER TABLE `preference_field` DISABLE KEYS */;
LOCK TABLES `preference_field` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `preference_field` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`preference_type`
--

DROP TABLE IF EXISTS `businessPortal`.`preference_type`;
CREATE TABLE  `businessPortal`.`preference_type` (
  `id` bigint(3) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`preference_type`
--

/*!40000 ALTER TABLE `preference_type` DISABLE KEYS */;
LOCK TABLES `preference_type` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `preference_type` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`preference_value`
--

DROP TABLE IF EXISTS `businessPortal`.`preference_value`;
CREATE TABLE  `businessPortal`.`preference_value` (
  `id` bigint(3) NOT NULL,
  `value` varchar(45) DEFAULT NULL,
  `beginningDate` datetime DEFAULT NULL,
  `endingDate` datetime DEFAULT NULL,
  `preferenceFieldId` bigint(3) NOT NULL,
  `enterpriseId` bigint(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_preference_value_preference_field1_idx` (`preferenceFieldId`),
  KEY `fk_preference_value_enterprise1_idx` (`enterpriseId`),
  CONSTRAINT `fk_preference_value_enterprise1` FOREIGN KEY (`enterpriseId`) REFERENCES `enterprise` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_preference_value_preference_field1` FOREIGN KEY (`preferenceFieldId`) REFERENCES `preference_field` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`preference_value`
--

/*!40000 ALTER TABLE `preference_value` DISABLE KEYS */;
LOCK TABLES `preference_value` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `preference_value` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`profile`
--

DROP TABLE IF EXISTS `businessPortal`.`profile`;
CREATE TABLE  `businessPortal`.`profile` (
  `id` bigint(3) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`profile`
--

/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
LOCK TABLES `profile` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`profile_data`
--

DROP TABLE IF EXISTS `businessPortal`.`profile_data`;
CREATE TABLE  `businessPortal`.`profile_data` (
  `id` int(11) NOT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `profileId` bigint(3) NOT NULL,
  `languageId` bigint(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_profile_data_profile1_idx` (`profileId`),
  KEY `fk_profile_data_language1_idx` (`languageId`),
  CONSTRAINT `fk_profile_data_language1` FOREIGN KEY (`languageId`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_profile_data_profile1` FOREIGN KEY (`profileId`) REFERENCES `profile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`profile_data`
--

/*!40000 ALTER TABLE `profile_data` DISABLE KEYS */;
LOCK TABLES `profile_data` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `profile_data` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`rate_payment_network`
--

DROP TABLE IF EXISTS `businessPortal`.`rate_payment_network`;
CREATE TABLE  `businessPortal`.`rate_payment_network` (
  `id` bigint(10) NOT NULL,
  `paymentNetworkId` bigint(10) DEFAULT NULL,
  `amount` float(20,2) DEFAULT NULL,
  `beginingDate` datetime DEFAULT NULL,
  `endingDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`rate_payment_network`
--

/*!40000 ALTER TABLE `rate_payment_network` DISABLE KEYS */;
LOCK TABLES `rate_payment_network` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `rate_payment_network` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`receiver`
--

DROP TABLE IF EXISTS `businessPortal`.`receiver`;
CREATE TABLE  `businessPortal`.`receiver` (
  `id` bigint(20) NOT NULL,
  `personId` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_receiver_person1_idx` (`personId`),
  CONSTRAINT `fk_receiver_person1` FOREIGN KEY (`personId`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`receiver`
--

/*!40000 ALTER TABLE `receiver` DISABLE KEYS */;
LOCK TABLES `receiver` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `receiver` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`remittence`
--

DROP TABLE IF EXISTS `businessPortal`.`remittence`;
CREATE TABLE  `businessPortal`.`remittence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `applicationDate` date DEFAULT NULL,
  `commentary` varchar(255) DEFAULT NULL,
  `amountOrigin` float(20,2) DEFAULT NULL,
  `totalAmount` float(20,2) DEFAULT NULL,
  `sendingOptionSMS` tinyint(1) DEFAULT NULL,
  `amountDestiny` float(20,2) DEFAULT NULL COMMENT '	',
  `paymentServiceId` varchar(15) DEFAULT NULL,
  `secondaryKey` varchar(50) DEFAULT NULL,
  `additionalChanges` float(20,2) DEFAULT NULL,
  `creationDate` date DEFAULT NULL,
  `creationHour` time DEFAULT NULL,
  `localSales` varchar(3) DEFAULT NULL,
  `reserveField1` varchar(80) DEFAULT NULL,
  `remittentId` bigint(20) NOT NULL,
  `receiverId` bigint(20) NOT NULL,
  `correspondentId` bigint(3) NOT NULL,
  `addressRecieverId` bigint(10) NOT NULL,
  `salesTypeId` bigint(3) NOT NULL,
  `addressRemittentId` bigint(10) NOT NULL,
  `exchangeRateId` bigint(10) NOT NULL,
  `ratePaymentNetworkId` bigint(10) NOT NULL,
  `salesPriceHistoryId` bigint(10) NOT NULL,
  `originCurrentId` bigint(3) NOT NULL,
  `destinyCurrentId` bigint(3) NOT NULL,
  `storeId` bigint(10) NOT NULL,
  `paymentMethodId` bigint(10) NOT NULL,
  `serviceTypeId` bigint(3) NOT NULL,
  `paymentNetworkId` bigint(10) NOT NULL,
  `documentId` bigint(20) NOT NULL,
  `languageId` bigint(3) NOT NULL,
  `bankId` bigint(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_remittence_remittent1_idx` (`remittentId`),
  KEY `fk_remittence_receiver1_idx` (`receiverId`),
  KEY `fk_remittence_correspondent1_idx` (`correspondentId`),
  KEY `fk_remittence_address1_idx` (`addressRecieverId`),
  KEY `fk_remittence_sales_type1_idx` (`salesTypeId`),
  KEY `fk_remittence_address2_idx` (`addressRemittentId`),
  KEY `fk_remittence_exchange_rate1_idx` (`exchangeRateId`),
  KEY `fk_remittence_rate_payment_network1_idx` (`ratePaymentNetworkId`),
  KEY `fk_remittence_sale_price_history1_idx` (`salesPriceHistoryId`),
  KEY `fk_remittence_currency1_idx` (`originCurrentId`),
  KEY `fk_remittence_currency2_idx` (`destinyCurrentId`),
  KEY `fk_remittence_store1_idx` (`storeId`),
  KEY `fk_remittence_payment_method1_idx` (`paymentMethodId`),
  KEY `fk_remittence_service_type1_idx` (`serviceTypeId`),
  KEY `fk_remittence_payment_network1_idx` (`paymentNetworkId`),
  KEY `fk_remittence_document1_idx` (`documentId`),
  KEY `fk_remittence_language2_idx` (`languageId`),
  KEY `fk_remittence_bank1_idx` (`bankId`),
  CONSTRAINT `fk_remittence_address1` FOREIGN KEY (`addressRecieverId`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_remittence_address2` FOREIGN KEY (`addressRemittentId`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_remittence_bank1` FOREIGN KEY (`bankId`) REFERENCES `bank` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_remittence_correspondent1` FOREIGN KEY (`correspondentId`) REFERENCES `correspondent` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_remittence_currency1` FOREIGN KEY (`originCurrentId`) REFERENCES `currency` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_remittence_currency2` FOREIGN KEY (`destinyCurrentId`) REFERENCES `currency` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_remittence_document1` FOREIGN KEY (`documentId`) REFERENCES `document` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_remittence_exchange_rate1` FOREIGN KEY (`exchangeRateId`) REFERENCES `exchange_rate` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_remittence_language2` FOREIGN KEY (`languageId`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_remittence_payment_method1` FOREIGN KEY (`paymentMethodId`) REFERENCES `payment_method` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_remittence_payment_network1` FOREIGN KEY (`paymentNetworkId`) REFERENCES `payment_network` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_remittence_rate_payment_network1` FOREIGN KEY (`ratePaymentNetworkId`) REFERENCES `rate_payment_network` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_remittence_receiver1` FOREIGN KEY (`receiverId`) REFERENCES `receiver` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_remittence_remittent1` FOREIGN KEY (`remittentId`) REFERENCES `remittent` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_remittence_sales_type1` FOREIGN KEY (`salesTypeId`) REFERENCES `sales_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_remittence_sale_price_history1` FOREIGN KEY (`salesPriceHistoryId`) REFERENCES `sale_price_history` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_remittence_service_type1` FOREIGN KEY (`serviceTypeId`) REFERENCES `service_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_remittence_store1` FOREIGN KEY (`storeId`) REFERENCES `store` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`remittence`
--

/*!40000 ALTER TABLE `remittence` DISABLE KEYS */;
LOCK TABLES `remittence` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `remittence` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`remittence_status`
--

DROP TABLE IF EXISTS `businessPortal`.`remittence_status`;
CREATE TABLE  `businessPortal`.`remittence_status` (
  `id` bigint(3) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`remittence_status`
--

/*!40000 ALTER TABLE `remittence_status` DISABLE KEYS */;
LOCK TABLES `remittence_status` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `remittence_status` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`remittence_status_has_remittence`
--

DROP TABLE IF EXISTS `businessPortal`.`remittence_status_has_remittence`;
CREATE TABLE  `businessPortal`.`remittence_status_has_remittence` (
  `id` bigint(10) NOT NULL DEFAULT '0',
  `remittence_status_id` bigint(3) NOT NULL,
  `remittence_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_remittence_status_has_remittence_remittence1_idx` (`remittence_id`),
  KEY `fk_remittence_status_has_remittence_remittence_status1_idx` (`remittence_status_id`),
  CONSTRAINT `fk_remittence_status_has_remittence_remittence1` FOREIGN KEY (`remittence_id`) REFERENCES `remittence` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_remittence_status_has_remittence_remittence_status1` FOREIGN KEY (`remittence_status_id`) REFERENCES `remittence_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`remittence_status_has_remittence`
--

/*!40000 ALTER TABLE `remittence_status_has_remittence` DISABLE KEYS */;
LOCK TABLES `remittence_status_has_remittence` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `remittence_status_has_remittence` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`remittent`
--

DROP TABLE IF EXISTS `businessPortal`.`remittent`;
CREATE TABLE  `businessPortal`.`remittent` (
  `id` bigint(20) NOT NULL,
  `personId` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_remittent_person1_idx` (`personId`),
  CONSTRAINT `fk_remittent_person1` FOREIGN KEY (`personId`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`remittent`
--

/*!40000 ALTER TABLE `remittent` DISABLE KEYS */;
LOCK TABLES `remittent` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `remittent` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`remittent_has_receiver`
--

DROP TABLE IF EXISTS `businessPortal`.`remittent_has_receiver`;
CREATE TABLE  `businessPortal`.`remittent_has_receiver` (
  `id` bigint(20) NOT NULL,
  `receiverId` bigint(20) NOT NULL,
  `remittentId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`,`receiverId`,`remittentId`),
  KEY `fk_remittent_has_receiver_receiver1_idx` (`receiverId`),
  KEY `fk_remittent_has_receiver_remittent1_idx` (`remittentId`),
  CONSTRAINT `fk_remittent_has_receiver_receiver1` FOREIGN KEY (`receiverId`) REFERENCES `receiver` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_remittent_has_receiver_remittent1` FOREIGN KEY (`remittentId`) REFERENCES `remittent` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`remittent_has_receiver`
--

/*!40000 ALTER TABLE `remittent_has_receiver` DISABLE KEYS */;
LOCK TABLES `remittent_has_receiver` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `remittent_has_receiver` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`report`
--

DROP TABLE IF EXISTS `businessPortal`.`report`;
CREATE TABLE  `businessPortal`.`report` (
  `id` bigint(3) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` text,
  `webServiceUrl` text,
  `enabled` tinyint(1) DEFAULT NULL,
  `report_type_id` bigint(3) NOT NULL,
  PRIMARY KEY (`id`,`report_type_id`),
  KEY `fk_report_report_type1_idx` (`report_type_id`),
  CONSTRAINT `fk_report_report_type1` FOREIGN KEY (`report_type_id`) REFERENCES `report_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`report`
--

/*!40000 ALTER TABLE `report` DISABLE KEYS */;
LOCK TABLES `report` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`report_has_profile`
--

DROP TABLE IF EXISTS `businessPortal`.`report_has_profile`;
CREATE TABLE  `businessPortal`.`report_has_profile` (
  `id` bigint(10) NOT NULL,
  `parameterTypeId` bigint(3) DEFAULT NULL,
  `profileId` bigint(3) NOT NULL,
  `reportId` bigint(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_report_has_profile_profile1_idx` (`profileId`),
  KEY `fk_report_has_profile_report1_idx` (`reportId`),
  CONSTRAINT `fk_report_has_profile_profile1` FOREIGN KEY (`profileId`) REFERENCES `profile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_report_has_profile_report1` FOREIGN KEY (`reportId`) REFERENCES `report` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`report_has_profile`
--

/*!40000 ALTER TABLE `report_has_profile` DISABLE KEYS */;
LOCK TABLES `report_has_profile` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `report_has_profile` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`report_parameter`
--

DROP TABLE IF EXISTS `businessPortal`.`report_parameter`;
CREATE TABLE  `businessPortal`.`report_parameter` (
  `id` bigint(10) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `indexOrder` int(11) DEFAULT NULL,
  `defaultValue` varchar(255) DEFAULT NULL,
  `parameterTypeId` bigint(3) NOT NULL,
  `reportId` bigint(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_report_parameter_parameter_type1_idx` (`parameterTypeId`),
  KEY `fk_report_parameter_report1_idx` (`reportId`),
  CONSTRAINT `fk_report_parameter_parameter_type1` FOREIGN KEY (`parameterTypeId`) REFERENCES `parameter_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_report_parameter_report1` FOREIGN KEY (`reportId`) REFERENCES `report` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`report_parameter`
--

/*!40000 ALTER TABLE `report_parameter` DISABLE KEYS */;
LOCK TABLES `report_parameter` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `report_parameter` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`report_type`
--

DROP TABLE IF EXISTS `businessPortal`.`report_type`;
CREATE TABLE  `businessPortal`.`report_type` (
  `id` bigint(3) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`report_type`
--

/*!40000 ALTER TABLE `report_type` DISABLE KEYS */;
LOCK TABLES `report_type` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `report_type` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`sale_price`
--

DROP TABLE IF EXISTS `businessPortal`.`sale_price`;
CREATE TABLE  `businessPortal`.`sale_price` (
  `id` bigint(10) NOT NULL,
  `enterpriseId` bigint(3) DEFAULT NULL,
  `countryId` bigint(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`sale_price`
--

/*!40000 ALTER TABLE `sale_price` DISABLE KEYS */;
LOCK TABLES `sale_price` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `sale_price` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`sale_price_history`
--

DROP TABLE IF EXISTS `businessPortal`.`sale_price_history`;
CREATE TABLE  `businessPortal`.`sale_price_history` (
  `id` bigint(10) NOT NULL,
  `oldAmount` float(20,2) DEFAULT NULL,
  `currencyAmount` float(20,2) DEFAULT NULL,
  `beginningDate` datetime DEFAULT NULL,
  `endingdate` datetime DEFAULT NULL,
  `salePriceId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sale_price_history_sale_price1_idx` (`salePriceId`),
  CONSTRAINT `fk_sale_price_history_sale_price1` FOREIGN KEY (`salePriceId`) REFERENCES `sale_price` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`sale_price_history`
--

/*!40000 ALTER TABLE `sale_price_history` DISABLE KEYS */;
LOCK TABLES `sale_price_history` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `sale_price_history` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`sales_type`
--

DROP TABLE IF EXISTS `businessPortal`.`sales_type`;
CREATE TABLE  `businessPortal`.`sales_type` (
  `id` bigint(3) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`sales_type`
--

/*!40000 ALTER TABLE `sales_type` DISABLE KEYS */;
LOCK TABLES `sales_type` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `sales_type` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`service_type`
--

DROP TABLE IF EXISTS `businessPortal`.`service_type`;
CREATE TABLE  `businessPortal`.`service_type` (
  `id` bigint(3) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`service_type`
--

/*!40000 ALTER TABLE `service_type` DISABLE KEYS */;
LOCK TABLES `service_type` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `service_type` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`sms`
--

DROP TABLE IF EXISTS `businessPortal`.`sms`;
CREATE TABLE  `businessPortal`.`sms` (
  `id` bigint(10) NOT NULL,
  `provideId` bigint(3) DEFAULT NULL,
  `sender` varchar(45) DEFAULT NULL,
  `destination` varchar(45) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `storeId` bigint(10) NOT NULL,
  PRIMARY KEY (`id`,`storeId`),
  KEY `fk_sms_store1_idx` (`storeId`),
  CONSTRAINT `fk_sms_store1` FOREIGN KEY (`storeId`) REFERENCES `store` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`sms`
--

/*!40000 ALTER TABLE `sms` DISABLE KEYS */;
LOCK TABLES `sms` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `sms` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`state`
--

DROP TABLE IF EXISTS `businessPortal`.`state`;
CREATE TABLE  `businessPortal`.`state` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `country_id` bigint(3) NOT NULL,
  PRIMARY KEY (`id`,`country_id`),
  KEY `fk_state_country_idx` (`country_id`),
  CONSTRAINT `fk_state_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`state`
--

/*!40000 ALTER TABLE `state` DISABLE KEYS */;
LOCK TABLES `state` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `state` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`store`
--

DROP TABLE IF EXISTS `businessPortal`.`store`;
CREATE TABLE  `businessPortal`.`store` (
  `id` bigint(10) NOT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(45) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `enterpriseId` bigint(3) DEFAULT NULL,
  `language` bigint(3) DEFAULT NULL,
  `addressId` bigint(10) DEFAULT NULL,
  `personId` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`store`
--

/*!40000 ALTER TABLE `store` DISABLE KEYS */;
LOCK TABLES `store` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `store` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`store_balance`
--

DROP TABLE IF EXISTS `businessPortal`.`store_balance`;
CREATE TABLE  `businessPortal`.`store_balance` (
  `id` bigint(10) NOT NULL,
  `limit` float(20,2) DEFAULT NULL,
  `beginningDate` datetime DEFAULT NULL,
  `endingDate` datetime DEFAULT NULL,
  `storeId` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_store_balance_store1_idx` (`storeId`),
  CONSTRAINT `fk_store_balance_store1` FOREIGN KEY (`storeId`) REFERENCES `store` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`store_balance`
--

/*!40000 ALTER TABLE `store_balance` DISABLE KEYS */;
LOCK TABLES `store_balance` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `store_balance` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`store_balance_history`
--

DROP TABLE IF EXISTS `businessPortal`.`store_balance_history`;
CREATE TABLE  `businessPortal`.`store_balance_history` (
  `id` bigint(10) NOT NULL,
  `oldAmount` float(20,2) DEFAULT NULL,
  `currentAmount` float(20,2) DEFAULT NULL,
  `creation` datetime DEFAULT NULL,
  `storeId` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_store_balance_history_store1_idx` (`storeId`),
  CONSTRAINT `fk_store_balance_history_store1` FOREIGN KEY (`storeId`) REFERENCES `store` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`store_balance_history`
--

/*!40000 ALTER TABLE `store_balance_history` DISABLE KEYS */;
LOCK TABLES `store_balance_history` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `store_balance_history` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`store_has_remittent`
--

DROP TABLE IF EXISTS `businessPortal`.`store_has_remittent`;
CREATE TABLE  `businessPortal`.`store_has_remittent` (
  `id` bigint(10) NOT NULL,
  `store_id` bigint(10) NOT NULL,
  `remittent_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_store_has_remittent_remittent1_idx` (`remittent_id`),
  KEY `fk_store_has_remittent_store1_idx` (`store_id`),
  CONSTRAINT `fk_store_has_remittent_remittent1` FOREIGN KEY (`remittent_id`) REFERENCES `remittent` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_store_has_remittent_store1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`store_has_remittent`
--

/*!40000 ALTER TABLE `store_has_remittent` DISABLE KEYS */;
LOCK TABLES `store_has_remittent` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `store_has_remittent` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`store_setting`
--

DROP TABLE IF EXISTS `businessPortal`.`store_setting`;
CREATE TABLE  `businessPortal`.`store_setting` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`store_setting`
--

/*!40000 ALTER TABLE `store_setting` DISABLE KEYS */;
LOCK TABLES `store_setting` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `store_setting` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`user`
--

DROP TABLE IF EXISTS `businessPortal`.`user`;
CREATE TABLE  `businessPortal`.`user` (
  `id` bigint(10) NOT NULL,
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(45) DEFAULT NULL,
  `recieveNotification` tinyint(1) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
LOCK TABLES `user` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`user_has_ip_address`
--

DROP TABLE IF EXISTS `businessPortal`.`user_has_ip_address`;
CREATE TABLE  `businessPortal`.`user_has_ip_address` (
  `id` bigint(10) NOT NULL,
  `beginningDate` datetime DEFAULT NULL,
  `endingdate` datetime DEFAULT NULL,
  `userId` bigint(10) NOT NULL,
  `ipAddressAid` bigint(3) NOT NULL,
  PRIMARY KEY (`id`,`ipAddressAid`),
  KEY `fk_user_has_ip_address_user1_idx` (`userId`),
  KEY `fk_user_has_ip_address_ip_address1_idx` (`ipAddressAid`),
  CONSTRAINT `fk_user_has_ip_address_ip_address1` FOREIGN KEY (`ipAddressAid`) REFERENCES `ip_address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_ip_address_user1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`user_has_ip_address`
--

/*!40000 ALTER TABLE `user_has_ip_address` DISABLE KEYS */;
LOCK TABLES `user_has_ip_address` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `user_has_ip_address` ENABLE KEYS */;


--
-- Definition of table `businessPortal`.`user_has_profile`
--

DROP TABLE IF EXISTS `businessPortal`.`user_has_profile`;
CREATE TABLE  `businessPortal`.`user_has_profile` (
  `id` bigint(10) NOT NULL,
  `beginningDate` datetime DEFAULT NULL,
  `endingdDate` datetime DEFAULT NULL,
  `profileId` bigint(20) NOT NULL,
  `userId` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_has_profile_profile1_idx` (`profileId`),
  KEY `fk_user_has_profile_user1_idx` (`userId`),
  CONSTRAINT `fk_user_has_profile_profile1` FOREIGN KEY (`profileId`) REFERENCES `profile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_profile_user1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessPortal`.`user_has_profile`
--

/*!40000 ALTER TABLE `user_has_profile` DISABLE KEYS */;
LOCK TABLES `user_has_profile` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `user_has_profile` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
