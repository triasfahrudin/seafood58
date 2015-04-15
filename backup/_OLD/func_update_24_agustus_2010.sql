# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.4.2-beta-community
# Server OS:                    Win32
# HeidiSQL version:             5.1.0.3496
# Date/time:                    2010-08-24 05:44:07
# --------------------------------------------------------

# Dumping structure for function pos_seafood58.func_GetModalTerakhir
DROP FUNCTION IF EXISTS `func_GetModalTerakhir`//
CREATE DEFINER=`root`@`localhost` FUNCTION `func_GetModalTerakhir`() RETURNS double
BEGIN
  declare result double;
  select (sum(COALESCE(besar,0))-(select COALESCE(sum(banyak * harga_satuan),0)
                                  from data_pengeluaran)) into result
  from data_modal;
  return result;
END//



# Dumping structure for function pos_seafood58.func_GetPendapatan
DROP FUNCTION IF EXISTS `func_GetPendapatan`//
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



# Dumping structure for function pos_seafood58.func_GetPengeluaran
DROP FUNCTION IF EXISTS `func_GetPengeluaran`//
CREATE DEFINER=`root`@`localhost` FUNCTION `func_GetPengeluaran`(`p_tgl` DATE) RETURNS double
BEGIN
  declare result double;
  
  select sum(banyak * harga_satuan) into result
  from data_pengeluaran
  where tgl =  p_tgl;
  
  return result; 
END//



# Dumping structure for function pos_seafood58.func_GetStokKeluar
DROP FUNCTION IF EXISTS `func_GetStokKeluar`//
CREATE DEFINER=`root`@`localhost` FUNCTION `func_GetStokKeluar`(`p_tgl` DATE, `p_idSubJenis` INT) RETURNS double
BEGIN
  declare result double;
  
  select ifnull((sum(b.banyak * c.pengali) / d.pengali),0) into result
  from data_subjenismenu a
  left join data_menus e
  on a.id = e.id_subjenismenu
  left join detail_pendapatan b
  on e.id = b.id_menu
  left join data_pendapatan h
  on b.id_pendapatan = h.id
  left join data_satuankonv c
  on b.id_satuan = c.id_konversi
  left join data_satuankonv d
  on a.id_satuan_laporan = d.id_konversi
  left join data_satuan f
  on a.id_satuan_laporan = f.id
  where a.is_stok = 1 and
        h.tgl <= p_tgl and
        a.id = p_idSubJenis;
        
  return result;
END//

# Dumping structure for function pos_seafood58.func_GetStokMasuk
DROP FUNCTION IF EXISTS `func_GetStokMasuk`//
CREATE DEFINER=`root`@`localhost` FUNCTION `func_GetStokMasuk`(`p_tgl` DATE, `p_idSubJenis` INT) RETURNS double
BEGIN
  declare result double;
  
  select ifnull(sum(a.banyak * b.pengali) / c.pengali,0) into result
  from data_pengeluaran a
  left join data_satuankonv b
  on a.id_satuan = b.id_konversi
  left join data_subjenismenu d
  on a.id_subjenismenu = d.id
  left join data_satuankonv c
  on  d.id_satuan_laporan = c.id_konversi
  where a.isBahanUtama = 1 and
        tgl <= p_tgl and
        a.id_subjenismenu = p_idSubJenis;
  
  return result;    
END//



# Dumping structure for function pos_seafood58.func_GetStokPenambahan
DROP FUNCTION IF EXISTS `func_GetStokPenambahan`//
CREATE DEFINER=`root`@`localhost` FUNCTION `func_GetStokPenambahan`(`p_tgl` DATE, `p_idSubJenis` INT) RETURNS double
BEGIN
  declare result double;
  
  select ifnull(sum(a.banyak * b.pengali) / c.pengali,0) into result
  from data_perubahan_stok a
  left join data_satuankonv b
  on a.id_satuan = b.id_konversi
  left join data_subjenismenu d
  on a.id_subjenismenu = d.id
  left join data_satuankonv c
  on  d.id_satuan_laporan = c.id_konversi
  where is_pengurangan = 0 and
        tgl <= p_tgl and
        a.id_subjenismenu = p_idSubJenis;
        
  return result;
END//



# Dumping structure for function pos_seafood58.func_GetStokPengurangan
DROP FUNCTION IF EXISTS `func_GetStokPengurangan`//
CREATE DEFINER=`root`@`localhost` FUNCTION `func_GetStokPengurangan`(`p_tgl` DATE, `p_idSubJenis` INT) RETURNS double
BEGIN
  declare result double;
  
  select ifnull(sum(a.banyak * b.pengali) / c.pengali,0) into result
  from data_perubahan_stok a
  left join data_satuankonv b
  on a.id_satuan = b.id_konversi
  left join data_subjenismenu d
  on a.id_subjenismenu = d.id
  left join data_satuankonv c
  on  d.id_satuan_laporan = c.id_konversi
  where is_pengurangan = 1 and
        tgl <= p_tgl and
        a.id_subjenismenu = p_idSubJenis;
        
  return result;
END//



# Dumping structure for function pos_seafood58.func_modal1
DROP FUNCTION IF EXISTS `func_modal1`//
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



# Dumping structure for function pos_seafood58.func_modal_baru_hrIni
DROP FUNCTION IF EXISTS `func_modal_baru_hrIni`//
CREATE DEFINER=`root`@`localhost` FUNCTION `func_modal_baru_hrIni`(`p_tgl` DATE) RETURNS double
BEGIN
declare mdl double;
  select ifnull(sum(besar),0) into mdl
  from data_modal
  where tgl = p_tgl;
return mdl; 

END//

