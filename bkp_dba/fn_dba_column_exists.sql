delimiter $$

drop function if exists fn_dba_column_exists$$

create function fn_dba_column_exists(
     tablename varchar(255),
     columnname varchar(255)
   )
   returns boolean
   reads sql data
begin
  return ((select count(*)
       from information_schema.columns
       where table_name = tablename and table_schema = schema() and column_name = columnname
      ) != 0);
end$$

delimiter ;