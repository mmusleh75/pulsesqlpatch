delimiter $$

drop function if exists fn_dba_index_exists$$

create function fn_dba_index_exists(
     tablename varchar(255),
     indexname varchar(255)
   )
   returns boolean
   reads sql data
begin
  return ((select 1
             from information_schema.statistics
             where
               table_schema = schema()
               and index_name = indexname
               and table_name = tablename
             limit 1
          ) <=> 1);
end$$

delimiter ;