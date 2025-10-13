-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema m5prog
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema m5prog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `m5prog` DEFAULT CHARACTER SET utf8 ;
USE `m5prog` ;

-- -----------------------------------------------------
-- Table `m5prog`.`adres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `m5prog`.`adres` (
  `adresID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `straat` VARCHAR(45) NOT NULL,
  `huisnummer` INT NOT NULL,
  `adres` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`adresID`),
  UNIQUE INDEX `adresID_UNIQUE` (`adresID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `m5prog`.`persoon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `m5prog`.`persoon` (
  `persoon` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `telefoonnummer` INT NOT NULL,
  `voornaam` VARCHAR(45) NOT NULL,
  `achternaam` VARCHAR(45) NOT NULL,
  `geslacht_datum` INT NOT NULL,
  `geboort_ stad` VARCHAR(45) NOT NULL,
  `nationaliteit` VARCHAR(45) NOT NULL,
  `adres_adresID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`persoon`, `adres_adresID`),
  UNIQUE INDEX `persoon_UNIQUE` (`persoon` ASC) VISIBLE,
  INDEX `fk_persoon_adres_idx` (`adres_adresID` ASC) VISIBLE,
  CONSTRAINT `fk_persoon_adres`
    FOREIGN KEY (`adres_adresID`)
    REFERENCES `m5prog`.`adres` (`adresID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
