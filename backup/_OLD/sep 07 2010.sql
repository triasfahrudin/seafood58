# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.4.2-beta-community
# Server OS:                    Win32
# HeidiSQL version:             5.1.0.3496
# Date/time:                    2010-09-07 16:27:45
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping database structure for db_test
CREATE DATABASE IF NOT EXISTS `db_test` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_test`;


# Dumping structure for table db_test.data_app_menu
DROP TABLE IF EXISTS `data_app_menu`;
CREATE TABLE IF NOT EXISTS `data_app_menu` (
  `id` int(10) NOT NULL,
  `parent` int(100) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `tgl_edit` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Dumping data for table db_test.data_app_menu: 44 rows
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
	(308, 300, 'PEGAWAI', NULL),
	(306, 300, 'MENU SAJIAN NON BARCODE', NULL),
	(304, 300, 'MASTER JENIS', NULL),
	(305, 300, 'MENU SAJIAN BARCODE', NULL),
	(302, 300, 'MASTER SATUAN', NULL),
	(303, 300, 'MASTER KONVERSI SATUAN', NULL),
	(301, 300, 'MASTER MEJA', NULL),
	(400, 0, 'REPORTS', NULL),
	(411, 410, 'PENDAPATAN HARIAN', NULL),
	(412, 410, 'PENDAPATAN BULANAN', NULL),
	(430, 400, 'RUGI /LABA ', NULL),
	(431, 400, 'STOK', NULL),
	(451, 450, 'DESIGN STRUK', NULL),
	(452, 450, 'DESIGN PENDAPATAN HARIAN', NULL),
	(453, 450, 'DESIGN PENGELUARAN HARIAN', NULL),
	(456, 450, 'DESIGN RUGI/LABA', NULL),
	(500, 0, 'TRANSAKSI', NULL),
	(501, 500, 'PENGELUARAN BIASA', NULL),
	(503, 500, 'HISTORY PENDAPATAN', NULL),
	(504, 500, 'PENDAPATAN LAIN', NULL),
	(505, 500, 'MODAL AWAL', NULL),
	(450, 400, 'DESIGN', NULL),
	(102, 100, 'GANTI PASSWORD', NULL),
	(457, 450, 'DESIGN STOK', NULL),
	(502, 500, 'PENGELUARAN UNTUK BAHAN UTAMA/BARCODE & NON MENU', NULL),
	(506, 500, 'PERUBAHAN /PENYESUAIAN STOK MANUAL', NULL),
	(410, 400, 'PENDAPATAN', NULL),
	(420, 400, 'PENGELUARAN', NULL),
	(421, 420, 'PENGELUARAN HARIAN', NULL),
	(422, 420, 'PENGELUARAN BULANAN', NULL),
	(454, 450, 'DESIGN PENDAPATAN BULANAN', NULL),
	(455, 450, 'DESIGN PENGELUARAN BULANAN', NULL),
	(307, 300, 'BAHAN NON MENU', NULL),
	(507, 500, 'TUTUP BUKU HARIAN', NULL),
	(432, 400, 'TUTUP BUKU', NULL);
/*!40000 ALTER TABLE `data_app_menu` ENABLE KEYS */;


# Dumping structure for table db_test.data_jenismenu
DROP TABLE IF EXISTS `data_jenismenu`;
CREATE TABLE IF NOT EXISTS `data_jenismenu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) DEFAULT NULL,
  `warna` varchar(20) DEFAULT '$00566A22',
  `sort` int(10) NOT NULL DEFAULT '0',
  `tgl_edit` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COMMENT='1->makanan,2->minuman,3->lain';

