# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.4.2-beta-community
# Server OS:                    Win32
# HeidiSQL version:             5.1.0.3446
# Date/time:                    2010-07-28 17:12:21
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping database structure for pos_seafood58
CREATE DATABASE IF NOT EXISTS `pos_seafood58` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `pos_seafood58`;


# Dumping structure for table pos_seafood58.data_jenismenu
CREATE TABLE IF NOT EXISTS `data_jenismenu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) DEFAULT NULL,
  `warna` varchar(20) DEFAULT '$00566A22',
  `sort` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='1->makanan,2->minuman,3->lain';

# Dumping data for table pos_seafood58.data_jenismenu: ~3 rows (approximately)
/*!40000 ALTER TABLE `data_jenismenu` DISABLE KEYS */;
INSERT INTO `data_jenismenu` (`id`, `nama`, `warna`, `sort`) VALUES
	(1, 'Makanan', '$00566A22', 0),
	(2, 'Minuman', '$00FF3300', 0),
	(3, 'Lain-Lain', '$0099CCFF', 0);
/*!40000 ALTER TABLE `data_jenismenu` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.data_login
CREATE TABLE IF NOT EXISTS `data_login` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_pegawai` int(10) DEFAULT NULL,
  `login` datetime DEFAULT NULL,
  `logout` datetime DEFAULT NULL,
  `keterangan` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

