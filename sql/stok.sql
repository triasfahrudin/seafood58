select a.nama,(sum(g.banyak * c.pengali) / d.pengali)  - (sum(b.banyak * c.pengali) / d.pengali), f.nama
from data_subjenismenu a

left join data_menus e
on a.id = e.id_subjenismenu

left join data_pengeluaran g
on e.id_subjenismenu = g.id_subjenismenu

left join detail_pendapatan b
on e.id = b.id_menu

left join data_satuankonv c
on b.id_satuan = c.id_konversi and
   g.id_satuan = c.id_konversi

left join data_satuankonv d
on a.id_satuan_laporan = d.id_konversi

left join data_satuan f
on a.id_satuan_laporan = f.id

where a.is_stok = 1
group by a.id