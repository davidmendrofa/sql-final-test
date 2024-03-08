SELECT 
    CAST(REGEXP_SUBSTR(strdata, '([0-9]{4}-[0-9]{2}-[0-9]{2})') AS DATE) tanggal,
    CASE 
        WHEN strdata LIKE '% lusin%' THEN CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(strdata, ' lusin', 1), ' ', -1) AS UNSIGNED) * 12
        ELSE CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(strdata, ' buah', 1), ' ', -1) AS UNSIGNED)
    END AS qty,
    CAST(
	    CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(strdata, 'seharga Rp ', -1), ' ', 1) AS UNSIGNED) / 
	    CASE 
	        WHEN strdata LIKE '% lusin%' THEN CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(strdata, ' lusin', 1), ' ', -1) AS UNSIGNED) * 12
	        ELSE CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(strdata, ' buah', 1), ' ', -1) AS UNSIGNED)
	    END AS UNSIGNED) AS harga_satuan,
    CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(strdata, 'seharga Rp ', -1), ' ', 1) AS UNSIGNED) AS total
FROM 
    strdata
ORDER BY 1;
