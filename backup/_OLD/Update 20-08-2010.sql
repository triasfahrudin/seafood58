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

DROP FUNCTION IF EXISTS `func_modal_baru_hrIni`//
CREATE DEFINER=`root`@`localhost` FUNCTION `func_modal_baru_hrIni`(`p_tgl` DATE) RETURNS double
BEGIN
declare mdl double;
  select ifnull(sum(besar),0) into mdl
  from data_modal
  where tgl = p_tgl;
return mdl; 

END//
