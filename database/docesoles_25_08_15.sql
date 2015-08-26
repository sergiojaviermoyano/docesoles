/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : docesoles

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2015-08-25 22:21:15
*/

SET FOREIGN_KEY_CHECKS=0;

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
  PRIMARY KEY (`cliId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of admcustomers
-- ----------------------------
INSERT INTO `admcustomers` VALUES ('1', 'Sergio', 'Moyano', '31324200', '1984-12-27', '1', 'Justo castro 2', '0264 - 4', '0264 - 1', 'sergio.m', '', '1');
INSERT INTO `admcustomers` VALUES ('3', 'Miguel', 'Pereyra', '31324207', '1988-12-13', '2', 'Justo castro 4', '0264 - 15555', '', '', '', '6');

-- ----------------------------
-- Table structure for confzone
-- ----------------------------
DROP TABLE IF EXISTS `confzone`;
CREATE TABLE `confzone` (
  `zonaId` int(11) NOT NULL AUTO_INCREMENT,
  `zonaName` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`zonaId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of confzone
-- ----------------------------
INSERT INTO `confzone` VALUES ('1', 'Justo Castro 2');
INSERT INTO `confzone` VALUES ('2', 'Villa Independencia');
INSERT INTO `confzone` VALUES ('3', 'Los Medanos');
INSERT INTO `confzone` VALUES ('4', 'Felipe Cobas');
INSERT INTO `confzone` VALUES ('5', 'Los Olivos');
INSERT INTO `confzone` VALUES ('6', 'Justo Castro 4');
INSERT INTO `confzone` VALUES ('7', 'Barrio Area 2');
INSERT INTO `confzone` VALUES ('8', 'Barrio Los Olivos');

-- ----------------------------
-- Table structure for sisactions
-- ----------------------------
DROP TABLE IF EXISTS `sisactions`;
CREATE TABLE `sisactions` (
  `actId` int(11) NOT NULL AUTO_INCREMENT,
  `actDescription` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`actId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of sisactions
-- ----------------------------
INSERT INTO `sisactions` VALUES ('1', 'Add');
INSERT INTO `sisactions` VALUES ('2', 'Edit');
INSERT INTO `sisactions` VALUES ('3', 'Del');
INSERT INTO `sisactions` VALUES ('4', 'View');
INSERT INTO `sisactions` VALUES ('5', 'Imprimir');

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
-- Records of sisgroups
-- ----------------------------
INSERT INTO `sisgroups` VALUES ('1', 'Administrador');
INSERT INTO `sisgroups` VALUES ('2', 'Vendedor');
INSERT INTO `sisgroups` VALUES ('3', 'Depósito');

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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of sisgroupsactions
-- ----------------------------
INSERT INTO `sisgroupsactions` VALUES ('57', '2', '1');
INSERT INTO `sisgroupsactions` VALUES ('58', '2', '4');
INSERT INTO `sisgroupsactions` VALUES ('59', '2', '8');
INSERT INTO `sisgroupsactions` VALUES ('60', '2', '13');
INSERT INTO `sisgroupsactions` VALUES ('61', '3', '9');
INSERT INTO `sisgroupsactions` VALUES ('62', '3', '10');
INSERT INTO `sisgroupsactions` VALUES ('63', '3', '11');
INSERT INTO `sisgroupsactions` VALUES ('64', '3', '12');
INSERT INTO `sisgroupsactions` VALUES ('65', '1', '1');
INSERT INTO `sisgroupsactions` VALUES ('66', '1', '2');
INSERT INTO `sisgroupsactions` VALUES ('67', '1', '3');
INSERT INTO `sisgroupsactions` VALUES ('68', '1', '4');
INSERT INTO `sisgroupsactions` VALUES ('69', '1', '5');
INSERT INTO `sisgroupsactions` VALUES ('70', '1', '6');
INSERT INTO `sisgroupsactions` VALUES ('71', '1', '7');
INSERT INTO `sisgroupsactions` VALUES ('72', '1', '8');
INSERT INTO `sisgroupsactions` VALUES ('73', '1', '9');
INSERT INTO `sisgroupsactions` VALUES ('74', '1', '10');
INSERT INTO `sisgroupsactions` VALUES ('75', '1', '11');
INSERT INTO `sisgroupsactions` VALUES ('76', '1', '12');
INSERT INTO `sisgroupsactions` VALUES ('77', '1', '13');
INSERT INTO `sisgroupsactions` VALUES ('78', '1', '14');
INSERT INTO `sisgroupsactions` VALUES ('79', '1', '15');
INSERT INTO `sisgroupsactions` VALUES ('80', '1', '16');
INSERT INTO `sisgroupsactions` VALUES ('81', '1', '17');
INSERT INTO `sisgroupsactions` VALUES ('82', '1', '18');
INSERT INTO `sisgroupsactions` VALUES ('83', '1', '19');
INSERT INTO `sisgroupsactions` VALUES ('84', '1', '20');
INSERT INTO `sisgroupsactions` VALUES ('85', '1', '21');
INSERT INTO `sisgroupsactions` VALUES ('86', '1', '22');
INSERT INTO `sisgroupsactions` VALUES ('87', '1', '23');
INSERT INTO `sisgroupsactions` VALUES ('88', '1', '24');
INSERT INTO `sisgroupsactions` VALUES ('89', '1', '25');
INSERT INTO `sisgroupsactions` VALUES ('90', '1', '26');
INSERT INTO `sisgroupsactions` VALUES ('91', '1', '27');
INSERT INTO `sisgroupsactions` VALUES ('92', '1', '28');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of sismenu
-- ----------------------------
INSERT INTO `sismenu` VALUES ('1', 'Clientes', 'fa fa-users', 'customer', 'index', null);
INSERT INTO `sismenu` VALUES ('2', 'Artículos', 'fa fa-leanpub', 'article', 'list', null);
INSERT INTO `sismenu` VALUES ('3', 'Stock', 'fa fa-home', 'stock', 'list', null);
INSERT INTO `sismenu` VALUES ('4', 'Cuenta_Corriente', 'fa fa-money', 'cash', 'list', null);
INSERT INTO `sismenu` VALUES ('5', 'Reportes', 'fa fa-file-picture-o', '', '', null);
INSERT INTO `sismenu` VALUES ('6', 'Ingresos', '', 'report', 'in', '5');
INSERT INTO `sismenu` VALUES ('7', 'Saldos', '', 'report', 'sl', '5');
INSERT INTO `sismenu` VALUES ('8', 'Ventas', '', 'report', 'vt', '5');
INSERT INTO `sismenu` VALUES ('9', 'Seguridad', 'fa fa-key', '', '', null);
INSERT INTO `sismenu` VALUES ('10', 'Usuarios', '', 'user', 'index', '9');
INSERT INTO `sismenu` VALUES ('11', 'Grupos', '', 'group', 'index', '9');
INSERT INTO `sismenu` VALUES ('12', 'Administración', 'fa fa-fw fa-cogs', '', '', null);
INSERT INTO `sismenu` VALUES ('13', 'Zonas', '', 'zone', 'index', '12');

-- ----------------------------
-- Table structure for sismenuactions
-- ----------------------------
DROP TABLE IF EXISTS `sismenuactions`;
CREATE TABLE `sismenuactions` (
  `menuAccId` int(11) NOT NULL AUTO_INCREMENT,
  `menuId` int(11) NOT NULL,
  `actId` int(11) DEFAULT NULL,
  PRIMARY KEY (`menuAccId`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of sismenuactions
-- ----------------------------
INSERT INTO `sismenuactions` VALUES ('1', '1', '1');
INSERT INTO `sismenuactions` VALUES ('2', '1', '2');
INSERT INTO `sismenuactions` VALUES ('3', '1', '3');
INSERT INTO `sismenuactions` VALUES ('4', '1', '4');
INSERT INTO `sismenuactions` VALUES ('5', '2', '1');
INSERT INTO `sismenuactions` VALUES ('6', '2', '2');
INSERT INTO `sismenuactions` VALUES ('7', '2', '3');
INSERT INTO `sismenuactions` VALUES ('8', '2', '4');
INSERT INTO `sismenuactions` VALUES ('9', '3', '1');
INSERT INTO `sismenuactions` VALUES ('10', '3', '2');
INSERT INTO `sismenuactions` VALUES ('11', '3', '3');
INSERT INTO `sismenuactions` VALUES ('12', '3', '4');
INSERT INTO `sismenuactions` VALUES ('13', '4', '1');
INSERT INTO `sismenuactions` VALUES ('14', '6', '5');
INSERT INTO `sismenuactions` VALUES ('15', '7', '5');
INSERT INTO `sismenuactions` VALUES ('16', '8', '5');
INSERT INTO `sismenuactions` VALUES ('17', '10', '1');
INSERT INTO `sismenuactions` VALUES ('18', '10', '2');
INSERT INTO `sismenuactions` VALUES ('19', '10', '3');
INSERT INTO `sismenuactions` VALUES ('20', '10', '4');
INSERT INTO `sismenuactions` VALUES ('21', '11', '1');
INSERT INTO `sismenuactions` VALUES ('22', '11', '2');
INSERT INTO `sismenuactions` VALUES ('23', '11', '3');
INSERT INTO `sismenuactions` VALUES ('24', '11', '4');
INSERT INTO `sismenuactions` VALUES ('25', '13', '1');
INSERT INTO `sismenuactions` VALUES ('26', '13', '2');
INSERT INTO `sismenuactions` VALUES ('27', '13', '3');
INSERT INTO `sismenuactions` VALUES ('28', '13', '4');

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

-- ----------------------------
-- Records of sisusers
-- ----------------------------
INSERT INTO `sisusers` VALUES ('1', 'admin', 'Administrador', ' ', '0', 'e10adc3949ba59abbe56e057f20f883e', '1');
INSERT INTO `sisusers` VALUES ('4', 'leo', 'Leonardo', 'Balmaceda', '0', 'e10adc3949ba59abbe56e057f20f883e', '2');
INSERT INTO `sisusers` VALUES ('5', 'ana', 'Analía', 'Perez', '15', 'e10adc3949ba59abbe56e057f20f883e', '2');
