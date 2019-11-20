select
   prc.spid                     ,
   prc.login_time               ,
   prc.last_batch               ,
   db_name(prc.dbid)    db_name ,
   suser_sname(prc.sid) sid_    , 
   prc.nt_username              ,
   prc.loginame                 ,   -- Note: it's loginame, not loginname.
   prc.hostname                 ,
   prc.program_name             ,
   sql.text             sql_text
from
   sys.sysprocesses     prc  cross apply
   sys.dm_exec_sql_text(prc.sql_handle) sql;
