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
-- Table structure for table `accessibility`
--

DROP TABLE IF EXISTS `accessibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accessibility` (
  `id` varchar(250) NOT NULL COMMENT 'The identifier for this accessibility information. Each entry must have a unique identifier.',
  `location_id` varchar(250) DEFAULT NULL COMMENT 'The identifier for the location of the accessibility provision.',
  `description` text COMMENT 'A free text description of the assistance or infrastructure that facilitates access to clients with disabilities.',
  `details` text COMMENT 'Any further details relating to the relevant accessibility arrangements at this location.',
  `url` text COMMENT 'The URL of a page giving more information about the accessibility of the location.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `accessibility_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` varchar(250) NOT NULL COMMENT 'The identifier of the postal address. Each postal address must have a unique identifier.',
  `location_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the location for this postal address.',
  `attention` text COMMENT 'The name of the person or entity whose attention should be sought at the location. These are often included as a "care of" component of an address.',
  `address_1` text NOT NULL COMMENT 'The first line(s) of the address, including office, building number and street.',
  `address_2` text COMMENT 'A second (additional) line of address information.',
  `city` text NOT NULL COMMENT 'The city in which the address is located.',
  `region` text COMMENT 'The region in which the address is located (optional).',
  `state_province` text NOT NULL COMMENT 'The state or province in which the address is located.',
  `postal_code` text NOT NULL COMMENT 'The postal code for the address.',
  `country` text NOT NULL COMMENT 'The country in which the address is located. This should be given as an ISO 3361-1 country code (two letter abbreviation).',
  `address_type` enum('physical','postal','virtual') NOT NULL COMMENT 'The type of address which may be physical, postal, or virtual.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attribute`
--

DROP TABLE IF EXISTS `attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute` (
  `id` varchar(250) NOT NULL COMMENT 'The identifier of the attribute entry. Each attribute entry should have a unique identifier.',
  `link_id` text NOT NULL COMMENT 'The identifier of the entity to which this taxonomy term applies.',
  `taxonomy_term_id` varchar(250) NOT NULL COMMENT 'The identifier of this taxonomy term from the taxonomy table.',
  `link_type` text COMMENT 'A code taken from an enumerated open codelist to indicate what the taxonomy term describes, e.g. the service eligibility or intended audience.',
  `link_entity` text NOT NULL COMMENT 'The table of the Link Identifier.',
  `value` text COMMENT 'The value (if any) of an attribute.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `taxonomy_term_id` (`taxonomy_term_id`),
  CONSTRAINT `attribute_ibfk_1` FOREIGN KEY (`taxonomy_term_id`) REFERENCES `taxonomy_term` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` varchar(250) NOT NULL COMMENT 'The identifier for the contact. Each contact must have a unique identifier.',
  `organization_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the organization for which this is a contact.',
  `service_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the service for which this is a contact.',
  `service_at_location_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the ‘service at location’ entry, when this contact is specific to a service in a particular location.',
  `location_id` varchar(250) DEFAULT NULL COMMENT 'The identifier for the location of the contact.',
  `name` text COMMENT 'The name of the contact.',
  `title` text COMMENT 'The job title of the contact.',
  `department` text COMMENT 'The department that the contact is a part of.',
  `email` text COMMENT 'The email address of the contact.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `service_id` (`service_id`),
  KEY `location_id` (`location_id`),
  KEY `service_at_location_id` (`service_at_location_id`),
  KEY `organization_id` (`organization_id`),
  CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  CONSTRAINT `contact_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `contact_ibfk_3` FOREIGN KEY (`service_at_location_id`) REFERENCES `service_at_location` (`id`),
  CONSTRAINT `contact_ibfk_4` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cost_option`
--

DROP TABLE IF EXISTS `cost_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cost_option` (
  `id` varchar(250) NOT NULL COMMENT 'The identifier for the cost option. Each entry must have a unique identifier',
  `service_id` varchar(250) NOT NULL COMMENT 'The identifier of the services for which the entry describes the cost.',
  `valid_from` date DEFAULT NULL COMMENT 'The date when this price is valid from.',
  `valid_to` date DEFAULT NULL COMMENT 'The date when this price is valid to.',
  `option` text COMMENT 'Conditions associated with the cost option.',
  `currency` text COMMENT 'The 3 letter currency code of this cost option (expected to be gbp by Open Referral UK).',
  `amount` float DEFAULT NULL COMMENT 'The cost of the option, expressed as an amount.',
  `amount_description` text COMMENT 'Specific details qualifying the cost amount.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `cost_option_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funding`
--

DROP TABLE IF EXISTS `funding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funding` (
  `id` varchar(250) NOT NULL COMMENT 'The identifier for the funding. Each entry must have a unique identifier.',
  `organization_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the organization in receipt of this funding.',
  `service_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the service in receipt of this funding.',
  `source` text COMMENT 'A free text description of the source of funds for this organization or service.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `service_id` (`service_id`),
  KEY `organization_id` (`organization_id`),
  CONSTRAINT `funding_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  CONSTRAINT `funding_ibfk_2` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language` (
  `id` varchar(250) NOT NULL COMMENT 'The identifier for the language. Each entry must have a unique identifier.',
  `service_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the service for which the entry describes the languages in which services are delivered.',
  `location_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the location for which the entry describes the languages in which services are delivered.',
  `phone_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the phone for which the entry describes the languages in which services delivered.',
  `name` text COMMENT 'The name of the language in which the service is delivered.',
  `code` text COMMENT 'The ISO 639-1 or ISO 639-3 code for the language.',
  `note` text COMMENT 'A free text description of any additional context or services provided for this language.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `phone_id` (`phone_id`),
  KEY `location_id` (`location_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `language_ibfk_1` FOREIGN KEY (`phone_id`) REFERENCES `phone` (`id`),
  CONSTRAINT `language_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `language_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` varchar(250) NOT NULL COMMENT 'The identifier of the location. Each location must have a unique identifier.',
  `location_type` enum('physical','postal','virtual') NOT NULL COMMENT 'The type of location, which may be either physical, postal, or virtual.',
  `url` text COMMENT 'If location_type is virtual, then this field represents the URL of a virtual location.',
  `organization_id` varchar(250) DEFAULT NULL COMMENT 'The organization identifier for a location. This is the organization that is responsible for maintaining information about this location. The identifier of the organization should be given here. Details of the services the organization delivers at this location should be provided in the services_at_location table.',
  `name` text COMMENT 'The name of the location.',
  `alternate_name` text COMMENT 'An (optional) alternative name of the location.',
  `description` text COMMENT 'A free text description of the location.',
  `transportation` text COMMENT 'A free text description of the access to public or private transportation to and from the location.',
  `latitude` float DEFAULT NULL COMMENT 'The latitude of the location expressed in decimal degrees in WGS84 datum.',
  `longitude` float DEFAULT NULL COMMENT 'The longitude of the location expressed in decimal degrees in WGS84 datum.',
  `external_identifier` text COMMENT 'A third party identifier for the location, which can be drawn from other services e.g. UK UPRN or what3words.',
  `external_identifier_type` text COMMENT 'The scheme used for the location''s external_identifier e.g. UK UPRN or what3words.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `organization_id` (`organization_id`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meta_table_description`
--

DROP TABLE IF EXISTS `meta_table_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_table_description` (
  `id` varchar(250) NOT NULL COMMENT 'The identifier for the metadata description. Each entry must have a unique identifier.',
  `name` text COMMENT 'The name for the metadata description.',
  `language` text COMMENT 'The ISO 639-1 or ISO 639-3 code for the language of the metadata description.',
  `character_set` text COMMENT 'The character set of the metadata description.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `metadata`
--

DROP TABLE IF EXISTS `metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metadata` (
  `id` varchar(250) NOT NULL COMMENT 'The identifier for this metadata. Each entry must have a unique identifier.',
  `resource_id` text NOT NULL COMMENT 'The identifier of the resource (service, program, location, address, or contact) that this metadata describes.',
  `resource_type` text NOT NULL COMMENT 'The type of entity being referenced.',
  `last_action_date` date NOT NULL COMMENT 'The date when data was changed.',
  `last_action_type` text NOT NULL COMMENT 'The kind of change made to the data.',
  `field_name` text NOT NULL COMMENT 'The name of field that has been modified.',
  `previous_value` text NOT NULL COMMENT 'The previous value of the field that has been modified.',
  `replacement_value` text NOT NULL COMMENT 'The new value of the field that has been modified.',
  `updated_by` text NOT NULL COMMENT 'The name of the person who modified the field.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization` (
  `id` varchar(250) NOT NULL COMMENT 'The identifier for the organization. Each organization must have a unique identifier.',
  `name` text NOT NULL COMMENT 'The official or public name of the organization.',
  `alternate_name` text COMMENT 'An (optional) alternative or commonly used name for the organization.',
  `description` text NOT NULL COMMENT 'A free text description containing a brief summary about the organization. It can contain markup such as HTML or Markdown.',
  `email` text COMMENT 'The contact e-mail address for the organization.',
  `website` text COMMENT 'The URL (website address) of the organization.',
  `tax_status` text COMMENT 'DEPRECATED: Government assigned tax designation for tax-exempt organizations.',
  `tax_id` text COMMENT 'DEPRECATED: A government issued identifier used for the purpose of tax administration.',
  `year_incorporated` float DEFAULT NULL COMMENT 'The year in which the organization was legally formed.',
  `legal_status` text COMMENT 'The legal conditions that an organization is operating under.',
  `logo` text COMMENT 'A URL to an image associated with the organization which can be presented alongside its name.',
  `uri` text COMMENT 'A persistent identifier to uniquely identify the organization such as those provided by Open Corporates or some other relevant URI provider. This is not for listing the website of the organization: that can be done through the website field of the Organization.',
  `parent_organization_id` text COMMENT 'The identifier of the organization''s parent organization.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organization_identifier`
--

DROP TABLE IF EXISTS `organization_identifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization_identifier` (
  `id` varchar(250) NOT NULL COMMENT 'The identifier for this organization identifier entry. Each entry must have a unique identifier.',
  `organization_id` varchar(250) NOT NULL COMMENT 'The identifier of the organization.',
  `identifier_scheme` text COMMENT 'The scheme of the third party identifier, according to http://org-id.guide/.',
  `identifier_type` text NOT NULL COMMENT 'The type of the third party identifier.',
  `identifier` text NOT NULL COMMENT 'The third-party identifier value',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `organization_id` (`organization_id`),
  CONSTRAINT `organization_identifier_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `phone`
--

DROP TABLE IF EXISTS `phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone` (
  `id` varchar(250) NOT NULL COMMENT 'The identifier for the phone number. Each entry must have a unique identifier.',
  `location_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the location where this phone number is located.',
  `service_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the service for which this is the phone number.',
  `organization_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the organization for which this is the phone number.',
  `contact_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the contact for which this is the phone number.',
  `service_at_location_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the ‘service at location’ table entry, when this phone number is specific to a service in a particular location.',
  `number` text NOT NULL COMMENT 'The phone number.',
  `extension` float DEFAULT NULL COMMENT 'The extension of the phone number.',
  `type` text COMMENT 'Indicates the type of phone service, drawing from the RFC6350 list of types (text (for SMS), voice, fax, cell, video, pager, textphone).',
  `description` text COMMENT 'A free text description providing extra information about the phone service',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `service_id` (`service_id`),
  KEY `location_id` (`location_id`),
  KEY `service_at_location_id` (`service_at_location_id`),
  KEY `organization_id` (`organization_id`),
  KEY `contact_id` (`contact_id`),
  CONSTRAINT `phone_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  CONSTRAINT `phone_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `phone_ibfk_3` FOREIGN KEY (`service_at_location_id`) REFERENCES `service_at_location` (`id`),
  CONSTRAINT `phone_ibfk_4` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
  CONSTRAINT `phone_ibfk_5` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program` (
  `id` varchar(250) NOT NULL COMMENT 'The identifier for the program. Each program must have a unique identifier.',
  `organization_id` varchar(250) NOT NULL COMMENT 'The identifier for the organization which the program belongs to. Each program must belong to a single organization, and the identifier for that organization should be given here.',
  `name` text NOT NULL COMMENT 'The name of the program.',
  `alternate_name` text COMMENT 'The (optional) alternative name for the program.',
  `description` text NOT NULL COMMENT 'A free text description of the program',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `organization_id` (`organization_id`),
  CONSTRAINT `program_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `required_document`
--

DROP TABLE IF EXISTS `required_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `required_document` (
  `id` varchar(250) NOT NULL COMMENT 'The identifier for the document. Each document must have a unique identifier.',
  `service_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the service for which this entry describes the required document.',
  `document` text COMMENT 'A free text description of the document required to apply for or receive the service.',
  `uri` text COMMENT 'A web link to the document.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `required_document_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `id` varchar(250) NOT NULL COMMENT 'The identifier for the schedule. Each entry must have a unique identifier.',
  `service_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the service for which this is the regular schedule',
  `location_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the location for which this is the regular schedule',
  `service_at_location_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the ‘service at location’ table entry, when this schedule is specific to a service in a particular location.',
  `valid_from` date DEFAULT NULL COMMENT 'The date from which the schedule information is valid. It must be in the ISO 8601 format of YYYY-MM-DD,',
  `valid_to` date DEFAULT NULL COMMENT 'The last date on which the schedule information is valid. It must be in the ISO 8601 format of YYYY-MM-DD.',
  `dtstart` date DEFAULT NULL COMMENT 'iCal - The date of the first event is the schedule. Necessary when using the ‘interval’ feature, optional otherwise.',
  `timezone` float DEFAULT NULL COMMENT 'The timezone that all dates are expressed as, expressed as a UTC offset. Dates are assumed to be UTC otherwise.',
  `until` date DEFAULT NULL COMMENT 'iCal - The date of the last occurrence of the recurring event.',
  `count` float DEFAULT NULL COMMENT 'iCal - The number of times that the event occurs. Use this instead of ‘until’, if appropriate.',
  `wkst` enum('MO','TU','WE','TH','FR','SA','SU') DEFAULT NULL COMMENT 'iCal - The two-letter code for the day on which the week starts.',
  `freq` enum('WEEKLY','MONTHLY') DEFAULT NULL COMMENT 'iCal - How often the frequency repeats.',
  `interval` float DEFAULT NULL COMMENT 'iCal - How often the frequency repeats. For example, and Interval of 2 for a WEEKLY Frequency would represent fortnightly.',
  `byday` text COMMENT 'iCal - Comma separated days of the week. Where freq is MONTHLY each part can be preceded by a positive or negative integer to represent which occurrence in a month; e.g. 2MO is the second Monday in a month. -1FR is the last Friday',
  `byweekno` text COMMENT 'iCal - Comma separated numeric weeks of the year, where freq is WEEKLY. Can be negative to represent weeks before the end of the year; e.g. -5 is the 5th to last week in a year.',
  `bymonthday` text COMMENT 'iCal - Comma separated numeric days of the month, where frequency is MONTHLY. Can be negative to represent days before the end of the month; e.g. -5 is the 5th to last day in a month.',
  `byyearday` text COMMENT 'iCal - Comma separated numeric days of the month, where frequency is YEARLY. Can be negative to represent days before the end of the year; e.g. -1 is the last day in a year.',
  `description` text COMMENT 'A free text description of the availability of the service.',
  `opens_at` time DEFAULT NULL COMMENT 'The time when a service or location opens. This should use HH:MM format and should include timezone information, either adding the suffix ‘Z’ when the date is in UTC, or including an offset from UTC (e.g. 09:00-05:00 for 9am EST.)',
  `closes_at` time DEFAULT NULL COMMENT 'The time when a service or location closes. This should use HH:MM format and should include timezone information, either adding the suffix ‘Z’ when the date is in UTC, or including an offset from UTC (e.g. 09:00-05:00 for 9am EST.).',
  `schedule_link` text COMMENT 'URL of a link for the schedule which may show each individual session and may provide a booking facility.',
  `attending_type` text COMMENT 'A free text description of how to attend this service.',
  `notes` text COMMENT 'Free text notes on the schedule.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `service_id` (`service_id`),
  KEY `service_at_location_id` (`service_at_location_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`service_at_location_id`) REFERENCES `service_at_location` (`id`),
  CONSTRAINT `schedule_ibfk_3` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `id` varchar(250) NOT NULL COMMENT 'The identifier for the service. Each service must have a unique identifier.',
  `organization_id` varchar(250) NOT NULL COMMENT 'The identifier of the organization that provides this service.',
  `program_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the program this service is delivered under.',
  `name` text NOT NULL COMMENT 'The official or public name of the service.',
  `alternate_name` text COMMENT 'An (optional) alternative name for this service.',
  `description` text COMMENT 'A free text description of the service.',
  `url` text COMMENT 'URL of the service',
  `email` text COMMENT 'An email address which can be used to contact the service provider.',
  `status` enum('active','inactive','defunct','temporarily closed') NOT NULL COMMENT 'The current status of the service which can be active, inactive, defunct, or temporarily closed.',
  `interpretation_services` text COMMENT 'A free text description of any interpretation services available for accessing this service.',
  `application_process` text COMMENT 'A free text description of the steps needed to access this service.',
  `fees_description` text COMMENT 'A free text description of any charges for service users to access this service.',
  `wait_time` text COMMENT 'DEPRECATED: The time a client may expect to wait before receiving a service.',
  `fees` text COMMENT 'DEPRECATED: Details of any charges for service users to access this service.',
  `accreditations` text COMMENT 'A free text description of any accreditations. Accreditation is the formal evaluation of an organization or program against best practice standards set by an accrediting organization.',
  `eligibility_description` text COMMENT 'A free text description of the type of person for whom this service is intended.',
  `minimum_age` float DEFAULT NULL COMMENT 'The minimum age of a person required to meet this eligibility requirement.',
  `maximum_age` float DEFAULT NULL COMMENT 'The maximum age of a person required to meet this eligibility requirement.',
  `assured_date` date DEFAULT NULL COMMENT 'The date that the information about the service was last checked.',
  `assurer_email` text COMMENT 'The contact e-mail address for the person or organization which last assured the service.',
  `licenses` text COMMENT 'DEPRECATED: An organization may have a license issued by a government entity to operate legally. A list of any such licenses can be provided here.',
  `alert` text COMMENT 'A description of any short term alerts concerning the service.',
  `last_modified` datetime DEFAULT NULL COMMENT 'The datetime when the service, or any related information about the service, has changed. Should have millisecond accuracy.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `program_id` (`program_id`),
  KEY `organization_id` (`organization_id`),
  CONSTRAINT `service_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `program` (`id`),
  CONSTRAINT `service_ibfk_2` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_area`
--

DROP TABLE IF EXISTS `service_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_area` (
  `id` varchar(250) NOT NULL COMMENT 'The identifier for the service area. Each service area must have a unique identifier.',
  `service_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the service for which this entry describes the service area',
  `name` text COMMENT 'A free text geographic area where a service is available.',
  `description` text COMMENT 'A more detailed free text description of this service area. Used to provide any additional information that cannot be communicated using the structured area and geometry fields.',
  `extent` text COMMENT 'A definition of the polygon defining the area.',
  `extent_type` text COMMENT 'The format of the extent field  populated from an enum of  "geojson", "topojson",  "kml",and (for legacy systems or early state during transformation) "text".',
  `uri` text COMMENT 'A URI which acts as a persistent identifier to identify an area.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `service_area_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_at_location`
--

DROP TABLE IF EXISTS `service_at_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_at_location` (
  `id` varchar(250) NOT NULL COMMENT 'The identifier of the service at location entry. Each entry must have a unique identifier.',
  `service_id` varchar(250) NOT NULL COMMENT 'The identifier of the service at a given location.',
  `location_id` varchar(250) NOT NULL COMMENT 'The identifier of the location where this service operates.',
  `description` text COMMENT 'A free text description of the service at this specific location.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `service_id` (`service_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `service_at_location_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  CONSTRAINT `service_at_location_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxonomy`
--

DROP TABLE IF EXISTS `taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxonomy` (
  `id` varchar(250) NOT NULL COMMENT 'The identifier of the taxonomy. Each entry must have a unique identifier',
  `name` text NOT NULL COMMENT 'The name of the taxonomy from which terms are sourced.',
  `description` text NOT NULL COMMENT 'A free text description of the taxonomy.',
  `uri` text COMMENT 'The URI of the taxonomy.',
  `version` text COMMENT 'The version of the taxonomy.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxonomy_term`
--

DROP TABLE IF EXISTS `taxonomy_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxonomy_term` (
  `id` varchar(250) NOT NULL COMMENT 'The identifier for this taxonomy term. Each taxonomy term must have a unique identifier, within the scope of the dataset.',
  `code` text COMMENT 'The term identfier as used in the taxonomy. This and the taxonomy_id combined define the term.',
  `name` text NOT NULL COMMENT 'The taxonomy term itself.',
  `description` text NOT NULL COMMENT 'A free text description of the term.',
  `parent_id` text COMMENT 'If this is a child term in a hierarchical taxonomy, give the identifier of the parent category. For top-level categories, this is not required.',
  `taxonomy` text COMMENT 'If this is an established taxonomy, a free text description of which taxonomy is in use. If possible, provide a URI.',
  `language` text COMMENT 'An ISO 639-1, or ISO 639-2 [language code](available at http://www.loc.gov/standards/iso639-2/php/code_list.php) to represent the language of the term. The three-letter codes from ISO 639-2 provide greater accuracy when describing variants of languages, which may be relevant to particular communities.',
  `taxonomy_id` varchar(250) DEFAULT NULL COMMENT 'The identifier of the taxonomy containing the term.',
  `term_uri` text COMMENT 'URI of the term.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `taxonomy_id` (`taxonomy_id`),
  CONSTRAINT `taxonomy_term_ibfk_1` FOREIGN KEY (`taxonomy_id`) REFERENCES `taxonomy` (`id`)
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

