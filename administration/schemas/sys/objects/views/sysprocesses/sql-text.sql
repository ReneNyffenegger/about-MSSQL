select
   prc.spid,
   prc.login_time,
   prc.last_batch,
   right(convert(varchar, 
            dateadd (ms,
            datediff(ms, prc.last_batch, getdate()),
           '1900-01-01'), 
            121), 12)                                 last_batch_,
   db_name(prc.dbid)                                  db_name    ,
   suser_sname(prc.sid)                               sid_       , 
   prc.nt_username,
   prc.loginame,                                                   -- Note: it's loginame, not loginname.
   prc.hostname,
   prc.program_name,
   sql.text                                           sql_text
from
   sys.sysprocesses     prc                 cross apply
   sys.dm_exec_sql_text(prc.sql_handle) sql
where
   prc.cmd   not in (
      'AWAITING COMMAND',
      'MIRROR HANDLER'  ,
      'LAZY WRITER'     ,
      'CHECKPOINT SLEEP',
      'RA MANAGER'
   )                                                   and
   prc.status not in (
      'background',
      'sleeping'
   );
