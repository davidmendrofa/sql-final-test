SELECT 
    node,
    CASE
        WHEN parent IS NULL THEN 'Akar'
        WHEN node NOT IN (SELECT DISTINCT parent FROM nodes WHERE parent IS NOT NULL) THEN 'Daun'
        ELSE 'Batang'
    END AS position
FROM 
    nodes
ORDER BY 1;
