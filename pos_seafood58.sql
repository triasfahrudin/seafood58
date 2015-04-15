--  MySQL Database Dump 1.1
--  Host: localhost    Database: pos_seafood58
--  Server version 5.4.2-beta-community
--
--  Dump database pos_seafood58 on 28-07-2010 5:20:45 PM
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ pos_seafood58;
USE pos_seafood58;

--
--  Table structure for table "data_jenismenu"
--
DROP TABLE IF EXISTS data_jenismenu;

CREATE TABLE `data_jenismenu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) DEFAULT NULL,
  `warna` varchar(20) DEFAULT '$00566A22',
  `sort` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='1->makanan,2->minuman,3->lain';

--
--  Table data for table "data_jenismenu". Record count - 3 
--
LOCK TABLES data_jenismenu WRITE;

INSERT INTO data_jenismenu VALUES (1,'Makanan','$00566A22',0);
INSERT INTO data_jenismenu VALUES (2,'Minuman','$00FF3300',0);
INSERT INTO data_jenismenu VALUES (3,'Lain-Lain','$0099CCFF',0);


UNLOCK TABLES;

--
--  Table structure for table "data_login"
--
DROP TABLE IF EXISTS data_login;

CREATE TABLE `data_login` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_pegawai` int(10) DEFAULT NULL,
  `login` datetime DEFAULT NULL,
  `logout` datetime DEFAULT NULL,
  `keterangan` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;

--
--  Table data for table "data_login". Record count - 95 
--
LOCK TABLES data_login WRITE;

