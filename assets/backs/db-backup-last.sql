DROP TABLE IF EXISTS admcredits;

CREATE TABLE `admcredits` (
  `crdId` int(11) NOT NULL AUTO_INCREMENT,
  `crdDescription` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `crdDate` datetime DEFAULT NULL,
  `crdDebe` decimal(10,2) DEFAULT NULL,
  `crdHaber` decimal(10,2) DEFAULT NULL,
  `crdNote` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliId` int(11) NOT NULL,
  `usrId` int(11) NOT NULL,
  `saleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`crdId`),
  KEY `cliId` (`cliId`),
  KEY `usrId` (`usrId`),
  KEY `saleId` (`saleId`),
  CONSTRAINT `admcredits_ibfk_3` FOREIGN KEY (`saleId`) REFERENCES `admsales` (`saleId`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `admcredits_ibfk_1` FOREIGN KEY (`cliId`) REFERENCES `admcustomers` (`cliId`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `admcredits_ibfk_2` FOREIGN KEY (`usrId`) REFERENCES `sisusers` (`usrId`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO admcredits VALUES("1","Carga de saldo al sistema","2015-09-16 16:27:02","500.50","0.00","Carga inicial","3","1","");
INSERT INTO admcredits VALUES("2","Carga Inicial de datos","2015-09-16 20:05:18","800.00","0.00","Es la deuda actual que tiene","4","1","");
INSERT INTO admcredits VALUES("3","carga al haber","2015-09-17 11:57:30","0.00","100.00","solo para probar","1","1","");
INSERT INTO admcredits VALUES("4","pago ","2015-09-17 13:08:05","0.00","200.00","primer pago ","4","1","");
INSERT INTO admcredits VALUES("5","Carga inicial ","2015-09-30 22:20:18","1000.00","0.00","carga","6","1","");
INSERT INTO admcredits VALUES("6","entrega plata","2015-09-30 22:21:43","0.00","100.00","pago cuota 1","6","1","");
INSERT INTO admcredits VALUES("7","Venta","2015-09-30 22:25:21","500.00","0.00","venta de mantel","1","1","");
INSERT INTO admcredits VALUES("8","compra","2015-10-22 13:24:27","100.00","0.00","cobro","4","1","");
INSERT INTO admcredits VALUES("9","Pago a cuenta","2015-10-23 14:37:02","0.00","300.00","primera prueba","4","1","");
INSERT INTO admcredits VALUES("10","Pago a cuenta","2015-10-23 14:41:17","0.00","5.00","segundo pago ","4","1","");
INSERT INTO admcredits VALUES("11","Pago a cuenta","2015-10-23 14:43:00","0.00","200.00","entrega plata porque le sobra","7","1","");
INSERT INTO admcredits VALUES("12","Pago a cuenta","2015-10-23 15:03:43","0.00","3.00","pago de prueba con mensaje","4","1","");
INSERT INTO admcredits VALUES("13","Pago a cuenta","2015-10-23 15:04:13","0.00","82.00","otro pago mas","4","1","");
INSERT INTO admcredits VALUES("14","Pago a cuenta","2015-10-23 15:07:30","0.00","3.00","asdasdasdasd","10","1","");
INSERT INTO admcredits VALUES("15","Pago a cuenta","2015-10-23 15:08:24","0.00","34.00","sdfsdsfd","9","1","");
INSERT INTO admcredits VALUES("16","Pago a cuenta","2015-10-23 15:08:38","0.00","45.00","asdfsdf","9","1","");
INSERT INTO admcredits VALUES("17","Pago a cuenta","2015-10-23 15:12:54","0.00","4.00","sdfsd","10","1","");
INSERT INTO admcredits VALUES("18","Pago a cuenta","2015-10-23 15:13:34","0.00","7.00","567567","9","1","");
INSERT INTO admcredits VALUES("19","Pago a cuenta","2015-10-23 15:14:15","0.00","33.00","ertetr","5","1","");
INSERT INTO admcredits VALUES("20","Pago a cuenta","2015-10-23 15:14:23","0.00","33.00","ertetr","5","1","");
INSERT INTO admcredits VALUES("21","Pago a cuenta","2015-10-23 15:14:46","0.00","33.00","ertetr","5","1","");
INSERT INTO admcredits VALUES("22","Pago a cuenta","2015-10-23 15:15:01","0.00","33.00","ertetr","5","1","");
INSERT INTO admcredits VALUES("23","Pago a cuenta","2015-10-23 15:15:32","0.00","30.00","pago unico ","1","1","");
INSERT INTO admcredits VALUES("24","Pago a cuenta","2015-10-23 15:16:24","0.00","90.00","ok","5","1","");
INSERT INTO admcredits VALUES("25","Pago a cuenta","2015-10-23 15:16:34","0.00","78.00","897","1","1","");
INSERT INTO admcredits VALUES("26","Pago a cuenta","2015-10-23 15:26:02","0.00","45.00","sdfsdf","5","1","");
INSERT INTO admcredits VALUES("27","Pago a cuenta","2015-10-23 23:56:52","0.00","200.50","me pago con cheque","3","1","");
INSERT INTO admcredits VALUES("28","Pago a cuenta","2015-10-23 23:57:25","0.00","3.00","","5","1","");
INSERT INTO admcredits VALUES("29","Pago a cuenta","2015-10-23 23:57:43","0.00","30.00","","5","1","");
INSERT INTO admcredits VALUES("30","Pago a cuenta","2015-10-24 01:32:26","0.00","1.00","","3","1","");
INSERT INTO admcredits VALUES("31","Pago a cuenta","2015-10-24 01:32:51","0.00","1.00","","3","1","");
INSERT INTO admcredits VALUES("32","Pago a cuenta","2015-10-24 01:33:08","0.00","1.00","","3","1","");
INSERT INTO admcredits VALUES("33","Pago a cuenta","2015-10-24 01:33:56","0.00","1.00","","3","1","");
INSERT INTO admcredits VALUES("34","Pago a cuenta","2015-10-24 01:34:44","0.00","1.00","","3","1","");
INSERT INTO admcredits VALUES("35","Pago a cuenta","2015-10-24 01:35:14","0.00","1.00","","3","1","");
INSERT INTO admcredits VALUES("36","Pago a cuenta","2015-10-24 01:36:14","0.00","1.00","","1","1","");
INSERT INTO admcredits VALUES("37","Pago a cuenta","2015-10-24 01:36:56","0.00","1.00","","4","1","");
INSERT INTO admcredits VALUES("38","Pago a cuenta","2015-10-24 01:38:18","0.00","1.00","","4","1","");
INSERT INTO admcredits VALUES("39","Pago a cuenta","2015-10-24 01:38:58","0.00","1.00","","4","1","");
INSERT INTO admcredits VALUES("40","Pago a cuenta","2015-10-24 01:40:39","0.00","1.00","","4","1","");
INSERT INTO admcredits VALUES("41","Pago a cuenta","2015-10-24 01:41:43","0.00","1.00","","4","1","");
INSERT INTO admcredits VALUES("42","Pago a cuenta","2015-10-24 01:42:23","0.00","1.00","","4","1","");
INSERT INTO admcredits VALUES("43","Pago a cuenta","2015-10-24 01:43:38","0.00","1.00","","4","1","");
INSERT INTO admcredits VALUES("44","Pago a cuenta","2015-10-24 01:44:01","0.00","1.00","","4","1","");
INSERT INTO admcredits VALUES("45","Pago a cuenta","2015-10-24 01:46:24","0.00","1.00","","4","1","");
INSERT INTO admcredits VALUES("46","Pago a cuenta","2015-10-24 01:47:55","0.00","1.00","","4","1","");
INSERT INTO admcredits VALUES("47","Pago a cuenta","2015-10-24 01:53:18","0.00","1.00","","4","1","");
INSERT INTO admcredits VALUES("48","Pago a cuenta","2015-10-24 01:53:34","0.00","1.00","","10","1","");
INSERT INTO admcredits VALUES("49","Pago a cuenta","2015-10-24 01:54:35","0.00","1.00","","4","1","");
INSERT INTO admcredits VALUES("50","Pago a cuenta","2015-10-24 02:04:34","0.00","1.00","","4","1","");
INSERT INTO admcredits VALUES("51","prueba de fecha","2015-10-24 02:12:47","100.00","0.00","23:12","4","1","");
INSERT INTO admcredits VALUES("52","prueba de fecha","2015-10-23 23:14:12","100.00","0.00","2314","3","1","");
INSERT INTO admcredits VALUES("53","prueba","2015-11-02 20:41:20","5000.00","0.00","a","5","1","");
INSERT INTO admcredits VALUES("54","Pago a cuenta","2015-11-02 20:42:49","0.00","700.00","","5","1","");
INSERT INTO admcredits VALUES("55","Pago a cuenta","2015-11-02 20:43:21","0.00","100.00","","3","1","");
INSERT INTO admcredits VALUES("56","qweqwe","2015-11-04 11:07:04","1000.00","0.00","dscvadvadv","9","1","");
INSERT INTO admcredits VALUES("57","Pago a cuenta","2015-11-04 11:07:30","0.00","100.00","","5","1","");
INSERT INTO admcredits VALUES("58","Pago a cuenta","2015-11-04 11:07:44","0.00","14.00","","9","1","");
INSERT INTO admcredits VALUES("59","Pago a cuenta","2015-11-04 16:04:09","0.00","100.00","","5","1","");
INSERT INTO admcredits VALUES("63","Pago a cuenta","2015-11-04 16:18:30","0.00","7.00","","4","1","");
INSERT INTO admcredits VALUES("64","Pago a cuenta","2015-11-04 16:19:07","0.00","10.00","","4","1","");
INSERT INTO admcredits VALUES("65","Pago a cuenta","2015-11-04 16:19:43","0.00","5.00","","4","1","");
INSERT INTO admcredits VALUES("66","Pago a cuenta","2015-11-04 16:20:39","0.00","4.00","","4","1","");
INSERT INTO admcredits VALUES("67","Pago a cuenta","2015-11-04 16:23:03","0.00","2.00","","4","1","");
INSERT INTO admcredits VALUES("68","Pago a cuenta","2015-11-04 16:24:59","0.00","8.00","","4","1","");
INSERT INTO admcredits VALUES("69","Pago a cuenta","2015-11-04 16:26:54","0.00","5.00","","4","1","");
INSERT INTO admcredits VALUES("70","8","2015-12-07 00:20:05","884.00","0.00","","3","1","");
INSERT INTO admcredits VALUES("71","9","2015-12-07 00:21:36","442.00","0.00","","5","1","");
INSERT INTO admcredits VALUES("72","Importe venta 10","2015-12-07 00:22:25","816.00","0.00","","10","1","");
INSERT INTO admcredits VALUES("73","Importe venta 11","2015-12-07 00:30:31","221.00","0.00","","10","1","");
INSERT INTO admcredits VALUES("74","Importe venta 12","2015-12-07 00:30:42","221.00","0.00","","10","1","");
INSERT INTO admcredits VALUES("75","Importe venta 13","2015-12-07 00:31:59","442.00","0.00","","5","1","");
INSERT INTO admcredits VALUES("76","Pago a cuenta venta 13","2015-12-07 00:31:59","0.00","42.00","","5","1","");
INSERT INTO admcredits VALUES("77","Importe venta 14","2015-12-07 00:33:18","1105.00","0.00","","9","1","");
INSERT INTO admcredits VALUES("78","Importe venta 15","2015-12-07 10:55:35","221.00","0.00","","11","1","");
INSERT INTO admcredits VALUES("79","Pago a cuenta venta 15","2015-12-07 10:55:35","0.00","21.00","","11","1","");
INSERT INTO admcredits VALUES("80","Importe venta 16","2015-12-07 11:00:45","300.00","0.00","","11","1","16");



DROP TABLE IF EXISTS admcustomerpreferences;

CREATE TABLE `admcustomerpreferences` (
  `cstprefId` int(11) NOT NULL AUTO_INCREMENT,
  `sfamId` int(11) NOT NULL,
  `cliId` int(11) NOT NULL,
  PRIMARY KEY (`cstprefId`),
  KEY `sfamId` (`sfamId`),
  KEY `cliId` (`cliId`),
  CONSTRAINT `cliId` FOREIGN KEY (`cliId`) REFERENCES `admcustomers` (`cliId`),
  CONSTRAINT `sfamId` FOREIGN KEY (`sfamId`) REFERENCES `confsubfamily` (`sfamId`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO admcustomerpreferences VALUES("25","1","1");
INSERT INTO admcustomerpreferences VALUES("26","2","1");
INSERT INTO admcustomerpreferences VALUES("27","3","1");
INSERT INTO admcustomerpreferences VALUES("28","4","1");
INSERT INTO admcustomerpreferences VALUES("80","1","9");
INSERT INTO admcustomerpreferences VALUES("81","1","3");
INSERT INTO admcustomerpreferences VALUES("82","2","3");
INSERT INTO admcustomerpreferences VALUES("83","3","3");
INSERT INTO admcustomerpreferences VALUES("84","4","3");
INSERT INTO admcustomerpreferences VALUES("85","3","4");
INSERT INTO admcustomerpreferences VALUES("86","4","4");
INSERT INTO admcustomerpreferences VALUES("87","1","5");
INSERT INTO admcustomerpreferences VALUES("88","2","5");
INSERT INTO admcustomerpreferences VALUES("89","3","5");
INSERT INTO admcustomerpreferences VALUES("90","4","5");
INSERT INTO admcustomerpreferences VALUES("91","1","6");
INSERT INTO admcustomerpreferences VALUES("92","2","6");
INSERT INTO admcustomerpreferences VALUES("93","1","11");
INSERT INTO admcustomerpreferences VALUES("94","2","11");



DROP TABLE IF EXISTS admcustomers;

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
  `cliColor` varchar(7) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`cliId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO admcustomers VALUES("1","Sergio Javier","Moyano","31324200","1984-12-27","1","Justo castro 2","0264 - 4","0264 - 1","sergio.m","","1","15","#00a65a");
INSERT INTO admcustomers VALUES("3","Miguel","Pereyra","31324207","1988-12-13","2","Justo castro 4","0264 - 15555","","","","6","30","#dd4b39");
INSERT INTO admcustomers VALUES("4","Maria","Romero","31324555","1984-05-07","4","Calle las moras 123","","","","","2","30","#f39c12");
INSERT INTO admcustomers VALUES("5","Sergio","Moyano","31200000","1990-07-01","5","B Justo Castro 2","0264 - 4960000","0264 - 150000000","sergio.moyano@outlook.com.ar","5.png","1","15","#00a65a");
INSERT INTO admcustomers VALUES("6","asdasdas","asdasd","12312312","2015-09-10","6","qweqwe","123123123","123123123","","6.png","1","30","#00a65a");
INSERT INTO admcustomers VALUES("7","Pereyra","Rogelia","12345678","0000-00-00","7","","","","","7.png","1","30","#f39c12");
INSERT INTO admcustomers VALUES("9","Aron ","Jhon","11123146","2015-10-30","9","","","","","9.png","1","30","");
INSERT INTO admcustomers VALUES("10","Moya","Pepe","12244456","2015-10-30","10","","","","","10.png","1","30","#dd4b39");
INSERT INTO admcustomers VALUES("11","Claudia","Agüero","31324294","1984-12-19","11","Conjunto 2 M/F C/19","0264-123456","","","11.png","1","15","#00a65a");



DROP TABLE IF EXISTS admproducts;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO admproducts VALUES("4","1","Sabana Looney Toons","272.00","50","","","","","","AC","1");
INSERT INTO admproducts VALUES("6","45","Mantelito Blanco","200.00","50","","","","","","AC","4");
INSERT INTO admproducts VALUES("7","123","Cortina de Baño","130.00","70","7_1.png","7_2.png","7_3.png","7_4.png","","AC","1");



DROP TABLE IF EXISTS admsales;

CREATE TABLE `admsales` (
  `saleId` int(11) NOT NULL AUTO_INCREMENT,
  `cliId` int(11) DEFAULT NULL,
  `saleDate` datetime DEFAULT NULL,
  `saleEstado` varchar(2) COLLATE utf8_spanish_ci DEFAULT '',
  `usrId` int(11) DEFAULT NULL,
  PRIMARY KEY (`saleId`),
  KEY `cliId` (`cliId`),
  KEY `usrId` (`usrId`),
  CONSTRAINT `admsales_ibfk_2` FOREIGN KEY (`usrId`) REFERENCES `sisusers` (`usrId`) ON UPDATE CASCADE,
  CONSTRAINT `admsales_ibfk_1` FOREIGN KEY (`cliId`) REFERENCES `admcustomers` (`cliId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO admsales VALUES("2","10","2015-12-05 23:39:09","AC","");
INSERT INTO admsales VALUES("3","9","2015-12-05 23:42:33","AC","");
INSERT INTO admsales VALUES("4","9","2015-12-05 23:51:08","AC","");
INSERT INTO admsales VALUES("5","9","2015-12-05 23:51:50","AC","");
INSERT INTO admsales VALUES("6","3","2015-12-07 00:08:18","AC","1");
INSERT INTO admsales VALUES("7","5","2015-12-07 00:18:00","AC","1");
INSERT INTO admsales VALUES("8","3","2015-12-07 00:20:04","AC","1");
INSERT INTO admsales VALUES("9","5","2015-12-07 00:21:36","AC","1");
INSERT INTO admsales VALUES("10","10","2015-12-07 00:22:25","AC","1");
INSERT INTO admsales VALUES("11","10","2015-12-07 00:30:30","AC","1");
INSERT INTO admsales VALUES("12","10","2015-12-07 00:30:42","AC","1");
INSERT INTO admsales VALUES("13","5","2015-12-07 00:31:58","AC","1");
INSERT INTO admsales VALUES("14","9","2015-12-07 00:33:18","AC","1");
INSERT INTO admsales VALUES("15","11","2015-12-07 10:55:35","AC","1");
INSERT INTO admsales VALUES("16","11","2015-12-07 11:00:45","AC","1");



DROP TABLE IF EXISTS admsalesdetail;

CREATE TABLE `admsalesdetail` (
  `saleDetId` int(11) NOT NULL AUTO_INCREMENT,
  `saleId` int(11) NOT NULL,
  `prodId` int(11) NOT NULL,
  `prodPrice` decimal(14,2) NOT NULL,
  `prodDescription` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `prodCant` int(11) NOT NULL,
  PRIMARY KEY (`saleDetId`),
  KEY `saleId` (`saleId`),
  KEY `prodId` (`prodId`),
  CONSTRAINT `admsalesdetail_ibfk_1` FOREIGN KEY (`saleId`) REFERENCES `admsales` (`saleId`) ON UPDATE NO ACTION,
  CONSTRAINT `admsalesdetail_ibfk_2` FOREIGN KEY (`prodId`) REFERENCES `admproducts` (`prodId`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO admsalesdetail VALUES("1","4","7","221.00","123 - Cortina de Baño","1");
INSERT INTO admsalesdetail VALUES("2","4","6","300.00","45 - Mantelito Blanco","3");
INSERT INTO admsalesdetail VALUES("3","5","7","221.00","123 - Cortina de Baño","1");
INSERT INTO admsalesdetail VALUES("4","5","6","300.00","45 - Mantelito Blanco","3");
INSERT INTO admsalesdetail VALUES("5","6","7","221.00","123 - Cortina de Baño","1");
INSERT INTO admsalesdetail VALUES("6","6","6","300.00","45 - Mantelito Blanco","3");
INSERT INTO admsalesdetail VALUES("7","7","4","408.00","1 - Sabana Looney Toons","5");
INSERT INTO admsalesdetail VALUES("8","8","7","221.00","123 - Cortina de Baño","4");
INSERT INTO admsalesdetail VALUES("9","9","7","221.00","123 - Cortina de Baño","2");
INSERT INTO admsalesdetail VALUES("10","10","4","408.00","1 - Sabana Looney Toons","2");
INSERT INTO admsalesdetail VALUES("11","11","7","221.00","123 - Cortina de Baño","1");
INSERT INTO admsalesdetail VALUES("12","12","7","221.00","123 - Cortina de Baño","1");
INSERT INTO admsalesdetail VALUES("13","13","7","221.00","123 - Cortina de Baño","2");
INSERT INTO admsalesdetail VALUES("14","14","7","221.00","123 - Cortina de Baño","5");
INSERT INTO admsalesdetail VALUES("15","15","7","221.00","123 - Cortina de Baño","1");
INSERT INTO admsalesdetail VALUES("16","16","6","300.00","45 - Mantelito Blanco","1");



DROP TABLE IF EXISTS admstock;

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO admstock VALUES("1","4","10","1","2015-09-04 17:00:44","Compra mes agosto");
INSERT INTO admstock VALUES("2","6","-20","4","2015-09-04 17:18:23","Extravio en terminal");
INSERT INTO admstock VALUES("3","6","-10","5","2015-09-18 17:39:09","hhh");
INSERT INTO admstock VALUES("4","4","12","1","2015-09-16 17:06:08","");
INSERT INTO admstock VALUES("5","4","12","1","2015-09-24 17:06:12","me faltaron bajarlos de la camioneta");
INSERT INTO admstock VALUES("6","4","-7","1","2015-09-04 17:06:16","nose porque, pero conte mal");
INSERT INTO admstock VALUES("7","4","-7","1","2015-09-11 20:48:26","nose porque, pero conte mal");
INSERT INTO admstock VALUES("8","6","20","1","2015-09-30 22:17:39","conteo inicial");
INSERT INTO admstock VALUES("9","6","-2","1","2015-09-30 22:18:13","estan rotos");
INSERT INTO admstock VALUES("10","7","-1","1","2015-12-07 00:08:18","Venta");
INSERT INTO admstock VALUES("11","6","-3","1","2015-12-07 00:08:18","Venta");
INSERT INTO admstock VALUES("12","4","-5","1","2015-12-07 00:18:00","Venta");
INSERT INTO admstock VALUES("13","7","-4","1","2015-12-07 00:20:05","Venta");
INSERT INTO admstock VALUES("14","7","-2","1","2015-12-07 00:21:36","Venta");
INSERT INTO admstock VALUES("15","4","-2","1","2015-12-07 00:22:25","Venta");
INSERT INTO admstock VALUES("16","7","-1","1","2015-12-07 00:30:30","Venta");
INSERT INTO admstock VALUES("17","7","-1","1","2015-12-07 00:30:42","Venta");
INSERT INTO admstock VALUES("18","7","-2","1","2015-12-07 00:31:58","Venta");
INSERT INTO admstock VALUES("19","7","-5","1","2015-12-07 00:33:18","Venta");
INSERT INTO admstock VALUES("20","7","-1","1","2015-12-07 10:55:35","Venta");
INSERT INTO admstock VALUES("21","6","-1","1","2015-12-07 11:00:45","Venta");



DROP TABLE IF EXISTS admvisits;

CREATE TABLE `admvisits` (
  `vstId` int(11) NOT NULL AUTO_INCREMENT,
  `vstDate` datetime NOT NULL,
  `cliId` int(11) NOT NULL,
  `vstNote` text COLLATE utf8_spanish_ci NOT NULL,
  `vstStatus` varchar(2) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`vstId`),
  KEY `cliId` (`cliId`),
  CONSTRAINT `admvisits_ibfk_1` FOREIGN KEY (`cliId`) REFERENCES `admcustomers` (`cliId`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO admvisits VALUES("1","2015-09-01 18:00:00","1","Se tiene que ir si o si","PN");
INSERT INTO admvisits VALUES("2","2015-09-04 12:30:00","3","Sin falta, viaja el lunes","PN");
INSERT INTO admvisits VALUES("3","2015-09-15 20:00:00","4","No hay problema si no voy","PN");
INSERT INTO admvisits VALUES("4","2015-09-19 13:00:00","5","Cuando llega el marido de trabajar","PN");
INSERT INTO admvisits VALUES("5","2015-09-19 14:30:00","6","Despues de que el marido se va al trabajo","PN");
INSERT INTO admvisits VALUES("6","2015-09-01 18:00:00","6","Repetido","PN");
INSERT INTO admvisits VALUES("7","2015-10-09 10:00:00","4","Otro mas","VS");
INSERT INTO admvisits VALUES("8","2015-10-16 12:00:00","9","","VS");
INSERT INTO admvisits VALUES("9","2015-10-17 12:15:00","10","","VS");
INSERT INTO admvisits VALUES("10","2015-10-20 22:00:00","4","","VS");
INSERT INTO admvisits VALUES("11","2015-10-31 08:00:00","1","","VS");
INSERT INTO admvisits VALUES("12","2015-10-17 08:00:00","3","","VS");
INSERT INTO admvisits VALUES("13","2015-10-17 09:00:00","1","","VS");
INSERT INTO admvisits VALUES("14","2015-10-17 10:00:00","4","","VS");
INSERT INTO admvisits VALUES("15","2015-10-17 11:00:00","7","","VS");
INSERT INTO admvisits VALUES("16","2015-10-17 16:30:00","9","Tengo que ir si  o si porque la esposa tiene que viajar el lunes","VS");
INSERT INTO admvisits VALUES("17","2015-10-17 08:00:00","5","ko","VS");
INSERT INTO admvisits VALUES("18","2015-10-30 10:00:00","5","ir urgente","VS");
INSERT INTO admvisits VALUES("19","2015-10-31 10:00:00","10","","VS");
INSERT INTO admvisits VALUES("20","2015-10-30 12:45:00","9","Ok","VS");
INSERT INTO admvisits VALUES("21","2015-10-27 13:00:00","5","test","VS");
INSERT INTO admvisits VALUES("22","2015-10-27 15:00:00","5","test","VS");
INSERT INTO admvisits VALUES("23","2015-10-28 10:30:00","5","El que vive frente al sergio","VS");
INSERT INTO admvisits VALUES("24","2015-10-28 10:00:00","4","","VS");
INSERT INTO admvisits VALUES("25","2015-10-28 15:00:00","10","","VS");
INSERT INTO admvisits VALUES("26","2015-10-28 20:00:00","5","","VS");
INSERT INTO admvisits VALUES("27","2015-10-30 15:30:00","4","","VS");
INSERT INTO admvisits VALUES("28","2015-10-28 13:30:00","10","","VS");
INSERT INTO admvisits VALUES("29","2015-10-31 10:00:00","6","pago\n","PN");
INSERT INTO admvisits VALUES("30","2015-10-29 10:00:00","1","Hola ","PN");
INSERT INTO admvisits VALUES("31","2015-10-28 08:00:00","3","dadasdasd","VS");
INSERT INTO admvisits VALUES("32","2015-10-28 15:00:00","4","asdasdasd","VS");
INSERT INTO admvisits VALUES("33","2015-10-28 10:00:00","1","asdasdad","VS");
INSERT INTO admvisits VALUES("34","2015-11-20 12:00:00","10","le hacen falta cortinas ","PN");
INSERT INTO admvisits VALUES("35","2016-02-26 13:00:00","1","Estaban haciendo un comedor ","PN");
INSERT INTO admvisits VALUES("36","2015-11-27 15:00:00","4","","VS");
INSERT INTO admvisits VALUES("37","2015-11-29 15:30:00","4","","VS");
INSERT INTO admvisits VALUES("38","2015-11-05 08:00:00","4","quiere una sabana roja ","VS");
INSERT INTO admvisits VALUES("39","2015-11-03 08:00:00","9","adasdas","VS");
INSERT INTO admvisits VALUES("40","2015-11-03 08:00:00","1","sdf","VS");
INSERT INTO admvisits VALUES("41","2015-11-03 08:00:00","5","prueba","VS");
INSERT INTO admvisits VALUES("42","2015-11-03 09:00:00","3","otro mas ","VS");
INSERT INTO admvisits VALUES("43","2015-11-18 08:00:00","5","pago 700","VS");
INSERT INTO admvisits VALUES("44","2015-12-03 09:00:00","3","descuento 100","PN");
INSERT INTO admvisits VALUES("45","2015-11-18 09:00:00","9","werre","VS");
INSERT INTO admvisits VALUES("46","2015-12-03 08:00:00","5","pago 100 / se mueve para el 2 a las 12\nse volvio al 3","VS");
INSERT INTO admvisits VALUES("47","2015-12-18 09:00:00","9","pago 14","PN");
INSERT INTO admvisits VALUES("48","2015-12-18 08:00:00","5","pago 100 mas","PN");
INSERT INTO admvisits VALUES("49","2015-11-12 13:00:00","4","llevar cubre mantel","VS");
INSERT INTO admvisits VALUES("50","2015-11-10 08:00:00","10","a las 9 pero para el 6","PN");
INSERT INTO admvisits VALUES("51","2015-12-12 13:00:00","4","acascac","VS");
INSERT INTO admvisits VALUES("52","2015-11-04 08:00:00","4","dgdf","VS");
INSERT INTO admvisits VALUES("53","2015-12-04 08:00:00","4","asdasd","VS");
INSERT INTO admvisits VALUES("54","2016-01-03 08:00:00","4","sfsdffd","PN");
INSERT INTO admvisits VALUES("55","2015-11-04 08:00:00","4","","VS");
INSERT INTO admvisits VALUES("56","2015-12-04 08:00:00","4","","PN");
INSERT INTO admvisits VALUES("57","2015-12-05 08:00:00","4","","PN");
INSERT INTO admvisits VALUES("58","2015-12-21 10:30:00","11","El 21 a las 10: 30 que vuelva, entrega 21 debe 200","PN");
INSERT INTO admvisits VALUES("59","2015-12-22 08:00:00","11","debería deberme 500","PN");



DROP TABLE IF EXISTS conffamily;

CREATE TABLE `conffamily` (
  `famId` int(11) NOT NULL AUTO_INCREMENT,
  `famName` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`famId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO conffamily VALUES("1","Cocina");
INSERT INTO conffamily VALUES("3","Comedor");
INSERT INTO conffamily VALUES("4","Habitación");



DROP TABLE IF EXISTS confsubfamily;

CREATE TABLE `confsubfamily` (
  `sfamId` int(11) NOT NULL AUTO_INCREMENT,
  `sfamName` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `famId` int(11) DEFAULT NULL,
  PRIMARY KEY (`sfamId`),
  KEY `famId` (`famId`),
  CONSTRAINT `famId` FOREIGN KEY (`famId`) REFERENCES `conffamily` (`famId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO confsubfamily VALUES("1","Cortina ","1");
INSERT INTO confsubfamily VALUES("2","Mantel cuadrado","1");
INSERT INTO confsubfamily VALUES("3","Cortina Grande","3");
INSERT INTO confsubfamily VALUES("4","Mantel redondo","3");
INSERT INTO confsubfamily VALUES("5","","");
INSERT INTO confsubfamily VALUES("6","Alfombra","4");
INSERT INTO confsubfamily VALUES("7","Almohadas","4");



DROP TABLE IF EXISTS confzone;

CREATE TABLE `confzone` (
  `zonaId` int(11) NOT NULL AUTO_INCREMENT,
  `zonaName` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`zonaId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO confzone VALUES("1","Justo Castro 2");
INSERT INTO confzone VALUES("2","Villa Independencia");
INSERT INTO confzone VALUES("4","Felipe Cobas");
INSERT INTO confzone VALUES("5","Los Olivos");
INSERT INTO confzone VALUES("6","Justo Castro 4");
INSERT INTO confzone VALUES("7","Barrio Area 2");
INSERT INTO confzone VALUES("8","Barrio Los Olivos");
INSERT INTO confzone VALUES("9","Villa dolores (ir de mañana)");



DROP TABLE IF EXISTS sisactions;

CREATE TABLE `sisactions` (
  `actId` int(11) NOT NULL AUTO_INCREMENT,
  `actDescription` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `actDescriptionSpanish` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`actId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO sisactions VALUES("1","Add","Agregar");
INSERT INTO sisactions VALUES("2","Edit","Editar");
INSERT INTO sisactions VALUES("3","Del","Eliminar");
INSERT INTO sisactions VALUES("4","View","Consultar");
INSERT INTO sisactions VALUES("5","Imprimir","Imprimir");
INSERT INTO sisactions VALUES("6","Saldo","Consultar Saldo");



DROP TABLE IF EXISTS sisgroups;

CREATE TABLE `sisgroups` (
  `grpId` int(11) NOT NULL AUTO_INCREMENT,
  `grpName` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`grpId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO sisgroups VALUES("1","Administrador");
INSERT INTO sisgroups VALUES("2","Vendedor");
INSERT INTO sisgroups VALUES("3","Depósito");



DROP TABLE IF EXISTS sisgroupsactions;

CREATE TABLE `sisgroupsactions` (
  `grpactId` int(11) NOT NULL AUTO_INCREMENT,
  `grpId` int(11) NOT NULL,
  `menuAccId` int(11) NOT NULL,
  PRIMARY KEY (`grpactId`),
  KEY `grpId` (`grpId`),
  KEY `menuAccId` (`menuAccId`),
  CONSTRAINT `grpId` FOREIGN KEY (`grpId`) REFERENCES `sisgroups` (`grpId`) ON UPDATE CASCADE,
  CONSTRAINT `menuAccId` FOREIGN KEY (`menuAccId`) REFERENCES `sismenuactions` (`menuAccId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=594 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO sisgroupsactions VALUES("125","2","1");
INSERT INTO sisgroupsactions VALUES("126","2","4");
INSERT INTO sisgroupsactions VALUES("127","2","8");
INSERT INTO sisgroupsactions VALUES("128","2","13");
INSERT INTO sisgroupsactions VALUES("129","2","25");
INSERT INTO sisgroupsactions VALUES("130","2","28");
INSERT INTO sisgroupsactions VALUES("484","3","9");
INSERT INTO sisgroupsactions VALUES("485","3","12");
INSERT INTO sisgroupsactions VALUES("557","1","1");
INSERT INTO sisgroupsactions VALUES("558","1","2");
INSERT INTO sisgroupsactions VALUES("559","1","3");
INSERT INTO sisgroupsactions VALUES("560","1","4");
INSERT INTO sisgroupsactions VALUES("561","1","5");
INSERT INTO sisgroupsactions VALUES("562","1","6");
INSERT INTO sisgroupsactions VALUES("563","1","7");
INSERT INTO sisgroupsactions VALUES("564","1","8");
INSERT INTO sisgroupsactions VALUES("565","1","9");
INSERT INTO sisgroupsactions VALUES("566","1","12");
INSERT INTO sisgroupsactions VALUES("567","1","13");
INSERT INTO sisgroupsactions VALUES("568","1","37");
INSERT INTO sisgroupsactions VALUES("569","1","38");
INSERT INTO sisgroupsactions VALUES("570","1","14");
INSERT INTO sisgroupsactions VALUES("571","1","15");
INSERT INTO sisgroupsactions VALUES("572","1","16");
INSERT INTO sisgroupsactions VALUES("573","1","17");
INSERT INTO sisgroupsactions VALUES("574","1","18");
INSERT INTO sisgroupsactions VALUES("575","1","19");
INSERT INTO sisgroupsactions VALUES("576","1","20");
INSERT INTO sisgroupsactions VALUES("577","1","21");
INSERT INTO sisgroupsactions VALUES("578","1","22");
INSERT INTO sisgroupsactions VALUES("579","1","23");
INSERT INTO sisgroupsactions VALUES("580","1","24");
INSERT INTO sisgroupsactions VALUES("581","1","25");
INSERT INTO sisgroupsactions VALUES("582","1","26");
INSERT INTO sisgroupsactions VALUES("583","1","27");
INSERT INTO sisgroupsactions VALUES("584","1","28");
INSERT INTO sisgroupsactions VALUES("585","1","29");
INSERT INTO sisgroupsactions VALUES("586","1","30");
INSERT INTO sisgroupsactions VALUES("587","1","31");
INSERT INTO sisgroupsactions VALUES("588","1","32");
INSERT INTO sisgroupsactions VALUES("589","1","33");
INSERT INTO sisgroupsactions VALUES("590","1","34");
INSERT INTO sisgroupsactions VALUES("591","1","35");
INSERT INTO sisgroupsactions VALUES("592","1","36");
INSERT INTO sisgroupsactions VALUES("593","1","39");



DROP TABLE IF EXISTS sismenu;

CREATE TABLE `sismenu` (
  `menuId` int(11) NOT NULL AUTO_INCREMENT,
  `menuName` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `menuIcon` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `menuController` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `menuView` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `menuFather` int(11) DEFAULT NULL,
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO sismenu VALUES("1","Clientes","fa fa-users","customer","index","");
INSERT INTO sismenu VALUES("2","Artículos","fa fa-leanpub","article","index","");
INSERT INTO sismenu VALUES("3","Stock","fa fa-home","stock","index","");
INSERT INTO sismenu VALUES("4","Cuenta_Corriente","fa fa-money","cash","index","");
INSERT INTO sismenu VALUES("5","Reportes","fa fa-file-picture-o","","","");
INSERT INTO sismenu VALUES("6","Ingresos","","report","in","5");
INSERT INTO sismenu VALUES("7","Saldos","","report","sl","5");
INSERT INTO sismenu VALUES("8","Ventas","","report","vt","5");
INSERT INTO sismenu VALUES("9","Seguridad","fa fa-key","","","");
INSERT INTO sismenu VALUES("10","Usuarios","","user","index","9");
INSERT INTO sismenu VALUES("11","Grupos","","group","index","9");
INSERT INTO sismenu VALUES("12","Administración","fa fa-fw fa-cogs","","","");
INSERT INTO sismenu VALUES("13","Zonas","","zone","index","12");
INSERT INTO sismenu VALUES("14","Familias","","family","index","12");
INSERT INTO sismenu VALUES("15","Sub-Familias","","family","indexSF","12");
INSERT INTO sismenu VALUES("16","BackUp","fa fa-fw fa-database","backup","index","");



DROP TABLE IF EXISTS sismenuactions;

CREATE TABLE `sismenuactions` (
  `menuAccId` int(11) NOT NULL AUTO_INCREMENT,
  `menuId` int(11) NOT NULL,
  `actId` int(11) DEFAULT NULL,
  PRIMARY KEY (`menuAccId`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO sismenuactions VALUES("1","1","1");
INSERT INTO sismenuactions VALUES("2","1","2");
INSERT INTO sismenuactions VALUES("3","1","3");
INSERT INTO sismenuactions VALUES("4","1","4");
INSERT INTO sismenuactions VALUES("5","2","1");
INSERT INTO sismenuactions VALUES("6","2","2");
INSERT INTO sismenuactions VALUES("7","2","3");
INSERT INTO sismenuactions VALUES("8","2","4");
INSERT INTO sismenuactions VALUES("9","3","1");
INSERT INTO sismenuactions VALUES("12","3","4");
INSERT INTO sismenuactions VALUES("13","4","1");
INSERT INTO sismenuactions VALUES("14","6","5");
INSERT INTO sismenuactions VALUES("15","7","5");
INSERT INTO sismenuactions VALUES("16","8","5");
INSERT INTO sismenuactions VALUES("17","10","1");
INSERT INTO sismenuactions VALUES("18","10","2");
INSERT INTO sismenuactions VALUES("19","10","3");
INSERT INTO sismenuactions VALUES("20","10","4");
INSERT INTO sismenuactions VALUES("21","11","1");
INSERT INTO sismenuactions VALUES("22","11","2");
INSERT INTO sismenuactions VALUES("23","11","3");
INSERT INTO sismenuactions VALUES("24","11","4");
INSERT INTO sismenuactions VALUES("25","13","1");
INSERT INTO sismenuactions VALUES("26","13","2");
INSERT INTO sismenuactions VALUES("27","13","3");
INSERT INTO sismenuactions VALUES("28","13","4");
INSERT INTO sismenuactions VALUES("29","14","1");
INSERT INTO sismenuactions VALUES("30","14","2");
INSERT INTO sismenuactions VALUES("31","14","3");
INSERT INTO sismenuactions VALUES("32","14","4");
INSERT INTO sismenuactions VALUES("33","15","1");
INSERT INTO sismenuactions VALUES("34","15","2");
INSERT INTO sismenuactions VALUES("35","15","3");
INSERT INTO sismenuactions VALUES("36","15","4");
INSERT INTO sismenuactions VALUES("37","4","4");
INSERT INTO sismenuactions VALUES("38","4","6");
INSERT INTO sismenuactions VALUES("39","16","1");



DROP TABLE IF EXISTS sisusers;

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

INSERT INTO sisusers VALUES("1","admin","Administrador"," ","0","e10adc3949ba59abbe56e057f20f883e","1");
INSERT INTO sisusers VALUES("4","leo","Leonardo","Balmaceda","0","e10adc3949ba59abbe56e057f20f883e","2");
INSERT INTO sisusers VALUES("5","ana","Analía","Perez","15","e10adc3949ba59abbe56e057f20f883e","2");



