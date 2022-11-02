-- MySQL Script generated by MySQL Workbench
-- Tue Nov  1 21:47:35 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`TIPO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TIPO` ;

CREATE TABLE IF NOT EXISTS `mydb`.`TIPO` (
  `tip_id` INT NOT NULL,
  `tip_rol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`tip_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`USUARIO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`USUARIO` ;

CREATE TABLE IF NOT EXISTS `mydb`.`USUARIO` (
  `usu_id` INT NOT NULL,
  `usu_nombre` VARCHAR(45) NULL,
  `usu_apellido` VARCHAR(45) NULL,
  `usu_foto` VARCHAR(45) NULL,
  `usu_usuario` VARCHAR(45) NULL,
  `usu_contrasena` VARCHAR(45) NULL,
  `usu_fecnacimiento` VARCHAR(45) NULL,
  `usu_correo` VARCHAR(45) NULL,
  `usu_semestre` INT NULL,
  PRIMARY KEY (`usu_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CATEGORIA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`CATEGORIA` ;

CREATE TABLE IF NOT EXISTS `mydb`.`CATEGORIA` (
  `cat_id` INT NOT NULL,
  PRIMARY KEY (`cat_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`LOGRO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`LOGRO` ;

CREATE TABLE IF NOT EXISTS `mydb`.`LOGRO` (
  `log_id` INT NOT NULL,
  `log_nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`log_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`JUEGO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`JUEGO` ;

CREATE TABLE IF NOT EXISTS `mydb`.`JUEGO` (
  `jue_id` INT NOT NULL,
  `jue_puntos` INT NULL,
  `jue_nivel` VARCHAR(45) NULL,
  `jue_avance` VARCHAR(45) NULL,
  `jue_tiempo_uso` TIME NULL,
  `log_id` INT NOT NULL,
  PRIMARY KEY (`jue_id`),
  CONSTRAINT `fk_JUEGO_LOGRO1`
    FOREIGN KEY (`log_id`)
    REFERENCES `mydb`.`LOGRO` (`log_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_JUEGO_LOGRO1_idx` ON `mydb`.`JUEGO` (`log_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`BLOG`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`BLOG` ;

CREATE TABLE IF NOT EXISTS `mydb`.`BLOG` (
  `blg_id` INT NOT NULL,
  `blg_fec_comen` DATETIME NOT NULL,
  `cat_id` INT NOT NULL,
  PRIMARY KEY (`blg_id`),
  CONSTRAINT `fk_BLOG_CATEGORIA1`
    FOREIGN KEY (`cat_id`)
    REFERENCES `mydb`.`CATEGORIA` (`cat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_BLOG_CATEGORIA1_idx` ON `mydb`.`BLOG` (`cat_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`AUTOR`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`AUTOR` ;

CREATE TABLE IF NOT EXISTS `mydb`.`AUTOR` (
  `aut_id` INT NOT NULL,
  `aut_nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`aut_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`HISTORIA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`HISTORIA` ;

CREATE TABLE IF NOT EXISTS `mydb`.`HISTORIA` (
  `his_id` INT NOT NULL,
  `his_fecha_publicacion` DATETIME NOT NULL,
  `his_editorial` VARCHAR(45) NULL,
  `his_titulo` VARCHAR(45) NULL,
  `aut_id` INT NOT NULL,
  PRIMARY KEY (`his_id`),
  CONSTRAINT `fk_HISTORIA_AUTOR1`
    FOREIGN KEY (`aut_id`)
    REFERENCES `mydb`.`AUTOR` (`aut_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_HISTORIA_AUTOR1_idx` ON `mydb`.`HISTORIA` (`aut_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`PRACTICA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PRACTICA` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PRACTICA` (
  `pra_id` INT NOT NULL,
  `pra_fecha_uso` DATETIME NULL,
  `pra_avance` VARCHAR(45) NULL,
  `cat_id` INT NOT NULL,
  PRIMARY KEY (`pra_id`),
  CONSTRAINT `fk_PRACTICA_CATEGORIA1`
    FOREIGN KEY (`cat_id`)
    REFERENCES `mydb`.`CATEGORIA` (`cat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_PRACTICA_CATEGORIA1_idx` ON `mydb`.`PRACTICA` (`cat_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`EDUCACION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`EDUCACION` ;

CREATE TABLE IF NOT EXISTS `mydb`.`EDUCACION` (
  `edu_id` INT NOT NULL,
  PRIMARY KEY (`edu_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CAT/USU`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`CAT/USU` ;

CREATE TABLE IF NOT EXISTS `mydb`.`CAT/USU` (
  `catusu_id` INT NOT NULL,
  `usu_id` INT NOT NULL,
  `cat_id` INT NOT NULL,
  PRIMARY KEY (`catusu_id`),
  CONSTRAINT `fk_CAT/USU_USUARIO1`
    FOREIGN KEY (`usu_id`)
    REFERENCES `mydb`.`USUARIO` (`usu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CAT/USU_CATEGORIA1`
    FOREIGN KEY (`cat_id`)
    REFERENCES `mydb`.`CATEGORIA` (`cat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_CAT/USU_USUARIO1_idx` ON `mydb`.`CAT/USU` (`usu_id` ASC) VISIBLE;

CREATE INDEX `fk_CAT/USU_CATEGORIA1_idx` ON `mydb`.`CAT/USU` (`cat_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`USU/TIP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`USU/TIP` ;

CREATE TABLE IF NOT EXISTS `mydb`.`USU/TIP` (
  `usu_id` INT NOT NULL,
  `tip_id` INT NOT NULL,
  `usutip_id` INT NOT NULL,
  PRIMARY KEY (`usu_id`, `tip_id`, `usutip_id`),
  CONSTRAINT `fk_USUARIO_has_TIPO_USUARIO1`
    FOREIGN KEY (`usu_id`)
    REFERENCES `mydb`.`USUARIO` (`usu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_USUARIO_has_TIPO_TIPO1`
    FOREIGN KEY (`tip_id`)
    REFERENCES `mydb`.`TIPO` (`tip_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_USUARIO_has_TIPO_TIPO1_idx` ON `mydb`.`USU/TIP` (`tip_id` ASC) VISIBLE;

CREATE INDEX `fk_USUARIO_has_TIPO_USUARIO1_idx` ON `mydb`.`USU/TIP` (`usu_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`CAT/HIS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`CAT/HIS` ;

CREATE TABLE IF NOT EXISTS `mydb`.`CAT/HIS` (
  `cat_id` INT NOT NULL,
  `cathis_id` INT NOT NULL,
  `his_id` INT NOT NULL,
  PRIMARY KEY (`cat_id`, `cathis_id`, `his_id`),
  CONSTRAINT `fk_CATEGORIA_has_HISTORIA_CATEGORIA1`
    FOREIGN KEY (`cat_id`)
    REFERENCES `mydb`.`CATEGORIA` (`cat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CAT/HIS_HISTORIA1`
    FOREIGN KEY (`his_id`)
    REFERENCES `mydb`.`HISTORIA` (`his_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_CATEGORIA_has_HISTORIA_CATEGORIA1_idx` ON `mydb`.`CAT/HIS` (`cat_id` ASC) VISIBLE;

CREATE INDEX `fk_CAT/HIS_HISTORIA1_idx` ON `mydb`.`CAT/HIS` (`his_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`JUE/CAT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`JUE/CAT` ;

CREATE TABLE IF NOT EXISTS `mydb`.`JUE/CAT` (
  `jue_id` INT NOT NULL,
  `cat_id` INT NOT NULL,
  `juecat_id` INT NOT NULL,
  PRIMARY KEY (`jue_id`, `cat_id`, `juecat_id`),
  CONSTRAINT `fk_JUEGO_has_CATEGORIA_JUEGO1`
    FOREIGN KEY (`jue_id`)
    REFERENCES `mydb`.`JUEGO` (`jue_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_JUEGO_has_CATEGORIA_CATEGORIA1`
    FOREIGN KEY (`cat_id`)
    REFERENCES `mydb`.`CATEGORIA` (`cat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_JUEGO_has_CATEGORIA_CATEGORIA1_idx` ON `mydb`.`JUE/CAT` (`cat_id` ASC) VISIBLE;

CREATE INDEX `fk_JUEGO_has_CATEGORIA_JUEGO1_idx` ON `mydb`.`JUE/CAT` (`jue_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`PUBLICACION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PUBLICACION` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PUBLICACION` (
  `blg_id` INT NOT NULL,
  `tip_id` INT NOT NULL,
  `pub_id` INT NOT NULL,
  `pub_comentario` VARCHAR(45) NULL,
  PRIMARY KEY (`blg_id`, `tip_id`, `pub_id`),
  CONSTRAINT `fk_BLOG_has_TIPO_BLOG1`
    FOREIGN KEY (`blg_id`)
    REFERENCES `mydb`.`BLOG` (`blg_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BLOG_has_TIPO_TIPO1`
    FOREIGN KEY (`tip_id`)
    REFERENCES `mydb`.`TIPO` (`tip_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_BLOG_has_TIPO_TIPO1_idx` ON `mydb`.`PUBLICACION` (`tip_id` ASC) VISIBLE;

CREATE INDEX `fk_BLOG_has_TIPO_BLOG1_idx` ON `mydb`.`PUBLICACION` (`blg_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`TEMA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TEMA` ;

CREATE TABLE IF NOT EXISTS `mydb`.`TEMA` (
  `tem_id` INT NOT NULL,
  `tem_nombre` VARCHAR(45) NULL,
  `pra_id` INT NOT NULL,
  PRIMARY KEY (`tem_id`),
  CONSTRAINT `fk_TEMA_PRACTICA1`
    FOREIGN KEY (`pra_id`)
    REFERENCES `mydb`.`PRACTICA` (`pra_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_TEMA_PRACTICA1_idx` ON `mydb`.`TEMA` (`pra_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
