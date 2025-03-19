-- MySQL Workbench Forward Engineering

-- Disable foreign key checks, unique checks, and set SQL mode
SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Drop the schema if it already exists and recreate it
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `LittleLemonDB`;

CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8;
USE `LittleLemonDB`;

-- -----------------------------------------------------
-- Create `Employees` table
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Employees` (
    `EmployeeID` INT NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(200) NULL,
    `Role` VARCHAR(100) NULL,
    `Address` VARCHAR(200) NULL,
    `Contact_Number` INT NULL,
    `Email` VARCHAR(100) NULL,
    `Annual_Salary` INT NULL,
    PRIMARY KEY (`EmployeeID`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Create `Customers` table
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Customers` (
    `CustomerID` INT NOT NULL AUTO_INCREMENT,
    `FullName` VARCHAR(200) NULL,
    `ContactNumber` INT NULL,
    `Email` VARCHAR(100) NULL,
    PRIMARY KEY (`CustomerID`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Create `Bookings` table
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bookings` (
    `BookingID` INT NOT NULL AUTO_INCREMENT,
    `BookingDate` DATETIME NULL,
    `CustomerID` INT NULL,
    `EmployeeID` INT NULL,
    PRIMARY KEY (`BookingID`),
    INDEX `staff_id_fk_idx` (`EmployeeID` ASC),
    INDEX `customer_id_fk_idx` (`CustomerID` ASC),
    CONSTRAINT `staff_id_fk`
        FOREIGN KEY (`EmployeeID`)
        REFERENCES `Employees` (`EmployeeID`)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT `customerid_fk`
        FOREIGN KEY (`CustomerID`)
        REFERENCES `Customers` (`CustomerID`)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Create `MenuItems` table
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MenuItems` (
    `MenuItemsID` INT NOT NULL AUTO_INCREMENT,
    `CourseName` VARCHAR(100) NULL,
    `Type` VARCHAR(100) NULL,
    `Price` INT NULL,
    PRIMARY KEY (`MenuItemsID`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Create `Menus` table
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Menus` (
    `MenuID` INT NOT NULL,
    `MenuItemsID` INT NULL,
    `Cuisine` VARCHAR(100) NULL,
    PRIMARY KEY (`MenuID`),
    INDEX `menuitem_id_fk_idx` (`MenuItemsID` ASC),
    CONSTRAINT `menuitems_id_fk`
        FOREIGN KEY (`MenuItemsID`)
        REFERENCES `MenuItems` (`MenuItemsID`)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Create `Orders` table
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Orders` (
    `OrderID` INT NOT NULL,
    `MenuID` INT NULL,
    `CustomerID` INT NULL,
    `TotalCost` INT NULL,
    PRIMARY KEY (`OrderID`),
    INDEX `menuid_fk_idx` (`MenuID` ASC),
    INDEX `customer_id_fk_idx` (`CustomerID` ASC),
    CONSTRAINT `menu_id_fk`
        FOREIGN KEY (`MenuID`)
        REFERENCES `Menus` (`MenuID`)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT `customer_id_fk`
        FOREIGN KEY (`CustomerID`)
        REFERENCES `Customers` (`CustomerID`)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE = InnoDB;

-- Re-enable previous settings
SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;

