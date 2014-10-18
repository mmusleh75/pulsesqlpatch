delimiter $$

drop function if exists fn_dba_is_workstation$$

create function fn_dba_is_workstation()
  returns boolean
  no sql
begin
  return (left(@@version_compile_os, 3) = 'Win') or
         (left(@@version_compile_os, 3) = 'osx') or
         (left(@@version_compile_os, 5) = 'apple');
end$$

delimiter ;
