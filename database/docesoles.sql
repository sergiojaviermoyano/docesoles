/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : docesoles

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2015-08-20 20:53:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sisactions
-- ----------------------------
DROP TABLE IF EXISTS `sisactions`;
CREATE TABLE `sisactions` (
  `actId` int(11) NOT NULL AUTO_INCREMENT,
  `actDescription` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`actId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of sisactions
-- ----------------------------
INSERT INTO `sisactions` VALUES ('1', 'Agregar');
INSERT INTO `sisactions` VALUES ('2', 'Modificar');
INSERT INTO `sisactions` VALUES ('3', 'Eliminar');
INSERT INTO `sisactions` VALUES ('4', 'Consultar');
INSERT INTO `sisactions` VALUES ('5', 'Imprimir');

-- ----------------------------
-- Table structure for sisgroups
-- ----------------------------
DROP TABLE IF EXISTS `sisgroups`;
CREATE TABLE `sisgroups` (
  `grpId` int(11) NOT NULL AUTO_INCREMENT,
  `grpName` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`grpId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of sisgroups
-- ----------------------------
INSERT INTO `sisgroups` VALUES ('1', 'Administrador');
INSERT INTO `sisgroups` VALUES ('2', 'Vendedor');
INSERT INTO `sisgroups` VALUES ('3', 'Depósito');
INSERT INTO `sisgroups` VALUES ('4', 'Calle');
INSERT INTO `sisgroups` VALUES ('5', 'Otro mas');
INSERT INTO `sisgroups` VALUES ('6', 'Grupo 6');
INSERT INTO `sisgroups` VALUES ('7', 'reporte');
INSERT INTO `sisgroups` VALUES ('8', 'Segurida');
INSERT INTO `sisgroups` VALUES ('9', 'ddddd');
INSERT INTO `sisgroups` VALUES ('10', 'asdasdasd');
INSERT INTO `sisgroups` VALUES ('11', 'grupo 11');

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
  CONSTRAINT `menuAccId` FOREIGN KEY (`menuAccId`) REFERENCES `sismenuactions` (`menuAccId`) ON UPDATE CASCADE,
  CONSTRAINT `grpId` FOREIGN KEY (`grpId`) REFERENCES `sisgroups` (`grpId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of sisgroupsactions
-- ----------------------------
INSERT INTO `sisgroupsactions` VALUES ('1', '5', '1');
INSERT INTO `sisgroupsactions` VALUES ('2', '5', '2');
INSERT INTO `sisgroupsactions` VALUES ('3', '5', '3');
INSERT INTO `sisgroupsactions` VALUES ('4', '5', '4');
INSERT INTO `sisgroupsactions` VALUES ('5', '6', '4');
INSERT INTO `sisgroupsactions` VALUES ('6', '6', '5');
INSERT INTO `sisgroupsactions` VALUES ('7', '7', '14');
INSERT INTO `sisgroupsactions` VALUES ('8', '7', '15');
INSERT INTO `sisgroupsactions` VALUES ('9', '7', '16');
INSERT INTO `sisgroupsactions` VALUES ('10', '8', '17');
INSERT INTO `sisgroupsactions` VALUES ('11', '8', '18');
INSERT INTO `sisgroupsactions` VALUES ('12', '8', '19');
INSERT INTO `sisgroupsactions` VALUES ('13', '8', '20');
INSERT INTO `sisgroupsactions` VALUES ('14', '9', '9');
INSERT INTO `sisgroupsactions` VALUES ('15', '9', '10');
INSERT INTO `sisgroupsactions` VALUES ('16', '10', '9');
INSERT INTO `sisgroupsactions` VALUES ('17', '10', '10');
INSERT INTO `sisgroupsactions` VALUES ('18', '11', '13');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of sismenu
-- ----------------------------
INSERT INTO `sismenu` VALUES ('1', 'Clientes', 'cl', 'client', 'list', null);
INSERT INTO `sismenu` VALUES ('2', 'Artículos', 'ar', 'article', 'list', null);
INSERT INTO `sismenu` VALUES ('3', 'Stock', 'st', 'stock', 'list', null);
INSERT INTO `sismenu` VALUES ('4', 'Cuenta_Corriente', 'cc', 'cash', 'list', null);
INSERT INTO `sismenu` VALUES ('5', 'Reportes', 'rp', '', '', null);
INSERT INTO `sismenu` VALUES ('6', 'Ingresos', '', 'report', 'in', '5');
INSERT INTO `sismenu` VALUES ('7', 'Saldos', '', 'report', 'sl', '5');
INSERT INTO `sismenu` VALUES ('8', 'Ventas', '', 'report', 'vt', '5');
INSERT INTO `sismenu` VALUES ('9', 'Seguridad', 'sg', '', '', null);
INSERT INTO `sismenu` VALUES ('10', 'Usuarios', '', 'users', 'list', '9');
INSERT INTO `sismenu` VALUES ('11', 'Grupos', '', 'group', 'list', '9');

-- ----------------------------
-- Table structure for sismenuactions
-- ----------------------------
DROP TABLE IF EXISTS `sismenuactions`;
CREATE TABLE `sismenuactions` (
  `menuAccId` int(11) NOT NULL AUTO_INCREMENT,
  `menuId` int(11) NOT NULL,
  `actId` int(11) DEFAULT NULL,
  PRIMARY KEY (`menuAccId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of sisusers
-- ----------------------------
