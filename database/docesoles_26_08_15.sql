/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : docesoles

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2015-08-26 21:05:23
*/

SET FOREIGN_KEY_CHECKS=0;

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
  CONSTRAINT `sfamId` FOREIGN KEY (`sfamId`) REFERENCES `confsubfamily` (`sfamId`),
  CONSTRAINT `cliId` FOREIGN KEY (`cliId`) REFERENCES `admcustomers` (`cliId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of admcustomerpreferences
-- ----------------------------
INSERT INTO `admcustomerpreferences` VALUES ('6', '1', '3');
INSERT INTO `admcustomerpreferences` VALUES ('7', '2', '3');
INSERT INTO `admcustomerpreferences` VALUES ('8', '3', '3');
INSERT INTO `admcustomerpreferences` VALUES ('9', '4', '3');
INSERT INTO `admcustomerpreferences` VALUES ('10', '3', '4');
INSERT INTO `admcustomerpreferences` VALUES ('11', '4', '4');
INSERT INTO `admcustomerpreferences` VALUES ('12', '1', '5');
INSERT INTO `admcustomerpreferences` VALUES ('13', '2', '5');
INSERT INTO `admcustomerpreferences` VALUES ('16', '1', '7');
INSERT INTO `admcustomerpreferences` VALUES ('17', '1', '1');
INSERT INTO `admcustomerpreferences` VALUES ('18', '2', '1');
INSERT INTO `admcustomerpreferences` VALUES ('19', '3', '1');
INSERT INTO `admcustomerpreferences` VALUES ('20', '4', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of admcustomers
-- ----------------------------
INSERT INTO `admcustomers` VALUES ('1', 'Sergio', 'Moyano', '31324200', '1984-12-27', '1', 'Justo castro 2', '0264 - 4', '0264 - 1', 'sergio.m', '', '1', '15');
INSERT INTO `admcustomers` VALUES ('3', 'Miguel', 'Pereyra', '31324207', '1988-12-13', '2', 'Justo castro 4', '0264 - 15555', '', '', '', '6', '30');
INSERT INTO `admcustomers` VALUES ('4', 'Maria', 'Romero', '31324555', '1984-05-07', '4', 'Calle las moras 123', '', '', '', '', '2', '30');
INSERT INTO `admcustomers` VALUES ('5', 'Julia', 'Dora', '78979878', '2015-08-27', '5', 'calle la plata 1200', '', '', '', '', '2', '30');
INSERT INTO `admcustomers` VALUES ('7', 'Rogelio', 'Funes Mori', '13131231', '2015-08-01', '6', 'justo castro 2 me casa 23', '', '', '', '', '1', '30');

-- ----------------------------
-- Table structure for conffamily
-- ----------------------------
DROP TABLE IF EXISTS `conffamily`;
CREATE TABLE `conffamily` (
  `famId` int(11) NOT NULL AUTO_INCREMENT,
  `famName` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`famId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of conffamily
-- ----------------------------
INSERT INTO `conffamily` VALUES ('1', 'Cocina');
INSERT INTO `conffamily` VALUES ('3', 'Comedor');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of confsubfamily
-- ----------------------------
INSERT INTO `confsubfamily` VALUES ('1', 'Cortina ', '1');
INSERT INTO `confsubfamily` VALUES ('2', 'Mantel cuadrado', '1');
INSERT INTO `confsubfamily` VALUES ('3', 'Cortina Grande', '3');
INSERT INTO `confsubfamily` VALUES ('4', 'Mantel redondo', '3');
INSERT INTO `confsubfamily` VALUES ('5', '', null);

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
  `actDescriptionSpanish` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`actId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of sisactions
-- ----------------------------
INSERT INTO `sisactions` VALUES ('1', 'Add', 'Agregar');
INSERT INTO `sisactions` VALUES ('2', 'Edit', 'Editar');
INSERT INTO `sisactions` VALUES ('3', 'Del', 'Eliminar');
INSERT INTO `sisactions` VALUES ('4', 'View', 'Consultar');
INSERT INTO `sisactions` VALUES ('5', 'Imprimir', 'Imprimir');

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
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of sisgroupsactions
-- ----------------------------
INSERT INTO `sisgroupsactions` VALUES ('61', '3', '9');
INSERT INTO `sisgroupsactions` VALUES ('62', '3', '10');
INSERT INTO `sisgroupsactions` VALUES ('63', '3', '11');
INSERT INTO `sisgroupsactions` VALUES ('64', '3', '12');
INSERT INTO `sisgroupsactions` VALUES ('125', '2', '1');
INSERT INTO `sisgroupsactions` VALUES ('126', '2', '4');
INSERT INTO `sisgroupsactions` VALUES ('127', '2', '8');
INSERT INTO `sisgroupsactions` VALUES ('128', '2', '13');
INSERT INTO `sisgroupsactions` VALUES ('129', '2', '25');
INSERT INTO `sisgroupsactions` VALUES ('130', '2', '28');
INSERT INTO `sisgroupsactions` VALUES ('131', '1', '1');
INSERT INTO `sisgroupsactions` VALUES ('132', '1', '2');
INSERT INTO `sisgroupsactions` VALUES ('133', '1', '3');
INSERT INTO `sisgroupsactions` VALUES ('134', '1', '4');
INSERT INTO `sisgroupsactions` VALUES ('135', '1', '5');
INSERT INTO `sisgroupsactions` VALUES ('136', '1', '6');
INSERT INTO `sisgroupsactions` VALUES ('137', '1', '7');
INSERT INTO `sisgroupsactions` VALUES ('138', '1', '8');
INSERT INTO `sisgroupsactions` VALUES ('139', '1', '9');
INSERT INTO `sisgroupsactions` VALUES ('140', '1', '10');
INSERT INTO `sisgroupsactions` VALUES ('141', '1', '11');
INSERT INTO `sisgroupsactions` VALUES ('142', '1', '12');
INSERT INTO `sisgroupsactions` VALUES ('143', '1', '13');
INSERT INTO `sisgroupsactions` VALUES ('144', '1', '14');
INSERT INTO `sisgroupsactions` VALUES ('145', '1', '15');
INSERT INTO `sisgroupsactions` VALUES ('146', '1', '16');
INSERT INTO `sisgroupsactions` VALUES ('147', '1', '17');
INSERT INTO `sisgroupsactions` VALUES ('148', '1', '18');
INSERT INTO `sisgroupsactions` VALUES ('149', '1', '19');
INSERT INTO `sisgroupsactions` VALUES ('150', '1', '20');
INSERT INTO `sisgroupsactions` VALUES ('151', '1', '21');
INSERT INTO `sisgroupsactions` VALUES ('152', '1', '22');
INSERT INTO `sisgroupsactions` VALUES ('153', '1', '23');
INSERT INTO `sisgroupsactions` VALUES ('154', '1', '24');
INSERT INTO `sisgroupsactions` VALUES ('155', '1', '25');
INSERT INTO `sisgroupsactions` VALUES ('156', '1', '26');
INSERT INTO `sisgroupsactions` VALUES ('157', '1', '27');
INSERT INTO `sisgroupsactions` VALUES ('158', '1', '28');
INSERT INTO `sisgroupsactions` VALUES ('159', '1', '29');
INSERT INTO `sisgroupsactions` VALUES ('160', '1', '30');
INSERT INTO `sisgroupsactions` VALUES ('161', '1', '31');
INSERT INTO `sisgroupsactions` VALUES ('162', '1', '32');
INSERT INTO `sisgroupsactions` VALUES ('163', '1', '33');
INSERT INTO `sisgroupsactions` VALUES ('164', '1', '34');
INSERT INTO `sisgroupsactions` VALUES ('165', '1', '35');
INSERT INTO `sisgroupsactions` VALUES ('166', '1', '36');

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
INSERT INTO `sismenu` VALUES ('14', 'Familias', '', 'family', 'index', '12');
INSERT INTO `sismenu` VALUES ('15', 'Sub-Familias', '', 'family', 'indexSF', '12');

-- ----------------------------
-- Table structure for sismenuactions
-- ----------------------------
DROP TABLE IF EXISTS `sismenuactions`;
CREATE TABLE `sismenuactions` (
  `menuAccId` int(11) NOT NULL AUTO_INCREMENT,
  `menuId` int(11) NOT NULL,
  `actId` int(11) DEFAULT NULL,
  PRIMARY KEY (`menuAccId`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
INSERT INTO `sismenuactions` VALUES ('29', '14', '1');
INSERT INTO `sismenuactions` VALUES ('30', '14', '2');
INSERT INTO `sismenuactions` VALUES ('31', '14', '3');
INSERT INTO `sismenuactions` VALUES ('32', '14', '4');
INSERT INTO `sismenuactions` VALUES ('33', '15', '1');
INSERT INTO `sismenuactions` VALUES ('34', '15', '2');
INSERT INTO `sismenuactions` VALUES ('35', '15', '3');
INSERT INTO `sismenuactions` VALUES ('36', '15', '4');
INSERT INTO `sismenuactions` VALUES ('37', '0', null);

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
