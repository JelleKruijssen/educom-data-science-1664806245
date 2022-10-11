SELECT mhl_suppliers.name, mhl_suppliers.straat, mhl_suppliers.huisnr, mhl_suppliers.postcode FROM mhl_suppliers
INNER JOIN mhl_yn_properties ON mhl_suppliers.id = mhl_yn_properties.supplier_ID
    WHERE propertytype_ID IN (
        SELECT id FROM mhl_propertytypes WHERE name = 'ook voor particulieren')
    OR propertytype_ID IN (
        SELECT id FROM mhl_propertytypes WHERE name = 'specialistische leverancier');