SELECT 
	mp.nama_product,
	SUM(
		CASE
			WHEN ts.satuan = 'krat' THEN ts.qty * 24
			WHEN ts.satuan = 'dus' THEN ts.qty * 30
			ELSE ts.qty
		END
	) AS qty
FROM
	tr_so AS ts
INNER JOIN ms_product AS mp ON ts.kode_barang = mp.kode_produk
GROUP BY 1
ORDER BY 2 DESC, 1 ASC
LIMIT 3;
