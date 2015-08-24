/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : docesoles

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2015-08-24 15:36:37
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of sisgroupsactions
-- ----------------------------
INSERT INTO `sisgroupsactions` VALUES ('33', '1', '1');
INSERT INTO `sisgroupsactions` VALUES ('34', '1', '2');
INSERT INTO `sisgroupsactions` VALUES ('35', '1', '3');
INSERT INTO `sisgroupsactions` VALUES ('36', '1', '4');
INSERT INTO `sisgroupsactions` VALUES ('37', '1', '5');
INSERT INTO `sisgroupsactions` VALUES ('38', '1', '6');
INSERT INTO `sisgroupsactions` VALUES ('39', '1', '7');
INSERT INTO `sisgroupsactions` VALUES ('40', '1', '8');
INSERT INTO `sisgroupsactions` VALUES ('41', '1', '9');
INSERT INTO `sisgroupsactions` VALUES ('42', '1', '10');
INSERT INTO `sisgroupsactions` VALUES ('43', '1', '11');
INSERT INTO `sisgroupsactions` VALUES ('44', '1', '12');
INSERT INTO `sisgroupsactions` VALUES ('45', '1', '13');
INSERT INTO `sisgroupsactions` VALUES ('46', '1', '14');
INSERT INTO `sisgroupsactions` VALUES ('47', '1', '15');
INSERT INTO `sisgroupsactions` VALUES ('48', '1', '16');
INSERT INTO `sisgroupsactions` VALUES ('49', '1', '17');
INSERT INTO `sisgroupsactions` VALUES ('50', '1', '18');
INSERT INTO `sisgroupsactions` VALUES ('51', '1', '19');
INSERT INTO `sisgroupsactions` VALUES ('52', '1', '20');
INSERT INTO `sisgroupsactions` VALUES ('53', '1', '21');
INSERT INTO `sisgroupsactions` VALUES ('54', '1', '22');
INSERT INTO `sisgroupsactions` VALUES ('55', '1', '23');
INSERT INTO `sisgroupsactions` VALUES ('56', '1', '24');
INSERT INTO `sisgroupsactions` VALUES ('57', '2', '1');
INSERT INTO `sisgroupsactions` VALUES ('58', '2', '4');
INSERT INTO `sisgroupsactions` VALUES ('59', '2', '8');
INSERT INTO `sisgroupsactions` VALUES ('60', '2', '13');
INSERT INTO `sisgroupsactions` VALUES ('61', '3', '9');
INSERT INTO `sisgroupsactions` VALUES ('62', '3', '10');
INSERT INTO `sisgroupsactions` VALUES ('63', '3', '11');
INSERT INTO `sisgroupsactions` VALUES ('64', '3', '12');

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
INSERT INTO `sismenu` VALUES ('1', 'Clientes', 'fa fa-users', 'client', 'list', null);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of sisusers
-- ----------------------------
INSERT INTO `sisusers` VALUES ('1', 'admin', 'Administrador', ' ', '0', 'e10adc3949ba59abbe56e057f20f883e', '1');
INSERT INTO `sisusers` VALUES ('4', 'leo', 'Leonardo', 'Balmaceda', '0', 'e10adc3949ba59abbe56e057f20f883e', '2');
INSERT INTO `sisusers` VALUES ('5', 'ana', 'Analía', 'Perez', '15', 'e10adc3949ba59abbe56e057f20f883e', '2');
