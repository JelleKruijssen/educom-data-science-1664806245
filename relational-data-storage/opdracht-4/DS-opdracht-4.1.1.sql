SELECT a.name, straat, huisnr, postcode  FROM mhl_suppliers a INNER JOIN mhl_cities b ON a.city_ID = b.id WHERE b.name = 'amsterdam'