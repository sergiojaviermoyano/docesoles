/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : docesoles

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2015-09-18 10:53:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admcredits
-- ----------------------------
DROP TABLE IF EXISTS `admcredits`;
CREATE TABLE `admcredits` (
  `crdId` int(11) NOT NULL AUTO_INCREMENT,
  `crdDescription` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `crdDate` datetime DEFAULT NULL,
  `crdDebe` decimal(10,2) DEFAULT NULL,
  `crdHaber` decimal(10,2) DEFAULT NULL,
  `crdNote` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliId` int(11) NOT NULL,
  `usrId` int(11) NOT NULL,
  PRIMARY KEY (`crdId`),
  KEY `cliId` (`cliId`),
  KEY `usrId` (`usrId`),
  CONSTRAINT `admcredits_ibfk_1` FOREIGN KEY (`cliId`) REFERENCES `admcustomers` (`cliId`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `admcredits_ibfk_2` FOREIGN KEY (`usrId`) REFERENCES `sisusers` (`usrId`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Table structure for admcustomerpreferences
-- ----------------------------
DROP TABLE IF EXISTS `admcustomerpreferences`;
CREATE TABLE `admcustomerpreferences` (
  `cstprefId` int(11) NOT NULL AUTO_INCREMENT,
  `sfamId` int(11) NOT NULL,
  `cliId` int(11) NOT NULL,
  PRIMARY KEY (`cstprefId`),
  KEY `sfamId` (`sfamId`),
  KEY `cliId` (`cliId`),
  CONSTRAINT `cliId` FOREIGN KEY (`cliId`) REFERENCES `admcustomers` (`cliId`),
  CONSTRAINT `sfamId` FOREIGN KEY (`sfamId`) REFERENCES `confsubfamily` (`sfamId`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Table structure for admcustomers
-- ----------------------------
DROP TABLE IF EXISTS `admcustomers`;
CREATE TABLE `admcustomers` (
  `cliId` int(11) NOT NULL AUTO_INCREMENT,
  `cliName` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliLastName` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliDni` varchar(8) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliDateOfBirth` date DEFAULT NULL,
  `cliNroCustomer` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliAddress` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliPhone` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliMovil` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliEmail` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliImagePath` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `zonaId` int(11) DEFAULT NULL,
  `cliDay` int(11) DEFAULT '30',
  PRIMARY KEY (`cliId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Table structure for admproducts
-- ----------------------------
DROP TABLE IF EXISTS `admproducts`;
CREATE TABLE `admproducts` (
  `prodId` int(11) NOT NULL AUTO_INCREMENT,
  `prodCode` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `prodDescription` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `prodPrice` decimal(10,2) NOT NULL,
  `prodMargin` int(11) NOT NULL,
  `prodImg1` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `prodImg2` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `prodImg3` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `prodImg4` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `prodImg5` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `prodStatus` varchar(2) COLLATE utf8_spanish_ci NOT NULL,
  `sfamId` int(11) NOT NULL,
  PRIMARY KEY (`prodId`),
  KEY `sfamId` (`sfamId`),
  CONSTRAINT `admproducts_ibfk_1` FOREIGN KEY (`sfamId`) REFERENCES `confsubfamily` (`sfamId`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Table structure for admstock
-- ----------------------------
DROP TABLE IF EXISTS `admstock`;
CREATE TABLE `admstock` (
  `stkId` int(11) NOT NULL AUTO_INCREMENT,
  `prodId` int(11) NOT NULL,
  `stkCant` int(11) NOT NULL,
  `usrId` int(11) NOT NULL,
  `stkDate` datetime NOT NULL,
  `stkMotive` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`stkId`),
  KEY `prodId` (`prodId`),
  KEY `usrId` (`usrId`),
  CONSTRAINT `admstock_ibfk_1` FOREIGN KEY (`prodId`) REFERENCES `admproducts` (`prodId`) ON UPDATE CASCADE,
  CONSTRAINT `admstock_ibfk_2` FOREIGN KEY (`usrId`) REFERENCES `sisusers` (`usrId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Table structure for admvisits
-- ----------------------------
DROP TABLE IF EXISTS `admvisits`;
CREATE TABLE `admvisits` (
  `vstId` int(11) NOT NULL AUTO_INCREMENT,
  `vstDate` datetime NOT NULL,
  `cliId` int(11) NOT NULL,
  `vstNote` text COLLATE utf8_spanish_ci NOT NULL,
  `vstStatus` varchar(2) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`vstId`),
  KEY `cliId` (`cliId`),
  CONSTRAINT `admvisits_ibfk_1` FOREIGN KEY (`cliId`) REFERENCES `admcustomers` (`cliId`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Table structure for conffamily
-- ----------------------------
DROP TABLE IF EXISTS `conffamily`;
CREATE TABLE `conffamily` (
  `famId` int(11) NOT NULL AUTO_INCREMENT,
  `famName` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`famId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Table structure for confsubfamily
-- ----------------------------
DROP TABLE IF EXISTS `confsubfamily`;
CREATE TABLE `confsubfamily` (
  `sfamId` int(11) NOT NULL AUTO_INCREMENT,
  `sfamName` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `famId` int(11) DEFAULT NULL,
  PRIMARY KEY (`sfamId`),
  KEY `famId` (`famId`),
  CONSTRAINT `famId` FOREIGN KEY (`famId`) REFERENCES `conffamily` (`famId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Table structure for confzone
-- ----------------------------
DROP TABLE IF EXISTS `confzone`;
CREATE TABLE `confzone` (
  `zonaId` int(11) NOT NULL AUTO_INCREMENT,
  `zonaName` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`zonaId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Table structure for sisactions
-- ----------------------------
DROP TABLE IF EXISTS `sisactions`;
CREATE TABLE `sisactions` (
  `actId` int(11) NOT NULL AUTO_INCREMENT,
  `actDescription` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `actDescriptionSpanish` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`actId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Table structure for sisgroups
-- ----------------------------
DROP TABLE IF EXISTS `sisgroups`;
CREATE TABLE `sisgroups` (
  `grpId` int(11) NOT NULL AUTO_INCREMENT,
  `grpName` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`grpId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Table structure for sisgroupsactions
-- ----------------------------
DROP TABLE IF EXISTS `sisgroupsactions`;
CREATE TABLE `sisgroupsactions` (
  `grpactId` int(11) NOT NULL AUTO_INCREMENT,
  `grpId` int(11) NOT NULL,
  `menuAccId` int(11) NOT NULL,
  PRIMARY KEY (`grpactId`),
  KEY `grpId` (`grpId`),
  KEY `menuAccId` (`menuAccId`),
  CONSTRAINT `grpId` FOREIGN KEY (`grpId`) REFERENCES `sisgroups` (`grpId`) ON UPDATE CASCADE,
  CONSTRAINT `menuAccId` FOREIGN KEY (`menuAccId`) REFERENCES `sismenuactions` (`menuAccId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=557 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Table structure for sismenu
-- ----------------------------
DROP TABLE IF EXISTS `sismenu`;
CREATE TABLE `sismenu` (
  `menuId` int(11) NOT NULL AUTO_INCREMENT,
  `menuName` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `menuIcon` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `menuController` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `menuView` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `menuFather` int(11) DEFAULT NULL,
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Table structure for sismenuactions
-- ----------------------------
DROP TABLE IF EXISTS `sismenuactions`;
CREATE TABLE `sismenuactions` (
  `menuAccId` int(11) NOT NULL AUTO_INCREMENT,
  `menuId` int(11) NOT NULL,
  `actId` int(11) DEFAULT NULL,
  PRIMARY KEY (`menuAccId`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Table structure for sisusers
-- ----------------------------
DROP TABLE IF EXISTS `sisusers`;
CREATE TABLE `sisusers` (
  `usrId` int(11) NOT NULL AUTO_INCREMENT,
  `usrNick` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `usrName` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `usrLastName` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `usrComision` int(11) NOT NULL,
  `usrPassword` varchar(5000) COLLATE utf8_spanish_ci NOT NULL,
  `grpId` int(11) NOT NULL,
  PRIMARY KEY (`usrId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
