SELECT DISTINCT  
	td.no_do,
	mc.kode_customer,
	td.tgl_do,
	CASE
		WHEN ts.satuan = 'krat' THEN ts.qty * 24
		WHEN ts.satuan = 'dus' THEN ts.qty * 30
		ELSE ts.qty
	END AS qty,
	CASE
		WHEN ts.satuan = 'krat' THEN CAST((mp.harga_satuan * (ts.qty * 24) * 1.1 + mc.ongkos_kirim) AS unsigned)
		WHEN ts.satuan = 'dus' THEN CAST((mp.harga_satuan * (ts.qty * 30) * 1.1 + mc.ongkos_kirim) AS unsigned)
		ELSE CAST((mp.harga_satuan * ts.qty * 1.1 + mc.ongkos_kirim) AS unsigned)	
	END AS amount
FROM
	tr_do AS td
LEFT JOIN tr_so AS ts ON td.no_entry_so = ts.no_entry_so
LEFT JOIN ms_customer AS mc ON mc.kode_customer = ts.kode_customer
LEFT JOIN ms_product AS mp ON mp.kode_produk = ts.kode_barang
ORDER BY 1;
