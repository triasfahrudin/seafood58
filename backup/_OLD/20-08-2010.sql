# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.4.2-beta-community
# Server OS:                    Win32
# HeidiSQL version:             5.1.0.3495
# Date/time:                    2010-08-20 23:54:13
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping database structure for pos_seafood58
CREATE DATABASE IF NOT EXISTS `pos_seafood58` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `pos_seafood58`;


# Dumping structure for table pos_seafood58.data_app_menu
CREATE TABLE IF NOT EXISTS `data_app_menu` (
  `id` int(10) NOT NULL DEFAULT '0',
  `parent` int(100) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `tgl_edit` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Dumping data for table pos_seafood58.data_app_menu: 35 rows
/*!40000 ALTER TABLE `data_app_menu` DISABLE KEYS */;
INSERT INTO `data_app_menu` (`id`, `parent`, `nama`, `tgl_edit`) VALUES
	(100, 0, 'APPLICATION', NULL),
	(101, 100, 'LOGOUT', NULL),
	(103, 100, 'BACKUP AND RESTORE', NULL),
	(104, 100, 'LOCK DESKTOP', NULL),
	(105, 100, 'SHUTDOWN WINDOWS', NULL),
	(106, 100, 'TENTANG', NULL),
	(107, 100, 'EXIT', NULL),
	(200, 0, 'SETTINGS', NULL),
	(300, 0, 'MASTER', NULL),
	(307, 300, 'PEGAWAI', NULL),
	(306, 300, 'MENU SAJIAN NON BARCODE', NULL),
	(304, 300, 'MASTER JENIS', NULL),
	(305, 300, 'MENU SAJIAN BARCODE', NULL),
	(302, 300, 'MASTER SATUAN', NULL),
	(303, 300, 'MASTER KONVERSI SATUAN', NULL),
	(301, 300, 'MASTER MEJA', NULL),
	(400, 0, 'REPORTS', NULL),
	(401, 400, 'PENDAPATAN', NULL),
	(402, 400, 'PENGELUARAN', NULL),
	(403, 400, 'RUGI /LABA ', NULL),
	(404, 400, 'STOK', NULL),
	(451, 450, 'DESIGN STRUK', NULL),
	(452, 450, 'DESIGN PENDAPATAN', NULL),
	(453, 450, 'DESIGN PENGELUARAN', NULL),
	(454, 450, 'DESIGN RUGI/LABA', NULL),
	(500, 0, 'TRANSAKSI', NULL),
	(501, 500, 'PENGELUARAN BIASA', NULL),
	(503, 500, 'HISTORY PENDAPATAN', NULL),
	(504, 500, 'PENDAPATAN LAIN', NULL),
	(505, 500, 'MODAL AWAL', NULL),
	(450, 400, 'DESIGN', NULL),
	(102, 100, 'GANTI PASSWORD', NULL),
	(455, 450, 'DESIGN STOK', NULL),
	(502, 500, 'PENGELUARAN UNTUK BAHAN UTAMA/BARCODE', NULL),
	(506, 500, 'PERUBAHAN /PENYESUAIAN STOK MANUAL', NULL);
/*!40000 ALTER TABLE `data_app_menu` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.data_jenismenu
CREATE TABLE IF NOT EXISTS `data_jenismenu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) DEFAULT NULL,
  `warna` varchar(20) DEFAULT '$00566A22',
  `sort` int(10) NOT NULL DEFAULT '0',
  `tgl_edit` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='1->makanan,2->minuman,3->lain';

# Dumping data for table pos_seafood58.data_jenismenu: 3 rows
/*!40000 ALTER TABLE `data_jenismenu` DISABLE KEYS */;
INSERT INTO `data_jenismenu` (`id`, `nama`, `warna`, `sort`, `tgl_edit`) VALUES
	(1, 'Makanan', '$00990000', 0, '0000-00-00 00:00:00'),
	(2, 'Minuman', '$009900CC', 0, '0000-00-00 00:00:00'),
	(3, 'Lain-Lain', '$00663300', 0, '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `data_jenismenu` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.data_login
CREATE TABLE IF NOT EXISTS `data_login` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_pegawai` int(10) DEFAULT NULL,
  `login` datetime DEFAULT NULL,
  `logout` datetime DEFAULT NULL,
  `keterangan` varchar(10) DEFAULT NULL,
  `tgl_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

# Dumping data for table pos_seafood58.data_login: 14 rows
/*!40000 ALTER TABLE `data_login` DISABLE KEYS */;
INSERT INTO `data_login` (`id`, `id_pegawai`, `login`, `logout`, `keterangan`, `tgl_edit`) VALUES
	(1, 1, '2010-08-16 13:37:41', '2010-08-16 13:39:05', NULL, NULL),
	(2, 1, '2010-08-16 13:41:04', NULL, NULL, NULL),
	(3, 1, '2010-08-16 21:15:40', '2010-08-16 21:16:27', NULL, NULL),
	(4, 3, '2010-08-16 21:16:31', '2010-08-16 21:17:26', NULL, NULL),
	(5, 1, '2010-08-19 00:27:24', '2010-08-19 00:27:32', NULL, NULL),
	(6, 1, '2010-08-20 02:41:54', '2010-08-20 02:42:20', NULL, NULL),
	(7, 1, '2010-08-20 02:46:31', '2010-08-20 02:47:06', NULL, NULL),
	(8, 1, '2010-08-20 20:34:46', '2010-08-20 20:36:30', NULL, NULL),
	(9, 1, '2010-08-20 20:36:37', '2010-08-20 20:38:05', NULL, NULL),
	(10, 1, '2010-08-20 20:38:13', '2010-08-20 20:38:24', NULL, NULL),
	(11, 1, '2010-08-20 20:39:09', '2010-08-20 20:40:24', NULL, NULL),
	(12, 1, '2010-08-20 20:42:02', '2010-08-20 20:42:51', NULL, NULL),
	(13, 1, '2010-08-20 20:53:40', '2010-08-20 20:54:03', NULL, NULL),
	(14, 1, '2010-08-20 23:52:51', NULL, NULL, NULL);
/*!40000 ALTER TABLE `data_login` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.data_meja
CREATE TABLE IF NOT EXISTS `data_meja` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Nama` varchar(100) DEFAULT NULL,
  `sort` int(10) NOT NULL DEFAULT '0',
  `tgl_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

# Dumping data for table pos_seafood58.data_meja: 4 rows
/*!40000 ALTER TABLE `data_meja` DISABLE KEYS */;
INSERT INTO `data_meja` (`id`, `Nama`, `sort`, `tgl_edit`) VALUES
	(1, 'MEJA REMANG-REMANG', 1, NULL),
	(6, 'xxx', 0, NULL),
	(7, 'xxx2', 3, NULL),
	(9, 'ddd', 0, NULL);
/*!40000 ALTER TABLE `data_meja` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.data_menus
CREATE TABLE IF NOT EXISTS `data_menus` (
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

# Dumping data for table pos_seafood58.data_menus: 42 rows
/*!40000 ALTER TABLE `data_menus` DISABLE KEYS */;
INSERT INTO `data_menus` (`id`, `barcode`, `nama`, `id_jenismenu`, `id_subjenismenu`, `id_satuan`, `harga`, `sort`, `isNewLineAfter`, `tgl_edit`) VALUES
	(1, NULL, 'REBUS', 1, 2, 1, 40000, NULL, NULL, NULL),
	(2, NULL, 'GORENG MENTEGA/TEPUNG', 1, 2, 1, 40000, NULL, NULL, NULL),
	(3, NULL, 'GORENG SAUS TIRAM', 1, 2, 1, 40000, NULL, NULL, NULL),
	(4, NULL, 'GORENG SAUS PADANG', 1, 2, 1, 0, NULL, 1, NULL),
	(5, NULL, 'BAKAR', 1, 3, 1, 0, NULL, NULL, NULL),
	(6, NULL, 'GORENG MENTEGA/TEPUNG', 1, 3, 0, 0, NULL, NULL, NULL),
	(7, NULL, 'GORENG SAUS TIRAM', 1, 3, 1, 0, NULL, NULL, NULL),
	(8, NULL, 'GORENG SAUS PADANG', 1, 3, 0, 0, NULL, 1, NULL),
	(9, NULL, 'REBUS', 1, 4, 0, 0, NULL, NULL, NULL),
	(10, NULL, 'BAKAR', 1, 4, NULL, NULL, NULL, NULL, NULL),
	(11, NULL, 'GORENG MENTEGA/TEPUNG', 1, 4, 0, 0, NULL, NULL, NULL),
	(12, NULL, 'GORENG SAUS TIRAM', 1, 4, 0, 0, NULL, NULL, NULL),
	(13, NULL, 'GORENG ASEM MANIS', 1, 4, 0, 0, NULL, 1, NULL),
	(14, NULL, 'BAKAR', 1, 5, 0, 0, NULL, NULL, NULL),
	(15, NULL, 'GORENG MENTEGA/KERING', 1, 5, 0, 0, NULL, NULL, NULL),
	(16, NULL, 'GORENG SAUS TIRAM', 1, 5, NULL, NULL, NULL, NULL, NULL),
	(17, NULL, 'GORENG SAUS PADANG', 1, 5, 0, 0, NULL, 1, NULL),
	(18, NULL, 'AYAM BAKAR/GORENG', 1, 7, 0, 0, NULL, NULL, NULL),
	(19, NULL, 'LELE', 1, 7, NULL, NULL, NULL, NULL, NULL),
	(20, NULL, 'BEBEK', 1, 7, NULL, NULL, NULL, NULL, NULL),
	(21, NULL, 'BURUNG PUYUH', 1, 7, NULL, NULL, NULL, NULL, NULL),
	(22, NULL, 'TEMPE/TAHU', 1, 7, 0, 0, NULL, 1, NULL),
	(23, NULL, 'KERANG', 1, 16, 0, 0, NULL, NULL, NULL),
	(24, NULL, 'CAH KANGKUNG', 1, 1, 0, 0, NULL, NULL, NULL),
	(25, NULL, 'NASI PUTIH', 1, 1, 0, 0, NULL, 1, NULL),
	(26, NULL, 'TEH PANAS', 2, NULL, NULL, NULL, NULL, NULL, NULL),
	(27, NULL, 'ES TEH MANIS', 2, 1, 0, 0, NULL, NULL, NULL),
	(28, NULL, 'JERUK PANAS', 2, NULL, NULL, NULL, NULL, NULL, NULL),
	(29, NULL, 'ES JERUK', 2, NULL, NULL, NULL, NULL, NULL, NULL),
	(30, NULL, 'KOPI SUSU', 2, NULL, NULL, NULL, NULL, NULL, NULL),
	(31, NULL, 'KOPI', 2, NULL, NULL, NULL, NULL, NULL, NULL),
	(32, NULL, 'SUSU PANAS', 2, 1, 0, 0, NULL, NULL, NULL),
	(33, NULL, 'ES SUSU', 2, NULL, NULL, NULL, NULL, NULL, NULL),
	(34, NULL, 'JHOSSUA', 2, NULL, NULL, NULL, NULL, NULL, NULL),
	(35, NULL, 'SPRITE', 2, NULL, NULL, NULL, NULL, NULL, NULL),
	(37, NULL, 'COCA-COLA', 2, NULL, NULL, NULL, NULL, NULL, NULL),
	(38, NULL, 'TEH BOTOL', 2, NULL, NULL, NULL, NULL, NULL, NULL),
	(39, NULL, 'AQUA', 2, NULL, NULL, NULL, NULL, NULL, NULL),
	(40, NULL, 'SODA GEMBIRA', 2, NULL, NULL, NULL, NULL, NULL, NULL),
	(41, NULL, 'ES DEGAN', 2, NULL, NULL, NULL, NULL, NULL, NULL),
	(42, '', 'ES OYEN', 2, 1, 5, 1000, NULL, 1, NULL),
	(51, '1111', 'ROKOK BUNGKUS', 3, 20, 4, 10000, NULL, NULL, NULL);
/*!40000 ALTER TABLE `data_menus` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.data_modal
CREATE TABLE IF NOT EXISTS `data_modal` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tgl` date DEFAULT NULL,
  `besar` double DEFAULT NULL,
  `id_pegawai` int(10) DEFAULT NULL,
  `tgl_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

# Dumping data for table pos_seafood58.data_modal: 7 rows
/*!40000 ALTER TABLE `data_modal` DISABLE KEYS */;
INSERT INTO `data_modal` (`id`, `tgl`, `besar`, `id_pegawai`, `tgl_edit`) VALUES
	(3, '2010-07-01', 20000000, NULL, NULL),
	(4, '2010-07-21', 10000000, 1, NULL),
	(5, '2010-07-26', 90, 1, NULL),
	(6, '2010-07-06', 10000, 1, NULL),
	(9, '2010-08-15', 100000, NULL, NULL),
	(8, '2010-07-01', 20000000, NULL, NULL),
	(10, '2010-08-20', 200000, 1, NULL);
/*!40000 ALTER TABLE `data_modal` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.data_pegawai
CREATE TABLE IF NOT EXISTS `data_pegawai` (
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

# Dumping data for table pos_seafood58.data_pegawai: 3 rows
/*!40000 ALTER TABLE `data_pegawai` DISABLE KEYS */;
INSERT INTO `data_pegawai` (`id`, `nama`, `alamat`, `notlp`, `password`, `IsOperator`, `IsActive`, `privilege`, `isSinuhun`, `tgl_edit`) VALUES
	(1, 'trias', NULL, NULL, 'trias', 1, 1, ';100;101;102;103;104;105;106;107;200;300;301;302;303;304;305;306;307;400;401;402;403;404;450;451;452;453;454;455;500;501;502;503;504;505;506', 0, NULL),
	(3, 'sodik', NULL, NULL, '123', NULL, 1, ';100;101;102;103;104;105;106;107;200;300;301;302;303;304;305;306;307;400;401;402;403;404;450;451;452;453;454;455;500;501;502;503;504;505', 1, NULL),
	(4, 'dodik', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL);
/*!40000 ALTER TABLE `data_pegawai` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.data_pendapatan
CREATE TABLE IF NOT EXISTS `data_pendapatan` (
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

# Dumping data for table pos_seafood58.data_pendapatan: 6 rows
/*!40000 ALTER TABLE `data_pendapatan` DISABLE KEYS */;
INSERT INTO `data_pendapatan` (`id`, `typependapatan`, `id_meja`, `tgl`, `id_pegawai`, `keterangan`, `struk`, `bayar`, `datetimeposted`, `tgl_edit`) VALUES
	(13, 0, 6, '2010-08-08', 1, NULL, '6/1-tri/08082010', 50000, '2010-08-08 12:46:47', NULL),
	(14, 0, 6, '2010-08-13', 1, NULL, '6/0-tri/13082010', 40000, '2010-08-13 00:11:25', NULL),
	(15, 0, 6, '2010-08-13', 1, NULL, '6/1-tri/13082010', 10000, '2010-08-13 23:37:16', NULL),
	(16, 0, 6, '2010-08-14', 1, NULL, '6/0-tri/14082010', 10000, '2010-08-14 14:51:32', NULL),
	(17, 2, NULL, '2010-08-15', 1, 'xxx', NULL, NULL, '2010-08-15 05:53:06', NULL),
	(18, 0, 6, '2010-08-20', 1, NULL, '6/0-tri/20082010', 50000, '2010-08-20 20:42:09', NULL);
/*!40000 ALTER TABLE `data_pendapatan` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.data_pengeluaran
CREATE TABLE IF NOT EXISTS `data_pengeluaran` (
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

# Dumping data for table pos_seafood58.data_pengeluaran: 11 rows
/*!40000 ALTER TABLE `data_pengeluaran` DISABLE KEYS */;
INSERT INTO `data_pengeluaran` (`id`, `item`, `id_satuan`, `banyak`, `harga_satuan`, `keterangan`, `tgl`, `id_pegawai`, `isBahanUtama`, `id_subjenismenu`, `tgl_edit`) VALUES
	(2, 'Pembelian: KEPITING', 1, 5, 20000, '', '2010-08-05', 1, 1, 2, NULL),
	(3, 'pembelian bahan bangunan', 0, 2, 10000, '', '2010-08-04', 1, 0, NULL, NULL),
	(5, 'Pembelian: CUMI', 1, 2, 30000, '', '2010-08-05', 1, 1, 3, NULL),
	(6, 'Pembelian: CUMI', 1, 1, 35000, '', '2010-08-06', 1, 1, 3, NULL),
	(10, 'xxx', 0, 2.5, 1000, '', '2010-08-08', 1, 0, NULL, NULL),
	(11, 'sss', 0, 1.5, 15000, '', '2010-08-08', 1, 0, NULL, NULL),
	(12, 'Pembelian: KEPITING', 1, 1.5, 15000, '', '2010-08-08', 1, 1, 2, NULL),
	(15, 'pembelian bahan bangunan', 0, 1, 50000, '', '2010-08-12', 1, 0, NULL, NULL),
	(21, 'Pembelian: ROKOK BUNGKUS', 4, 1, 10000, '', '2010-08-15', 1, 1, 20, NULL),
	(19, 'Pembelian: ROKOK BUNGKUS', 7, 1, 50000, '', '2010-08-13', 1, 1, 20, NULL),
	(23, 'kangkung', 0, 1, 10000, '', '2010-08-20', 1, 0, NULL, NULL);
/*!40000 ALTER TABLE `data_pengeluaran` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.data_perubahan
CREATE TABLE IF NOT EXISTS `data_perubahan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_pegawai` int(10) DEFAULT NULL,
  `Nama_pemberi_ijin` varchar(100) DEFAULT NULL,
  `tgl` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `keterangan` varchar(200) DEFAULT NULL,
  `tgl_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

# Dumping data for table pos_seafood58.data_perubahan: 44 rows
/*!40000 ALTER TABLE `data_perubahan` DISABLE KEYS */;
INSERT INTO `data_perubahan` (`id`, `id_pegawai`, `Nama_pemberi_ijin`, `tgl`, `keterangan`, `tgl_edit`) VALUES
	(1, 1, 'sodik', '2010-08-06 10:20:41', 'Delete Catatan Pengeluaran\r\nItem         :pembelian bahan bangunan\r\nHarga Satuan :1000000\r\nBanyak       :1\r\nperubahan aja', NULL),
	(2, 1, 'sodik', '2010-08-06 10:46:01', 'Delete Master Employees\r\nNama: sodik\r\n', NULL),
	(3, 1, '', '2010-08-06 11:12:48', 'Perubahan Harga satuan CUMI     - BAKAR\r\nDari    : 0\r\nMenjadi : 3000\r\n', NULL),
	(4, 1, '', '2010-08-06 11:12:53', 'Perubahan Harga satuan CUMI     - BAKAR\r\nDari    : 3000\r\nMenjadi : 30000\r\n', NULL),
	(5, 1, '', '2010-08-06 19:54:17', 'Perubahan Harga satuan CUMI     - BAKAR\r\nDari    : 0\r\nMenjadi : 15000\r\n', NULL),
	(6, 1, '', '2010-08-06 19:56:16', 'Perubahan Harga satuan CUMI     - BAKAR\r\nDari    : 0\r\nMenjadi : 15000\r\n', NULL),
	(7, 1, '', '2010-08-06 19:57:07', 'Perubahan Harga satuan CUMI     - BAKAR\r\nDari    : 0\r\nMenjadi : 15000\r\n', NULL),
	(8, 1, '', '2010-08-08 11:28:02', 'Delete Catatan Pengeluaran\r\nItem         :xxx\r\nHarga Satuan :555\r\nBanyak       :5,8\r\n', NULL),
	(9, 1, '', '2010-08-08 11:28:04', 'Delete Catatan Pengeluaran\r\nItem         :xxx\r\nHarga Satuan :5\r\nBanyak       :7,8\r\n', NULL),
	(10, 1, '', '2010-08-08 11:28:06', 'Delete Catatan Pengeluaran\r\nItem         :xxx\r\nHarga Satuan :33\r\nBanyak       :8,9\r\n', NULL),
	(11, 1, '', '2010-08-08 12:37:07', 'Delete List Jenis Satuan\r\nSatuan: hhh\r\n', NULL),
	(12, 1, '', '2010-08-08 12:37:56', 'Satuan Konversi\r\nSatuan Konversi: KG\r\nSatuan Dasar   : KG\r\n', NULL),
	(13, 1, '', '2010-08-08 12:45:13', 'Delete History Pendapatan: \r\nNo.struk: 6/0-tri/05082010\r\nTotal   : 40.000\r\n', NULL),
	(14, 1, '', '2010-08-08 12:45:15', 'Delete History Pendapatan: \r\nNo.struk: 6/1-tri/05082010\r\nTotal   : 40.000\r\n', NULL),
	(15, 1, '', '2010-08-08 12:45:18', 'Delete History Pendapatan: \r\nNo.struk: 6/2-tri/05082010\r\nTotal   : 1.000\r\n', NULL),
	(16, 1, '', '2010-08-08 12:45:21', 'Delete History Pendapatan: \r\nNo.struk: 6/0-tri/06082010\r\nTotal   : 300.000\r\n', NULL),
	(17, 1, '', '2010-08-08 12:45:23', 'Delete History Pendapatan: \r\nNo.struk: 6/1-tri/06082010\r\nTotal   : 150.000\r\n', NULL),
	(18, 1, '', '2010-08-08 12:45:26', 'Delete History Pendapatan: \r\nNo.struk: 6/2-tri/06082010\r\nTotal   : 150.000\r\n', NULL),
	(19, 1, '', '2010-08-08 12:45:29', 'Delete History Pendapatan: \r\nNo.struk: 6/3-tri/06082010\r\nTotal   : 150.000\r\n', NULL),
	(20, 1, '', '2010-08-08 12:45:33', 'Delete History Pendapatan: \r\nNo.struk: 6/0-tri/07082010\r\nTotal   : 360.000\r\n', NULL),
	(21, 1, '', '2010-08-08 12:45:35', 'Delete History Pendapatan: \r\nNo.struk: 6/1-tri/07082010\r\nTotal   : 40.000\r\n', NULL),
	(22, 1, '', '2010-08-08 12:46:20', 'Perubahan Harga satuan CUMI     - BAKAR\r\nDari    : 0\r\nMenjadi : 20000\r\n', NULL),
	(23, 1, '', '2010-08-08 13:23:27', 'Delete History Pendapatan: \r\nNo.struk: 6/0-tri/08082010\r\nTotal   : 60.000\r\n', NULL),
	(24, 1, '', '2010-08-08 13:26:08', 'Delete Catatan Pengeluaran\r\nItem         :saos\r\nHarga Satuan :2000\r\nBanyak       :10\r\n', NULL),
	(25, 1, '', '2010-08-08 13:26:38', 'Delete Catatan Pengeluaran\r\nItem         :ccc\r\nHarga Satuan :40000\r\nBanyak       :1,5\r\n', NULL),
	(26, 1, 'sodik', '2010-08-08 13:46:44', 'Delete Menu\r\nBarcode         :2222222222222\r\nJenis Menu      :Lain-Lain\r\nSub Jenis Menu  :xxxxxxxxxxxxx\r\nNama Items      :xxxxxxxxxxxxx\r\nSatuan          :porsi\r\n', NULL),
	(27, 1, 'sodik', '2010-08-12 23:49:29', 'Delete Menu\r\nNama Items      :cccccccccccccccc\r\n', NULL),
	(28, 1, 'sodik', '2010-08-12 23:51:28', 'Delete Menu\r\nNama Items      :cccccccccccccccc\r\n', NULL),
	(29, 1, 'sodik', '2010-08-12 23:51:41', 'Delete Menu\r\nNama Items      :cccccccccc\r\n', NULL),
	(30, 1, 'sodik', '2010-08-12 23:52:42', 'Delete Menu\r\nJenis Menu      :Minuman\r\nSub Jenis Menu  :\r\nNama Items      :FANTA\r\nSatuan          :\r\n', NULL),
	(31, 1, 'sodik', '2010-08-12 23:53:01', 'Delete Menu\r\nNama Items      :ROKOK DJISAMSOE\r\n', NULL),
	(32, 1, 'sodik', '2010-08-12 23:54:27', 'Delete Meja:ddd\r\n123', NULL),
	(33, 1, 'sodik', '2010-08-12 23:55:16', 'Delete Menu\r\nJenis Menu      :Makanan\r\nSub Jenis Menu  :KEPITING\r\nNama Items      :SAUS TIRAM\r\nSatuan          :KG\r\n', NULL),
	(34, 1, 'sodik', '2010-08-13 11:04:36', 'Delete Menu\r\nNama Items      :xxxx\r\n', NULL),
	(35, 1, 'sodik', '2010-08-13 11:06:43', 'Delete Menu\r\nNama Items      :dede\r\n', NULL),
	(36, 1, 'sodik', '2010-08-13 23:34:03', 'Delete Menu\r\nNama Items      :xxxxx\r\n', NULL),
	(37, 1, 'sodik', '2010-08-14 21:36:37', 'Delete CatatanPembelianBahanUtama:\r\nSubjenis     :KEPITING\r\nSatuan       :KG\r\nbanyak       :0,5\r\nharga Satuan :50000\r\nKeterangan   :test\r\n', NULL),
	(38, 1, 'sodik', '2010-08-14 21:36:56', 'Delete CatatanPembelianBahanUtama:\r\nSubjenis     :\r\nSatuan       :KG\r\nbanyak       :1\r\nharga Satuan :50000\r\nKeterangan   :\r\n', NULL),
	(39, 1, 'sodik', '2010-08-14 21:36:58', 'Delete CatatanPembelianBahanUtama:\r\nSubjenis     :\r\nSatuan       :KG\r\nbanyak       :1\r\nharga Satuan :100000\r\nKeterangan   :\r\n', NULL),
	(40, 1, 'sodik', '2010-08-14 21:37:00', 'Delete CatatanPembelianBahanUtama:\r\nSubjenis     :\r\nSatuan       :KG\r\nbanyak       :1\r\nharga Satuan :50000\r\nKeterangan   :\r\n', NULL),
	(41, 1, 'sodik', '2010-08-14 22:57:15', 'Delete Pengurangan Stok:\r\nSubjenis     :ROKOK BUNGKUS\r\nSatuan       :bungkus\r\nbanyak       :1\r\nharga Satuan :10000\r\nKeterangan   :test aja\r\n', NULL),
	(42, 1, 'sodik', '2010-08-15 01:22:25', 'Delete Perubahan Stok:\r\nPengurangan  :TIDAK\r\nSubjenis     :ROKOK BUNGKUS\r\nSatuan       :bungkus\r\nbanyak       :1\r\nharga Satuan :10000\r\nKeterangan   :\r\n', NULL),
	(43, 1, 'sodik', '2010-08-15 01:23:07', 'Delete Perubahan Stok:\r\nPengurangan  :TIDAK\r\nSubjenis     :ROKOK BUNGKUS\r\nSatuan       :bungkus\r\nbanyak       :1\r\nharga Satuan :10000\r\nKeterangan   :\r\n', NULL),
	(44, 1, 'sodik', '2010-08-15 01:31:53', 'Delete CatatanPembelianBahanUtama:\r\nSubjenis     :KEPITING\r\nSatuan       :KG\r\nbanyak       :1\r\nharga Satuan :50000\r\nKeterangan   :\r\n', NULL);
/*!40000 ALTER TABLE `data_perubahan` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.data_perubahan_stok
CREATE TABLE IF NOT EXISTS `data_perubahan_stok` (
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

# Dumping data for table pos_seafood58.data_perubahan_stok: ~2 rows (approximately)
/*!40000 ALTER TABLE `data_perubahan_stok` DISABLE KEYS */;
INSERT INTO `data_perubahan_stok` (`id`, `tgl`, `id_subjenismenu`, `banyak`, `id_satuan`, `harga_satuan`, `alasan`, `id_pegawai`, `is_pengurangan`, `tgl_edit`) VALUES
	(6, '2010-08-15', 20, 1000, 4, 10000, '', 1, 1, NULL),
	(8, '2010-08-15', 20, 1, 4, 10000, '', 1, 1, NULL);
/*!40000 ALTER TABLE `data_perubahan_stok` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.data_satuan
CREATE TABLE IF NOT EXISTS `data_satuan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  `isBase` int(1) DEFAULT NULL,
  `tgl_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

# Dumping data for table pos_seafood58.data_satuan: 8 rows
/*!40000 ALTER TABLE `data_satuan` DISABLE KEYS */;
INSERT INTO `data_satuan` (`id`, `nama`, `isBase`, `tgl_edit`) VALUES
	(1, 'KG', 0, NULL),
	(2, 'porsi', 1, NULL),
	(3, 'botol', 1, NULL),
	(4, 'bungkus', 1, NULL),
	(5, 'ons', 1, NULL),
	(7, 'LUSIN', 0, NULL),
	(9, 'gram', 1, NULL),
	(10, 'xxx', 1, NULL);
/*!40000 ALTER TABLE `data_satuan` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.data_satuankonv
CREATE TABLE IF NOT EXISTS `data_satuankonv` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_dasar` int(10) DEFAULT NULL,
  `id_konversi` int(10) DEFAULT NULL,
  `pengali` float DEFAULT NULL,
  `tgl_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

# Dumping data for table pos_seafood58.data_satuankonv: 8 rows
/*!40000 ALTER TABLE `data_satuankonv` DISABLE KEYS */;
INSERT INTO `data_satuankonv` (`id`, `id_dasar`, `id_konversi`, `pengali`, `tgl_edit`) VALUES
	(7, 3, 3, 1, NULL),
	(8, 4, 4, 1, NULL),
	(9, 2, 2, 1, NULL),
	(10, 4, 7, 12, NULL),
	(11, 5, 5, 1, NULL),
	(13, 5, 1, 10, NULL),
	(14, 9, 9, 1, NULL),
	(15, 10, 10, 1, NULL);
/*!40000 ALTER TABLE `data_satuankonv` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.data_subjenismenu
CREATE TABLE IF NOT EXISTS `data_subjenismenu` (
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

# Dumping data for table pos_seafood58.data_subjenismenu: 11 rows
/*!40000 ALTER TABLE `data_subjenismenu` DISABLE KEYS */;
INSERT INTO `data_subjenismenu` (`id`, `nama`, `sort`, `isBarcode`, `Barcode`, `id_satuan_laporan`, `is_stok`, `tgl_edit`) VALUES
	(1, '', 7, 0, NULL, 0, NULL, NULL),
	(2, 'KEPITING', 1, 0, NULL, 5, 1, NULL),
	(3, 'CUMI', 2, 0, NULL, 5, 1, NULL),
	(4, 'UDANG', 3, 0, NULL, 6, 0, NULL),
	(5, 'IKAN', 4, 0, NULL, 1, 1, NULL),
	(6, 'IKAN TAWAR', 5, 0, NULL, 6, 0, NULL),
	(7, 'LALAPAN', 6, 0, NULL, 6, 0, NULL),
	(14, 'ddd', 0, 0, '', 2, 0, NULL),
	(15, 'sasa', 5, 0, NULL, 1, 0, NULL),
	(16, 'KERANG', 0, 0, '', 2, 0, NULL),
	(20, 'ROKOK BUNGKUS', 1, 1, '1111', 4, 1, NULL);
/*!40000 ALTER TABLE `data_subjenismenu` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.detail_pendapatan
CREATE TABLE IF NOT EXISTS `detail_pendapatan` (
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

# Dumping data for table pos_seafood58.detail_pendapatan: 7 rows
/*!40000 ALTER TABLE `detail_pendapatan` DISABLE KEYS */;
INSERT INTO `detail_pendapatan` (`id`, `id_pendapatan`, `id_menu`, `harga_satuan`, `id_satuan`, `banyak`, `keterangan`, `tgl_edit`) VALUES
	(22, 13, 5, 20000, 1, 2.5, '', NULL),
	(23, 14, 1, 40000, 1, 1, '', NULL),
	(24, 14, 5, 40000, 1, 1, '', NULL),
	(25, 15, 51, 10000, 4, 1, '', NULL),
	(26, 16, 51, 10000, 4, 1, '', NULL),
	(27, 17, NULL, 100000, NULL, 1, NULL, NULL),
	(28, 18, 1, 40000, 1, 1, '', NULL);
/*!40000 ALTER TABLE `detail_pendapatan` ENABLE KEYS */;


# Dumping structure for function pos_seafood58.func_modal1
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `func_modal1`(`p_tgl` DATE) RETURNS double
    COMMENT 'modal terakhir minus modal yang dimasukkan hari ini'
BEGIN
declare mdl_terakhir double;
select ifnull(sum(besar),0)-(select ifnull(sum(banyak * harga_satuan),0)
                    from data_pengeluaran
	                 where tgl < p_tgl
	  ) as modal_terakhir into mdl_terakhir
from data_modal
where tgl < p_tgl;
return mdl_terakhir;

END//
DELIMITER ;


# Dumping structure for function pos_seafood58.func_modal_baru_hrIni
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `func_modal_baru_hrIni`(`p_tgl` DATE) RETURNS double
BEGIN
declare mdl double;
  select ifnull(sum(besar),0) into mdl
  from data_modal
  where tgl = p_tgl;
return mdl; 

END//
DELIMITER ;


# Dumping structure for table pos_seafood58.master_privilege
CREATE TABLE IF NOT EXISTS `master_privilege` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `tgl_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Dumping data for table pos_seafood58.master_privilege: 0 rows
/*!40000 ALTER TABLE `master_privilege` DISABLE KEYS */;
/*!40000 ALTER TABLE `master_privilege` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.temp_pendapatan
CREATE TABLE IF NOT EXISTS `temp_pendapatan` (
  `id_meja` int(10) DEFAULT NULL,
  `id_menu` int(10) DEFAULT NULL,
  `harga_satuan` double DEFAULT NULL,
  `id_satuan` int(10) DEFAULT NULL,
  `banyak` float DEFAULT NULL,
  `keterangan` varchar(200) DEFAULT NULL,
  `isEditedItem` int(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Dumping data for table pos_seafood58.temp_pendapatan: 1 rows
/*!40000 ALTER TABLE `temp_pendapatan` DISABLE KEYS */;
INSERT INTO `temp_pendapatan` (`id_meja`, `id_menu`, `harga_satuan`, `id_satuan`, `banyak`, `keterangan`, `isEditedItem`) VALUES
	(0, 51, 10000, 4, 1, '', 0);
/*!40000 ALTER TABLE `temp_pendapatan` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.temp_priv
CREATE TABLE IF NOT EXISTS `temp_priv` (
  `id_pegawai` int(10) DEFAULT NULL,
  `strPriv` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Dumping data for table pos_seafood58.temp_priv: 0 rows
/*!40000 ALTER TABLE `temp_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_priv` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.temp_report_3
CREATE TABLE IF NOT EXISTS `temp_report_3` (
  `tgl` date DEFAULT NULL,
  `pengeluaran` double DEFAULT NULL,
  `pendapatan` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Dumping data for table pos_seafood58.temp_report_3: 0 rows
/*!40000 ALTER TABLE `temp_report_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_report_3` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.temp_report_stok
CREATE TABLE IF NOT EXISTS `temp_report_stok` (
  `id_subjenismenu` int(10) DEFAULT NULL,
  `nama_items` varchar(100) DEFAULT NULL,
  `stok_masuk` float DEFAULT NULL,
  `stok_keluar` float DEFAULT NULL,
  `pengurangan_stok` float DEFAULT NULL,
  `penambahan_stok` float DEFAULT NULL,
  `nama_satuan` varchar(100) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table pos_seafood58.temp_report_stok: ~4 rows (approximately)
/*!40000 ALTER TABLE `temp_report_stok` DISABLE KEYS */;
INSERT INTO `temp_report_stok` (`id_subjenismenu`, `nama_items`, `stok_masuk`, `stok_keluar`, `pengurangan_stok`, `penambahan_stok`, `nama_satuan`, `sort`) VALUES
	(2, 'KEPITING', 65, 20, 0, 0, 'ons', 1),
	(20, 'ROKOK BUNGKUS', 13, 2, 1001, 0, 'bungkus', 1),
	(3, 'CUMI', 30, 35, 0, 0, 'ons', 2),
	(5, 'IKAN', 0, 0, 0, 0, 'KG', 4);
/*!40000 ALTER TABLE `temp_report_stok` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
