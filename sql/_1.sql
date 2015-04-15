select a.tgl, a.id_subjenismenu, sum(a.banyak * b.pengali) / c.pengali as jumlah_masuk
from data_pengeluaran a
left join data_satuankonv b
on a.id_satuan = b.id_konversi
left join data_subjenismenu d
on a.id_subjenismenu = d.id
left join data_satuankonv c
on  d.id_satuan_laporan = c.id_konversi
where a.isBahanUtama = 1
group by a.id_subjenismenu,a.tgl
