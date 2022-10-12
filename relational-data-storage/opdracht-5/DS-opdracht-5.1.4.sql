SELECT name, SUM(hitcount), COUNT(month), AVG(hitcount)
FROM mhl_hitcount
LEFT JOIN mhl_suppliers
ON mhl_hitcount.supplier_ID=mhl_suppliers.id
WHERE name IS NOT NULL
GROUP BY name
ORDER BY SUM(hitcount) DESC