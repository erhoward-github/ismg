DROP PROCEDURE IF EXISTS fig13_03;

DELIMITER //

CREATE PROCEDURE fig13_03()
BEGIN
	SELECT 'This is a test. . .' AS message;
END//

DELIMITER ;

CALL fig13_03();
