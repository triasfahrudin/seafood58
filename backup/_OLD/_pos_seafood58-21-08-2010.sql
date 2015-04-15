--  MySQL Database Dump 1.1
--  Host: localhost    Database: pos_seafood58
--  Server version 5.4.2-beta-community
--
--  Dump database pos_seafood58 on 21-08-2010 4:41:29 AM
--

--
--  Table structure for table "data_app_menu"
--



DROP TABLE IF EXISTS data_app_menu;

CREATE TABLE `data_app_menu` (
  `id` int(10) NOT NULL DEFAULT '0',
  `parent` int(100) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `tgl_edit` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
--  Table data for table "data_app_menu". Record count - 35 
--
LOCK TABLES data_app_menu WRITE;

INSERT INTO data_app_menu VALUES (100,0,'APPLICATION',NULL);
INSERT INTO data_app_menu VALUES (101,100,'LOGOUT',NULL);
INSERT INTO data_app_menu VALUES (103,100,'BACKUP AND RESTORE',NULL);
INSERT INTO data_app_menu VALUES (104,100,'LOCK DESKTOP',NULL);
INSERT INTO data_app_menu VALUES (105,100,'SHUTDOWN WINDOWS',NULL);
INSERT INTO data_app_menu VALUES (106,100,'TENTANG',NULL);
INSERT INTO data_app_menu VALUES (107,100,'EXIT',NULL);
INSERT INTO data_app_menu VALUES (200,0,'SETTINGS',NULL);
INSERT INTO data_app_menu VALUES (300,0,'MASTER',NULL);
INSERT INTO data_app_menu VALUES (307,300,'PEGAWAI',NULL);
INSERT INTO data_app_menu VALUES (306,300,'MENU SAJIAN NON BARCODE',NULL);
INSERT INTO data_app_menu VALUES (304,300,'MASTER JENIS',NULL);
INSERT INTO data_app_menu VALUES (305,300,'MENU SAJIAN BARCODE',NULL);
INSERT INTO data_app_menu VALUES (302,300,'MASTER SATUAN',NULL);
INSERT INTO data_app_menu VALUES (303,300,'MASTER KONVERSI SATUAN',NULL);
INSERT INTO data_app_menu VALUES (301,300,'MASTER MEJA',NULL);
INSERT INTO data_app_menu VALUES (400,0,'REPORTS',NULL);
INSERT INTO data_app_menu VALUES (401,400,'PENDAPATAN',NULL);
INSERT INTO data_app_menu VALUES (402,400,'PENGELUARAN',NULL);
INSERT INTO data_app_menu VALUES (403,400,'RUGI /LABA ',NULL);
INSERT INTO data_app_menu VALUES (404,400,'STOK',NULL);
INSERT INTO data_app_menu VALUES (451,450,'DESIGN STRUK',NULL);
INSERT INTO data_app_menu VALUES (452,450,'DESIGN PENDAPATAN',NULL);
INSERT INTO data_app_menu VALUES (453,450,'DESIGN PENGELUARAN',NULL);
INSERT INTO data_app_menu VALUES (454,450,'DESIGN RUGI/LABA',NULL);
INSERT INTO data_app_menu VALUES (500,0,'TRANSAKSI',NULL);
INSERT INTO data_app_menu VALUES (501,500,'PENGELUARAN BIASA',NULL);
INSERT INTO data_app_menu VALUES (503,500,'HISTORY PENDAPATAN',NULL);
INSERT INTO data_app_menu VALUES (504,500,'PENDAPATAN LAIN',NULL);
INSERT INTO data_app_menu VALUES (505,500,'MODAL AWAL',NULL);
INSERT INTO data_app_menu VALUES (450,400,'DESIGN',NULL);
INSERT INTO data_app_menu VALUES (102,100,'GANTI PASSWORD',NULL);
INSERT INTO data_app_menu VALUES (455,450,'DESIGN STOK',NULL);
INSERT INTO data_app_menu VALUES (502,500,'PENGELUARAN UNTUK BAHAN UTAMA/BARCODE',NULL);
INSERT INTO data_app_menu VALUES (506,500,'PERUBAHAN /PENYESUAIAN STOK MANUAL',NULL);


UNLOCK TABLES;

--
--  Table structure for table "data_jenismenu"
--
DROP TABLE IF EXISTS data_jenismenu;

CREATE TABLE `data_jenismenu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) DEFAULT NULL,
  `warna` varchar(20) DEFAULT '$00566A22',
  `sort` int(10) NOT NULL DEFAULT '0',
  `tgl_edit` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='1->makanan,2->minuman,3->lain';

--
--  Table data for table "data_jenismenu". Record count - 3 
--
LOCK TABLES data_jenismenu WRITE;

INSERT INTO data_jenismenu VALUES (1,'Makanan','$00990000',0,'0000-00-00 00:00:00');
INSERT INTO data_jenismenu VALUES (2,'Minuman','$009900CC',0,'0000-00-00 00:00:00');
INSERT INTO data_jenismenu VALUES (3,'Lain-Lain','$00663300',0,'0000-00-00 00:00:00');


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
  `tgl_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
--  Table data for table "data_login". Record count - 15 
--
LOCK TABLES data_login WRITE;

INSERT INTO data_login VALUES (1,1,'2010-08-16 13:37:41','2010-08-16 13:39:05',NULL,NULL);
INSERT INTO data_login VALUES (2,1,'2010-08-16 13:41:04',NULL,NULL,NULL);
INSERT INTO data_login VALUES (3,1,'2010-08-16 21:15:40','2010-08-16 21:16:27',NULL,NULL);
INSERT INTO data_login VALUES (4,3,'2010-08-16 21:16:31','2010-08-16 21:17:26',NULL,NULL);
INSERT INTO data_login VALUES (5,1,'2010-08-19 00:27:24','2010-08-19 00:27:32',NULL,NULL);
INSERT INTO data_login VALUES (6,1,'2010-08-20 02:41:54','2010-08-20 02:42:20',NULL,NULL);
INSERT INTO data_login VALUES (7,1,'2010-08-20 02:46:31','2010-08-20 02:47:06',NULL,NULL);
INSERT INTO data_login VALUES (8,1,'2010-08-20 20:34:46','2010-08-20 20:36:30',NULL,NULL);
INSERT INTO data_login VALUES (9,1,'2010-08-20 20:36:37','2010-08-20 20:38:05',NULL,NULL);
INSERT INTO data_login VALUES (10,1,'2010-08-20 20:38:13','2010-08-20 20:38:24',NULL,NULL);
INSERT INTO data_login VALUES (11,1,'2010-08-20 20:39:09','2010-08-20 20:40:24',NULL,NULL);
INSERT INTO data_login VALUES (12,1,'2010-08-20 20:42:02','2010-08-20 20:42:51',NULL,NULL);
INSERT INTO data_login VALUES (13,1,'2010-08-20 20:53:40','2010-08-20 20:54:03',NULL,NULL);
INSERT INTO data_login VALUES (14,1,'2010-08-20 23:52:51',NULL,NULL,NULL);
INSERT INTO data_login VALUES (15,1,'2010-08-21 04:41:23',NULL,NULL,NULL);


UNLOCK TABLES;

--
--  Table structure for table "data_meja"
--
DROP TABLE IF EXISTS data_meja;

CREATE TABLE `data_meja` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Nama` varchar(100) DEFAULT NULL,
  `sort` int(10) NOT NULL DEFAULT '0',
  `tgl_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
--  Table data for table "data_meja". Record count - 4 
--
LOCK TABLES data_meja WRITE;

INSERT INTO data_meja VALUES (1,'MEJA REMANG-REMANG',1,NULL);
INSERT INTO data_meja VALUES (6,'xxx',0,NULL);
INSERT INTO data_meja VALUES (7,'xxx2',3,NULL);
INSERT INTO data_meja VALUES (9,'ddd',0,NULL);


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
  `tgl_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

--
--  Table data for table "data_menus". Record count - 42 
--
LOCK TABLES data_menus WRITE;

INSERT INTO data_menus VALUES (1,NULL,'REBUS',1,2,1,40000,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (2,NULL,'GORENG MENTEGA/TEPUNG',1,2,1,40000,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (3,NULL,'GORENG SAUS TIRAM',1,2,1,40000,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (4,NULL,'GORENG SAUS PADANG',1,2,1,0,NULL,1,NULL);
INSERT INTO data_menus VALUES (5,NULL,'BAKAR',1,3,1,0,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (6,NULL,'GORENG MENTEGA/TEPUNG',1,3,0,0,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (7,NULL,'GORENG SAUS TIRAM',1,3,1,0,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (8,NULL,'GORENG SAUS PADANG',1,3,0,0,NULL,1,NULL);
INSERT INTO data_menus VALUES (9,NULL,'REBUS',1,4,0,0,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (10,NULL,'BAKAR',1,4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (11,NULL,'GORENG MENTEGA/TEPUNG',1,4,0,0,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (12,NULL,'GORENG SAUS TIRAM',1,4,0,0,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (13,NULL,'GORENG ASEM MANIS',1,4,0,0,NULL,1,NULL);
INSERT INTO data_menus VALUES (14,NULL,'BAKAR',1,5,0,0,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (15,NULL,'GORENG MENTEGA/KERING',1,5,0,0,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (16,NULL,'GORENG SAUS TIRAM',1,5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (17,NULL,'GORENG SAUS PADANG',1,5,0,0,NULL,1,NULL);
INSERT INTO data_menus VALUES (18,NULL,'AYAM BAKAR/GORENG',1,7,0,0,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (19,NULL,'LELE',1,7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (20,NULL,'BEBEK',1,7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (21,NULL,'BURUNG PUYUH',1,7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (22,NULL,'TEMPE/TAHU',1,7,0,0,NULL,1,NULL);
INSERT INTO data_menus VALUES (23,NULL,'KERANG',1,16,0,0,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (24,NULL,'CAH KANGKUNG',1,1,0,0,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (25,NULL,'NASI PUTIH',1,1,0,0,NULL,1,NULL);
INSERT INTO data_menus VALUES (26,NULL,'TEH PANAS',2,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (27,NULL,'ES TEH MANIS',2,1,0,0,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (28,NULL,'JERUK PANAS',2,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (29,NULL,'ES JERUK',2,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (30,NULL,'KOPI SUSU',2,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (31,NULL,'KOPI',2,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (32,NULL,'SUSU PANAS',2,1,0,0,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (33,NULL,'ES SUSU',2,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (34,NULL,'JHOSSUA',2,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (35,NULL,'SPRITE',2,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (37,NULL,'COCA-COLA',2,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (38,NULL,'TEH BOTOL',2,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (39,NULL,'AQUA',2,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (40,NULL,'SODA GEMBIRA',2,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (41,NULL,'ES DEGAN',2,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO data_menus VALUES (42,'','ES OYEN',2,1,5,1000,NULL,1,NULL);
INSERT INTO data_menus VALUES (51,'1111','ROKOK BUNGKUS',3,20,4,10000,NULL,NULL,NULL);


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
  `tgl_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
--  Table data for table "data_modal". Record count - 7 
--
LOCK TABLES data_modal WRITE;

INSERT INTO data_modal VALUES (3,'2010-07-01',20000000,NULL,NULL);
INSERT INTO data_modal VALUES (4,'2010-07-21',10000000,1,NULL);
INSERT INTO data_modal VALUES (5,'2010-07-26',90,1,NULL);
INSERT INTO data_modal VALUES (6,'2010-07-06',10000,1,NULL);
INSERT INTO data_modal VALUES (9,'2010-08-15',100000,NULL,NULL);
INSERT INTO data_modal VALUES (8,'2010-07-01',20000000,NULL,NULL);
INSERT INTO data_modal VALUES (10,'2010-08-20',200000,1,NULL);


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
  `privilege` varchar(300) DEFAULT NULL,
  `isSinuhun` int(1) DEFAULT NULL,
  `tgl_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
--  Table data for table "data_pegawai". Record count - 3 
--
LOCK TABLES data_pegawai WRITE;

INSERT INTO data_pegawai VALUES (1,'trias',NULL,NULL,'trias',1,1,';100;101;102;103;104;105;106;107;200;300;301;302;303;304;305;306;307;400;401;402;403;404;450;451;452;453;454;455;500;501;502;503;504;505;506',0,NULL);
INSERT INTO data_pegawai VALUES (3,'sodik',NULL,NULL,'123',NULL,1,';100;101;102;103;104;105;106;107;200;300;301;302;303;304;305;306;307;400;401;402;403;404;450;451;452;453;454;455;500;501;502;503;504;505',1,NULL);
INSERT INTO data_pegawai VALUES (4,'dodik',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL);


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
  `tgl_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COMMENT='0->pake_meja,1->penjualan_langsung,2->lain2 ';

--
--  Table data for table "data_pendapatan". Record count - 6 
--
LOCK TABLES data_pendapatan WRITE;

INSERT INTO data_pendapatan VALUES (13,0,6,'2010-08-08',1,NULL,'6/1-tri/08082010',50000,'2010-08-08 12:46:47',NULL);
INSERT INTO data_pendapatan VALUES (14,0,6,'2010-08-13',1,NULL,'6/0-tri/13082010',40000,'2010-08-13 00:11:25',NULL);
INSERT INTO data_pendapatan VALUES (15,0,6,'2010-08-13',1,NULL,'6/1-tri/13082010',10000,'2010-08-13 23:37:16',NULL);
INSERT INTO data_pendapatan VALUES (16,0,6,'2010-08-14',1,NULL,'6/0-tri/14082010',10000,'2010-08-14 14:51:32',NULL);
INSERT INTO data_pendapatan VALUES (17,2,NULL,'2010-08-15',1,'xxx',NULL,NULL,'2010-08-15 05:53:06',NULL);
INSERT INTO data_pendapatan VALUES (18,0,6,'2010-08-20',1,NULL,'6/0-tri/20082010',50000,'2010-08-20 20:42:09',NULL);


UNLOCK TABLES;

--
--  Table structure for table "data_pengeluaran"
--
DROP TABLE IF EXISTS data_pengeluaran;

CREATE TABLE `data_pengeluaran` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `item` varchar(100) DEFAULT NULL,
  `id_satuan` int(10) NOT NULL DEFAULT '0',
  `banyak` float DEFAULT NULL,
  `harga_satuan` double DEFAULT NULL,
  `keterangan` text,
  `tgl` date DEFAULT NULL,
  `id_pegawai` int(10) DEFAULT NULL,
  `isBahanUtama` int(1) DEFAULT NULL,
  `id_subjenismenu` int(10) DEFAULT NULL,
  `tgl_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
--  Table data for table "data_pengeluaran". Record count - 11 
--
LOCK TABLES data_pengeluaran WRITE;

INSERT INTO data_pengeluaran VALUES (2,'Pembelian: KEPITING',1,5,20000,'','2010-08-05',1,1,2,NULL);
INSERT INTO data_pengeluaran VALUES (3,'pembelian bahan bangunan',0,2,10000,'','2010-08-04',1,0,NULL,NULL);
INSERT INTO data_pengeluaran VALUES (5,'Pembelian: CUMI',1,2,30000,'','2010-08-05',1,1,3,NULL);
INSERT INTO data_pengeluaran VALUES (6,'Pembelian: CUMI',1,1,35000,'','2010-08-06',1,1,3,NULL);
INSERT INTO data_pengeluaran VALUES (10,'xxx',0,2.5,1000,'','2010-08-08',1,0,NULL,NULL);
INSERT INTO data_pengeluaran VALUES (11,'sss',0,1.5,15000,'','2010-08-08',1,0,NULL,NULL);
INSERT INTO data_pengeluaran VALUES (12,'Pembelian: KEPITING',1,1.5,15000,'','2010-08-08',1,1,2,NULL);
INSERT INTO data_pengeluaran VALUES (15,'pembelian bahan bangunan',0,1,50000,'','2010-08-12',1,0,NULL,NULL);
INSERT INTO data_pengeluaran VALUES (21,'Pembelian: ROKOK BUNGKUS',4,1,10000,'','2010-08-15',1,1,20,NULL);
INSERT INTO data_pengeluaran VALUES (19,'Pembelian: ROKOK BUNGKUS',7,1,50000,'','2010-08-13',1,1,20,NULL);
INSERT INTO data_pengeluaran VALUES (23,'kangkung',0,1,10000,'','2010-08-20',1,0,NULL,NULL);


UNLOCK TABLES;

--
--  Table structure for table "data_perubahan"
--
DROP TABLE IF EXISTS data_perubahan;

CREATE TABLE `data_perubahan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_pegawai` int(10) DEFAULT NULL,
  `Nama_pemberi_ijin` varchar(100) DEFAULT NULL,
  `tgl` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `keterangan` varchar(200) DEFAULT NULL,
  `tgl_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

--
--  Table data for table "data_perubahan". Record count - 44 
--
LOCK TABLES data_perubahan WRITE;

INSERT INTO data_perubahan VALUES (1,1,'sodik','2010-08-06 10:20:41','Delete Catatan Pengeluaran\r\nItem         :pembelian bahan bangunan\r\nHarga Satuan :1000000\r\nBanyak       :1\r\nperubahan aja',NULL);
INSERT INTO data_perubahan VALUES (2,1,'sodik','2010-08-06 10:46:01','Delete Master Employees\r\nNama: sodik\r\n',NULL);
INSERT INTO data_perubahan VALUES (3,1,'','2010-08-06 11:12:48','Perubahan Harga satuan CUMI     - BAKAR\r\nDari    : 0\r\nMenjadi : 3000\r\n',NULL);
INSERT INTO data_perubahan VALUES (4,1,'','2010-08-06 11:12:53','Perubahan Harga satuan CUMI     - BAKAR\r\nDari    : 3000\r\nMenjadi : 30000\r\n',NULL);
INSERT INTO data_perubahan VALUES (5,1,'','2010-08-06 19:54:17','Perubahan Harga satuan CUMI     - BAKAR\r\nDari    : 0\r\nMenjadi : 15000\r\n',NULL);
INSERT INTO data_perubahan VALUES (6,1,'','2010-08-06 19:56:16','Perubahan Harga satuan CUMI     - BAKAR\r\nDari    : 0\r\nMenjadi : 15000\r\n',NULL);
INSERT INTO data_perubahan VALUES (7,1,'','2010-08-06 19:57:07','Perubahan Harga satuan CUMI     - BAKAR\r\nDari    : 0\r\nMenjadi : 15000\r\n',NULL);
INSERT INTO data_perubahan VALUES (8,1,'','2010-08-08 11:28:02','Delete Catatan Pengeluaran\r\nItem         :xxx\r\nHarga Satuan :555\r\nBanyak       :5,8\r\n',NULL);
INSERT INTO data_perubahan VALUES (9,1,'','2010-08-08 11:28:04','Delete Catatan Pengeluaran\r\nItem         :xxx\r\nHarga Satuan :5\r\nBanyak       :7,8\r\n',NULL);
INSERT INTO data_perubahan VALUES (10,1,'','2010-08-08 11:28:06','Delete Catatan Pengeluaran\r\nItem         :xxx\r\nHarga Satuan :33\r\nBanyak       :8,9\r\n',NULL);
INSERT INTO data_perubahan VALUES (11,1,'','2010-08-08 12:37:07','Delete List Jenis Satuan\r\nSatuan: hhh\r\n',NULL);
INSERT INTO data_perubahan VALUES (12,1,'','2010-08-08 12:37:56','Satuan Konversi\r\nSatuan Konversi: KG\r\nSatuan Dasar   : KG\r\n',NULL);
INSERT INTO data_perubahan VALUES (13,1,'','2010-08-08 12:45:13','Delete History Pendapatan: \r\nNo.struk: 6/0-tri/05082010\r\nTotal   : 40.000\r\n',NULL);
INSERT INTO data_perubahan VALUES (14,1,'','2010-08-08 12:45:15','Delete History Pendapatan: \r\nNo.struk: 6/1-tri/05082010\r\nTotal   : 40.000\r\n',NULL);
INSERT INTO data_perubahan VALUES (15,1,'','2010-08-08 12:45:18','Delete History Pendapatan: \r\nNo.struk: 6/2-tri/05082010\r\nTotal   : 1.000\r\n',NULL);
INSERT INTO data_perubahan VALUES (16,1,'','2010-08-08 12:45:21','Delete History Pendapatan: \r\nNo.struk: 6/0-tri/06082010\r\nTotal   : 300.000\r\n',NULL);
INSERT INTO data_perubahan VALUES (17,1,'','2010-08-08 12:45:23','Delete History Pendapatan: \r\nNo.struk: 6/1-tri/06082010\r\nTotal   : 150.000\r\n',NULL);
INSERT INTO data_perubahan VALUES (18,1,'','2010-08-08 12:45:26','Delete History Pendapatan: \r\nNo.struk: 6/2-tri/06082010\r\nTotal   : 150.000\r\n',NULL);
INSERT INTO data_perubahan VALUES (19,1,'','2010-08-08 12:45:29','Delete History Pendapatan: \r\nNo.struk: 6/3-tri/06082010\r\nTotal   : 150.000\r\n',NULL);
INSERT INTO data_perubahan VALUES (20,1,'','2010-08-08 12:45:33','Delete History Pendapatan: \r\nNo.struk: 6/0-tri/07082010\r\nTotal   : 360.000\r\n',NULL);
INSERT INTO data_perubahan VALUES (21,1,'','2010-08-08 12:45:35','Delete History Pendapatan: \r\nNo.struk: 6/1-tri/07082010\r\nTotal   : 40.000\r\n',NULL);
INSERT INTO data_perubahan VALUES (22,1,'','2010-08-08 12:46:20','Perubahan Harga satuan CUMI     - BAKAR\r\nDari    : 0\r\nMenjadi : 20000\r\n',NULL);
INSERT INTO data_perubahan VALUES (23,1,'','2010-08-08 13:23:27','Delete History Pendapatan: \r\nNo.struk: 6/0-tri/08082010\r\nTotal   : 60.000\r\n',NULL);
INSERT INTO data_perubahan VALUES (24,1,'','2010-08-08 13:26:08','Delete Catatan Pengeluaran\r\nItem         :saos\r\nHarga Satuan :2000\r\nBanyak       :10\r\n',NULL);
INSERT INTO data_perubahan VALUES (25,1,'','2010-08-08 13:26:38','Delete Catatan Pengeluaran\r\nItem         :ccc\r\nHarga Satuan :40000\r\nBanyak       :1,5\r\n',NULL);
INSERT INTO data_perubahan VALUES (26,1,'sodik','2010-08-08 13:46:44','Delete Menu\r\nBarcode         :2222222222222\r\nJenis Menu      :Lain-Lain\r\nSub Jenis Menu  :xxxxxxxxxxxxx\r\nNama Items      :xxxxxxxxxxxxx\r\nSatuan          :porsi\r\n',NULL);
INSERT INTO data_perubahan VALUES (27,1,'sodik','2010-08-12 23:49:29','Delete Menu\r\nNama Items      :cccccccccccccccc\r\n',NULL);
INSERT INTO data_perubahan VALUES (28,1,'sodik','2010-08-12 23:51:28','Delete Menu\r\nNama Items      :cccccccccccccccc\r\n',NULL);
INSERT INTO data_perubahan VALUES (29,1,'sodik','2010-08-12 23:51:41','Delete Menu\r\nNama Items      :cccccccccc\r\n',NULL);
INSERT INTO data_perubahan VALUES (30,1,'sodik','2010-08-12 23:52:42','Delete Menu\r\nJenis Menu      :Minuman\r\nSub Jenis Menu  :\r\nNama Items      :FANTA\r\nSatuan          :\r\n',NULL);
INSERT INTO data_perubahan VALUES (31,1,'sodik','2010-08-12 23:53:01','Delete Menu\r\nNama Items      :ROKOK DJISAMSOE\r\n',NULL);
INSERT INTO data_perubahan VALUES (32,1,'sodik','2010-08-12 23:54:27','Delete Meja:ddd\r\n123',NULL);
INSERT INTO data_perubahan VALUES (33,1,'sodik','2010-08-12 23:55:16','Delete Menu\r\nJenis Menu      :Makanan\r\nSub Jenis Menu  :KEPITING\r\nNama Items      :SAUS TIRAM\r\nSatuan          :KG\r\n',NULL);
INSERT INTO data_perubahan VALUES (34,1,'sodik','2010-08-13 11:04:36','Delete Menu\r\nNama Items      :xxxx\r\n',NULL);
INSERT INTO data_perubahan VALUES (35,1,'sodik','2010-08-13 11:06:43','Delete Menu\r\nNama Items      :dede\r\n',NULL);
INSERT INTO data_perubahan VALUES (36,1,'sodik','2010-08-13 23:34:03','Delete Menu\r\nNama Items      :xxxxx\r\n',NULL);
INSERT INTO data_perubahan VALUES (37,1,'sodik','2010-08-14 21:36:37','Delete CatatanPembelianBahanUtama:\r\nSubjenis     :KEPITING\r\nSatuan       :KG\r\nbanyak       :0,5\r\nharga Satuan :50000\r\nKeterangan   :test\r\n',NULL);
INSERT INTO data_perubahan VALUES (38,1,'sodik','2010-08-14 21:36:56','Delete CatatanPembelianBahanUtama:\r\nSubjenis     :\r\nSatuan       :KG\r\nbanyak       :1\r\nharga Satuan :50000\r\nKeterangan   :\r\n',NULL);
INSERT INTO data_perubahan VALUES (39,1,'sodik','2010-08-14 21:36:58','Delete CatatanPembelianBahanUtama:\r\nSubjenis     :\r\nSatuan       :KG\r\nbanyak       :1\r\nharga Satuan :100000\r\nKeterangan   :\r\n',NULL);
INSERT INTO data_perubahan VALUES (40,1,'sodik','2010-08-14 21:37:00','Delete CatatanPembelianBahanUtama:\r\nSubjenis     :\r\nSatuan       :KG\r\nbanyak       :1\r\nharga Satuan :50000\r\nKeterangan   :\r\n',NULL);
INSERT INTO data_perubahan VALUES (41,1,'sodik','2010-08-14 22:57:15','Delete Pengurangan Stok:\r\nSubjenis     :ROKOK BUNGKUS\r\nSatuan       :bungkus\r\nbanyak       :1\r\nharga Satuan :10000\r\nKeterangan   :test aja\r\n',NULL);
INSERT INTO data_perubahan VALUES (42,1,'sodik','2010-08-15 01:22:25','Delete Perubahan Stok:\r\nPengurangan  :TIDAK\r\nSubjenis     :ROKOK BUNGKUS\r\nSatuan       :bungkus\r\nbanyak       :1\r\nharga Satuan :10000\r\nKeterangan   :\r\n',NULL);
INSERT INTO data_perubahan VALUES (43,1,'sodik','2010-08-15 01:23:07','Delete Perubahan Stok:\r\nPengurangan  :TIDAK\r\nSubjenis     :ROKOK BUNGKUS\r\nSatuan       :bungkus\r\nbanyak       :1\r\nharga Satuan :10000\r\nKeterangan   :\r\n',NULL);
INSERT INTO data_perubahan VALUES (44,1,'sodik','2010-08-15 01:31:53','Delete CatatanPembelianBahanUtama:\r\nSubjenis     :KEPITING\r\nSatuan       :KG\r\nbanyak       :1\r\nharga Satuan :50000\r\nKeterangan   :\r\n',NULL);


UNLOCK TABLES;

--
--  Table structure for table "data_perubahan_stok"
--
DROP TABLE IF EXISTS data_perubahan_stok;

CREATE TABLE `data_perubahan_stok` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `id_subjenismenu` int(10) NOT NULL DEFAULT '0',
  `banyak` float NOT NULL DEFAULT '0',
  `id_satuan` int(11) NOT NULL DEFAULT '0',
  `harga_satuan` double NOT NULL DEFAULT '0',
  `alasan` varchar(200) NOT NULL DEFAULT '0',
  `id_pegawai` int(10) DEFAULT NULL,
  `is_pengurangan` int(1) DEFAULT NULL,
  `tgl_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
--  Table data for table "data_perubahan_stok". Record count - 2 
--
LOCK TABLES data_perubahan_stok WRITE;

INSERT INTO data_perubahan_stok VALUES (6,'2010-08-15',20,1000,4,10000,'',1,1,NULL);
INSERT INTO data_perubahan_stok VALUES (8,'2010-08-15',20,1,4,10000,'',1,1,NULL);


UNLOCK TABLES;

--
--  Table structure for table "data_satuan"
--
DROP TABLE IF EXISTS data_satuan;

CREATE TABLE `data_satuan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  `isBase` int(1) DEFAULT NULL,
  `tgl_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
--  Table data for table "data_satuan". Record count - 8 
--
LOCK TABLES data_satuan WRITE;

INSERT INTO data_satuan VALUES (1,'KG',0,NULL);
INSERT INTO data_satuan VALUES (2,'porsi',1,NULL);
INSERT INTO data_satuan VALUES (3,'botol',1,NULL);
INSERT INTO data_satuan VALUES (4,'bungkus',1,NULL);
INSERT INTO data_satuan VALUES (5,'ons',1,NULL);
INSERT INTO data_satuan VALUES (7,'LUSIN',0,NULL);
INSERT INTO data_satuan VALUES (9,'gram',1,NULL);
INSERT INTO data_satuan VALUES (10,'xxx',1,NULL);


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
  `tgl_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
--  Table data for table "data_satuankonv". Record count - 8 
--
LOCK TABLES data_satuankonv WRITE;

INSERT INTO data_satuankonv VALUES (7,3,3,1,NULL);
INSERT INTO data_satuankonv VALUES (8,4,4,1,NULL);
INSERT INTO data_satuankonv VALUES (9,2,2,1,NULL);
INSERT INTO data_satuankonv VALUES (10,4,7,12,NULL);
INSERT INTO data_satuankonv VALUES (11,5,5,1,NULL);
INSERT INTO data_satuankonv VALUES (13,5,1,10,NULL);
INSERT INTO data_satuankonv VALUES (14,9,9,1,NULL);
INSERT INTO data_satuankonv VALUES (15,10,10,1,NULL);


UNLOCK TABLES;

--
--  Table structure for table "data_subjenismenu"
--
DROP TABLE IF EXISTS data_subjenismenu;

CREATE TABLE `data_subjenismenu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  `isBarcode` int(1) DEFAULT NULL,
  `Barcode` varchar(100) DEFAULT NULL,
  `id_satuan_laporan` int(10) DEFAULT NULL,
  `is_stok` int(1) DEFAULT NULL,
  `tgl_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
--  Table data for table "data_subjenismenu". Record count - 11 
--
LOCK TABLES data_subjenismenu WRITE;

INSERT INTO data_subjenismenu VALUES (1,'',7,0,NULL,0,NULL,NULL);
INSERT INTO data_subjenismenu VALUES (2,'KEPITING',1,0,NULL,5,1,NULL);
INSERT INTO data_subjenismenu VALUES (3,'CUMI',2,0,NULL,5,1,NULL);
INSERT INTO data_subjenismenu VALUES (4,'UDANG',3,0,NULL,6,0,NULL);
INSERT INTO data_subjenismenu VALUES (5,'IKAN',4,0,NULL,1,1,NULL);
INSERT INTO data_subjenismenu VALUES (6,'IKAN TAWAR',5,0,NULL,6,0,NULL);
INSERT INTO data_subjenismenu VALUES (7,'LALAPAN',6,0,NULL,6,0,NULL);
INSERT INTO data_subjenismenu VALUES (14,'ddd',0,0,'',2,0,NULL);
INSERT INTO data_subjenismenu VALUES (15,'sasa',5,0,NULL,1,0,NULL);
INSERT INTO data_subjenismenu VALUES (16,'KERANG',0,0,'',2,0,NULL);
INSERT INTO data_subjenismenu VALUES (20,'ROKOK BUNGKUS',1,1,'1111',4,1,NULL);


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
  `banyak` float DEFAULT NULL,
  `keterangan` varchar(200) DEFAULT NULL,
  `tgl_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
--  Table data for table "detail_pendapatan". Record count - 7 
--
LOCK TABLES detail_pendapatan WRITE;

INSERT INTO detail_pendapatan VALUES (22,13,5,20000,1,2.5,'',NULL);
INSERT INTO detail_pendapatan VALUES (23,14,1,40000,1,1,'',NULL);
INSERT INTO detail_pendapatan VALUES (24,14,5,40000,1,1,'',NULL);
INSERT INTO detail_pendapatan VALUES (25,15,51,10000,4,1,'',NULL);
INSERT INTO detail_pendapatan VALUES (26,16,51,10000,4,1,'',NULL);
INSERT INTO detail_pendapatan VALUES (27,17,NULL,100000,NULL,1,NULL,NULL);
INSERT INTO detail_pendapatan VALUES (28,18,1,40000,1,1,'',NULL);


UNLOCK TABLES;

--
--  Table structure for table "master_privilege"
--
DROP TABLE IF EXISTS master_privilege;

CREATE TABLE `master_privilege` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `tgl_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
--  Table structure for table "temp_pendapatan"
--
DROP TABLE IF EXISTS temp_pendapatan;

CREATE TABLE `temp_pendapatan` (
  `id_meja` int(10) DEFAULT NULL,
  `id_menu` int(10) DEFAULT NULL,
  `harga_satuan` double DEFAULT NULL,
  `id_satuan` int(10) DEFAULT NULL,
  `banyak` float DEFAULT NULL,
  `keterangan` varchar(200) DEFAULT NULL,
  `isEditedItem` int(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
--  Table data for table "temp_pendapatan". Record count - 1 
--
LOCK TABLES temp_pendapatan WRITE;

INSERT INTO temp_pendapatan VALUES (0,51,10000,4,1,'',0);


UNLOCK TABLES;

--
--  Table structure for table "temp_priv"
--
DROP TABLE IF EXISTS temp_priv;

CREATE TABLE `temp_priv` (
  `id_pegawai` int(10) DEFAULT NULL,
  `strPriv` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
--  Table structure for table "temp_report_3"
--
DROP TABLE IF EXISTS temp_report_3;

CREATE TABLE `temp_report_3` (
  `tgl` date DEFAULT NULL,
  `pengeluaran` double DEFAULT NULL,
  `pendapatan` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
--  Table structure for table "temp_report_stok"
--
DROP TABLE IF EXISTS temp_report_stok;

CREATE TABLE `temp_report_stok` (
  `id_subjenismenu` int(10) DEFAULT NULL,
  `nama_items` varchar(100) DEFAULT NULL,
  `stok_masuk` float DEFAULT NULL,
  `stok_keluar` float DEFAULT NULL,
  `pengurangan_stok` float DEFAULT NULL,
  `penambahan_stok` float DEFAULT NULL,
  `nama_satuan` varchar(100) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
--  Table data for table "temp_report_stok". Record count - 4 
--
LOCK TABLES temp_report_stok WRITE;

INSERT INTO temp_report_stok VALUES (2,'KEPITING',65,20,0,0,'ons',1);
INSERT INTO temp_report_stok VALUES (20,'ROKOK BUNGKUS',13,2,1001,0,'bungkus',1);
INSERT INTO temp_report_stok VALUES (3,'CUMI',30,35,0,0,'ons',2);
INSERT INTO temp_report_stok VALUES (5,'IKAN',0,0,0,0,'KG',4);


UNLOCK TABLES;

DELIMITER_START
CREATE DEFINER=`root`@`localhost` FUNCTION `func_modal1`(`p_tgl` DATE) RETURNS double
    COMMENT 'modal terakhir minus modal yang dimasukkan hari ini'
BEGIN
declare mdl_terakhir double
select ifnull(sum(besar),0)-(select ifnull(sum(banyak * harga_satuan),0)
                    from data_pengeluaran
	                 where tgl < p_tgl
	  ) as modal_terakhir into mdl_terakhir
from data_modal
where tgl < p_tgl
return mdl_terakhir

END#
DELIMITER_END

