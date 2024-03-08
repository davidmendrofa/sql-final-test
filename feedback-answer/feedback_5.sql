SELECT
	mv.vendor,
	sum(
		CASE 
			WHEN ts.satuan = 'krat' THEN CAST(mp.harga_satuan * (ts.qty * 24) AS UNSIGNED)
			WHEN ts.satuan = 'dus' THEN CAST(mp.harga_satuan * (ts.qty * 30) AS UNSIGNED)
			ELSE CAST(mp.harga_satuan * ts.qty AS UNSIGNED)
		END
	)AS amount
FROM
	ms_vendor AS mv
INNER JOIN ms_product AS mp ON mv.kode_vendor = mp.kode_vendor 
INNER JOIN tr_so AS ts ON mp.kode_produk = ts.kode_barang
INNER JOIN tr_do AS td ON ts.no_entry_so = td.no_entry_so 
INNER JOIN tr_inv AS ti ON td.no_entry_do = ti.no_entry_do 
GROUP BY 1
ORDER BY 2 DESC, 1 ASC
LIMIT 3;
