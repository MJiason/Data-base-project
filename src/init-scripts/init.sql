-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE =
        'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema data_management_system
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema data_management_system
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `data_management_system` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `data_management_system`;

-- -----------------------------------------------------
-- Table `data_management_system`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_management_system`.`country`
(
    `id`          INT(11)     NOT NULL AUTO_INCREMENT,
    `name`        VARCHAR(45) NULL DEFAULT NULL,
    `geolocation` VARCHAR(45) NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8
    COMMENT = 'Entity example';


-- -----------------------------------------------------
-- Table `data_management_system`.`entity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_management_system`.`entity`
(
    `id`         INT          NOT NULL,
    `name`       VARCHAR(255) NOT NULL,
    `table_name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_management_system`.`datapoint`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_management_system`.`datapoint`
(
    `id`         INT          NOT NULL,
    `name`       VARCHAR(255) NOT NULL,
    `table_name` VARCHAR(255) NOT NULL,
    `entity_id`  INT          NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `fk_datapoint_entity_idx` (`entity_id` ASC) VISIBLE,
    CONSTRAINT `fk_datapoint_entity`
        FOREIGN KEY (`entity_id`)
            REFERENCES `data_management_system`.`entity` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_management_system`.`concept`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_management_system`.`concept`
(
    `id`   INT          NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `abbr` VARCHAR(255) NOT NULL,
    `desc` TEXT         NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_management_system`.`assoc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_management_system`.`assoc`
(
    `id`           INT NOT NULL AUTO_INCREMENT,
    `concept_id`   INT NOT NULL,
    `datapoint_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `fk_assoc_concept1_idx` (`concept_id` ASC) VISIBLE,
    INDEX `fk_assoc_datapoint1_idx` (`datapoint_id` ASC) VISIBLE,
    CONSTRAINT `fk_assoc_concept1`
        FOREIGN KEY (`concept_id`)
            REFERENCES `data_management_system`.`concept` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_assoc_datapoint1`
        FOREIGN KEY (`datapoint_id`)
            REFERENCES `data_management_system`.`datapoint` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_management_system`.`includes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_management_system`.`includes`
(
    `id`         INT          NOT NULL,
    `field_name` VARCHAR(255) NULL,
    `concept_id` INT          NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `fk_includes_concept1_idx` (`concept_id` ASC) VISIBLE,
    CONSTRAINT `fk_includes_concept1`
        FOREIGN KEY (`concept_id`)
            REFERENCES `data_management_system`.`concept` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;