INSERT INTO data_login VALUES (1,1,'2010-07-27 00:58:47',NULL,NULL);
INSERT INTO data_login VALUES (2,1,NULL,'2010-07-27 00:59:13',NULL);
INSERT INTO data_login VALUES (3,3,'2010-07-27 00:59:35',NULL,NULL);
INSERT INTO data_login VALUES (4,3,NULL,'2010-07-27 00:59:37',NULL);
INSERT INTO data_login VALUES (5,1,'2010-07-27 00:59:44',NULL,NULL);
INSERT INTO data_login VALUES (6,1,NULL,'2010-07-27 01:00:17',NULL);
INSERT INTO data_login VALUES (7,1,'2010-07-27 01:05:42',NULL,NULL);
INSERT INTO data_login VALUES (8,1,NULL,'2010-07-27 01:06:26',NULL);
INSERT INTO data_login VALUES (9,1,'2010-07-27 01:10:51',NULL,NULL);
INSERT INTO data_login VALUES (10,1,NULL,'2010-07-27 01:11:31',NULL);
INSERT INTO data_login VALUES (11,1,'2010-07-27 01:11:38',NULL,NULL);
INSERT INTO data_login VALUES (12,1,NULL,'2010-07-27 01:11:46',NULL);
INSERT INTO data_login VALUES (13,1,'2010-07-27 01:34:01',NULL,NULL);
INSERT INTO data_login VALUES (14,1,NULL,'2010-07-27 01:34:41',NULL);
INSERT INTO data_login VALUES (15,1,'2010-07-27 01:35:38',NULL,NULL);
INSERT INTO data_login VALUES (16,1,NULL,'2010-07-27 01:36:01',NULL);
INSERT INTO data_login VALUES (17,1,'2010-07-27 01:36:06',NULL,NULL);
INSERT INTO data_login VALUES (18,1,NULL,'2010-07-27 01:36:46',NULL);
INSERT INTO data_login VALUES (19,1,'2010-07-27 01:37:09',NULL,NULL);
INSERT INTO data_login VALUES (20,1,NULL,'2010-07-27 01:37:19',NULL);
INSERT INTO data_login VALUES (21,1,'2010-07-27 01:38:18',NULL,NULL);
INSERT INTO data_login VALUES (22,1,NULL,'2010-07-27 01:38:34',NULL);
INSERT INTO data_login VALUES (23,1,'2010-07-27 01:38:51',NULL,NULL);
INSERT INTO data_login VALUES (24,1,NULL,'2010-07-27 01:38:53',NULL);
INSERT INTO data_login VALUES (25,1,'2010-07-27 01:41:57',NULL,NULL);
INSERT INTO data_login VALUES (26,1,NULL,'2010-07-27 01:41:59',NULL);
INSERT INTO data_login VALUES (27,1,'2010-07-27 01:46:17',NULL,NULL);
INSERT INTO data_login VALUES (28,1,'2010-07-27 01:48:07',NULL,NULL);
INSERT INTO data_login VALUES (29,1,'2010-07-27 01:52:42',NULL,NULL);
INSERT INTO data_login VALUES (30,1,NULL,'2010-07-27 01:53:19',NULL);
INSERT INTO data_login VALUES (31,1,'2010-07-27 02:00:47',NULL,NULL);
INSERT INTO data_login VALUES (32,1,NULL,'2010-07-27 02:00:55',NULL);
INSERT INTO data_login VALUES (33,1,'2010-07-27 02:01:42',NULL,NULL);
INSERT INTO data_login VALUES (34,1,NULL,'2010-07-27 02:02:34',NULL);
INSERT INTO data_login VALUES (35,1,'2010-07-27 02:06:34',NULL,NULL);
INSERT INTO data_login VALUES (36,1,NULL,'2010-07-27 02:06:56',NULL);
INSERT INTO data_login VALUES (37,1,'2010-07-27 02:07:30',NULL,NULL);
INSERT INTO data_login VALUES (38,1,NULL,'2010-07-27 02:08:19',NULL);
INSERT INTO data_login VALUES (39,1,'2010-07-27 02:08:37',NULL,NULL);
INSERT INTO data_login VALUES (40,1,NULL,'2010-07-27 02:08:57',NULL);
INSERT INTO data_login VALUES (41,1,'2010-07-27 02:10:05',NULL,NULL);
INSERT INTO data_login VALUES (42,1,NULL,'2010-07-27 02:10:51',NULL);
INSERT INTO data_login VALUES (43,1,'2010-07-27 02:12:37',NULL,NULL);
INSERT INTO data_login VALUES (44,1,NULL,'2010-07-27 02:12:46',NULL);
INSERT INTO data_login VALUES (45,1,'2010-07-27 02:13:31',NULL,NULL);
INSERT INTO data_login VALUES (46,1,NULL,'2010-07-27 02:13:39',NULL);
INSERT INTO data_login VALUES (47,1,'2010-07-27 02:15:13',NULL,NULL);
INSERT INTO data_login VALUES (48,1,NULL,'2010-07-27 02:16:38',NULL);
INSERT INTO data_login VALUES (49,1,'2010-07-27 02:19:38',NULL,NULL);
INSERT INTO data_login VALUES (50,1,NULL,'2010-07-27 02:20:52',NULL);
INSERT INTO data_login VALUES (51,1,'2010-07-27 22:37:26',NULL,NULL);
INSERT INTO data_login VALUES (52,1,NULL,'2010-07-27 22:42:51',NULL);
INSERT INTO data_login VALUES (53,1,'2010-07-27 22:50:48',NULL,NULL);
INSERT INTO data_login VALUES (54,1,NULL,'2010-07-27 23:00:23',NULL);
INSERT INTO data_login VALUES (55,1,'2010-07-27 23:09:38',NULL,NULL);
INSERT INTO data_login VALUES (56,1,NULL,'2010-07-27 23:10:17',NULL);
INSERT INTO data_login VALUES (57,1,'2010-07-27 23:12:05',NULL,NULL);
INSERT INTO data_login VALUES (58,1,NULL,'2010-07-27 23:12:38',NULL);
INSERT INTO data_login VALUES (59,1,'2010-07-27 23:12:47',NULL,NULL);
INSERT INTO data_login VALUES (60,1,NULL,'2010-07-27 23:13:48',NULL);
INSERT INTO data_login VALUES (61,1,'2010-07-27 23:30:39',NULL,NULL);
INSERT INTO data_login VALUES (62,1,NULL,'2010-07-27 23:30:56',NULL);
INSERT INTO data_login VALUES (63,1,'2010-07-27 23:31:52',NULL,NULL);
INSERT INTO data_login VALUES (64,1,'2010-07-27 23:41:41',NULL,NULL);
INSERT INTO data_login VALUES (65,1,NULL,'2010-07-27 23:42:33',NULL);
INSERT INTO data_login VALUES (66,3,'2010-07-27 23:53:17',NULL,NULL);
INSERT INTO data_login VALUES (67,3,NULL,'2010-07-27 23:53:19',NULL);
INSERT INTO data_login VALUES (68,1,'2010-07-28 00:00:54',NULL,NULL);
INSERT INTO data_login VALUES (69,1,NULL,'2010-07-28 00:01:27',NULL);
INSERT INTO data_login VALUES (70,1,'2010-07-28 00:54:42',NULL,NULL);
INSERT INTO data_login VALUES (71,1,NULL,'2010-07-28 00:55:12',NULL);
INSERT INTO data_login VALUES (72,1,'2010-07-28 00:56:59',NULL,NULL);
INSERT INTO data_login VALUES (73,1,NULL,'2010-07-28 00:57:16',NULL);
INSERT INTO data_login VALUES (74,1,'2010-07-28 00:58:52',NULL,NULL);
INSERT INTO data_login VALUES (75,1,NULL,'2010-07-28 00:59:48',NULL);
INSERT INTO data_login VALUES (76,1,'2010-07-28 01:00:04',NULL,NULL);
INSERT INTO data_login VALUES (77,1,NULL,'2010-07-28 01:01:29',NULL);
INSERT INTO data_login VALUES (78,1,'2010-07-28 01:02:06',NULL,NULL);
INSERT INTO data_login VALUES (79,1,NULL,'2010-07-28 01:02:34',NULL);
INSERT INTO data_login VALUES (80,1,'2010-07-28 01:03:34',NULL,NULL);
INSERT INTO data_login VALUES (81,1,NULL,'2010-07-28 01:04:09',NULL);
INSERT INTO data_login VALUES (82,1,'2010-07-28 01:04:33',NULL,NULL);
INSERT INTO data_login VALUES (83,1,NULL,'2010-07-28 01:04:50',NULL);
INSERT INTO data_login VALUES (84,1,'2010-07-28 01:13:40',NULL,NULL);
INSERT INTO data_login VALUES (85,1,NULL,'2010-07-28 01:14:24',NULL);
INSERT INTO data_login VALUES (86,1,'2010-07-28 16:59:55',NULL,NULL);
INSERT INTO data_login VALUES (87,1,NULL,'2010-07-28 17:00:04',NULL);
INSERT INTO data_login VALUES (88,1,'2010-07-28 17:00:26',NULL,NULL);
INSERT INTO data_login VALUES (89,1,NULL,'2010-07-28 17:09:11',NULL);
INSERT INTO data_login VALUES (90,1,'2010-07-28 17:11:04',NULL,NULL);
INSERT INTO data_login VALUES (91,1,NULL,'2010-07-28 17:13:17',NULL);
INSERT INTO data_login VALUES (92,1,'2010-07-28 17:13:55',NULL,NULL);
INSERT INTO data_login VALUES (93,1,'2010-07-28 17:19:53',NULL,NULL);
INSERT INTO data_login VALUES (94,1,NULL,'2010-07-28 17:20:19',NULL);
INSERT INTO data_login VALUES (95,1,'2010-07-28 17:20:41',NULL,NULL);


