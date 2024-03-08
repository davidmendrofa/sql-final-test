SELECT 
	mp.nama_pegawai,
	js.jumlah_so,
	mp.target,
	CASE
		WHEN js.jumlah_so < mp.target THEN 'ya'
		ELSE 'tidak'
	END AS kurang_dari_target
FROM ms_pegawai AS mp
LEFT JOIN
	(SELECT
		count(DISTINCT no_so) AS jumlah_so,
		kode_sales
	FROM tr_so
	GROUP BY 2
	) AS js ON mp.kode_pegawai = js.kode_sales
ORDER BY 1;
