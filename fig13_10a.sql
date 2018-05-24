DROP PROCEDURE IF EXISTS fig13_10a;

DELIMITER //

CREATE PROCEDURE fig13_10a()
BEGIN
	INSERT INTO general_ledger_accounts (account_number, account_description) VALUES (130, 'Cash');

	SELECT '1 row was inserted. . .';
END//

DELIMITER ;

SELECT account_number, account_description 
FROM general_ledger_accounts 
ORDER BY account_number;