UNLOCK TABLES;

--
--  Table structure for table "data_meja"
--
DROP TABLE IF EXISTS data_meja;

CREATE TABLE `data_meja` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Nama` varchar(100) DEFAULT NULL,
  `sort` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
--  Table data for table "data_meja". Record count - 3 
--
LOCK TABLES data_meja WRITE;

INSERT INTO data_meja VALUES (1,'MEJA REMANG-REMANG',1);
INSERT INTO data_meja VALUES (2,'MEJA RAJA',2);
INSERT INTO data_meja VALUES (3,'MEJA AKU',3);


UNLOCK TABLES;

--
--  Table structure for table "data_menus"
--
DROP TABLE IF EXISTS data_menus;

CREATE TABLE `data_menus` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(20) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `id_jenismenu` int(10) DEFAULT NULL,
  `id_subjenismenu` int(10) DEFAULT NULL,
  `id_satuan` int(10) DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `isNewLineAfter` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

--
--  Table data for table "data_menus". Record count - 45 
--
LOCK TABLES data_menus WRITE;

INSERT INTO data_menus VALUES (1,NULL,'REBUS',1,2,1,40000,NULL,NULL);
INSERT INTO data_menus VALUES (2,NULL,'GORENG MENTEGA/TEPUNG',1,2,1,40000,NULL,NULL);
INSERT INTO data_menus VALUES (3,NULL,'GORENG SAUS TIRAM',1,2,1,0,NULL,NULL);
INSERT INTO data_menus VALUES (4,NULL,'GORENG SAUS PADANG',1,2,1,0,NULL,1);
INSERT INTO data_menus VALUES (5,NULL,'BAKAR',1,3,1,0,NULL,NULL);
INSERT INTO data_menus VALUES (6,NULL,'GORENG MENTEGA/TEPUNG',1,3,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (7,NULL,'GORENG SAUS TIRAM',1,3,0,0,NULL,NULL);
INSERT INTO data_menus VALUES (8,NULL,'GORENG SAUS PADANG',1,3,NULL,NULL,NULL,1);
INSERT INTO data_menus VALUES (9,NULL,'REBUS',1,4,0,0,NULL,NULL);
INSERT INTO data_menus VALUES (10,NULL,'BAKAR',1,4,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (11,NULL,'GORENG MENTEGA/TEPUNG',1,4,0,0,NULL,NULL);
INSERT INTO data_menus VALUES (12,NULL,'GORENG SAUS TIRAM',1,4,0,0,NULL,NULL);
INSERT INTO data_menus VALUES (13,NULL,'GORENG ASEM MANIS',1,4,0,0,NULL,1);
INSERT INTO data_menus VALUES (14,NULL,'BAKAR',1,5,0,0,NULL,NULL);
INSERT INTO data_menus VALUES (15,NULL,'GORENG MENTEGA/KERING',1,5,0,0,NULL,NULL);
INSERT INTO data_menus VALUES (16,NULL,'GORENG SAUS TIRAM',1,5,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (17,NULL,'GORENG SAUS PADANG',1,5,0,0,NULL,1);
INSERT INTO data_menus VALUES (18,NULL,'AYAM BAKAR/GORENG',1,7,0,0,NULL,NULL);
INSERT INTO data_menus VALUES (19,NULL,'LELE',1,7,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (20,NULL,'BEBEK',1,7,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (21,NULL,'BURUNG PUYUH',1,7,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (22,NULL,'TEMPE/TAHU',1,7,NULL,NULL,NULL,1);
INSERT INTO data_menus VALUES (23,NULL,'KERANG',1,1,0,0,NULL,NULL);
INSERT INTO data_menus VALUES (24,NULL,'CAH KANGKUNG',1,1,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (25,NULL,'NASI PUTIH',1,1,0,0,NULL,1);
INSERT INTO data_menus VALUES (26,NULL,'TEH PANAS',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (27,NULL,'ES TEH MANIS',2,1,0,0,NULL,NULL);
INSERT INTO data_menus VALUES (28,NULL,'JERUK PANAS',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (29,NULL,'ES JERUK',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (30,NULL,'KOPI SUSU',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (31,NULL,'KOPI',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (32,NULL,'SUSU PANAS',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (33,NULL,'ES SUSU',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (34,NULL,'JHOSSUA',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (35,NULL,'SPRITE',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (36,NULL,'FANTA',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (37,NULL,'COCA-COLA',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (38,NULL,'TEH BOTOL',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (39,NULL,'AQUA',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (40,NULL,'SODA GEMBIRA',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (41,NULL,'ES DEGAN',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (42,NULL,'ES OYEN',2,NULL,NULL,NULL,NULL,1);
INSERT INTO data_menus VALUES (43,'11111','Rokok Djiesamsoe',3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (44,NULL,'xxxx',1,2,1,50000,NULL,NULL);
INSERT INTO data_menus VALUES (45,NULL,'xxx',1,3,1,50000,NULL,NULL);


UNLOCK TABLES;

--
--  Table structure for table "data_modal"
--
DROP TABLE IF EXISTS data_modal;

CREATE TABLE `data_modal` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tgl` date DEFAULT NULL,
  `besar` double DEFAULT NULL,
  `id_pegawai` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
