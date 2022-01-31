-- MySQL Workbench Synchronization
-- Generated: 2022-01-15 15:32
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: danii

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `Shop` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `Shop`.`suppliers` (
  `idSupplier` INT(11) NOT NULL,
  `Supplier_name` VARCHAR(45) NOT NULL DEFAULT ' ',
  `Supplier_address` VARCHAR(100) NOT NULL,
  `Supplier_phone` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`idSupplier`),
  CONSTRAINT `id_supplier`
    FOREIGN KEY (`idSupplier`)
    REFERENCES `Shop`.`supplies` (`id_supplier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Shop`.`supplies` (
  `id_supply` INT(11) NOT NULL,
  `id_supplier` INT(11) NOT NULL,
  `id_product` INT(11) NOT NULL,
  `quantity` INT(11) NOT NULL DEFAULT 0,
  `wholesale_price` FLOAT(11) NOT NULL DEFAULT 0,
  `date` DATE NOT NULL,
  PRIMARY KEY (`id_supply`),
  INDEX `id_supplier_idx` (`id_supplier` ASC) VISIBLE,
  INDEX `id_product_idx` (`id_product` ASC) VISIBLE,
  CONSTRAINT `id_supplier`
    FOREIGN KEY (`id_supplier`)
    REFERENCES `Shop`.`suppliers` (`idSupplier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_product`
    FOREIGN KEY (`id_product`)
    REFERENCES `Shop`.`product` (`id_product`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Shop`.`product` (
  `id_product` INT(11) NOT NULL,
  `product_name` VARCHAR(45) NOT NULL DEFAULT ' ',
  `id_department` INT(11) NOT NULL,
  `price` FLOAT(11) NOT NULL,
  PRIMARY KEY (`id_product`),
  INDEX `id_department_idx` (`id_department` ASC) VISIBLE,
  CONSTRAINT `id_department`
    FOREIGN KEY (`id_department`)
    REFERENCES `Shop`.`department` (`id_department`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Shop`.`department` (
  `id_department` INT(11) NOT NULL,
  `department_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_department`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Shop`.`storage` (
  `id_product` INT(11) NOT NULL,
  `id_department` INT(11) NOT NULL,
  `balance` INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_product`),
  INDEX `department_id_idx` (`id_department` ASC) VISIBLE,
  CONSTRAINT `id_product`
    FOREIGN KEY (`id_product`)
    REFERENCES `Shop`.`product` (`id_product`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `department_id`
    FOREIGN KEY (`id_department`)
    REFERENCES `Shop`.`department` (`id_department`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Shop`.`orders` (
  `id_order` INT(11) NOT NULL,
  `id_product` INT(11) NULL DEFAULT NULL,
  `quantity` INT(11) NOT NULL DEFAULT 0,
  `price` FLOAT(11) NOT NULL DEFAULT 0,
  `id_sailer` INT(11) NOT NULL,
  PRIMARY KEY (`id_order`),
  INDEX `id_product_idx` (`id_product` ASC) VISIBLE,
  INDEX `id_sailer_idx` (`id_sailer` ASC) VISIBLE,
  CONSTRAINT `id_product`
    FOREIGN KEY (`id_product`)
    REFERENCES `Shop`.`product` (`id_product`)
    ON DELETE NO ACTION
    ON UPDATE SET NULL,
  CONSTRAINT `id_sailer`
    FOREIGN KEY (`id_sailer`)
    REFERENCES `Shop`.`sailers` (`id_sailer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Shop`.`sailers` (
  `id_sailer` INT(11) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `sales_position` VARCHAR(45) NOT NULL DEFAULT ' ',
  `phone` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_sailer`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
