# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.4.2-beta-community
# Server OS:                    Win32
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2011-07-29 14:41:47
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

SET @@global.max_sp_recursion_depth=255;
SET @@session.max_sp_recursion_depth=255;

# Dumping structure for table test.bilangan
DROP TABLE IF EXISTS `bilangan`;
CREATE TABLE IF NOT EXISTS `bilangan` (
  `id` int(11) NOT NULL,
  `Bilangan` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table test.bilangan: ~12 rows (approximately)
/*!40000 ALTER TABLE `bilangan` DISABLE KEYS */;
INSERT INTO `bilangan` (`id`, `Bilangan`) VALUES
	(0, ''),
	(1, 'Satu'),
	(2, 'Dua'),
	(3, 'Tiga'),
	(4, 'Empat'),
	(5, 'Lima'),
	(6, 'Enam'),
	(7, 'Tujuh'),
	(8, 'Delapan'),
	(9, 'Sembilan'),
	(10, 'Sepuluh'),
	(11, 'Sebelas');
/*!40000 ALTER TABLE `bilangan` ENABLE KEYS */;


# Dumping structure for procedure test.terbilang
DROP PROCEDURE IF EXISTS `terbilang`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `terbilang`(IN nilai INT, OUT output Text)
BEGIN
	DECLARE cetak TEXT default '';
	DECLARE temp TEXT default '';
		
		IF nilai < 12 then
			set cetak = concat((select bilangan from bilangan where id = nilai));			
		ELSE
			IF nilai >= 12 and nilai < 20 then
				call terbilang(nilai - 10,temp);
				set cetak = concat(temp, ' Belas');
			ELSE
				IF nilai >= 20 and nilai < 100 THEN
					call terbilang(floor(nilai/10),temp);				
					set cetak = concat(temp, ' Puluh ');
					call terbilang(ifnull(nilai % 10,0),temp);				
					set cetak  = concat(cetak ,temp );
				ELSE 
					IF nilai >= 100 and nilai < 200 THEN
						set cetak = 'Seratus';
						call terbilang(nilai % 100,temp);				
						set cetak  = concat(cetak, ' ', temp);
					ELSE 
						IF nilai >= 200 and nilai < 1000 then
							call terbilang(floor(nilai/100),temp);				
							set cetak = concat(temp, ' Ratus ');
							call terbilang(ifnull(nilai % 100,0),temp);				
							set cetak  = concat(cetak ,temp );
						ELSE
							IF nilai >= 1000 and nilai < 2000 THEN
								set cetak = 'Seribu';
								call terbilang(nilai % 1000,temp);				
								set cetak  = concat(cetak, ' ', temp);
							ELSE 
								IF nilai >= 2000 and nilai < 1000000 then
									call terbilang(floor(nilai/1000),temp);				
									set cetak = concat(temp, ' Ribu ');
									call terbilang(ifnull(nilai % 1000,0),temp);				
									set cetak  = concat(cetak ,temp );
								ELSE 
									IF nilai >= 1000000 and nilai < 1000000000 THEN        
										call terbilang(floor(nilai/1000000),temp);				
										set cetak = concat(temp, ' Juta ');
										call terbilang(ifnull(nilai % 1000000,0),temp);				
										set cetak  = concat(cetak ,temp );

									ELSE
										IF nilai >= 1000000000 and nilai < 1000000000000 THEN        
											call terbilang(floor(nilai/1000000000),temp);				
											set cetak = concat(temp, ' Milyar ');
											call terbilang(ifnull(nilai % 1000000000,0),temp);				
											set cetak  = concat(cetak ,temp );
										END IF;
									END IF;
								END IF;
							END IF;
						END IF;
					END IF;
				END IF;

			END IF;
		END IF;

	set output = cetak;

        END//
DELIMITER ;


# Dumping structure for function test.terbilang
DROP FUNCTION IF EXISTS `terbilang`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `terbilang`(nilai int) RETURNS text CHARSET latin1
BEGIN

	DECLARE temp TEXT default '';
	
	call terbilang(nilai, temp);

	return temp;
    END//
DELIMITER ;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