# Dumping data for table db_test.data_jenismenu: 6 rows
/*!40000 ALTER TABLE `data_jenismenu` DISABLE KEYS */;
INSERT INTO `data_jenismenu` (`id`, `nama`, `warna`, `sort`, `tgl_edit`) VALUES
	(1, 'Makanan', '$00990000', 0, '0000-00-00 00:00:00'),
	(2, 'Minuman', '$009900CC', 0, '0000-00-00 00:00:00'),
	(3, 'Lain-Lain', '$00566A22', 0, '0000-00-00 00:00:00'),
	(4, 'Rokok', '$00566A22', 0, '0000-00-00 00:00:00'),
	(5, 'Snack', '$00566A22', 0, '0000-00-00 00:00:00'),
	(6, 'Kerupuk', '$00663300', 0, '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `data_jenismenu` ENABLE KEYS */;


# Dumping structure for table db_test.data_login
DROP TABLE IF EXISTS `data_login`;
CREATE TABLE IF NOT EXISTS `data_login` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_pegawai` int(10) DEFAULT NULL,
  `login` datetime DEFAULT NULL,
  `logout` datetime DEFAULT NULL,
  `keterangan` varchar(10) DEFAULT NULL,
  `tgl_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Dumping data for table db_test.data_login: 0 rows
/*!40000 ALTER TABLE `data_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_login` ENABLE KEYS */;


# Dumping structure for table db_test.data_meja
DROP TABLE IF EXISTS `data_meja`;
CREATE TABLE IF NOT EXISTS `data_meja` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Nama` varchar(100) DEFAULT NULL,
  `sort` int(10) NOT NULL DEFAULT '0',
  `tgl_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

# Dumping data for table db_test.data_meja: 21 rows
/*!40000 ALTER TABLE `data_meja` DISABLE KEYS */;
INSERT INTO `data_meja` (`id`, `Nama`, `sort`, `tgl_edit`) VALUES
	(1, 'A', 0, NULL),
	(2, 'B', 1, NULL),
	(3, 'C', 2, NULL),
	(4, 'D', 3, NULL),
	(5, 'E', 4, NULL),
	(6, 'F', 5, NULL),
	(7, 'G', 6, NULL),
	(8, 'H', 7, NULL),
	(9, '1', 8, NULL),
	(10, '2', 9, NULL),
	(11, '3', 10, NULL),
	(12, '4', 11, NULL),
	(13, '5', 12, NULL),
	(14, '6', 13, NULL),
	(15, '7', 14, NULL),
	(16, '8', 15, NULL),
	(17, '9', 16, NULL),
	(18, '10', 17, NULL),
	(19, '11', 18, NULL),
	(20, '12', 19, NULL),
	(21, '13', 20, NULL);
/*!40000 ALTER TABLE `data_meja` ENABLE KEYS */;


# Dumping structure for table db_test.data_menus
DROP TABLE IF EXISTS `data_menus`;
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
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=latin1;

# Dumping data for table db_test.data_menus: 143 rows
/*!40000 ALTER TABLE `data_menus` DISABLE KEYS */;
INSERT INTO `data_menus` (`id`, `barcode`, `nama`, `id_jenismenu`, `id_subjenismenu`, `id_satuan`, `harga`, `sort`, `isNewLineAfter`, `tgl_edit`) VALUES
	(1, NULL, 'REBUS', 1, 2, 5, 8000, NULL, NULL, NULL),
	(2, NULL, 'GORENG MENTEGA', 1, 2, 5, 8000, NULL, NULL, NULL),
	(3, NULL, 'GORENG TEPUNG', 1, 2, 5, 8000, NULL, NULL, NULL),
	(4, NULL, 'GORENG SAUS TIRAM', 1, 2, 5, 8000, NULL, NULL, NULL),
	(5, NULL, 'GORENG ASAM MANIS', 1, 2, 5, 8000, NULL, NULL, NULL),
	(6, NULL, 'GORENG SAUS PADANG', 1, 2, 5, 8000, NULL, 1, NULL),
	(7, NULL, 'BAKAR', 1, 3, 2, 15000, NULL, NULL, NULL),
	(8, NULL, 'GORENG MENTEGA', 1, 3, 2, 15000, NULL, NULL, NULL),
	(9, NULL, 'GORENG TEPUNG', 1, 3, 2, 15000, NULL, NULL, NULL),
	(10, NULL, 'GORENG KERING', 1, 3, 2, 15000, NULL, NULL, NULL),
	(11, NULL, 'GORENG SAUS TIRAM', 1, 3, 2, 15000, NULL, NULL, NULL),
	(12, NULL, 'GORENG ASAM MANIS', 1, 3, 2, 15000, NULL, NULL, NULL),
	(13, NULL, 'GORENG SAUS PADANG', 1, 3, 2, 15000, NULL, 1, NULL),
	(14, NULL, 'REBUS', 1, 4, 2, 15000, NULL, NULL, NULL),
	(15, NULL, 'BAKAR', 1, 4, 2, 15000, NULL, NULL, NULL),
	(16, NULL, 'GORENG MENTEGA', 1, 4, 2, 15000, NULL, NULL, NULL),
	(17, NULL, 'GORENG KERING', 1, 4, 2, 15000, NULL, NULL, NULL),
	(18, NULL, 'GORENG TEPUNG', 1, 4, 2, 15000, NULL, NULL, NULL),
	(19, NULL, 'GORENG SAOS TIRAM', 1, 4, 2, 15000, NULL, NULL, NULL),
	(20, NULL, 'GORENG ASEM MANIS', 1, 4, 2, 15000, NULL, NULL, NULL),
	(21, NULL, 'GORENG SAOS PADANG', 1, 4, 2, 15000, NULL, 1, NULL),
	(22, NULL, 'BAKAR', 1, 5, 5, 5000, NULL, NULL, NULL),
	(23, NULL, 'GORENG MENTEGA', 1, 5, 5, 5000, NULL, NULL, NULL),
	(24, NULL, 'GORENG KERING', 1, 5, 5, 5000, NULL, NULL, NULL),
	(25, NULL, 'GORENG TEPUNG', 1, 5, 5, 5000, NULL, NULL, NULL),
	(26, NULL, 'GORENG SAUS TIRAM', 1, 5, 5, 5000, NULL, NULL, NULL),
	(27, NULL, 'GORENG ASAM MANIS', 1, 5, 5, 5000, NULL, NULL, NULL),
	(28, NULL, 'GORENG SAUS PADANG', 1, 5, 5, 5000, NULL, 1, NULL),
	(29, NULL, 'BAKAR', 1, 6, 5, 5000, NULL, NULL, NULL),
	(30, NULL, 'GORENG MENTEGA', 1, 6, 5, 5000, NULL, NULL, NULL),
	(31, NULL, 'GORENG KERING', 1, 6, 5, 5000, NULL, NULL, NULL),
	(32, NULL, 'GORENG TEPUNG', 1, 6, 5, 5000, NULL, NULL, NULL),
	(33, NULL, 'GORENG SAOS TIRAM', 1, 6, 5, 5000, NULL, NULL, NULL),
	(34, NULL, 'GORENG ASAM MANIS', 1, 6, 5, 5000, NULL, NULL, NULL),
	(35, NULL, 'GORENG SAOS PADANG', 1, 6, 5, 5000, NULL, 1, NULL),
	(36, NULL, 'REBUS', 1, 8, 2, 10000, NULL, NULL, NULL),
	(37, NULL, 'GORENG MENTEGA', 1, 8, 2, 10000, NULL, NULL, NULL),
	(38, NULL, 'GORENG KERING', 1, 8, 2, 10000, NULL, NULL, NULL),
	(39, NULL, 'GORENG TEPUNG', 1, 8, 2, 10000, NULL, NULL, NULL),
	(40, NULL, 'GORENG SAOS TIRAM', 1, 8, 2, 10000, NULL, NULL, NULL),
	(41, NULL, 'GORENG ASAM MANIS', 1, 8, 2, 10000, NULL, NULL, NULL),
	(42, NULL, 'GORENG SAOS PADANG', 1, 8, 2, 10000, NULL, 1, NULL),
	(43, NULL, 'SATE', 1, 10, 2, 15000, NULL, NULL, NULL),
	(44, NULL, 'GORENG MENTEGA', 1, 10, 2, 15000, NULL, NULL, NULL),
	(45, NULL, 'GORENG TEPUNG', 1, 10, 2, 15000, NULL, NULL, NULL),
	(46, NULL, 'GORENG SAOS TIRAM', 1, 10, 2, 15000, NULL, NULL, NULL),
	(47, NULL, 'GORENG ASAM MANIS', 1, 10, 2, 15000, NULL, NULL, NULL),
	(48, NULL, 'GORENG SAOS PADANG', 1, 10, 2, 15000, NULL, 1, NULL),
	(49, NULL, 'AYAM GORENG', 1, 7, 2, 15000, NULL, NULL, NULL),
	(50, NULL, 'AYAM BAKAR', 1, 7, 2, 15000, NULL, NULL, NULL),
	(51, NULL, 'BEBEK GORENG', 1, 7, 2, 15000, NULL, NULL, NULL),
	(52, NULL, 'BEBEK BAKAR', 1, 7, 2, 15000, NULL, NULL, NULL),
	(53, NULL, 'LELE', 1, 7, 2, 5000, NULL, NULL, NULL),
	(54, NULL, 'TEMPE', 1, 7, 2, 2500, NULL, NULL, NULL),
	(55, NULL, 'TAHU', 1, 7, 2, 2500, NULL, 1, NULL),
	(56, NULL, 'CAH SAWI', 1, 1, 2, 5000, NULL, NULL, NULL),
	(57, NULL, 'CAH SAYUR', 1, 1, 2, 5000, NULL, NULL, NULL),
	(58, NULL, 'CAH KANGKUNG', 1, 1, 2, 5000, NULL, NULL, NULL),
	(59, NULL, 'PIRING', 1, 9, 2, 3000, NULL, NULL, NULL),
	(60, NULL, 'BAKUL KECIL', 1, 9, 2, 10000, NULL, NULL, NULL),
	(61, NULL, 'BAKUL BESAR', 1, 9, 2, 15000, NULL, 1, NULL),
	(62, NULL, 'ES TEH', 2, 1, 9, 2000, NULL, NULL, NULL),
	(63, NULL, 'TEH PANAS-HANGAT', 2, 1, 9, 2000, NULL, NULL, NULL),
	(64, NULL, 'ES JERUK', 2, 1, 9, 2500, NULL, NULL, NULL),
	(65, NULL, 'JERUK PANAS-HANGAT', 2, 1, 9, 2500, NULL, NULL, NULL),
	(66, NULL, 'KOPI', 2, 1, 9, 2000, NULL, NULL, NULL),
	(67, NULL, 'KOPI SUSU', 2, 1, 9, 2500, NULL, NULL, NULL),
	(68, NULL, 'ES SUSU', 2, 1, 9, 6000, NULL, NULL, NULL),
	(69, NULL, 'SUSU PANAS', 2, 1, 9, 6000, NULL, NULL, NULL),
	(70, NULL, 'JHOSSUA', 2, 1, 9, 6000, NULL, NULL, NULL),
	(71, NULL, 'ES OYEN', 2, 1, 2, 5000, NULL, NULL, NULL),
	(72, NULL, 'HAPPY COLA', 2, 1, 9, 6000, NULL, NULL, NULL),
	(73, NULL, 'HAPPY TEBS', 2, 1, 9, 6000, NULL, NULL, NULL),
	(74, NULL, 'SODA GEMBIRA', 2, 1, 9, 8000, NULL, NULL, NULL),
	(75, NULL, 'ES DEGAN', 2, 1, 9, 4000, NULL, NULL, NULL),
	(76, NULL, 'ES DEGAN BUAH', 2, 1, 9, 6000, NULL, NULL, NULL),
	(77, NULL, 'SPRITE 200ML', 2, 1, 3, 3000, NULL, NULL, NULL),
	(78, NULL, 'FRESTEA 220ML', 2, 1, 3, 3000, NULL, NULL, NULL),
	(79, NULL, 'COCA-COLA 193ML', 2, 1, 3, 3000, NULL, NULL, NULL),
	(80, NULL, 'FANTA STRAWBERY 200ML', 2, 1, 3, 3000, NULL, NULL, NULL),
	(81, NULL, 'FANTA SODA WATER 295ML', 2, 1, 3, 3000, NULL, NULL, NULL),
	(82, NULL, 'TEBS 230ML', 2, 1, 3, 3000, NULL, NULL, NULL),
	(83, NULL, 'SOSRO 220ML', 2, 1, 3, 3000, NULL, NULL, NULL),
	(84, NULL, 'S-TEE 318ML', 2, 1, 3, 3000, NULL, NULL, NULL),
	(85, NULL, 'JOYTEA 234ML', 2, 1, 3, 3000, NULL, NULL, NULL),
	(86, NULL, 'FRUIT TEA 235ML', 2, 1, 3, 3000, NULL, NULL, NULL),
	(87, '8886008101046', 'AQUA 240 ML', 2, 44, 9, 500, NULL, NULL, NULL),
	(88, '8886008101053', 'AQUA 600 ML', 2, 45, 3, 3000, NULL, NULL, NULL),
	(89, NULL, 'AQUA 1LITER', 2, 71, 3, 5000, NULL, NULL, NULL),
	(90, '8997001970079', 'MARSHOF 220 ML', 2, 46, 9, 500, NULL, NULL, NULL),
	(91, '8999908034205', 'HEMAVITON Energy Drink 150 ML', 2, 21, 3, 3500, NULL, NULL, NULL),
	(92, '8886057883665', 'KRATINDAENG Energy Drink 150 ML', 2, 20, 3, 3500, NULL, NULL, NULL),
	(93, '8992761111533', 'SPRITE 250 ML', 2, 14, 11, 5000, NULL, NULL, NULL),
	(94, '8992761111519', 'COCA COLA 250 ML', 2, 16, 11, 5000, NULL, NULL, NULL),
	(95, '8992761111595', 'FANTA BLUEBERY 250 ML', 2, 41, 11, 5000, NULL, NULL, NULL),
	(96, '8992761111540', 'FANTA STRAWBERY 250 ML', 2, 15, 11, 5000, NULL, NULL, NULL),
	(97, '8992761122331', 'FRESTEA APEL 500ML', 2, 91, 3, 6000, NULL, NULL, NULL),
	(98, '8992761122355', 'FRESTEA LEMON 500ML', 2, 92, 3, 6000, NULL, NULL, NULL),
	(99, '8992761122348', 'FRESTEA MARKISA 500 ML', 2, 19, 3, 6000, NULL, NULL, NULL),
	(100, '8997035563414', 'POCARI SWEAT 500ML', 2, 40, 3, 6000, NULL, NULL, NULL),
	(101, '8992761166038', 'PULPY ORANGE 350 ML', 2, 18, 3, 6000, NULL, NULL, NULL),
	(102, '8992761122379', 'ISOTONIK LEMON 500ML', 2, 39, 3, 6000, NULL, NULL, NULL),
	(103, '8992761122386', 'ISOTONIK ORANGE 500ML', 2, 22, 3, 6000, NULL, NULL, NULL),
	(104, '8992761136161', 'COCA COLA 1 LITER', 2, 17, 3, 10000, NULL, NULL, NULL),
	(105, '8994116101176', 'COUNTRY CHOICE JERUK 250 ML', 2, 43, 10, 4000, NULL, NULL, NULL),
	(106, '8994116101190', 'COUNTRY CHOICE GUAVA 250 ML', 2, 42, 10, 4000, NULL, NULL, NULL),
	(107, '89981801', 'Ardath', 3, 25, 4, 6500, NULL, NULL, NULL),
	(108, '8998127533124', 'Country Merah', 3, 24, 4, 7500, NULL, NULL, NULL),
	(109, '76164217', 'Malboro Merah', 3, 26, 4, 11000, NULL, NULL, NULL),
	(110, '76239878', 'Malboro Putih', 3, 27, 4, 11000, NULL, NULL, NULL),
	(111, '8991906101668', 'Djarum 76', 3, 29, 4, 6500, NULL, NULL, NULL),
	(112, '8991906101019', 'Djarum Super', 3, 30, 4, 8000, NULL, NULL, NULL),
	(113, '8991906101118', 'Djarum Black', 3, 31, 4, 7500, NULL, NULL, NULL),
	(114, '8999909028234', 'Dji Sam Soe', 3, 28, 4, 11000, NULL, NULL, NULL),
	(115, '8998989100120', 'G.G Inter', 3, 35, 4, 9000, NULL, NULL, NULL),
	(116, '8998989110129', 'Surya 12', 3, 34, 4, 8500, NULL, NULL, NULL),
	(117, '8998989300063', 'Surya 12 Premium', 3, 33, 4, 8000, NULL, NULL, NULL),
	(118, '8991906101057', 'L.A Lights 16', 3, 32, 4, 9500, NULL, NULL, NULL),
	(119, '8993989311699', 'Class Mild 16', 3, 69, 4, 9000, NULL, NULL, NULL),
	(120, '8993989511679', 'Class Mild Menthol 16', 3, 70, 4, 9000, NULL, NULL, NULL),
	(121, '8999909096004', 'Sampoerna Mild 16', 3, 23, 4, 10500, NULL, NULL, NULL),
	(122, '8998127611136', 'Tali Jagat Filter', 3, 36, 4, 5000, NULL, NULL, NULL),
	(123, '8998127622132', 'Tali Jagat Kretek', 3, 37, 4, 4500, NULL, NULL, NULL),
	(124, '8992775511602', 'LEO Nacho Cheese', 3, 47, 4, 1000, NULL, NULL, NULL),
	(125, '8992775511206', 'LEO Potato Crisps', 3, 48, 4, 1000, NULL, NULL, NULL),
	(126, '1', 'Molen', 3, 93, 4, 9000, NULL, NULL, NULL),
	(127, '2', 'KORO GURIH', 3, 94, 4, 6500, NULL, NULL, NULL),
	(128, '3', 'Sale Pisang', 3, 95, 4, 9000, NULL, NULL, NULL),
	(129, '4', 'Melinjo Manis', 3, 96, 4, 9500, NULL, NULL, NULL),
	(130, '5', 'Keciput Putih', 3, 97, 4, 6500, NULL, NULL, NULL),
	(131, '6', 'Keciput Hitam', 3, 98, 4, 10000, NULL, NULL, NULL),
	(132, '7', 'Teng Teng Jahe', 3, 99, 4, 11000, NULL, NULL, NULL),
	(133, '8', 'Teng Teng Kacang', 3, 100, 4, 11000, NULL, NULL, NULL),
	(134, '9', 'Kerupuk Kotak', 3, 101, 4, 1000, NULL, NULL, NULL),
	(135, '10', 'Tengiri', 3, 102, 4, 1000, NULL, NULL, NULL),
	(136, '11', 'Kemplang', 3, 103, 4, 2500, NULL, NULL, NULL),
	(137, '12', 'Tempe Kecil', 3, 104, 4, 1000, NULL, NULL, NULL),
	(138, '13', 'Tempe Besar', 3, 105, 4, 1500, NULL, NULL, NULL),
	(139, '14', 'Rambak Kecil', 3, 106, 4, 1000, NULL, NULL, NULL),
	(140, '15', 'Rambak Besar', 3, 107, 4, 1500, NULL, 1, NULL),
	(141, '16', 'Ikan Palembang', 3, 108, 4, 1500, NULL, NULL, NULL),
	(142, '17', 'Makaroni', 3, 109, 4, 1000, NULL, NULL, NULL),
	(143, '18', 'Korek Api', 3, 110, 10, 1500, NULL, NULL, NULL);
/*!40000 ALTER TABLE `data_menus` ENABLE KEYS */;


# Dumping structure for table db_test.data_menus_bahanpembentuk
DROP TABLE IF EXISTS `data_menus_bahanpembentuk`;
CREATE TABLE IF NOT EXISTS `data_menus_bahanpembentuk` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_menu` int(10) DEFAULT NULL,
  `id_subjenismenu` int(10) DEFAULT NULL,
  `banyak` float DEFAULT NULL,
  `id_Satuan` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

# Dumping data for table db_test.data_menus_bahanpembentuk: ~2 rows (approximately)
/*!40000 ALTER TABLE `data_menus_bahanpembentuk` DISABLE KEYS */;
INSERT INTO `data_menus_bahanpembentuk` (`id`, `id_menu`, `id_subjenismenu`, `banyak`, `id_Satuan`) VALUES
	(2, 74, 14, 1, 3),
	(3, 2, 45, 1, 3);
/*!40000 ALTER TABLE `data_menus_bahanpembentuk` ENABLE KEYS */;


# Dumping structure for table db_test.data_modal
DROP TABLE IF EXISTS `data_modal`;
CREATE TABLE IF NOT EXISTS `data_modal` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tgl` date DEFAULT NULL,
  `besar` double DEFAULT NULL,
  `id_pegawai` int(10) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `tgl_edit` datetime DEFAULT NULL,
  `is_daritutupbuku` int(1) DEFAULT NULL,
  `id_tutupbuku` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

# Dumping data for table db_test.data_modal: 2 rows
/*!40000 ALTER TABLE `data_modal` DISABLE KEYS */;
INSERT INTO `data_modal` (`id`, `tgl`, `besar`, `id_pegawai`, `keterangan`, `tgl_edit`, `is_daritutupbuku`, `id_tutupbuku`) VALUES
	(10, '2010-08-22', 10000000, 3, NULL, NULL, NULL, NULL),
	(12, '2010-08-31', 3000, 3, 'Modal dari pendapatan tgl: 30-08-2010', NULL, 1, 2);
/*!40000 ALTER TABLE `data_modal` ENABLE KEYS */;


# Dumping structure for table db_test.data_pegawai
DROP TABLE IF EXISTS `data_pegawai`;
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

# Dumping data for table db_test.data_pegawai: 3 rows
/*!40000 ALTER TABLE `data_pegawai` DISABLE KEYS */;
INSERT INTO `data_pegawai` (`id`, `nama`, `alamat`, `notlp`, `password`, `IsOperator`, `IsActive`, `privilege`, `isSinuhun`, `tgl_edit`) VALUES
	(1, 'sodik', NULL, NULL, '1468', 1, 1, ';100;101;102;103;104;105;106;107;200;300;301;302;303;304;305;306;307;308;400;450;451;452;453;454;455;500;501;502;503;504;505;506', 1, NULL),
	(2, 'HUSNUL', NULL, NULL, 'HUSNUL', 1, 1, ';100;101;102;104;105;106;107;300;301;305;306;500;501;502;503;504;505', NULL, NULL),
	(3, '1', NULL, NULL, NULL, 1, 1, ';100;101;102;103;104;105;106;107;200;300;301;302;303;304;305;306;307;308;400;410;411;412;420;421;422;430;431;432;450;451;452;453;454;455;456;457;500;501;502;503;504;505;506;507', 1, NULL);
/*!40000 ALTER TABLE `data_pegawai` ENABLE KEYS */;


# Dumping structure for table db_test.data_pendapatan
DROP TABLE IF EXISTS `data_pendapatan`;
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COMMENT='0->pake_meja,1->penjualan_langsung,2->lain2 ';

# Dumping data for table db_test.data_pendapatan: 2 rows
/*!40000 ALTER TABLE `data_pendapatan` DISABLE KEYS */;
INSERT INTO `data_pendapatan` (`id`, `typependapatan`, `id_meja`, `tgl`, `id_pegawai`, `keterangan`, `struk`, `bayar`, `datetimeposted`, `tgl_edit`) VALUES
	(5, 0, 1, '2010-09-02', 3, NULL, '1/0-1/02092010', 150000, '2010-09-02 01:03:17', NULL),
	(6, 0, 1, '2010-09-02', 3, NULL, '1/1-1/02092010', 8000, '2010-09-02 06:28:42', NULL);
/*!40000 ALTER TABLE `data_pendapatan` ENABLE KEYS */;


# Dumping structure for table db_test.data_pengeluaran
DROP TABLE IF EXISTS `data_pengeluaran`;
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

# Dumping data for table db_test.data_pengeluaran: 1 rows
/*!40000 ALTER TABLE `data_pengeluaran` DISABLE KEYS */;
INSERT INTO `data_pengeluaran` (`id`, `item`, `id_satuan`, `banyak`, `harga_satuan`, `keterangan`, `tgl`, `id_pegawai`, `isBahanUtama`, `id_subjenismenu`, `tgl_edit`) VALUES
	(3, 'Pembelian: KEPITING', 1, 1, 50000, '', '2010-09-01', 3, 1, 2, NULL);
/*!40000 ALTER TABLE `data_pengeluaran` ENABLE KEYS */;


# Dumping structure for table db_test.data_perubahan
DROP TABLE IF EXISTS `data_perubahan`;
CREATE TABLE IF NOT EXISTS `data_perubahan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_pegawai` int(10) DEFAULT NULL,
  `Nama_pemberi_ijin` varchar(100) DEFAULT NULL,
  `tgl` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `keterangan` varchar(200) DEFAULT NULL,
  `tgl_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;

# Dumping data for table db_test.data_perubahan: 32 rows
/*!40000 ALTER TABLE `data_perubahan` DISABLE KEYS */;
INSERT INTO `data_perubahan` (`id`, `id_pegawai`, `Nama_pemberi_ijin`, `tgl`, `keterangan`, `tgl_edit`) VALUES
	(45, 3, '', '2010-08-18 21:53:35', 'Satuan Konversi\r\nSatuan Konversi: Gram\r\nSatuan Dasar   : Gram\r\n', NULL),
	(46, 3, '', '2010-08-18 21:55:08', 'Delete History Pendapatan: \r\nNo.struk: 1/0-1/18082010\r\nTotal   : 53.500\r\n', NULL),
	(47, 3, '', '2010-08-31 07:11:20', 'Delete Sub Jenis Menu:FRUIT TEA 235ML\r\n', NULL),
	(48, 3, '', '2010-08-31 23:54:19', 'Delete Data Bahan Pembentuk\r\nItem         :Kopi ABC Susu 31g\r\nSatuan       :Bungkus\r\nBanyak       :1\r\n', NULL),
	(49, 3, '', '2010-09-01 01:46:21', 'Delete History Pendapatan: \r\nNo.struk: 1/0-1/01092010\r\nTotal   : 8.000\r\n', NULL),
	(50, 3, '', '2010-09-01 01:55:58', 'Satuan Konversi\r\nSatuan Konversi: KG\r\nSatuan Dasar   : KG\r\n', NULL),
	(51, 3, '', '2010-09-01 01:56:41', 'Delete History Pendapatan: \r\nNo.struk: 1/0-1/01092010\r\nTotal   : 8.000\r\n', NULL),
	(52, 3, '', '2010-09-01 01:57:21', 'Delete CatatanPembelianBahanUtama:\r\nSubjenis     :KEPITING\r\nSatuan       :KG\r\nbanyak       :10\r\nharga Satuan :50000\r\nKeterangan   :\r\n', NULL),
	(53, 3, '', '2010-09-01 02:13:51', 'Satuan Konversi\r\nSatuan Konversi: KG\r\nSatuan Dasar   : KG\r\n', NULL),
	(54, 3, '', '2010-09-01 04:13:36', 'Satuan Konversi\r\nSatuan Konversi: KG\r\nSatuan Dasar   : KG\r\n', NULL),
	(55, 3, '', '2010-09-01 04:15:19', 'Satuan Konversi\r\nSatuan Konversi: KG\r\nSatuan Dasar   : KG\r\n', NULL),
	(56, 3, '', '2010-09-01 04:17:25', 'Satuan Konversi\r\nSatuan Konversi: KG\r\nSatuan Dasar   : KG\r\n', NULL),
	(57, 3, '', '2010-09-01 04:19:05', 'Satuan Konversi\r\nSatuan Konversi: Ons\r\nSatuan Dasar   : Ons\r\n', NULL),
	(58, 3, '', '2010-09-01 04:23:17', 'Satuan Konversi\r\nSatuan Konversi: KG\r\nSatuan Dasar   : KG\r\n', NULL),
	(59, 3, '', '2010-09-01 22:30:04', 'Delete CatatanPembelianBahanUtama:\r\nSubjenis     :KEPITING\r\nSatuan       :Ons\r\nbanyak       :1\r\nharga Satuan :50000\r\nKeterangan   :\r\n', NULL),
	(60, 3, '', '2010-09-01 22:30:06', 'Delete CatatanPembelianBahanUtama:\r\nSubjenis     :KEPITING\r\nSatuan       :Ons\r\nbanyak       :10\r\nharga Satuan :50000\r\nKeterangan   :\r\n', NULL),
	(61, 3, '', '2010-09-01 22:30:45', 'Delete Perubahan Stok:\r\nPengurangan  :TIDAK\r\nSubjenis     :KEPITING\r\nSatuan       :KG\r\nbanyak       :1\r\nharga Satuan :50000\r\nKeterangan   :\r\n', NULL),
	(62, 3, '', '2010-09-01 22:40:17', 'Delete History Pendapatan: \r\nNo.struk: 1/0-1/01092010\r\nTotal   : 8.000\r\n', NULL),
	(63, 3, '', '2010-09-01 22:46:28', 'Delete History Pendapatan: \r\nNo.struk: 1/1-1/01092010\r\nTotal   : 8.000\r\n', NULL),
	(64, 3, '', '2010-09-01 22:46:30', 'Delete History Pendapatan: \r\nNo.struk: 1/2-1/01092010\r\nTotal   : 8.000\r\n', NULL),
	(65, 3, '', '2010-09-01 22:46:32', 'Delete History Pendapatan: \r\nNo.struk: 1/0-1/01092010\r\nTotal   : 8.000\r\n', NULL),
	(66, 3, '', '2010-09-01 22:52:31', 'Satuan Konversi\r\nSatuan Konversi: KG\r\nSatuan Dasar   : KG\r\n', NULL),
	(67, 3, '', '2010-09-01 22:55:22', 'Satuan Konversi\r\nSatuan Konversi: KG\r\nSatuan Dasar   : KG\r\n', NULL),
	(68, 3, '', '2010-09-01 22:58:42', 'Satuan Konversi\r\nSatuan Konversi: KG\r\nSatuan Dasar   : KG\r\n', NULL),
	(69, 3, '', '2010-09-01 22:59:18', 'Satuan Konversi\r\nSatuan Konversi: KG\r\nSatuan Dasar   : KG\r\n', NULL),
	(70, 3, '', '2010-09-01 23:00:19', 'Satuan Konversi\r\nSatuan Konversi: KG\r\nSatuan Dasar   : KG\r\n', NULL),
	(71, 3, '', '2010-09-01 23:00:57', 'Satuan Konversi\r\nSatuan Konversi: KG\r\nSatuan Dasar   : KG\r\n', NULL),
	(72, 3, '', '2010-09-01 23:01:42', 'Satuan Konversi\r\nSatuan Konversi: KG\r\nSatuan Dasar   : KG\r\n', NULL),
	(73, 3, '', '2010-09-01 23:06:04', 'Satuan Konversi\r\nSatuan Konversi: KG\r\nSatuan Dasar   : KG\r\n', NULL),
	(74, 3, '', '2010-09-01 23:06:31', 'Satuan Konversi\r\nSatuan Konversi: KG\r\nSatuan Dasar   : KG\r\n', NULL),
	(75, 3, '', '2010-09-02 01:06:50', 'Perubahan Harga satuan (dalam mode Edit dengan id:5) KEPITING - REBUS\r\nDari    : 8000\r\nMenjadi : 1500\r\n', NULL),
	(76, 3, '', '2010-09-02 06:49:03', 'Perubahan Harga satuan KEPITING - GORENG MENTEGA\r\nDari    : 8000\r\nMenjadi : 9000\r\n', NULL);
/*!40000 ALTER TABLE `data_perubahan` ENABLE KEYS */;


# Dumping structure for table db_test.data_perubahan_stok
DROP TABLE IF EXISTS `data_perubahan_stok`;
CREATE TABLE IF NOT EXISTS `data_perubahan_stok` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `id_subjenismenu` int(10) DEFAULT NULL,
  `id_pendapatan` int(11) DEFAULT NULL,
  `banyak` float NOT NULL DEFAULT '0',
  `id_satuan` int(11) NOT NULL,
  `harga_satuan` double NOT NULL DEFAULT '0',
  `alasan` varchar(200) NOT NULL DEFAULT '0',
  `id_pegawai` int(10) DEFAULT NULL,
  `is_pengurangan` int(1) DEFAULT NULL,
  `tgl_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

# Dumping data for table db_test.data_perubahan_stok: ~1 rows (approximately)
/*!40000 ALTER TABLE `data_perubahan_stok` DISABLE KEYS */;
INSERT INTO `data_perubahan_stok` (`id`, `tgl`, `id_subjenismenu`, `id_pendapatan`, `banyak`, `id_satuan`, `harga_satuan`, `alasan`, `id_pegawai`, `is_pengurangan`, `tgl_edit`) VALUES
	(2, '2010-09-01', 2, NULL, 1, 1, 50000, '', 3, 0, NULL);
/*!40000 ALTER TABLE `data_perubahan_stok` ENABLE KEYS */;


# Dumping structure for table db_test.data_satuan
DROP TABLE IF EXISTS `data_satuan`;
CREATE TABLE IF NOT EXISTS `data_satuan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  `isBase` int(1) DEFAULT NULL,
  `tgl_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

# Dumping data for table db_test.data_satuan: 13 rows
/*!40000 ALTER TABLE `data_satuan` DISABLE KEYS */;
INSERT INTO `data_satuan` (`id`, `nama`, `isBase`, `tgl_edit`) VALUES
	(1, 'KG', 0, NULL),
	(2, 'Porsi', 1, NULL),
	(3, 'Botol', 1, NULL),
	(4, 'Bungkus', 1, NULL),
	(5, 'Ons', 1, NULL),
	(6, 'LUSIN', 0, NULL),
	(7, 'Gram', 1, NULL),
	(8, 'Pak', 1, NULL),
	(9, 'Gelas', 1, NULL),
	(10, 'Biji', 1, NULL),
	(11, 'Kaleng', 1, NULL),
	(12, 'Dus', 0, NULL),
	(13, 'Buah', 1, NULL);
/*!40000 ALTER TABLE `data_satuan` ENABLE KEYS */;


# Dumping structure for table db_test.data_satuankonv
DROP TABLE IF EXISTS `data_satuankonv`;
CREATE TABLE IF NOT EXISTS `data_satuankonv` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_dasar` int(10) DEFAULT NULL,
  `id_konversi` int(10) DEFAULT NULL,
  `pengali` float DEFAULT NULL,
  `tgl_edit` datetime DEFAULT NULL,
  `isOtomatis` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

# Dumping data for table db_test.data_satuankonv: 19 rows
/*!40000 ALTER TABLE `data_satuankonv` DISABLE KEYS */;
INSERT INTO `data_satuankonv` (`id`, `id_dasar`, `id_konversi`, `pengali`, `tgl_edit`, `isOtomatis`) VALUES
	(1, 2, 2, 1, NULL, 1),
	(2, 3, 3, 1, NULL, 1),
	(3, 4, 4, 1, NULL, 1),
	(4, 5, 5, 1, NULL, 1),
	(24, 7, 7, 1, NULL, 1),
	(6, 8, 8, 1, NULL, 1),
	(7, 9, 9, 1, NULL, 1),
	(8, 10, 10, 1, NULL, 1),
	(9, 11, 11, 1, NULL, 1),
	(10, 13, 13, 1, NULL, 1),
	(11, 1, 1, 1, NULL, 1),
	(12, 6, 6, 1, NULL, 1),
	(13, 12, 12, 1, NULL, 1),
	(20, 5, 1, 10, NULL, 0),
	(21, 1, 5, 0.1, NULL, 1),
	(40, 7, 1, 1000, NULL, 0),
	(41, 1, 7, 0.001, NULL, 1),
	(42, 7, 5, 100, NULL, 0),
	(43, 5, 7, 0.01, NULL, 1);
/*!40000 ALTER TABLE `data_satuankonv` ENABLE KEYS */;


# Dumping structure for table db_test.data_subjenismenu
DROP TABLE IF EXISTS `data_subjenismenu`;
CREATE TABLE IF NOT EXISTS `data_subjenismenu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  `isBarcode` int(1) DEFAULT NULL,
  `Barcode` varchar(100) DEFAULT NULL,
  `id_satuan_laporan` int(10) DEFAULT NULL,
  `is_stok` int(1) DEFAULT NULL,
  `tgl_edit` datetime DEFAULT NULL,
  `is_NonMenu` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=latin1;

# Dumping data for table db_test.data_subjenismenu: 93 rows
/*!40000 ALTER TABLE `data_subjenismenu` DISABLE KEYS */;
INSERT INTO `data_subjenismenu` (`id`, `nama`, `sort`, `isBarcode`, `Barcode`, `id_satuan_laporan`, `is_stok`, `tgl_edit`, `is_NonMenu`) VALUES
	(1, '', 11, 0, NULL, 0, NULL, NULL, NULL),
	(2, 'KEPITING', 1, 0, NULL, 1, 1, NULL, NULL),
	(3, 'CUMI', 2, 0, NULL, 1, 1, NULL, NULL),
	(4, 'UDANG', 3, 0, NULL, 1, 1, NULL, NULL),
	(5, 'IKAN LAUT', 4, 0, NULL, 1, 1, NULL, NULL),
	(6, 'GURAME', 5, 0, NULL, 1, 1, NULL, NULL),
	(7, 'LALAPAN', 7, 0, NULL, 0, 0, NULL, NULL),
	(8, 'KERANG', 6, 0, NULL, 1, 1, NULL, NULL),
	(9, 'NASI', 8, 0, NULL, NULL, 0, NULL, NULL),
	(10, 'HIU', 6, 0, NULL, 1, 1, NULL, NULL),
	(12, 'SUSU MANIS', 11, 1, '8992702000179', 12, 1, NULL, NULL),
	(13, 'KECAP MANIS INDOFOOD 600ML', 12, 1, '089686420678', 12, 1, NULL, NULL),
	(14, 'SPRITE 250ML', 13, 1, '8992761111533', 11, 1, NULL, NULL),
	(15, 'FANTA STRAWBERY 250ML', 14, 1, '8992761111540', 11, 1, NULL, NULL),
	(16, 'COCA COLA 250 ML', 15, 1, '8992761111519', 11, 1, NULL, NULL),
	(17, 'COCA COLA 1 LITER', 16, 1, '8992761136161', 3, 1, NULL, NULL),
	(18, 'PULPY ORANGE 350 ML', 17, 1, '8992761166038', 3, 1, NULL, NULL),
	(19, 'FRESTEA MARKISA 500 ML', 18, 1, '8992761122348', 3, 1, NULL, NULL),
	(20, 'KRATINDAENG Energy Drink 150 ML', 19, 1, '8886057883665', 3, 1, NULL, NULL),
	(21, 'HEMAVITON Energy Drink 150 ML', 20, 1, '8999908034205', 3, 1, NULL, NULL),
	(22, 'ISOTONIK ORANGE', 21, 1, '8992761122386', 3, 1, NULL, NULL),
	(23, 'SAMPOERNA MILD 16', 22, 1, '8999909096004', 4, 1, NULL, NULL),
	(24, 'Country Merah', 23, 1, '8998127533124', 4, 1, NULL, NULL),
	(25, 'Ardath', 24, 1, '89981801', 4, 1, NULL, NULL),
	(26, 'Malboro Merah', 25, 1, '76164217', 4, 1, NULL, NULL),
	(27, 'Malboro Putih', 26, 1, '76239878', 4, 1, NULL, NULL),
	(28, 'Dji Sam Soe', 27, 1, '8999909028234', 4, 1, NULL, NULL),
	(29, 'Djarum 76', 28, 1, '8991906101668', 4, 1, NULL, NULL),
	(30, 'Djarum Super', 29, 1, '8991906101019', 4, 1, NULL, NULL),
	(31, 'Djarum Black', 30, 1, '8991906101118', 4, 1, NULL, NULL),
	(32, 'L.A Lights 16', 31, 1, '8991906101057', 4, 1, NULL, NULL),
	(33, 'Surya 12 Premium', 20, 1, '8998989300063', 4, 1, NULL, NULL),
	(34, 'Surya 12', 21, 1, '8998989110129', 4, 1, NULL, NULL),
	(35, 'G.G Inter', 22, 1, '8998989100120', 4, 1, NULL, NULL),
	(36, 'Tali Jagat Filter', 23, 1, '8998127611136', 4, 1, NULL, NULL),
	(37, 'Tali Jagat Kretek', 24, 1, '8998127622132', 4, 1, NULL, NULL),
	(39, 'ISOTONIK LEMON', 26, 1, '8992761122379', 3, 1, NULL, NULL),
	(40, 'POCARI SWEAT', 27, 1, '8997035563414', 3, 1, NULL, NULL),
	(41, 'FANTA  BLUEBERY 250 ML', 28, 1, '8992761111595', 4, 1, NULL, NULL),
	(42, 'COUNTRY CHOICE GUAVA 250 ML', 29, 1, '8994116101190', 10, 1, NULL, NULL),
	(43, 'COUNTRY CHOICE JERUK 250 ML', 30, 1, '8994116101176', 10, 1, NULL, NULL),
	(44, 'AQUA 240 ML', 31, 1, '8886008101046', 9, 1, NULL, NULL),
	(45, 'AQUA 600 ML', 32, 1, '8886008101053', 3, 1, NULL, NULL),
	(46, 'MARSHOF 220 ML', 33, 1, '8997001970079', 9, 1, NULL, NULL),
	(47, 'LEO Nacho Cheese', 34, 1, '8992775511602', 4, 1, NULL, NULL),
	(48, 'LEO Potato Crisps', 35, 1, '8992775511206', 4, 1, NULL, NULL),
	(66, 'SUSU COKLAT', 53, 1, '8992702000063', 11, 1, NULL, NULL),
	(69, 'Class Mild', 54, 1, '8993989311699', 4, 1, NULL, NULL),
	(70, 'Class Mild Menthol', 55, 1, '8993989511679', 4, 1, NULL, NULL),
	(71, 'Masako 9g', NULL, 1, '8992770035127', 12, 1, NULL, 1),
	(72, 'Teh Sari Wangi 9.25g', NULL, 1, '8999999193522', 12, 1, NULL, 1),
	(73, 'Sabun Colek BuKrim 300g', NULL, 1, '8893335515293', 12, 1, NULL, 1),
	(74, 'Penyedap SASA 250 ML', NULL, 1, '8991188943062', 12, 1, NULL, 1),
	(75, 'Tepung Bumbu Sajiku 42g', NULL, 1, '8992770061034', 12, 1, NULL, 1),
	(76, 'Garam Halus DAUN 250g', NULL, 1, '8993226302503', 12, 1, NULL, 1),
	(77, 'Kopi ABC Susu 31g', NULL, 1, '8991002101630', 12, 1, NULL, 1),
	(78, 'Kopi ABC Plus 31g', NULL, 1, '8991002101265', 12, 1, NULL, 1),
	(79, 'Hemaviton Jreng 4g', NULL, 1, '8999908045805', 12, 1, NULL, 1),
	(80, 'Extra Joss Active 4g', NULL, 1, '8993058000653', 12, 1, NULL, 1),
	(81, 'Super Pell Pine Essence 800 ML', NULL, 1, '8999999406974', 10, 1, NULL, 1),
	(82, 'Super Pell Secret Garden 800 ML', NULL, 1, '8999999406998', 10, 1, NULL, 1),
	(83, 'Super Pell Fresh Apples 800 ML', NULL, 1, '8999999406929', 10, 1, NULL, 1),
	(84, 'Sunlight 200 ML', NULL, 1, '8999999390419', 10, 1, NULL, 1),
	(86, 'Sirup Indofood Cocopandan 650 ML', NULL, 1, '089686834109', 3, 1, NULL, 1),
	(87, 'Saos Raja Rasa 600 ML', NULL, 1, '8997151800011', 3, 1, NULL, 1),
	(88, 'Saus Tiram ABC 425 ML', NULL, 1, '711844140011', 3, 1, NULL, 1),
	(89, 'Kecap Asin ABC 135 ML', NULL, 1, '711844115057', 3, 1, NULL, 1),
	(90, 'Multie Tissue 8 Rolls', NULL, NULL, NULL, 10, 1, NULL, 1),
	(91, 'FRESTEA APEL 500 ML ', 76, 1, '8992761122331', 3, 1, NULL, NULL),
	(92, 'FRESTEA LEMON 500 ML ', 77, 1, '8992761122355', 3, 1, NULL, NULL),
	(94, 'KORO GURIH', 79, 1, '2', 4, 1, NULL, NULL),
	(93, 'Molen', 78, 1, '1', 4, 1, NULL, NULL),
	(95, 'Sale Pisang', 80, 1, '3', 4, 1, NULL, NULL),
	(96, 'Melinjo Manis', 81, 1, '4', 4, 1, NULL, NULL),
	(97, 'Keciput Putih', 82, 1, '5', 4, 1, NULL, NULL),
	(98, 'Keciput Hitam', 83, 1, '6', 4, 1, NULL, NULL),
	(99, 'Teng Teng jahe', 84, 1, '7', 4, 1, NULL, NULL),
	(100, 'Teng Teng kacang', 85, 1, '8', 4, 1, NULL, NULL),
	(101, 'Kerupuk Kotak', 86, 1, '9', 4, 1, NULL, NULL),
	(102, 'Kerupuk Tengiri', 87, 1, '10', 4, 1, NULL, NULL),
	(103, 'Kerupuk Kemplang', 88, 1, '11', 4, 1, NULL, NULL),
	(104, 'Kerupuk Tempe Kecil', 89, 1, '12', 4, 1, NULL, NULL),
	(105, 'Kerupuk Tempe Besar', 90, 1, '13', 4, 1, NULL, NULL),
	(106, 'Rambak Kecil', 91, 1, '14', 4, 1, NULL, NULL),
	(107, 'Rambak Besar', 92, 1, '15', 4, 1, NULL, NULL),
	(108, 'Kerupuk Ikan Palembang', 93, 1, '16', 4, 1, NULL, NULL),
	(109, 'Makaroni', 94, 1, '17', 4, 1, NULL, NULL),
	(110, 'Korek Api', 95, 1, '18', 10, 1, NULL, NULL),
	(111, 'Tusuk Sate', NULL, NULL, NULL, 10, 1, NULL, 1),
	(112, 'Jeruk Buah', NULL, NULL, NULL, 10, 1, NULL, 1),
	(113, 'Jeruk Nipis', NULL, NULL, NULL, 10, 1, NULL, 1),
	(114, 'Kertas Minyak', NULL, NULL, NULL, 4, 1, NULL, 1),
	(115, 'xxxxxx', NULL, 1, '111111111', 1, 1, NULL, 1);
/*!40000 ALTER TABLE `data_subjenismenu` ENABLE KEYS */;


# Dumping structure for table db_test.data_tutupbuku
DROP TABLE IF EXISTS `data_tutupbuku`;
CREATE TABLE IF NOT EXISTS `data_tutupbuku` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tgl` date DEFAULT NULL,
  `id_pegawai` int(10) DEFAULT NULL,
  `bos` double DEFAULT NULL,
  `modal` double DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table db_test.data_tutupbuku: ~0 rows (approximately)
/*!40000 ALTER TABLE `data_tutupbuku` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_tutupbuku` ENABLE KEYS */;


# Dumping structure for table db_test.detail_pendapatan
DROP TABLE IF EXISTS `detail_pendapatan`;
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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

# Dumping data for table db_test.detail_pendapatan: 2 rows
/*!40000 ALTER TABLE `detail_pendapatan` DISABLE KEYS */;
INSERT INTO `detail_pendapatan` (`id`, `id_pendapatan`, `id_menu`, `harga_satuan`, `id_satuan`, `banyak`, `keterangan`, `tgl_edit`) VALUES
	(7, 5, 1, 1500, 7, 100, '', NULL),
	(8, 6, 2, 8000, 1, 1, '', NULL);
/*!40000 ALTER TABLE `detail_pendapatan` ENABLE KEYS */;


# Dumping structure for function db_test.func_GetKeteranganModalTambahan
DROP FUNCTION IF EXISTS `func_GetKeteranganModalTambahan`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `func_GetKeteranganModalTambahan`(`p_tgl` DATE) RETURNS varchar(100) CHARSET latin1
BEGIN
  declare result varchar(100);
  select keterangan into result 
  from data_modal 
  where tgl = p_tgl;
  return result;
END//
DELIMITER ;


# Dumping structure for function db_test.func_GetKirimKeBosOnTutupBuku
DROP FUNCTION IF EXISTS `func_GetKirimKeBosOnTutupBuku`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `func_GetKirimKeBosOnTutupBuku`(`p_tgl` DATE) RETURNS double
BEGIN
  declare result double;
  select bos into result
  from data_tutupbuku
  where tgl = p_tgl;
  return result;
END//
DELIMITER ;


# Dumping structure for function db_test.func_GetModalTerakhir
DROP FUNCTION IF EXISTS `func_GetModalTerakhir`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `func_GetModalTerakhir`() RETURNS double
BEGIN
  declare result double;
  select (sum(COALESCE(besar,0))-(select COALESCE(sum(banyak * harga_satuan),0)
                                  from data_pengeluaran)) into result
  from data_modal;
  return result;
END//
DELIMITER ;


# Dumping structure for function db_test.func_GetPendapatan
DROP FUNCTION IF EXISTS `func_GetPendapatan`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `func_GetPendapatan`(`p_tgl` DATE) RETURNS double
BEGIN
  declare result double;
  
  select sum(b.harga_satuan * b.banyak) into result
  from data_pendapatan a
  left join detail_pendapatan b
  on a.id = b.id_pendapatan
  where a.tgl = p_tgl;
  
  return result;
END//
DELIMITER ;


# Dumping structure for function db_test.func_GetPengaliBahanPembentuk
DROP FUNCTION IF EXISTS `func_GetPengaliBahanPembentuk`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `func_GetPengaliBahanPembentuk`(`p_idMenu_temp_pendapatan` INT, `p_idMeja_temp_pendapatan` INT) RETURNS float
BEGIN
  declare result double;
  
  select ifnull(cast(c.pengali as decimal(10,4)),0) into result
  from temp_pendapatan a
  
  left join data_menus d
  on a.id_menu = d.id
  
  left join data_satuankonv c
  on  d.id_satuan = c.id_dasar and
      a.id_satuan = c.id_konversi
  
  where a.id_meja = p_idMeja_temp_pendapatan and
        a.id_menu = p_idMenu_temp_pendapatan;
  
  return result;
END//
DELIMITER ;


# Dumping structure for function db_test.func_GetPengeluaran
DROP FUNCTION IF EXISTS `func_GetPengeluaran`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `func_GetPengeluaran`(`p_tgl` DATE) RETURNS double
BEGIN
  declare result double;
  
  select sum(banyak * harga_satuan) into result
  from data_pengeluaran
  where tgl =  p_tgl;
  
  return result; 
END//
DELIMITER ;


# Dumping structure for function db_test.func_GetStokKeluar
DROP FUNCTION IF EXISTS `func_GetStokKeluar`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `func_GetStokKeluar`(`p_tgl` DATE, `p_idSubJenis` INT) RETURNS double
BEGIN
  declare result double;
  
  select ifnull(sum(b.banyak  * cast(c.pengali as decimal(10,4))),0) into result
  from data_subjenismenu a
  
  left join data_menus e
  on a.id = e.id_subjenismenu
  
  left join detail_pendapatan b
  on e.id = b.id_menu
  
  left join data_pendapatan h
  on b.id_pendapatan = h.id
  
  left join data_satuankonv c
  on a.id_satuan_laporan = c.id_dasar and
     b.id_satuan = c.id_konversi
     
  where a.is_stok = 1 and
        h.tgl <= p_tgl and
        a.id = p_idSubJenis;
        
  return result;
END//
DELIMITER ;


# Dumping structure for function db_test.func_GetStokMasuk
DROP FUNCTION IF EXISTS `func_GetStokMasuk`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `func_GetStokMasuk`(`p_tgl` DATE, `p_idSubJenis` INT) RETURNS double
BEGIN
  declare result double;
  
  select ifnull(sum(a.banyak  * cast(c.pengali as decimal(10,4))),0) into result
  from data_pengeluaran a  
  
  left join data_subjenismenu b
  on a.id_subjenismenu = b.id

  
  left join data_satuankonv c
  on a.id_satuan = c.id_konversi  and
     b.id_satuan_laporan = c.id_dasar  
  
  where a.isBahanUtama = 1 and
        tgl <= p_tgl and
        a.id_subjenismenu =  p_idSubJenis;
        

  return result;    
END//
DELIMITER ;


# Dumping structure for function db_test.func_GetStokPenambahan
DROP FUNCTION IF EXISTS `func_GetStokPenambahan`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `func_GetStokPenambahan`(`p_tgl` DATE, `p_idSubJenis` INT) RETURNS double
BEGIN
  declare result double;
  
  select ifnull(sum(a.banyak  * cast(c.pengali as decimal(10,4))),0) into result
  from data_perubahan_stok a
  
  left join data_subjenismenu b
  on a.id_subjenismenu = b.id
    
  left join data_satuankonv c
  on a.id_satuan = c.id_konversi and 
     b.id_satuan_laporan = c.id_dasar 
	    
  where is_pengurangan = 0 and
        tgl <= p_tgl and
        a.id_subjenismenu = p_idSubJenis;
        
  return result;
END//
DELIMITER ;


# Dumping structure for function db_test.func_GetStokPengurangan
DROP FUNCTION IF EXISTS `func_GetStokPengurangan`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `func_GetStokPengurangan`(`p_tgl` DATE, `p_idSubJenis` INT) RETURNS double
BEGIN
  declare result double;
  
  select ifnull(sum(a.banyak  * cast(c.pengali as decimal(10,4))),0) into result
  from data_perubahan_stok a
  
  left join data_subjenismenu b
  on a.id_subjenismenu = b.id
    
  left join data_satuankonv c
  on a.id_satuan = c.id_konversi and 
     b.id_satuan_laporan = c.id_dasar 
	    
  where is_pengurangan = 1 and
        tgl <= p_tgl and
        a.id_subjenismenu = p_idSubJenis;
        
  return result;
END//
DELIMITER ;


# Dumping structure for function db_test.func_isUsesBahanPembentuk
DROP FUNCTION IF EXISTS `func_isUsesBahanPembentuk`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `func_isUsesBahanPembentuk`(`p_idMenu` INT) RETURNS int(11)
BEGIN
  declare result int;
  select count(id) into result
  from data_menus_bahanpembentuk
  where id_menu = p_idMenu;
  return result; 
END//
DELIMITER ;


# Dumping structure for function db_test.func_modal1
DROP FUNCTION IF EXISTS `func_modal1`;
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


# Dumping structure for function db_test.func_modal_baru_hrIni
DROP FUNCTION IF EXISTS `func_modal_baru_hrIni`;
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


# Dumping structure for table db_test.master_privilege
DROP TABLE IF EXISTS `master_privilege`;
CREATE TABLE IF NOT EXISTS `master_privilege` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `tgl_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Dumping data for table db_test.master_privilege: 0 rows
/*!40000 ALTER TABLE `master_privilege` DISABLE KEYS */;
/*!40000 ALTER TABLE `master_privilege` ENABLE KEYS */;


# Dumping structure for table db_test.temp_bahanpembentuk
DROP TABLE IF EXISTS `temp_bahanpembentuk`;
CREATE TABLE IF NOT EXISTS `temp_bahanpembentuk` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_meja` int(10) DEFAULT NULL,
  `id_menu` int(10) DEFAULT NULL,
  `id_subjenismenu` int(10) DEFAULT NULL,
  `banyak` float DEFAULT NULL,
  `id_Satuan` int(10) DEFAULT NULL,
  `isEditedItem` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

# Dumping data for table db_test.temp_bahanpembentuk: ~2 rows (approximately)
/*!40000 ALTER TABLE `temp_bahanpembentuk` DISABLE KEYS */;
INSERT INTO `temp_bahanpembentuk` (`id`, `id_meja`, `id_menu`, `id_subjenismenu`, `banyak`, `id_Satuan`, `isEditedItem`) VALUES
	(37, 1, 2, 45, 2, 3, 0),
	(38, 1, 74, 14, 2, 3, 0);
/*!40000 ALTER TABLE `temp_bahanpembentuk` ENABLE KEYS */;


# Dumping structure for table db_test.temp_pendapatan
DROP TABLE IF EXISTS `temp_pendapatan`;
CREATE TABLE IF NOT EXISTS `temp_pendapatan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_meja` int(10) DEFAULT NULL,
  `id_menu` int(10) DEFAULT NULL,
  `harga_satuan` double DEFAULT NULL,
  `id_satuan` int(10) DEFAULT NULL,
  `banyak` float DEFAULT NULL,
  `keterangan` varchar(200) DEFAULT NULL,
  `isEditedItem` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;

# Dumping data for table db_test.temp_pendapatan: 2 rows
/*!40000 ALTER TABLE `temp_pendapatan` DISABLE KEYS */;
INSERT INTO `temp_pendapatan` (`id`, `id_meja`, `id_menu`, `harga_satuan`, `id_satuan`, `banyak`, `keterangan`, `isEditedItem`) VALUES
	(87, 1, 74, 8000, 9, 1, '', 0),
	(86, 1, 2, 8000, 5, 2, '', 0);
/*!40000 ALTER TABLE `temp_pendapatan` ENABLE KEYS */;


# Dumping structure for table db_test.temp_priv
DROP TABLE IF EXISTS `temp_priv`;
CREATE TABLE IF NOT EXISTS `temp_priv` (
  `id_pegawai` int(10) DEFAULT NULL,
  `strPriv` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Dumping data for table db_test.temp_priv: 0 rows
/*!40000 ALTER TABLE `temp_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_priv` ENABLE KEYS */;


# Dumping structure for table db_test.temp_report_3
DROP TABLE IF EXISTS `temp_report_3`;
CREATE TABLE IF NOT EXISTS `temp_report_3` (
  `tgl` date DEFAULT NULL,
  `pengeluaran` double DEFAULT NULL,
  `pendapatan` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Dumping data for table db_test.temp_report_3: 30 rows
/*!40000 ALTER TABLE `temp_report_3` DISABLE KEYS */;
INSERT INTO `temp_report_3` (`tgl`, `pengeluaran`, `pendapatan`) VALUES
	('2010-09-01', 50000, 0),
	('2010-09-02', 0, 0),
	('2010-09-03', 0, 0),
	('2010-09-04', 0, 0),
	('2010-09-05', 0, 0),
	('2010-09-06', 0, 0),
	('2010-09-07', 0, 0),
	('2010-09-08', 0, 0),
	('2010-09-09', 0, 0),
	('2010-09-10', 0, 0),
	('2010-09-11', 0, 0),
	('2010-09-12', 0, 0),
	('2010-09-13', 0, 0),
	('2010-09-14', 0, 0),
	('2010-09-15', 0, 0),
	('2010-09-16', 0, 0),
	('2010-09-17', 0, 0),
	('2010-09-18', 0, 0),
	('2010-09-19', 0, 0),
	('2010-09-20', 0, 0),
	('2010-09-21', 0, 0),
	('2010-09-22', 0, 0),
	('2010-09-23', 0, 0),
	('2010-09-24', 0, 0),
	('2010-09-25', 0, 0),
	('2010-09-26', 0, 0),
	('2010-09-27', 0, 0),
	('2010-09-28', 0, 0),
	('2010-09-29', 0, 0),
	('2010-09-30', 0, 0);
/*!40000 ALTER TABLE `temp_report_3` ENABLE KEYS */;


# Dumping structure for table db_test.temp_report_stok
DROP TABLE IF EXISTS `temp_report_stok`;
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

# Dumping data for table db_test.temp_report_stok: ~90 rows (approximately)
/*!40000 ALTER TABLE `temp_report_stok` DISABLE KEYS */;
INSERT INTO `temp_report_stok` (`id_subjenismenu`, `nama_items`, `stok_masuk`, `stok_keluar`, `pengurangan_stok`, `penambahan_stok`, `nama_satuan`, `sort`) VALUES
	(81, 'Super Pell Pine Essence 800 ML', 0, 0, 0, 0, 'Biji', 0),
	(83, 'Super Pell Fresh Apples 800 ML', 0, 0, 0, 0, 'Biji', 0),
	(84, 'Sunlight 200 ML', 0, 0, 0, 0, 'Biji', 0),
	(86, 'Sirup Indofood Cocopandan 650 ML', 0, 0, 0, 0, 'Botol', 0),
	(87, 'Saos Raja Rasa 600 ML', 0, 0, 0, 0, 'Botol', 0),
	(111, 'Tusuk Sate', 0, 0, 0, 0, 'Biji', 0),
	(88, 'Saus Tiram ABC 425 ML', 0, 0, 0, 0, 'Botol', 0),
	(89, 'Kecap Asin ABC 135 ML', 0, 0, 0, 0, 'Botol', 0),
	(114, 'Kertas Minyak', 0, 0, 0, 0, 'Bungkus', 0),
	(113, 'Jeruk Nipis', 0, 0, 0, 0, 'Biji', 0),
	(112, 'Jeruk Buah', 0, 0, 0, 0, 'Biji', 0),
	(90, 'Multie Tissue 8 Rolls', 0, 0, 0, 0, 'Biji', 0),
	(115, 'xxxxxx', 0, 0, 0, 0, 'KG', 0),
	(82, 'Super Pell Secret Garden 800 ML', 0, 0, 0, 0, 'Biji', 0),
	(80, 'Extra Joss Active 4g', 0, 0, 0, 0, 'Dus', 0),
	(79, 'Hemaviton Jreng 4g', 0, 0, 0, 0, 'Dus', 0),
	(77, 'Kopi ABC Susu 31g', 0, 0, 0, 0, 'Dus', 0),
	(71, 'Masako 9g', 0, 0, 0, 0, 'Dus', 0),
	(76, 'Garam Halus DAUN 250g', 0, 0, 0, 0, 'Dus', 0),
	(75, 'Tepung Bumbu Sajiku 42g', 0, 0, 0, 0, 'Dus', 0),
	(74, 'Penyedap SASA 250 ML', 0, 0, 0, 0, 'Dus', 0),
	(73, 'Sabun Colek BuKrim 300g', 0, 0, 0, 0, 'Dus', 0),
	(72, 'Teh Sari Wangi 9.25g', 0, 0, 0, 0, 'Dus', 0),
	(78, 'Kopi ABC Plus 31g', 0, 0, 0, 0, 'Dus', 0),
	(2, 'KEPITING', 1, 0.1, 0, 1, 'KG', 1),
	(3, 'CUMI', 0, 0, 0, 0, 'KG', 2),
	(4, 'UDANG', 0, 0, 0, 0, 'KG', 3),
	(5, 'IKAN LAUT', 0, 0, 0, 0, 'KG', 4),
	(6, 'GURAME', 0, 0, 0, 0, 'KG', 5),
	(8, 'KERANG', 0, 0, 0, 0, 'KG', 6),
	(10, 'HIU', 0, 0, 0, 0, 'KG', 6),
	(12, 'SUSU MANIS', 0, 0, 0, 0, 'Dus', 11),
	(13, 'KECAP MANIS INDOFOOD 600ML', 0, 0, 0, 0, 'Dus', 12),
	(14, 'SPRITE 250ML', 0, 0, 0, 0, 'Kaleng', 13),
	(15, 'FANTA STRAWBERY 250ML', 0, 0, 0, 0, 'Kaleng', 14),
	(16, 'COCA COLA 250 ML', 0, 0, 0, 0, 'Kaleng', 15),
	(17, 'COCA COLA 1 LITER', 0, 0, 0, 0, 'Botol', 16),
	(18, 'PULPY ORANGE 350 ML', 0, 0, 0, 0, 'Botol', 17),
	(19, 'FRESTEA MARKISA 500 ML', 0, 0, 0, 0, 'Botol', 18),
	(20, 'KRATINDAENG Energy Drink 150 ML', 0, 0, 0, 0, 'Botol', 19),
	(21, 'HEMAVITON Energy Drink 150 ML', 0, 0, 0, 0, 'Botol', 20),
	(33, 'Surya 12 Premium', 0, 0, 0, 0, 'Bungkus', 20),
	(22, 'ISOTONIK ORANGE', 0, 0, 0, 0, 'Botol', 21),
	(34, 'Surya 12', 0, 0, 0, 0, 'Bungkus', 21),
	(35, 'G.G Inter', 0, 0, 0, 0, 'Bungkus', 22),
	(23, 'SAMPOERNA MILD 16', 0, 0, 0, 0, 'Bungkus', 22),
	(36, 'Tali Jagat Filter', 0, 0, 0, 0, 'Bungkus', 23),
	(24, 'Country Merah', 0, 0, 0, 0, 'Bungkus', 23),
	(25, 'Ardath', 0, 0, 0, 0, 'Bungkus', 24),
	(37, 'Tali Jagat Kretek', 0, 0, 0, 0, 'Bungkus', 24),
	(26, 'Malboro Merah', 0, 0, 0, 0, 'Bungkus', 25),
	(27, 'Malboro Putih', 0, 0, 0, 0, 'Bungkus', 26),
	(39, 'ISOTONIK LEMON', 0, 0, 0, 0, 'Botol', 26),
	(40, 'POCARI SWEAT', 0, 0, 0, 0, 'Botol', 27),
	(28, 'Dji Sam Soe', 0, 0, 0, 0, 'Bungkus', 27),
	(29, 'Djarum 76', 0, 0, 0, 0, 'Bungkus', 28),
	(41, 'FANTA  BLUEBERY 250 ML', 0, 0, 0, 0, 'Bungkus', 28),
	(30, 'Djarum Super', 0, 0, 0, 0, 'Bungkus', 29),
	(42, 'COUNTRY CHOICE GUAVA 250 ML', 0, 0, 0, 0, 'Biji', 29),
	(31, 'Djarum Black', 0, 0, 0, 0, 'Bungkus', 30),
	(43, 'COUNTRY CHOICE JERUK 250 ML', 0, 0, 0, 0, 'Biji', 30),
	(44, 'AQUA 240 ML', 0, 0, 0, 0, 'Gelas', 31),
	(32, 'L.A Lights 16', 0, 0, 0, 0, 'Bungkus', 31),
	(45, 'AQUA 600 ML', 0, 0, 0, 0, 'Botol', 32),
	(46, 'MARSHOF 220 ML', 0, 0, 0, 0, 'Gelas', 33),
	(47, 'LEO Nacho Cheese', 0, 0, 0, 0, 'Bungkus', 34),
	(48, 'LEO Potato Crisps', 0, 0, 0, 0, 'Bungkus', 35),
	(66, 'SUSU COKLAT', 0, 0, 0, 0, 'Kaleng', 53),
	(69, 'Class Mild', 0, 0, 0, 0, 'Bungkus', 54),
	(70, 'Class Mild Menthol', 0, 0, 0, 0, 'Bungkus', 55),
	(91, 'FRESTEA APEL 500 ML ', 0, 0, 0, 0, 'Botol', 76),
	(92, 'FRESTEA LEMON 500 ML ', 0, 0, 0, 0, 'Botol', 77),
	(93, 'Molen', 0, 0, 0, 0, 'Bungkus', 78),
	(94, 'KORO GURIH', 0, 0, 0, 0, 'Bungkus', 79),
	(95, 'Sale Pisang', 0, 0, 0, 0, 'Bungkus', 80),
	(96, 'Melinjo Manis', 0, 0, 0, 0, 'Bungkus', 81),
	(97, 'Keciput Putih', 0, 0, 0, 0, 'Bungkus', 82),
	(98, 'Keciput Hitam', 0, 0, 0, 0, 'Bungkus', 83),
	(99, 'Teng Teng jahe', 0, 0, 0, 0, 'Bungkus', 84),
	(100, 'Teng Teng kacang', 0, 0, 0, 0, 'Bungkus', 85),
	(101, 'Kerupuk Kotak', 0, 0, 0, 0, 'Bungkus', 86),
	(102, 'Kerupuk Tengiri', 0, 0, 0, 0, 'Bungkus', 87),
	(103, 'Kerupuk Kemplang', 0, 0, 0, 0, 'Bungkus', 88),
	(104, 'Kerupuk Tempe Kecil', 0, 0, 0, 0, 'Bungkus', 89),
	(105, 'Kerupuk Tempe Besar', 0, 0, 0, 0, 'Bungkus', 90),
	(106, 'Rambak Kecil', 0, 0, 0, 0, 'Bungkus', 91),
	(107, 'Rambak Besar', 0, 0, 0, 0, 'Bungkus', 92),
	(108, 'Kerupuk Ikan Palembang', 0, 0, 0, 0, 'Bungkus', 93),
	(109, 'Makaroni', 0, 0, 0, 0, 'Bungkus', 94),
	(110, 'Korek Api', 0, 0, 0, 0, 'Biji', 95);
/*!40000 ALTER TABLE `temp_report_stok` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
