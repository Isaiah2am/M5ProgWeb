-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema gameraccount
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema gameraccount
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gameraccount` DEFAULT CHARACTER SET utf8 ;
USE `gameraccount` ;

-- -----------------------------------------------------
-- Table `gameraccount`.`gamer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gameraccount`.`gamer` (
  `username` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gameraccount`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gameraccount`.`games` (
  `achievements` VARCHAR(25) NOT NULL,
  `achieved` VARCHAR(45) NULL,
  PRIMARY KEY (`achievements`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gameraccount`.`gamer_has_games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gameraccount`.`gamer_has_games` (
  `gamer_username` VARCHAR(25) NOT NULL,
  `games_achievements` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`gamer_username`, `games_achievements`),
  INDEX `fk_gamer_has_games_games1_idx` (`games_achievements` ASC) VISIBLE,
  INDEX `fk_gamer_has_games_gamer_idx` (`gamer_username` ASC) VISIBLE,
  CONSTRAINT `fk_gamer_has_games_gamer`
    FOREIGN KEY (`gamer_username`)
    REFERENCES `gameraccount`.`gamer` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gamer_has_games_games1`
    FOREIGN KEY (`games_achievements`)
    REFERENCES `gameraccount`.`games` (`achievements`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