--  Table data for table "data_modal". Record count - 5 
--
LOCK TABLES data_modal WRITE;

INSERT INTO data_modal VALUES (3,'2010-07-23',20000000,NULL);
INSERT INTO data_modal VALUES (4,'2010-07-21',10000000,1);
INSERT INTO data_modal VALUES (5,'2010-07-26',90,1);
INSERT INTO data_modal VALUES (6,'2010-07-06',10000,1);
INSERT INTO data_modal VALUES (7,'2010-07-01',1000,1);


UNLOCK TABLES;

--
--  Table structure for table "data_pegawai"
--
DROP TABLE IF EXISTS data_pegawai;

CREATE TABLE `data_pegawai` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `notlp` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `IsOperator` int(1) DEFAULT NULL,
  `IsActive` int(1) DEFAULT NULL,
  `privilege` varchar(200) DEFAULT NULL,
  `isSinuhun` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
--  Table data for table "data_pegawai". Record count - 3 
--
LOCK TABLES data_pegawai WRITE;

INSERT INTO data_pegawai VALUES (1,'trias',NULL,NULL,'trias',1,1,NULL,NULL);
INSERT INTO data_pegawai VALUES (2,'sodik',NULL,NULL,NULL,NULL,1,NULL,NULL);
INSERT INTO data_pegawai VALUES (3,'',NULL,NULL,'',NULL,0,NULL,NULL);


