DROP PROCEDURE IF EXISTS fig13_07;

DELIMITER //

CREATE PROCEDURE fig13_07()
BEGIN
	DECLARE i INT DEFAULT 1;
    DECLARE s VARCHAR(400) DEFAULT '';
    
    WHILE i < 4 DO
		SET s = CONCAT(s, 'i = ', i, ' | ');
        SET i = i + 1;
    END WHILE;
    
    SELECT s AS 'Message';
END//

DELIMITER ;

CALL fig13_07();