# Dumping data for table pos_seafood58.data_login: ~90 rows (approximately)
/*!40000 ALTER TABLE `data_login` DISABLE KEYS */;
INSERT INTO `data_login` (`id`, `id_pegawai`, `login`, `logout`, `keterangan`) VALUES
	(1, 1, '2010-07-27 00:58:47', NULL, NULL),
	(2, 1, NULL, '2010-07-27 00:59:13', NULL),
	(3, 3, '2010-07-27 00:59:35', NULL, NULL),
	(4, 3, NULL, '2010-07-27 00:59:37', NULL),
	(5, 1, '2010-07-27 00:59:44', NULL, NULL),
	(6, 1, NULL, '2010-07-27 01:00:17', NULL),
	(7, 1, '2010-07-27 01:05:42', NULL, NULL),
	(8, 1, NULL, '2010-07-27 01:06:26', NULL),
	(9, 1, '2010-07-27 01:10:51', NULL, NULL),
	(10, 1, NULL, '2010-07-27 01:11:31', NULL),
	(11, 1, '2010-07-27 01:11:38', NULL, NULL),
	(12, 1, NULL, '2010-07-27 01:11:46', NULL),
	(13, 1, '2010-07-27 01:34:01', NULL, NULL),
	(14, 1, NULL, '2010-07-27 01:34:41', NULL),
	(15, 1, '2010-07-27 01:35:38', NULL, NULL),
	(16, 1, NULL, '2010-07-27 01:36:01', NULL),
	(17, 1, '2010-07-27 01:36:06', NULL, NULL),
	(18, 1, NULL, '2010-07-27 01:36:46', NULL),
	(19, 1, '2010-07-27 01:37:09', NULL, NULL),
	(20, 1, NULL, '2010-07-27 01:37:19', NULL),
	(21, 1, '2010-07-27 01:38:18', NULL, NULL),
	(22, 1, NULL, '2010-07-27 01:38:34', NULL),
	(23, 1, '2010-07-27 01:38:51', NULL, NULL),
	(24, 1, NULL, '2010-07-27 01:38:53', NULL),
	(25, 1, '2010-07-27 01:41:57', NULL, NULL),
	(26, 1, NULL, '2010-07-27 01:41:59', NULL),
	(27, 1, '2010-07-27 01:46:17', NULL, NULL),
	(28, 1, '2010-07-27 01:48:07', NULL, NULL),
	(29, 1, '2010-07-27 01:52:42', NULL, NULL),
	(30, 1, NULL, '2010-07-27 01:53:19', NULL),
	(31, 1, '2010-07-27 02:00:47', NULL, NULL),
	(32, 1, NULL, '2010-07-27 02:00:55', NULL),
	(33, 1, '2010-07-27 02:01:42', NULL, NULL),
	(34, 1, NULL, '2010-07-27 02:02:34', NULL),
	(35, 1, '2010-07-27 02:06:34', NULL, NULL),
	(36, 1, NULL, '2010-07-27 02:06:56', NULL),
	(37, 1, '2010-07-27 02:07:30', NULL, NULL),
	(38, 1, NULL, '2010-07-27 02:08:19', NULL),
	(39, 1, '2010-07-27 02:08:37', NULL, NULL),
	(40, 1, NULL, '2010-07-27 02:08:57', NULL),
	(41, 1, '2010-07-27 02:10:05', NULL, NULL),
	(42, 1, NULL, '2010-07-27 02:10:51', NULL),
	(43, 1, '2010-07-27 02:12:37', NULL, NULL),
	(44, 1, NULL, '2010-07-27 02:12:46', NULL),
	(45, 1, '2010-07-27 02:13:31', NULL, NULL),
	(46, 1, NULL, '2010-07-27 02:13:39', NULL),
	(47, 1, '2010-07-27 02:15:13', NULL, NULL),
	(48, 1, NULL, '2010-07-27 02:16:38', NULL),
	(49, 1, '2010-07-27 02:19:38', NULL, NULL),
	(50, 1, NULL, '2010-07-27 02:20:52', NULL),
	(51, 1, '2010-07-27 22:37:26', NULL, NULL),
	(52, 1, NULL, '2010-07-27 22:42:51', NULL),
	(53, 1, '2010-07-27 22:50:48', NULL, NULL),
	(54, 1, NULL, '2010-07-27 23:00:23', NULL),
	(55, 1, '2010-07-27 23:09:38', NULL, NULL),
	(56, 1, NULL, '2010-07-27 23:10:17', NULL),
	(57, 1, '2010-07-27 23:12:05', NULL, NULL),
	(58, 1, NULL, '2010-07-27 23:12:38', NULL),
	(59, 1, '2010-07-27 23:12:47', NULL, NULL),
	(60, 1, NULL, '2010-07-27 23:13:48', NULL),
	(61, 1, '2010-07-27 23:30:39', NULL, NULL),
	(62, 1, NULL, '2010-07-27 23:30:56', NULL),
	(63, 1, '2010-07-27 23:31:52', NULL, NULL),
	(64, 1, '2010-07-27 23:41:41', NULL, NULL),
	(65, 1, NULL, '2010-07-27 23:42:33', NULL),
	(66, 3, '2010-07-27 23:53:17', NULL, NULL),
	(67, 3, NULL, '2010-07-27 23:53:19', NULL),
	(68, 1, '2010-07-28 00:00:54', NULL, NULL),
	(69, 1, NULL, '2010-07-28 00:01:27', NULL),
	(70, 1, '2010-07-28 00:54:42', NULL, NULL),
	(71, 1, NULL, '2010-07-28 00:55:12', NULL),
	(72, 1, '2010-07-28 00:56:59', NULL, NULL),
	(73, 1, NULL, '2010-07-28 00:57:16', NULL),
	(74, 1, '2010-07-28 00:58:52', NULL, NULL),
	(75, 1, NULL, '2010-07-28 00:59:48', NULL),
	(76, 1, '2010-07-28 01:00:04', NULL, NULL),
	(77, 1, NULL, '2010-07-28 01:01:29', NULL),
	(78, 1, '2010-07-28 01:02:06', NULL, NULL),
	(79, 1, NULL, '2010-07-28 01:02:34', NULL),
	(80, 1, '2010-07-28 01:03:34', NULL, NULL),
	(81, 1, NULL, '2010-07-28 01:04:09', NULL),
	(82, 1, '2010-07-28 01:04:33', NULL, NULL),
	(83, 1, NULL, '2010-07-28 01:04:50', NULL),
	(84, 1, '2010-07-28 01:13:40', NULL, NULL),
	(85, 1, NULL, '2010-07-28 01:14:24', NULL),
	(86, 1, '2010-07-28 16:59:55', NULL, NULL),
	(87, 1, NULL, '2010-07-28 17:00:04', NULL),
	(88, 1, '2010-07-28 17:00:26', NULL, NULL),
	(89, 1, NULL, '2010-07-28 17:09:11', NULL),
	(90, 1, '2010-07-28 17:11:04', NULL, NULL);
/*!40000 ALTER TABLE `data_login` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.data_meja
CREATE TABLE IF NOT EXISTS `data_meja` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Nama` varchar(100) DEFAULT NULL,
  `sort` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

# Dumping data for table pos_seafood58.data_meja: ~3 rows (approximately)
/*!40000 ALTER TABLE `data_meja` DISABLE KEYS */;
INSERT INTO `data_meja` (`id`, `Nama`, `sort`) VALUES
	(1, 'MEJA REMANG-REMANG', 1),
	(2, 'MEJA RAJA', 2),
	(3, 'MEJA AKU', 3);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