UNLOCK TABLES;

--
--  Table structure for table "data_pendapatan"
--
DROP TABLE IF EXISTS data_pendapatan;

CREATE TABLE `data_pendapatan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `typependapatan` int(1) DEFAULT NULL,
  `id_meja` int(10) DEFAULT NULL,
  `tgl` date DEFAULT NULL,
  `id_pegawai` int(10) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `struk` varchar(100) DEFAULT NULL,
  `bayar` double DEFAULT NULL,
  `datetimeposted` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='0->pake_meja,1->penjualan_langsung,2->lain2 ';

--
--  Table data for table "data_pendapatan". Record count - 7 
--
LOCK TABLES data_pendapatan WRITE;

INSERT INTO data_pendapatan VALUES (1,0,1,'2010-07-27',1,NULL,'1/0-tri/27072010',200000,'2010-07-27 01:05:55');
INSERT INTO data_pendapatan VALUES (2,1,0,'2010-07-27',1,NULL,'0/1-tri/27072010',120000,'2010-07-27 01:10:59');
INSERT INTO data_pendapatan VALUES (3,0,1,'2010-07-27',1,NULL,'1/2-tri/27072010',500000,'2010-07-27 01:46:43');
INSERT INTO data_pendapatan VALUES (4,0,1,'2010-07-27',1,NULL,'1/3-tri/27072010',300000,'2010-07-27 22:38:11');
INSERT INTO data_pendapatan VALUES (5,0,3,'2010-07-27',1,NULL,'3/4-tri/27072010',200000,'2010-07-27 23:13:10');
INSERT INTO data_pendapatan VALUES (6,0,3,'2010-07-28',1,NULL,'3/0-tri/28072010',300000,'2010-07-27 23:34:06');
INSERT INTO data_pendapatan VALUES (7,0,1,'2010-07-28',1,NULL,'1/1-tri/28072010',40000,'2010-07-27 23:42:04');


UNLOCK TABLES;

--
--  Table structure for table "data_pengeluaran"
--
DROP TABLE IF EXISTS data_pengeluaran;

CREATE TABLE `data_pengeluaran` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `item` varchar(100) DEFAULT NULL,
  `banyak` double DEFAULT NULL,
  `id_satuan` int(10) NOT NULL DEFAULT '0',
  `harga_satuan` double DEFAULT NULL,
  `keterangan` text,
  `tgl` date DEFAULT NULL,
  `id_pegawai` int(10) DEFAULT NULL,
  `isBahanUtama` int(1) DEFAULT NULL,
  `id_subjenismenu` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
--  Table structure for table "data_perubahan"
--
DROP TABLE IF EXISTS data_perubahan;

CREATE TABLE `data_perubahan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `keterangan` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
--  Table structure for table "data_satuan"
--
DROP TABLE IF EXISTS data_satuan;

