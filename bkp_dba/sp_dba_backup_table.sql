DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_dba_backup_table`$$

CREATE PROCEDURE `sp_dba_backup_table`(
IN short_desc VARCHAR(255)       -- domain mapping or ticket#
,IN table_name VARCHAR(255)      -- table to backup
,IN table_short_name VARCHAR(17) -- short name for the table to backup
,IN joins VARCHAR(4000)          -- recommended especially if you are touching big tables
,IN where_clause VARCHAR(8000))  -- conditions

sproc:BEGIN

-- the total length of the short_desc and table_name (or table_short_name) must be 27 or less 
-- because of the length of the schemas that this procedure has to accomodate 
-- (geolearning_, geolearning_fit_, geolearningcourseware_)
DECLARE short_desc_and_nameMaxSize INT DEFAULT 27;

DECLARE Backuptable_nameSize INT DEFAULT 64;
DECLARE backup_type VARCHAR(16);
DECLARE remaining_chars INT;
DECLARE curSize INT;

DECLARE backup_table_name varchar(255);

SET backup_type = IF( fn_dba_is_workstation(), 'dba', 'file');

IF (TRIM(IFNULL(backup_type,'')) NOT IN ('dba','file') ) THEN
    SELECT 'First param was not valid, possible values (dba,file).' AS Msg;
    LEAVE sproc;
END IF;

SET table_short_name = IFNULL(table_short_name, '');

IF CHAR_LENGTH(table_short_name) = 0 THEN
    SET backup_table_name = table_name;
ELSE
    SET backup_table_name = table_short_name;
END IF;

SET @Backuptable_name = CONCAT(SCHEMA(),'_',short_desc,'_',backup_table_name,'_', DATE_FORMAT(NOW(),'%y%m%d_%H%i%s'));

IF backup_type = 'dba' THEN

    SET remaining_chars = short_desc_and_nameMaxSize - CHAR_LENGTH(short_desc);
    IF CHAR_LENGTH(backup_table_name) > remaining_chars THEN
        SET curSize = CHAR_LENGTH(short_desc) + CHAR_LENGTH(backup_table_name);
        IF CHAR_LENGTH(table_short_name) = 0 THEN
            SELECT CONCAT('WARNING: You must supply a short_table_name or shorten your short_desc since the total length of the table_name and your short_desc [',curSize,'] is greater than the maximum [', short_desc_and_nameMaxSize,'].') AS warning;
        ELSE
            SELECT CONCAT('WARNING: You must shorten the short_desc and/or short_table_name. You supplied [',curSize,'] charaters, which is greater than the maximum [',short_desc_and_nameMaxSize,'].') AS warning;
        END IF;
        LEAVE sproc;
    END IF;

    IF CHAR_LENGTH(@Backuptable_name) > Backuptable_nameSize THEN
        SELECT CONCAT('WARNING: Backup table name (',  @Backuptable_name, ') must not exceed ',Backuptable_nameSize,' chars, current size is [',CHAR_LENGTH(@Backuptable_name),'] chars!!!') AS warning;
    END IF;

    SET @SQL1 = CONCAT('CREATE TABLE IF NOT EXISTS DBA.`',@Backuptable_name,'` ENGINE=MYISAM
    SELECT ',SCHEMA(),'.',table_name,'.*
    FROM ',SCHEMA(),'.',table_name,'
    ',joins);

ELSE
    SET @SQL1 = CONCAT('SELECT ',SCHEMA(),'.',table_name,'.*
                        INTO OUTFILE \'/mysqlbackups/dba/',@Backuptable_name,'\'
                        FIELDS TERMINATED BY \',\'
                        OPTIONALLY ENCLOSED BY \'"\'
                        LINES TERMINATED BY \'\\r\\n\'
                        FROM
                        ',SCHEMA(),'.',table_name,'
                        ',joins);
END IF;

IF LENGTH(where_clause) > 0 THEN
    SET @SQL1 = CONCAT(@SQL1, ' WHERE ', where_clause);
END IF;

SET @SQL1 = CONCAT(@SQL1, ';');

PREPARE BackupStatement FROM @SQL1;
EXECUTE BackupStatement;
DEALLOCATE PREPARE BackupStatement;

END$$

DELIMITER ;