# Dumping data for table pos_seafood58.data_menus: ~45 rows (approximately)
/*!40000 ALTER TABLE `data_menus` DISABLE KEYS */;
INSERT INTO `data_menus` (`id`, `barcode`, `nama`, `id_jenismenu`, `id_subjenismenu`, `id_satuan`, `harga`, `sort`, `isNewLineAfter`) VALUES
	(1, NULL, 'REBUS', 1, 2, 1, 40000, NULL, NULL),
	(2, NULL, 'GORENG MENTEGA/TEPUNG', 1, 2, 1, 40000, NULL, NULL),
	(3, NULL, 'GORENG SAUS TIRAM', 1, 2, 1, 0, NULL, NULL),
	(4, NULL, 'GORENG SAUS PADANG', 1, 2, 1, 0, NULL, 1),
	(5, NULL, 'BAKAR', 1, 3, 1, 0, NULL, NULL),
	(6, NULL, 'GORENG MENTEGA/TEPUNG', 1, 3, NULL, NULL, NULL, NULL),
	(7, NULL, 'GORENG SAUS TIRAM', 1, 3, 0, 0, NULL, NULL),
	(8, NULL, 'GORENG SAUS PADANG', 1, 3, NULL, NULL, NULL, 1),
	(9, NULL, 'REBUS', 1, 4, 0, 0, NULL, NULL),
	(10, NULL, 'BAKAR', 1, 4, NULL, NULL, NULL, NULL),
	(11, NULL, 'GORENG MENTEGA/TEPUNG', 1, 4, 0, 0, NULL, NULL),
	(12, NULL, 'GORENG SAUS TIRAM', 1, 4, 0, 0, NULL, NULL),
	(13, NULL, 'GORENG ASEM MANIS', 1, 4, 0, 0, NULL, 1),
	(14, NULL, 'BAKAR', 1, 5, 0, 0, NULL, NULL),
	(15, NULL, 'GORENG MENTEGA/KERING', 1, 5, 0, 0, NULL, NULL),
	(16, NULL, 'GORENG SAUS TIRAM', 1, 5, NULL, NULL, NULL, NULL),
	(17, NULL, 'GORENG SAUS PADANG', 1, 5, 0, 0, NULL, 1),
	(18, NULL, 'AYAM BAKAR/GORENG', 1, 7, 0, 0, NULL, NULL),
	(19, NULL, 'LELE', 1, 7, NULL, NULL, NULL, NULL),
	(20, NULL, 'BEBEK', 1, 7, NULL, NULL, NULL, NULL),
	(21, NULL, 'BURUNG PUYUH', 1, 7, NULL, NULL, NULL, NULL),
	(22, NULL, 'TEMPE/TAHU', 1, 7, NULL, NULL, NULL, 1),
	(23, NULL, 'KERANG', 1, 1, 0, 0, NULL, NULL),
	(24, NULL, 'CAH KANGKUNG', 1, 1, NULL, NULL, NULL, NULL),
	(25, NULL, 'NASI PUTIH', 1, 1, 0, 0, NULL, 1),
	(26, NULL, 'TEH PANAS', 2, NULL, NULL, NULL, NULL, NULL),
	(27, NULL, 'ES TEH MANIS', 2, 1, 0, 0, NULL, NULL),
	(28, NULL, 'JERUK PANAS', 2, NULL, NULL, NULL, NULL, NULL),
	(29, NULL, 'ES JERUK', 2, NULL, NULL, NULL, NULL, NULL),
	(30, NULL, 'KOPI SUSU', 2, NULL, NULL, NULL, NULL, NULL),
	(31, NULL, 'KOPI', 2, NULL, NULL, NULL, NULL, NULL),
	(32, NULL, 'SUSU PANAS', 2, NULL, NULL, NULL, NULL, NULL),
	(33, NULL, 'ES SUSU', 2, NULL, NULL, NULL, NULL, NULL),
	(34, NULL, 'JHOSSUA', 2, NULL, NULL, NULL, NULL, NULL),
	(35, NULL, 'SPRITE', 2, NULL, NULL, NULL, NULL, NULL),
	(36, NULL, 'FANTA', 2, NULL, NULL, NULL, NULL, NULL),
	(37, NULL, 'COCA-COLA', 2, NULL, NULL, NULL, NULL, NULL),
	(38, NULL, 'TEH BOTOL', 2, NULL, NULL, NULL, NULL, NULL),
	(39, NULL, 'AQUA', 2, NULL, NULL, NULL, NULL, NULL),
	(40, NULL, 'SODA GEMBIRA', 2, NULL, NULL, NULL, NULL, NULL),
	(41, NULL, 'ES DEGAN', 2, NULL, NULL, NULL, NULL, NULL),
	(42, NULL, 'ES OYEN', 2, NULL, NULL, NULL, NULL, 1),
	(43, '11111', 'Rokok Djiesamsoe', 3, NULL, NULL, NULL, NULL, NULL),
	(44, NULL, 'xxxx', 1, 2, 1, 50000, NULL, NULL),
	(45, NULL, 'xxx', 1, 3, 1, 50000, NULL, NULL);
