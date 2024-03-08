SELECT 
    p1.nama AS nama1,
    p2.nama AS nama2,
    ABS(DATEDIFF(p1.tanggal_registrasi, p1.tanggal_lahir) - DATEDIFF(p2.tanggal_registrasi, p2.tanggal_lahir)) AS selisih
FROM 
    people p1
INNER JOIN 
    people p2 ON p1.nama < p2.nama
ORDER BY 3
LIMIT 1;
