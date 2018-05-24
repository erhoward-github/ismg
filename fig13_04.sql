DROP PROCEDURE IF EXISTS fig13_04;

DELIMITER //

CREATE PROCEDURE fig13_04()
BEGIN
	DECLARE max_invoice_total DECIMAL(9, 2) DEFAULT 0.00;
	DECLARE min_invoice_total DECIMAL(9, 2) DEFAULT 0.00;
	DECLARE percent_difference DECIMAL(9, 4) DEFAULT 0.00;
    DECLARE count_invoice_id INT DEFAULT 0;
    DECLARE vendor_id_var INT DEFAULT 0;
    
    SET vendor_id_var = 95;
    
    SELECT MAX(invoice_total), MIN(invoice_total), COUNT(invoice_id)
    INTO max_invoice_total, min_invoice_total, count_invoice_id
    FROM invoices 
    WHERE vendor_id = vendor_id_var;
    
    SET percent_difference = ((max_invoice_total - min_invoice_total) / min_invoice_total) * 100;
    
    SELECT 
		CONCAT('$', max_invoice_total) AS 'Maximum Invoice',
		CONCAT('$', min_invoice_total) AS 'Minimum Invoice',
		CONCAT(ROUND(percent_difference, 2), '%') AS 'Percent Difference',
		count_invoice_id AS 'Number of Invoices';
    
END//

DELIMITER ;

CALL fig13_04();