/*!40000 ALTER TABLE `data_menus` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.data_modal
CREATE TABLE IF NOT EXISTS `data_modal` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tgl` date DEFAULT NULL,
  `besar` double DEFAULT NULL,
  `id_pegawai` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

# Dumping data for table pos_seafood58.data_modal: ~5 rows (approximately)
/*!40000 ALTER TABLE `data_modal` DISABLE KEYS */;
INSERT INTO `data_modal` (`id`, `tgl`, `besar`, `id_pegawai`) VALUES
	(3, '2010-07-23', 20000000, NULL),
	(4, '2010-07-21', 10000000, 1),
	(5, '2010-07-26', 90, 1),
	(6, '2010-07-06', 10000, 1),
	(7, '2010-07-01', 1000, 1);
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
  `privilege` varchar(200) DEFAULT NULL,
  `isSinuhun` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

# Dumping data for table pos_seafood58.data_pegawai: ~3 rows (approximately)
/*!40000 ALTER TABLE `data_pegawai` DISABLE KEYS */;
INSERT INTO `data_pegawai` (`id`, `nama`, `alamat`, `notlp`, `password`, `IsOperator`, `IsActive`, `privilege`, `isSinuhun`) VALUES
	(1, 'trias', NULL, NULL, 'trias', 1, 1, NULL, NULL),
	(2, 'sodik', NULL, NULL, NULL, NULL, 1, NULL, NULL),
	(3, '', NULL, NULL, '', NULL, 0, NULL, NULL);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='0->pake_meja,1->penjualan_langsung,2->lain2 ';

# Dumping data for table pos_seafood58.data_pendapatan: ~7 rows (approximately)
/*!40000 ALTER TABLE `data_pendapatan` DISABLE KEYS */;
INSERT INTO `data_pendapatan` (`id`, `typependapatan`, `id_meja`, `tgl`, `id_pegawai`, `keterangan`, `struk`, `bayar`, `datetimeposted`) VALUES
	(1, 0, 1, '2010-07-27', 1, NULL, '1/0-tri/27072010', 200000, '2010-07-27 01:05:55'),
	(2, 1, 0, '2010-07-27', 1, NULL, '0/1-tri/27072010', 120000, '2010-07-27 01:10:59'),
	(3, 0, 1, '2010-07-27', 1, NULL, '1/2-tri/27072010', 500000, '2010-07-27 01:46:43'),
	(4, 0, 1, '2010-07-27', 1, NULL, '1/3-tri/27072010', 300000, '2010-07-27 22:38:11'),
	(5, 0, 3, '2010-07-27', 1, NULL, '3/4-tri/27072010', 200000, '2010-07-27 23:13:10'),
	(6, 0, 3, '2010-07-28', 1, NULL, '3/0-tri/28072010', 300000, '2010-07-27 23:34:06'),
	(7, 0, 1, '2010-07-28', 1, NULL, '1/1-tri/28072010', 40000, '2010-07-27 23:42:04');
/*!40000 ALTER TABLE `data_pendapatan` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.data_pengeluaran
CREATE TABLE IF NOT EXISTS `data_pengeluaran` (
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

# Dumping data for table pos_seafood58.data_pengeluaran: ~0 rows (approximately)
/*!40000 ALTER TABLE `data_pengeluaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_pengeluaran` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.data_perubahan
CREATE TABLE IF NOT EXISTS `data_perubahan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `keterangan` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table pos_seafood58.data_perubahan: ~0 rows (approximately)
/*!40000 ALTER TABLE `data_perubahan` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_perubahan` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.data_satuan
CREATE TABLE IF NOT EXISTS `data_satuan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  `isBase` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

# Dumping data for table pos_seafood58.data_satuan: ~7 rows (approximately)
/*!40000 ALTER TABLE `data_satuan` DISABLE KEYS */;
INSERT INTO `data_satuan` (`id`, `nama`, `isBase`) VALUES
	(1, 'KG', 0),
	(2, 'porsi', 0),
	(3, 'botol', 1),
	(4, 'bungkus', 1),
	(5, 'porsi cumi', 0),
	(6, 'gram', 1),
	(7, 'ons', 0);