CREATE TABLE `data_satuan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  `isBase` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
--  Table data for table "data_satuan". Record count - 7 
--
LOCK TABLES data_satuan WRITE;

INSERT INTO data_satuan VALUES (1,'KG',0);
INSERT INTO data_satuan VALUES (2,'porsi',0);
INSERT INTO data_satuan VALUES (3,'botol',1);
INSERT INTO data_satuan VALUES (4,'bungkus',1);
INSERT INTO data_satuan VALUES (5,'porsi cumi',0);
INSERT INTO data_satuan VALUES (6,'gram',1);
INSERT INTO data_satuan VALUES (7,'ons',0);


UNLOCK TABLES;

--
--  Table structure for table "data_satuankonv"
--
DROP TABLE IF EXISTS data_satuankonv;

CREATE TABLE `data_satuankonv` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_dasar` int(10) DEFAULT NULL,
  `id_konversi` int(10) DEFAULT NULL,
  `pengali` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
--  Table data for table "data_satuankonv". Record count - 3 
--
LOCK TABLES data_satuankonv WRITE;

INSERT INTO data_satuankonv VALUES (1,6,1,1000);
INSERT INTO data_satuankonv VALUES (2,6,6,1);
INSERT INTO data_satuankonv VALUES (3,6,7,100);


UNLOCK TABLES;

--
--  Table structure for table "data_subjenismenu"
--
DROP TABLE IF EXISTS data_subjenismenu;

CREATE TABLE `data_subjenismenu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
--  Table data for table "data_subjenismenu". Record count - 7 
--
LOCK TABLES data_subjenismenu WRITE;

INSERT INTO data_subjenismenu VALUES (1,'',7);
INSERT INTO data_subjenismenu VALUES (2,'KEPITING',1);
INSERT INTO data_subjenismenu VALUES (3,'CUMI',2);
INSERT INTO data_subjenismenu VALUES (4,'UDANG',3);
INSERT INTO data_subjenismenu VALUES (5,'IKAN',4);
INSERT INTO data_subjenismenu VALUES (6,'IKAN TAWAR',5);
INSERT INTO data_subjenismenu VALUES (7,'LALAPAN',6);


UNLOCK TABLES;

--
--  Table structure for table "detail_pendapatan"
--
DROP TABLE IF EXISTS detail_pendapatan;

CREATE TABLE `detail_pendapatan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_pendapatan` int(10) DEFAULT NULL,
  `id_menu` int(10) DEFAULT NULL,
  `harga_satuan` double DEFAULT NULL,
  `id_satuan` int(10) DEFAULT NULL,
  `banyak` int(10) DEFAULT NULL,
  `keterangan` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
--  Table data for table "detail_pendapatan". Record count - 7 
--
LOCK TABLES detail_pendapatan WRITE;

INSERT INTO detail_pendapatan VALUES (1,1,1,40000,1,5,'');
INSERT INTO detail_pendapatan VALUES (2,2,1,40000,1,3,'');
INSERT INTO detail_pendapatan VALUES (5,4,1,40000,1,6,'');
INSERT INTO detail_pendapatan VALUES (6,3,45,50000,1,7,'');
INSERT INTO detail_pendapatan VALUES (7,5,1,40000,1,5,'');
INSERT INTO detail_pendapatan VALUES (8,6,1,40000,1,5,'');
INSERT INTO detail_pendapatan VALUES (9,7,1,40000,1,1,'');


UNLOCK TABLES;

--
--  Table structure for table "master_privilege"
--
DROP TABLE IF EXISTS master_privilege;

CREATE TABLE `master_privilege` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
--  Table structure for table "temp_pendapatan"
--
DROP TABLE IF EXISTS temp_pendapatan;

CREATE TABLE `temp_pendapatan` (
  `id_meja` int(10) DEFAULT NULL,
  `id_menu` int(10) DEFAULT NULL,
  `harga_satuan` double DEFAULT NULL,
  `id_satuan` int(10) DEFAULT NULL,
  `banyak` int(11) DEFAULT NULL,
  `keterangan` varchar(200) DEFAULT NULL,
  `isEditedItem` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
--  Table data for table "temp_pendapatan". Record count - 1 
--
LOCK TABLES temp_pendapatan WRITE;

INSERT INTO temp_pendapatan VALUES (0,1,40000,1,3,'',0);


UNLOCK TABLES;

--
--  Table structure for table "temp_report_3"
--
DROP TABLE IF EXISTS temp_report_3;

CREATE TABLE `temp_report_3` (
  `tgl` date DEFAULT NULL,
  `pengeluaran` double DEFAULT NULL,
  `pendapatan` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

