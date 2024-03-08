SELECT
	td.no_do,
	tsx.nama_customer,
	td.tgl_do,
	DATE('2018-02-01') AS date_measurement,
	abs(datediff(td.tgl_do,DATE('2018-02-01'))) AS aging
FROM
	tr_do AS td
LEFT JOIN tr_inv AS ti ON td.no_entry_do = ti.no_entry_do
LEFT JOIN 
	(SELECT DISTINCT
		ms.nama_customer AS nama_customer,
		ts.no_entry_so AS no_entry_so,
		ts.kode_customer AS kode_customer
	FROM
		ms_customer AS ms
	INNER JOIN tr_so AS TS ON ms.kode_customer = ts.kode_customer
	) AS tsx ON tsx.no_entry_so = td.no_entry_so
WHERE td.no_entry_do NOT IN (SELECT no_entry_do FROM tr_inv)
ORDER BY 5 DESC, 1 ASC;
