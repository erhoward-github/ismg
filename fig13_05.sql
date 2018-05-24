DROP PROCEDURE IF EXISTS fig13_05;

DELIMITER //

CREATE PROCEDURE fig13_05()
BEGIN
	DECLARE first_invoice_due_date DATE DEFAULT '1000-01-01';
    
    SELECT MIN(invoice_due_date)
    INTO first_invoice_due_date
    FROM invoices
    WHERE invoice_total - payment_total - credit_total > 0;
    
    IF first_invoice_due_date < NOW() THEN
		SELECT 'Outstanding invoices overdue. . .' AS 'Message';
    ELSEIF first_invoice_due_date = NOW() THEN
		SELECT 'Outstanding invoices are due today. . .' AS 'Message';
    ELSE
		SELECT 'No invoices overdue. . .' AS 'Message';
    END IF;

END//

DELIMITER ;

SELECT * 
FROM invoices
WHERE invoice_total - payment_total - credit_total > 0;

CALL fig13_05();
