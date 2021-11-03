--
-- ------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accessibility_for_disabilities`
--

DROP TABLE IF EXISTS `accessibility_for_disabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accessibility_for_disabilities` (
  `id` varchar(250) NOT NULL COMMENT 'Each entry must have a unique identifier',
  `location_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the location for which the entry describes the accessibility provision',
  `accessibility` text COMMENT 'Description of assistance or infrastructure that facilitate access to clients with disabilities.',
  `details` text COMMENT 'Any further details relating to the relevant accessibility arrangements at this location. E.g. whether advance notice is required to use an accessibility facility.',
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `accessibility_for_disabilities_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `accessibility_for_disabilities_chk_1` CHECK ((length(`id`) <= 250)),
  CONSTRAINT `accessibility_for_disabilities_chk_2` CHECK ((length(`location_id`) <= 250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` varchar(250) NOT NULL COMMENT 'Each contact must have a unique identifier',
  `organization_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the organization for which this is a contact',
  `service_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the service for which this is a contact',
  `service_at_location_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the ''service at location'' table entry, when this contact is specific to a service in a particular location.',
  `name` text COMMENT 'The name of the person',
  `title` text COMMENT 'The job title of the person',
  `department` text COMMENT 'The department that the person is part of',
  `email` text COMMENT 'The email address of the person',
  PRIMARY KEY (`id`),
  KEY `organization_id` (`organization_id`),
  KEY `service_id` (`service_id`),
  KEY `service_at_location_id` (`service_at_location_id`),
  CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
  CONSTRAINT `contact_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  CONSTRAINT `contact_ibfk_3` FOREIGN KEY (`service_at_location_id`) REFERENCES `service_at_location` (`id`),
  CONSTRAINT `contact_chk_1` CHECK ((length(`id`) <= 250)),
  CONSTRAINT `contact_chk_2` CHECK ((length(`organization_id`) <= 250)),
  CONSTRAINT `contact_chk_3` CHECK ((length(`service_id`) <= 250)),
  CONSTRAINT `contact_chk_4` CHECK ((length(`service_at_location_id`) <= 250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eligibility`
--

DROP TABLE IF EXISTS `eligibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eligibility` (
  `id` varchar(250) NOT NULL COMMENT 'Each entry must have a unique identifier',
  `service_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the service for which this entry describes the eligibility criteria',
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `eligibility_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  CONSTRAINT `eligibility_chk_1` CHECK ((length(`id`) <= 250)),
  CONSTRAINT `eligibility_chk_2` CHECK ((length(`service_id`) <= 250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funding`
--

DROP TABLE IF EXISTS `funding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funding` (
  `id` varchar(250) NOT NULL COMMENT 'Each entry must have a unique identifier',
  `organization_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the organization in receipt of this funding.',
  `service_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the service in receipt of this funding',
  `source` text COMMENT 'A free text description of the source of funds for this organization or service.',
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`),
  KEY `organization_id` (`organization_id`),
  CONSTRAINT `funding_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  CONSTRAINT `funding_ibfk_2` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
  CONSTRAINT `funding_chk_1` CHECK ((length(`id`) <= 250)),
  CONSTRAINT `funding_chk_2` CHECK ((length(`organization_id`) <= 250)),
  CONSTRAINT `funding_chk_3` CHECK ((length(`service_id`) <= 250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language` (
  `id` varchar(250) NOT NULL COMMENT 'Each language must have a unique identifier',
  `service_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the service for which the entry describes the languages in which services are delivered',
  `location_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the location for which the entry describes the languages in which services are delivered',
  `language` text COMMENT 'Languages, other than English, in which the service is delivered. Languages are listed as ISO639-1 codes.',
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `language_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  CONSTRAINT `language_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `language_chk_1` CHECK ((length(`id`) <= 250)),
  CONSTRAINT `language_chk_2` CHECK ((length(`service_id`) <= 250)),
  CONSTRAINT `language_chk_3` CHECK ((length(`location_id`) <= 250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` varchar(250) NOT NULL COMMENT 'Each location must have a unique identifier',
  `organization_id` varchar(250) DEFAULT NULL COMMENT 'Each location entry should be linked to a single organization. This is the organization that is responsible for maintaining information about this location. The identifier of the organization should be given here. Details of the services the organisation delivers at this location should be provided in the services_at_location table.',
  `name` text COMMENT 'The name of the location',
  `alternate_name` text COMMENT 'An alternative name for the location',
  `description` text COMMENT 'A description of this location.',
  `transportation` text COMMENT 'A description of the access to public or private transportation to and from the location.',
  `latitude` float DEFAULT NULL COMMENT 'Y coordinate of location expressed in decimal degrees in WGS84 datum.',
  `longitude` float DEFAULT NULL COMMENT 'X coordinate of location expressed in decimal degrees in WGS84 datum.',
  PRIMARY KEY (`id`),
  KEY `organization_id` (`organization_id`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
  CONSTRAINT `location_chk_1` CHECK ((length(`id`) <= 250)),
  CONSTRAINT `location_chk_2` CHECK ((length(`organization_id`) <= 250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meta_table_description`
--

DROP TABLE IF EXISTS `meta_table_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_table_description` (
  `id` varchar(250) NOT NULL COMMENT 'Each entry must have a unique identifier',
  `name` text,
  `language` text,
  `character_set` text,
  PRIMARY KEY (`id`),
  CONSTRAINT `meta_table_description_chk_1` CHECK ((length(`id`) <= 250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `metadata`
--

DROP TABLE IF EXISTS `metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metadata` (
  `id` varchar(250) NOT NULL COMMENT 'Each entry must have a unique identifier',
  `resource_id` text NOT NULL COMMENT 'Each service, program. location, address, or contact will have a unique identifier.',
  `resource_type` enum('organization','program','service','service_attribute','other_attribute','service_at_location','location','phone','contact','schedule','funding','eligibility','service_area','accessibility_for_disabilities','taxonomy_term') NOT NULL COMMENT 'The type of entity being referenced',
  `last_action_date` datetime NOT NULL COMMENT 'The date when data was changed.',
  `last_action_type` text NOT NULL COMMENT 'The kind of change made to the data; eg create, update, delete',
  `field_name` text NOT NULL COMMENT 'The name of field that has been modified',
  `previous_value` text NOT NULL COMMENT 'The previous value of a field that has been updated',
  `replacement_value` text NOT NULL COMMENT 'The new value of a field that has been updated',
  `updated_by` text NOT NULL COMMENT 'The name of the person who updated a value',
  PRIMARY KEY (`id`),
  CONSTRAINT `metadata_chk_1` CHECK ((length(`id`) <= 250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization` (
  `id` varchar(250) NOT NULL COMMENT 'Each organization must have a unique identifier.',
  `name` text NOT NULL COMMENT 'The official or public name of the organization.',
  `alternate_name` text COMMENT 'Alternative or commonly used name for the organization.',
  `description` text NOT NULL COMMENT 'A brief summary about the organization. It can contain markup such as HTML or Markdown.',
  `email` text COMMENT 'The contact e-mail address for the organization.',
  `url` text COMMENT 'The URL (website address) of the organization.',
  `tax_status` text COMMENT 'Government assigned tax designation for tax-exempt organizations.',
  `tax_id` text COMMENT 'A government issued identifier used for the purpose of tax administration.',
  `year_incorporated` date DEFAULT NULL COMMENT 'The year in which the organization was legally formed.',
  `legal_status` text COMMENT 'The legal status defines the conditions that an organization is operating under; e.g. non-profit, private corporation or a government organization.',
  PRIMARY KEY (`id`),
  CONSTRAINT `organization_chk_1` CHECK ((length(`id`) <= 250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `other_attribute`
--

DROP TABLE IF EXISTS `other_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `other_attribute` (
  `id` varchar(250) NOT NULL COMMENT 'Each other_attribute entry should have a unique identifier.',
  `link_id` text NOT NULL COMMENT 'The identifier of the entity to which this taxonomy term applies.',
  `link_type` enum('organization','program','service','service_at_location','location','phone','contact','physical_address','postal_address','schedule','funding','eligibility','service_area','required_document','payment_accepted','language','accessibility_for_disabilities') NOT NULL COMMENT 'The identifier of the entity to which this taxonomy term applies.',
  `taxonomy_term_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of this taxonomy term from the taxonomy table.',
  PRIMARY KEY (`id`),
  KEY `taxonomy_term_id` (`taxonomy_term_id`),
  CONSTRAINT `other_attribute_ibfk_1` FOREIGN KEY (`taxonomy_term_id`) REFERENCES `taxonomy_term` (`id`),
  CONSTRAINT `other_attribute_chk_1` CHECK ((length(`id`) <= 250)),
  CONSTRAINT `other_attribute_chk_2` CHECK ((length(`taxonomy_term_id`) <= 250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_accepted`
--

DROP TABLE IF EXISTS `payment_accepted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_accepted` (
  `id` varchar(250) NOT NULL COMMENT 'Each entry must have a unique identifier',
  `service_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the services for which the entry describes the accepted payment methods',
  `payment` text COMMENT 'The methods of payment accepted for the service',
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `payment_accepted_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  CONSTRAINT `payment_accepted_chk_1` CHECK ((length(`id`) <= 250)),
  CONSTRAINT `payment_accepted_chk_2` CHECK ((length(`service_id`) <= 250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `phone`
--

DROP TABLE IF EXISTS `phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone` (
  `id` varchar(250) NOT NULL COMMENT 'Each entry must have a unique identifier',
  `location_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the location where this phone number is located',
  `service_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the service for which this is the phone number',
  `organization_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the organisation for which this is the phone number',
  `contact_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the contact for which this is the phone number',
  `service_at_location_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the ''service at location'' table entry, when this phone number is specific to a service in a particular location.',
  `number` text NOT NULL COMMENT 'The phone number',
  `extension` float DEFAULT NULL COMMENT 'The extension of the phone number',
  `type` enum('text','voice','fax','cell','video','pager','textphone') DEFAULT NULL COMMENT 'Indicates the type of phone service, drawing from the RFC6350 list of types (text (for SMS), voice, fax, cell, video, pager, textphone).',
  `language` text COMMENT 'A comma separated list of ISO 639-1, or ISO 639-2 [language codes](available at http://www.loc.gov/standards/iso639-2/php/code_list.php) to represent the languages available from this phone service. The three-letter codes from ISO 639-2 provide greater accuracy when describing variants of languages, which may be relevant to particular communities.',
  `description` text COMMENT 'A description providing extra information about the phone service (e.g. any special arrangements for accessing, or details of availability at particular times.',
  `department` text COMMENT '(Deprecated) The department for which this is the phone number. This field is deprecated and will be removed in a future version of HSDS.',
  PRIMARY KEY (`id`),
  KEY `organization_id` (`organization_id`),
  KEY `location_id` (`location_id`),
  KEY `service_id` (`service_id`),
  KEY `contact_id` (`contact_id`),
  KEY `service_at_location_id` (`service_at_location_id`),
  CONSTRAINT `phone_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
  CONSTRAINT `phone_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `phone_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  CONSTRAINT `phone_ibfk_4` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `phone_ibfk_5` FOREIGN KEY (`service_at_location_id`) REFERENCES `service_at_location` (`id`),
  CONSTRAINT `phone_chk_1` CHECK ((length(`id`) <= 250)),
  CONSTRAINT `phone_chk_2` CHECK ((length(`location_id`) <= 250)),
  CONSTRAINT `phone_chk_3` CHECK ((length(`service_id`) <= 250)),
  CONSTRAINT `phone_chk_4` CHECK ((length(`organization_id`) <= 250)),
  CONSTRAINT `phone_chk_5` CHECK ((length(`contact_id`) <= 250)),
  CONSTRAINT `phone_chk_6` CHECK ((length(`service_at_location_id`) <= 250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `physical_address`
--

DROP TABLE IF EXISTS `physical_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `physical_address` (
  `id` varchar(250) NOT NULL COMMENT 'Each physical address must have a unique identifier.',
  `location_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the location for which this is the address.',
  `attention` text COMMENT 'The person or entity whose attention should be sought at the location (Often included as ''care of'' component of an address.)',
  `address_1` text NOT NULL COMMENT 'The first line(s) of the address, including office, building number and street.',
  `address_2` text COMMENT '(Deprecated) A second (additional) line of address information. (This field is deprecated: we recommend including all address information before ''city'' as a comma or newline separated list in address_1. There is no guarantee that systems will read this line of address information.)',
  `address_3` text COMMENT '(Deprecated) A third (additional) line of address information. (This field is deprecated: we recommend including all address information before ''city'' as a comma or newline separated list in address_1. There is no guarantee that systems will read this line of address information.)',
  `address_4` text COMMENT '(Deprecated) The fourth (additional) line of address information. (This field is deprecated: we recommend including all address information before ''city'' as a comma or newline separated list in address_1. There is no guarantee that systems will read this line of address information.)',
  `city` text NOT NULL COMMENT 'The city in which the address is located.',
  `region` text COMMENT 'The region in which the address is located (optional).',
  `state_province` text NOT NULL COMMENT 'The state or province in which the address is located.',
  `postal_code` text NOT NULL COMMENT 'The postal code for the address.',
  `country` text NOT NULL COMMENT 'The country in which the address is located. This should be given as an ISO 3361-1 country code (two letter abbreviation).',
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `physical_address_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `physical_address_chk_1` CHECK ((length(`id`) <= 250)),
  CONSTRAINT `physical_address_chk_2` CHECK ((length(`location_id`) <= 250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `postal_address`
--

DROP TABLE IF EXISTS `postal_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postal_address` (
  `id` varchar(250) NOT NULL COMMENT 'Each postal address must have a unique identifier',
  `location_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the location for which this is the postal address.',
  `attention` text COMMENT 'The person or entity whose attention should be sought at the location (Often included as ''care of'' component of an address.)',
  `address_1` text NOT NULL COMMENT 'The first line(s) of the address, including office, building number and street.',
  `address_2` text COMMENT '(Deprecated) A second (additional) line of address information. (This field is deprecated: we recommend including all address information before ''city'' as a comma or newline separated list in address_1. There is no guarantee that systems will read this line of address information.)',
  `address_3` text COMMENT '(Deprecated) A third (additional) line of address information. (This field is deprecated: we recommend including all address information before ''city'' as a comma or newline separated list in address_1. There is no guarantee that systems will read this line of address information.)',
  `address_4` text COMMENT '(Deprecated) The fourth (additional) line of address information. (This field is deprecated: we recommend including all address information before ''city'' as a comma or newline separated list in address_1. There is no guarantee that systems will read this line of address information.)',
  `city` text NOT NULL COMMENT 'The city in which the address is located.',
  `region` text COMMENT 'The region in which the address is located (optional).',
  `state_province` text NOT NULL COMMENT 'The state or province in which the address is located.',
  `postal_code` text NOT NULL COMMENT 'The postal code for the address.',
  `country` text NOT NULL COMMENT 'The country in which the address is located. This should be given as an ISO 3361-1 country code (two letter abbreviation)',
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `postal_address_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `postal_address_chk_1` CHECK ((length(`id`) <= 250)),
  CONSTRAINT `postal_address_chk_2` CHECK ((length(`location_id`) <= 250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program` (
  `id` varchar(250) NOT NULL COMMENT 'Each program must have a unique identifier.',
  `organization_id` varchar(250) NOT NULL COMMENT 'Each program must belong to a single organization. The identifier of the organization should be given here.',
  `name` text NOT NULL COMMENT 'The name of the program',
  `alternate_name` text COMMENT 'An alternative name for the program',
  PRIMARY KEY (`id`),
  KEY `organization_id` (`organization_id`),
  CONSTRAINT `program_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
  CONSTRAINT `program_chk_1` CHECK ((length(`id`) <= 250)),
  CONSTRAINT `program_chk_2` CHECK ((length(`organization_id`) <= 250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `required_document`
--

DROP TABLE IF EXISTS `required_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `required_document` (
  `id` varchar(250) NOT NULL COMMENT 'Each document must have a unique identifier',
  `service_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the service for which this entry describes the required document',
  `document` text COMMENT 'The document required to apply for or receive the service. e.g. ''Government-issued ID'', ''EU Passport''',
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `required_document_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  CONSTRAINT `required_document_chk_1` CHECK ((length(`id`) <= 250)),
  CONSTRAINT `required_document_chk_2` CHECK ((length(`service_id`) <= 250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `id` varchar(250) NOT NULL COMMENT 'Each entry must have a unique identifier',
  `service_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the service for which this is the regular schedule',
  `location_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the location for which this is the regular schedule',
  `service_at_location_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the ''service at location'' table entry, when this schedule is specific to a service in a particular location.',
  `valid_from` date DEFAULT NULL COMMENT 'The date from which the schedule information is valid.',
  `valid_to` date DEFAULT NULL COMMENT 'The last date on which the schedule information is valid.',
  `dtstart` date DEFAULT NULL COMMENT 'iCal - The date of the first event is the schedule. Necessary when using the ''interval'' feature, optional otherwise.',
  `timezone` float DEFAULT NULL COMMENT 'The timezone that all dates are expressed as, expressed as a UTC offset. Dates are assumed to be UTC otherwise.',
  `until` date DEFAULT NULL COMMENT 'iCal - The date of the last occurence of the recurring event.',
  `count` date DEFAULT NULL COMMENT 'iCal - The number of times that the event occurs. Use this instead of ''until'', if appropriate.',
  `wkst` date DEFAULT NULL COMMENT 'iCal - The day on which the week starts, eg MO.',
  `freq` enum('DAILY','WEEKLY','MONTHLY','YEARLY') DEFAULT NULL COMMENT 'iCal - How often the frequency repeats. E.g. Frequency use one of WEEKLY or MONTHLY.',
  `interval` float DEFAULT NULL COMMENT 'iCal - How often the frequency repeats. E.g. Interval 2 for Frequency WEEKLY gives Fortnightly',
  `byday` text COMMENT 'iCal - Comma seperated days of the week. E.g. SU,MO,TU,WE,TH,FR,SA. Where freq is MONTHLY each part can be preceded by a positive or negative integer to represent which occurrence in a month; e.g. 2MO is the second Monday in a month. -1FR is the last Friday',
  `byweekno` text COMMENT 'iCal - Comma seperated numeric weeks of the year if freq is WEEKLY. Can be negative to represent weeks before the end of the year; e.g. -5 is the 5th to last week in a year.',
  `bymonthday` float DEFAULT NULL COMMENT 'iCal - Comma separated numeric days of the month if frequency is MONTHLY. Can be negative to represent days before the end of the month; e.g. -5 is the 5th to last day in a month.',
  `byyearday` float DEFAULT NULL COMMENT 'iCal - Comma separated numeric days of the month if frequency is YEARLY. Can be negative to represent days before the end of the year; e.g. -1 is the last day in a year.',
  `description` text COMMENT 'Human readable description of the availability of the service.',
  `opens_at` time DEFAULT NULL COMMENT 'The time when a service or location opens. This should use HH:MM format and should include timezone information, either adding the suffix ''Z'' when the date is in UTC, or including an offset from UTC (e.g. 09:00-05:00 for 9am EST.)',
  `closes_at` time DEFAULT NULL COMMENT 'The time when a service or location closes. This should use HH:MM format and should include timezone information, either adding the suffix ''Z'' when the date is in UTC, or including an offset from UTC (e.g. 09:00-05:00 for 9am EST.)',
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `service_id` (`service_id`),
  KEY `service_at_location_id` (`service_at_location_id`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  CONSTRAINT `schedule_ibfk_3` FOREIGN KEY (`service_at_location_id`) REFERENCES `service_at_location` (`id`),
  CONSTRAINT `schedule_chk_1` CHECK ((length(`id`) <= 250)),
  CONSTRAINT `schedule_chk_2` CHECK ((length(`service_id`) <= 250)),
  CONSTRAINT `schedule_chk_3` CHECK ((length(`location_id`) <= 250)),
  CONSTRAINT `schedule_chk_4` CHECK ((length(`service_at_location_id`) <= 250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `id` varchar(250) NOT NULL COMMENT 'Each service must have a unique identifier.',
  `organization_id` varchar(250) NOT NULL COMMENT 'The identifier of the organization that provides this service.',
  `program_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the program this service is delivered under.',
  `name` text NOT NULL COMMENT 'The official or public name of the service.',
  `alternate_name` text COMMENT 'Alternative or commonly used name for a service.',
  `description` text COMMENT 'A description of the service.',
  `url` text COMMENT 'URL of the service',
  `email` text COMMENT 'Email address for the service',
  `status` enum('active','inactive','defunct','temporarily closed') NOT NULL COMMENT 'The current status of the service.',
  `interpretation_services` text COMMENT 'A description of any interpretation services available for accessing this service.',
  `application_process` text COMMENT 'The steps needed to access the service.',
  `wait_time` text COMMENT 'Time a client may expect to wait before receiving a service.',
  `fees` text COMMENT 'Details of any charges for service users to access this service.',
  `accreditations` text COMMENT 'Details of any accreditations. Accreditation is the formal evaluation of an organization or program against best practice standards set by an accrediting organization.',
  `licenses` text COMMENT 'An organization may have a license issued by a government entity to operate legally. A list of any such licenses can be provided here.',
  PRIMARY KEY (`id`),
  KEY `organization_id` (`organization_id`),
  KEY `program_id` (`program_id`),
  CONSTRAINT `service_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
  CONSTRAINT `service_ibfk_2` FOREIGN KEY (`program_id`) REFERENCES `program` (`id`),
  CONSTRAINT `service_chk_1` CHECK ((length(`id`) <= 250)),
  CONSTRAINT `service_chk_2` CHECK ((length(`organization_id`) <= 250)),
  CONSTRAINT `service_chk_3` CHECK ((length(`program_id`) <= 250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_area`
--

DROP TABLE IF EXISTS `service_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_area` (
  `id` varchar(250) NOT NULL COMMENT 'Each service area must have a unique identifier',
  `service_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the service for which this entry describes the service area',
  `service_area` text COMMENT 'The geographic area where a service is available. This is a free-text description, and so may be precise or indefinite as necessary.',
  `description` text COMMENT 'A more detailed description of this service area. Used to provide any additional information that cannot be communicated using the structured area and geometry fields.',
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `service_area_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  CONSTRAINT `service_area_chk_1` CHECK ((length(`id`) <= 250)),
  CONSTRAINT `service_area_chk_2` CHECK ((length(`service_id`) <= 250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_at_location`
--

DROP TABLE IF EXISTS `service_at_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_at_location` (
  `id` varchar(250) NOT NULL COMMENT 'Each entry must have a unique identifier.',
  `service_id` varchar(250) NOT NULL COMMENT 'The identifier of the service at a given location.',
  `location_id` varchar(250) NOT NULL COMMENT 'The identifier of the location where this service operates.',
  `description` text COMMENT 'Any additional information that should be displayed to users about the service at this specific location.',
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `service_at_location_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  CONSTRAINT `service_at_location_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `service_at_location_chk_1` CHECK ((length(`id`) <= 250)),
  CONSTRAINT `service_at_location_chk_2` CHECK ((length(`service_id`) <= 250)),
  CONSTRAINT `service_at_location_chk_3` CHECK ((length(`location_id`) <= 250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_attribute`
--

DROP TABLE IF EXISTS `service_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_attribute` (
  `id` varchar(250) NOT NULL COMMENT 'Each service_attribute entry should have a unique identifier.',
  `service_id` varchar(250) NOT NULL COMMENT 'The identifier of the service to which this taxonomy term applies.',
  `taxonomy_term_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of this taxonomy term from the taxonomy table.',
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`),
  KEY `taxonomy_term_id` (`taxonomy_term_id`),
  CONSTRAINT `service_attribute_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  CONSTRAINT `service_attribute_ibfk_2` FOREIGN KEY (`taxonomy_term_id`) REFERENCES `taxonomy_term` (`id`),
  CONSTRAINT `service_attribute_chk_1` CHECK ((length(`id`) <= 250)),
  CONSTRAINT `service_attribute_chk_2` CHECK ((length(`service_id`) <= 250)),
  CONSTRAINT `service_attribute_chk_3` CHECK ((length(`taxonomy_term_id`) <= 250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxonomy_term`
--

DROP TABLE IF EXISTS `taxonomy_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxonomy_term` (
  `id` varchar(250) NOT NULL COMMENT 'Each taxonomy term must have a unique identifier, within the scope of the dataset',
  `term` text NOT NULL COMMENT 'The taxonomy term itself.',
  `description` text NOT NULL COMMENT 'What the term means',
  `parent_id` text COMMENT 'If this is a child term in a hierarchical taxonomy, give the identifier of the parent category. For top-level categories, this should be left blank.',
  `taxonomy` text COMMENT 'If this is an established taxonomy, detail which taxonomy is in use. For example, AIRS or Open Eligibility. If possible, provide a URI.',
  `language` text COMMENT 'An ISO 639-1, or ISO 639-2 [language code](available at http://www.loc.gov/standards/iso639-2/php/code_list.php) to represent the language of the term. The three-letter codes from ISO 639-2 provide greater accuracy when describing variants of languages, which may be relevant to particular communities.',
  PRIMARY KEY (`id`),
  CONSTRAINT `taxonomy_term_chk_1` CHECK ((length(`id`) <= 250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

