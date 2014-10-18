delimiter $$

drop function if exists fn_dba_constraint_exists$$

create function fn_dba_constraint_exists(
     tablename varchar(255),
     constraintname varchar(255)
   )
   returns boolean
   reads sql data
begin
  return ((select 1
             from information_schema.table_constraints
             where table_schema = schema()
               and table_name = tablename
               and constraint_name = constraintname
             limit 1
          ) <=> 1);
end$$

delimiter ;