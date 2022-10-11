SELECT name, straat, huisnr, postcode FROM mhl_suppliers
WHERE EXISTS (SELECT COUNT(*) FROM mhl_rubrieken INNER JOIN mhl_suppliers_mhl_rubriek_view WHERE mhl_suppliers.id=mhl_suppliers_mhl_rubriek_view.mhl_suppliers_ID AND mhl_suppliers_mhl_rubriek_view.mhl_rubriek_view_ID=mhl_rubrieken.id)
HAVING COUNT(*)=1