/*!40000 ALTER TABLE `data_satuan` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.data_satuankonv
CREATE TABLE IF NOT EXISTS `data_satuankonv` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_dasar` int(10) DEFAULT NULL,
  `id_konversi` int(10) DEFAULT NULL,
  `pengali` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

# Dumping data for table pos_seafood58.data_satuankonv: ~3 rows (approximately)
/*!40000 ALTER TABLE `data_satuankonv` DISABLE KEYS */;
INSERT INTO `data_satuankonv` (`id`, `id_dasar`, `id_konversi`, `pengali`) VALUES
	(1, 6, 1, 1000),
	(2, 6, 6, 1),
	(3, 6, 7, 100);
/*!40000 ALTER TABLE `data_satuankonv` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.data_subjenismenu
CREATE TABLE IF NOT EXISTS `data_subjenismenu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

# Dumping data for table pos_seafood58.data_subjenismenu: ~7 rows (approximately)
/*!40000 ALTER TABLE `data_subjenismenu` DISABLE KEYS */;
INSERT INTO `data_subjenismenu` (`id`, `nama`, `sort`) VALUES
	(1, '', 7),
	(2, 'KEPITING', 1),
	(3, 'CUMI', 2),
	(4, 'UDANG', 3),
	(5, 'IKAN', 4),
	(6, 'IKAN TAWAR', 5),
	(7, 'LALAPAN', 6);
/*!40000 ALTER TABLE `data_subjenismenu` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.detail_pendapatan
CREATE TABLE IF NOT EXISTS `detail_pendapatan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_pendapatan` int(10) DEFAULT NULL,
  `id_menu` int(10) DEFAULT NULL,
  `harga_satuan` double DEFAULT NULL,
  `id_satuan` int(10) DEFAULT NULL,
  `banyak` int(10) DEFAULT NULL,
  `keterangan` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

# Dumping data for table pos_seafood58.detail_pendapatan: ~7 rows (approximately)
/*!40000 ALTER TABLE `detail_pendapatan` DISABLE KEYS */;
INSERT INTO `detail_pendapatan` (`id`, `id_pendapatan`, `id_menu`, `harga_satuan`, `id_satuan`, `banyak`, `keterangan`) VALUES
	(1, 1, 1, 40000, 1, 5, ''),
	(2, 2, 1, 40000, 1, 3, ''),
	(5, 4, 1, 40000, 1, 6, ''),
	(6, 3, 45, 50000, 1, 7, ''),
	(7, 5, 1, 40000, 1, 5, ''),
	(8, 6, 1, 40000, 1, 5, ''),
	(9, 7, 1, 40000, 1, 1, '');
/*!40000 ALTER TABLE `detail_pendapatan` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.master_privilege
CREATE TABLE IF NOT EXISTS `master_privilege` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table pos_seafood58.master_privilege: ~0 rows (approximately)
/*!40000 ALTER TABLE `master_privilege` DISABLE KEYS */;
/*!40000 ALTER TABLE `master_privilege` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.temp_pendapatan
CREATE TABLE IF NOT EXISTS `temp_pendapatan` (
  `id_meja` int(10) DEFAULT NULL,
  `id_menu` int(10) DEFAULT NULL,
  `harga_satuan` double DEFAULT NULL,
  `id_satuan` int(10) DEFAULT NULL,
  `banyak` int(11) DEFAULT NULL,
  `keterangan` varchar(200) DEFAULT NULL,
  `isEditedItem` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table pos_seafood58.temp_pendapatan: ~1 rows (approximately)
/*!40000 ALTER TABLE `temp_pendapatan` DISABLE KEYS */;
INSERT INTO `temp_pendapatan` (`id_meja`, `id_menu`, `harga_satuan`, `id_satuan`, `banyak`, `keterangan`, `isEditedItem`) VALUES
	(0, 1, 40000, 1, 3, '', 0);
/*!40000 ALTER TABLE `temp_pendapatan` ENABLE KEYS */;


# Dumping structure for table pos_seafood58.temp_report_3
CREATE TABLE IF NOT EXISTS `temp_report_3` (
  `tgl` date DEFAULT NULL,
  `pengeluaran` double DEFAULT NULL,
  `pendapatan` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table pos_seafood58.temp_report_3: ~0 rows (approximately)
/*!40000 ALTER TABLE `temp_report_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_report_3` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
