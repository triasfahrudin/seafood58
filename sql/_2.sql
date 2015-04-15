select a.nama as subjenismenu,
		 ifnull((sum(b.banyak * c.pengali) / d.pengali),0) as stok_tersisa, 
		 f.nama as nama_satuan
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


where a.is_stok = 1 
      /*and x.tgl <=:tgl*/

group by a.id
