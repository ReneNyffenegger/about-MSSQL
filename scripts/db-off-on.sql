--
-- sqlcmd -S … -i db-off-on.sql -v DB=…
--

use master
go

print ('');
print ('Current connections');
print ('');

select
   ses.session_id,
   con.connect_time,
   substring(ses.login_name, 1, 20) login,
   cast(replace(
        replace(
          substring(sql.text, 1, 50),
          char(10),
          ' '
       ), char(13), ' ') as varchar(50)) sql_text
from
   sys.dm_exec_connections                          con                                            join
   sys.dm_exec_sessions                             ses on con.session_id = ses.session_id  cross apply
   sys.dm_exec_sql_text(con.most_recent_sql_handle) sql 
 where
    db_name(ses.database_id) = "$(DB)";
go

print ('offlinging database');
alter database $(DB)
  set offline with rollback immediate
go

print ('onlining database');
alter database $(DB)
  set online;
go
