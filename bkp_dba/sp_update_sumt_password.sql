DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_update_sumt_password`$$

CREATE PROCEDURE `sp_update_sumt_password`(IN _new_password VARCHAR(128))
BEGIN
	DECLARE _mapping  VARCHAR(512);
	
	DECLARE done BOOLEAN DEFAULT 0;
		
	DECLARE all_active_domains CURSOR FOR 
	SELECT mapping
	FROM domain
	WHERE STATUS = 'Active';
			
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

	DROP TABLE IF EXISTS m5_sumt_pwresult;
	CREATE TABLE m5_sumt_pwresult(
		domain VARCHAR(255),
		username VARCHAR(255),
		msg VARCHAR(512));
			
	OPEN all_active_domains;
	REPEAT
		FETCH all_active_domains INTO _mapping;
		IF NOT done THEN 
			CALL sp_change_password_unlock_account(_mapping, 'geositeadmin', _new_password, 'mass');
			CALL sp_change_password_unlock_account(_mapping, 'geoadmin', _new_password, 'mass');
			CALL sp_change_password_unlock_account(_mapping, 'geostudent', _new_password, 'mass');
		END IF;
		
	UNTIL done END REPEAT;
	
	SELECT * FROM m5_sumt_pwresult ORDER BY domain;

END$$

DELIMITER ;