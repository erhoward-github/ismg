DROP PROCEDURE IF EXISTS fig13_01;

DELIMITER //

CREATE PROCEDURE fig13_01()
BEGIN
	DECLARE sum_balance_due_var DECIMAL(9, 2) DEFAULT 0.00;
    
    SELECT SUM(invoice_total - payment_total - credit_total)
    INTO sum_balance_due_var
    FROM invoices
    WHERE vendor_id = 95;
    
    IF sum_balance_due_var > 0 THEN
		SELECT CONCAT('Balance due: $', sum_balance_due_var) AS message;
    ELSE
		SELECT 'Balance paid in full' AS message;
    END IF;
END//

DELIMITER ;

SELECT * FROM invoices;

CALL fig13_01();
