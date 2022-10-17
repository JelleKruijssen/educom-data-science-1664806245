CREATE OR REPLACE VIEW DIRECTIE AS 
	SELECT
		supplier_ID AS ID,
        mhl_contacts.name AS contact,
		contacttype AS functie,
        mhl_departments.name AS department
	FROM mhl_contacts
    LEFT JOIN mhl_departments ON mhl_departments.id=mhl_contacts.department
    WHERE IF (mhl_departments.name='Directie', TRUE, contacttype LIKE '%directeur%');
    
SELECT * FROM DIRECTIE;
    
    


	


