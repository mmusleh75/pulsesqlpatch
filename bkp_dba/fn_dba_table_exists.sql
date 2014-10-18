delimiter $$

drop function if exists fn_dba_table_exists$$

create function fn_dba_table_exists(
    tablename varchar(255)
  )
  returns boolean
  reads sql data
begin
  return ((select count(*)
       from information_schema.columns
       where table_name = tablename and table_schema = schema()
      ) != 0);
end$$

delimiter ;