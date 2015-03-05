SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `openreferral` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `openreferral` ;

-- -----------------------------------------------------
-- Table `openreferral`.`organization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `openreferral`.`organization` ;

CREATE TABLE IF NOT EXISTS `openreferral`.`organization` (
  `organization_id` INT NOT NULL,
  `organization_name` VARCHAR(256) NULL,
  `fein` VARCHAR(64) NULL,
  `aka` VARCHAR(256) NULL,
  `urls` TEXT NULL,
  `legal_status` VARCHAR(256) NULL,
  `year_of_incorporation` DATETIME NULL,
  `licenses` TEXT NULL,
  `accreditation` TEXT NULL,
  PRIMARY KEY (`organization_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openreferral`.`location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `openreferral`.`location` ;

CREATE TABLE IF NOT EXISTS `openreferral`.`location` (
  `location_id` INT NOT NULL,
  `organization_id` INT NULL,
  `name` VARCHAR(256) NULL,
  `aka` VARCHAR(256) NULL,
  `accessibility` TEXT NULL,
  `coordinates` TEXT NULL,
  `description` TEXT NULL,
  `emails` VARCHAR(45) NULL,
  `location_hours` TEXT NULL,
  `location_languages` TEXT NULL,
  `short_desc` TEXT NULL,
  `transportation` TEXT NULL,
  `urls` TEXT NULL,
  `organization_organization_id` INT NOT NULL,
  PRIMARY KEY (`location_id`, `organization_organization_id`),
  INDEX `fk_location_organization1_idx` (`organization_organization_id` ASC),
  CONSTRAINT `fk_location_organization1`
    FOREIGN KEY (`organization_organization_id`)
    REFERENCES `openreferral`.`organization` (`organization_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openreferral`.`service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `openreferral`.`service` ;

CREATE TABLE IF NOT EXISTS `openreferral`.`service` (
  `service_id` INT NOT NULL,
  `organization_id` INT NULL,
  `location_id` INT NULL,
  `audience` VARCHAR(45) NULL,
  `description` TEXT NULL,
  `eligibility` VARCHAR(45) NULL,
  `fees` VARCHAR(45) NULL,
  `funding_sources` TEXT NULL,
  `keywords` TEXT NULL,
  `how_to_apply` VARCHAR(45) NULL,
  `wait` VARCHAR(45) NULL,
  `name` VARCHAR(64) NULL,
  `service_areas` TEXT NULL,
  `short_desc` TEXT NULL,
  `urls` TEXT NULL,
  `service_languages` TEXT NULL,
  `service_hours` TEXT NULL,
  `wait` VARCHAR(256) NULL,
  `method_of_payment` TEXT NULL,
  `organization_organization_id` INT NOT NULL,
  PRIMARY KEY (`service_id`, `organization_organization_id`),
  INDEX `fk_service_organization1_idx` (`organization_organization_id` ASC),
  CONSTRAINT `fk_service_organization1`
    FOREIGN KEY (`organization_organization_id`)
    REFERENCES `openreferral`.`organization` (`organization_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openreferral`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `openreferral`.`address` ;

CREATE TABLE IF NOT EXISTS `openreferral`.`address` (
  `location_id` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  `attention` VARCHAR(128) NULL,
  `street_1` VARCHAR(45) NULL,
  `street_2` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `postal_code` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `location_location_id` INT NOT NULL,
  PRIMARY KEY (`location_id`, `location_location_id`),
  INDEX `fk_address_location1_idx` (`location_location_id` ASC),
  CONSTRAINT `fk_address_location1`
    FOREIGN KEY (`location_location_id`)
    REFERENCES `openreferral`.`location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openreferral`.`phone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `openreferral`.`phone` ;

CREATE TABLE IF NOT EXISTS `openreferral`.`phone` (
  `location_id` INT NOT NULL,
  `phone_number` VARCHAR(45) NULL,
  `phone_extension` VARCHAR(45) NULL,
  `phone_hours` VARCHAR(45) NULL,
  `phone_type` VARCHAR(45) NULL,
  `department` VARCHAR(128) NULL,
  `country_code` VARCHAR(3) NULL,
  `location_location_id` INT NOT NULL,
  PRIMARY KEY (`location_id`, `location_location_id`),
  INDEX `fk_phone_location1_idx` (`location_location_id` ASC),
  CONSTRAINT `fk_phone_location1`
    FOREIGN KEY (`location_location_id`)
    REFERENCES `openreferral`.`location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openreferral`.`admin_contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `openreferral`.`admin_contact` ;

CREATE TABLE IF NOT EXISTS `openreferral`.`admin_contact` (
  `organization_id` INT NOT NULL,
  `contact_name` VARCHAR(100) NULL,
  `contact_title` VARCHAR(100) NULL,
  `organization_organization_id` INT NOT NULL,
  PRIMARY KEY (`organization_id`),
  INDEX `fk_admin_contact_organization1_idx` (`organization_organization_id` ASC),
  CONSTRAINT `fk_admin_contact_organization1`
    FOREIGN KEY (`organization_organization_id`)
    REFERENCES `openreferral`.`organization` (`organization_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openreferral`.`contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `openreferral`.`contact` ;

CREATE TABLE IF NOT EXISTS `openreferral`.`contact` (
  `location_id` INT NOT NULL,
  `organization_id` INT NULL,
  `contact_name` VARCHAR(64) NULL,
  `contact_title` VARCHAR(64) NULL,
  `email` VARCHAR(128) NULL,
  `fax` VARCHAR(10) NULL,
  `phone` VARCHAR(10) NULL,
  `extension` VARCHAR(10) NULL,
  `location_location_id` INT NOT NULL,
  `organization_organization_id` INT NOT NULL,
  PRIMARY KEY (`location_id`, `location_location_id`, `organization_organization_id`),
  INDEX `fk_contact_location1_idx` (`location_location_id` ASC),
  INDEX `fk_contact_organization1_idx` (`organization_organization_id` ASC),
  CONSTRAINT `fk_contact_location1`
    FOREIGN KEY (`location_location_id`)
    REFERENCES `openreferral`.`location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contact_organization1`
    FOREIGN KEY (`organization_organization_id`)
    REFERENCES `openreferral`.`organization` (`organization_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openreferral`.`internet_resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `openreferral`.`internet_resource` ;

CREATE TABLE IF NOT EXISTS `openreferral`.`internet_resource` (
  `organization_id` INT NOT NULL,
  `location_location_id` INT NOT NULL,
  `service_id` INT NULL,
  `resource` VARCHAR(45) NULL,
  `resource_type` VARCHAR(45) NULL,
  `location_organization_organization_id` INT NOT NULL,
  PRIMARY KEY (`organization_id`, `location_organization_organization_id`),
  INDEX `fk_internet_resource_location1_idx` (`location_organization_organization_id` ASC),
  CONSTRAINT `fk_internet_resource_location1`
    FOREIGN KEY (`location_organization_organization_id`)
    REFERENCES `openreferral`.`location` (`organization_organization_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openreferral`.`accessibility`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `openreferral`.`accessibility` ;

CREATE TABLE IF NOT EXISTS `openreferral`.`accessibility` (
  `location_id` INT NOT NULL,
  `accomodation` VARCHAR(45) NULL,
  PRIMARY KEY (`location_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openreferral`.`funding`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `openreferral`.`funding` ;

CREATE TABLE IF NOT EXISTS `openreferral`.`funding` (
  `organization_id` INT NOT NULL,
  `service_service_id` INT NOT NULL,
  `source` TEXT NULL,
  PRIMARY KEY (`organization_id`, `service_service_id`),
  INDEX `fk_funding_service1_idx` (`service_service_id` ASC),
  CONSTRAINT `fk_funding_service1`
    FOREIGN KEY (`service_service_id`)
    REFERENCES `openreferral`.`service` (`service_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openreferral`.`keyword`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `openreferral`.`keyword` ;

CREATE TABLE IF NOT EXISTS `openreferral`.`keyword` (
  `service_id` INT NOT NULL,
  `keyword` VARCHAR(45) NULL,
  `service_service_id` INT NOT NULL,
  PRIMARY KEY (`service_id`),
  INDEX `fk_keyword_service1_idx` (`service_service_id` ASC),
  CONSTRAINT `fk_keyword_service1`
    FOREIGN KEY (`service_service_id`)
    REFERENCES `openreferral`.`service` (`service_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openreferral`.`location_has_service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `openreferral`.`location_has_service` ;

CREATE TABLE IF NOT EXISTS `openreferral`.`location_has_service` (
  `location_location_id` INT NOT NULL,
  `location_organization_organization_id` INT NOT NULL,
  `service_service_id` INT NOT NULL,
  PRIMARY KEY (`location_location_id`, `location_organization_organization_id`, `service_service_id`),
  INDEX `fk_location_has_service_service1_idx` (`service_service_id` ASC),
  INDEX `fk_location_has_service_location1_idx` (`location_location_id` ASC, `location_organization_organization_id` ASC),
  CONSTRAINT `fk_location_has_service_location1`
    FOREIGN KEY (`location_location_id` , `location_organization_organization_id`)
    REFERENCES `openreferral`.`location` (`location_id` , `organization_organization_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_location_has_service_service1`
    FOREIGN KEY (`service_service_id`)
    REFERENCES `openreferral`.`service` (`service_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openreferral`.`service_has_location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `openreferral`.`service_has_location` ;

CREATE TABLE IF NOT EXISTS `openreferral`.`service_has_location` (
  `service_service_id` INT NOT NULL,
  `location_location_id` INT NOT NULL,
  `location_organization_organization_id` INT NOT NULL,
  PRIMARY KEY (`service_service_id`, `location_location_id`, `location_organization_organization_id`),
  INDEX `fk_service_has_location_location1_idx` (`location_location_id` ASC, `location_organization_organization_id` ASC),
  INDEX `fk_service_has_location_service1_idx` (`service_service_id` ASC),
  CONSTRAINT `fk_service_has_location_service1`
    FOREIGN KEY (`service_service_id`)
    REFERENCES `openreferral`.`service` (`service_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_service_has_location_location1`
    FOREIGN KEY (`location_location_id` , `location_organization_organization_id`)
    REFERENCES `openreferral`.`location` (`location_id` , `organization_organization_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
