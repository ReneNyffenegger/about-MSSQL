select 
-- ses.is_user_process                   ,
   db_name(ses.database_id)                database_name,
-- ses.login_name                        ,  -- Seems to be ses.nt_domain \ ses.login_name
   ses.nt_domain                         ,
   ses.nt_user_name                      ,
   ses.original_login_name               ,
   ses.status                            ,  -- sleeping, running, ... ?
   con.session_id                        ,  -- Use to kill session/process
   ses.program_name                      ,
   ses.login_time                        ,
-- suser_sname(ses.security_id           ) xxx,
-- suser_sname(ses.original_security_id  ) yyy,
   con.connect_time                      ,
   ses.last_request_start_time           ,
   ses.last_request_end_time             ,
   con.last_read                         ,
   con.last_write                        ,
   ses.cpu_time                          ,
   ses.total_elapsed_time                ,
   con.num_reads                         ,
   ses.reads                             ,
   ses.logical_reads                     ,
   con.num_writes                        ,
   ses.writes                            ,
   ses.memory_usage                      ,
   ses.total_scheduled_time              ,
   con.net_transport                     ,  -- Shared memory, TCP, ... ?
   con.protocol_type                     ,  -- TSQL ...?
   con.encrypt_option                    ,
   con.auth_scheme                       ,  -- KERBEROS, NTLM, ... ?
   ses.host_name                         ,
   ses.host_process_id                   ,
   con.client_net_address                ,
   con.client_tcp_port                   ,
   con.local_tcp_port                    ,
   ses.client_interface_name             ,
   con.endpoint_id                       ,
   ses.client_version                    ,
   sql.text                                most_recent_sql_text,
   ses.context_info                      ,
   ses.quoted_identifier                 ,
   ses.arithabort                        ,
   ses.ansi_null_dflt_on                 ,
   ses.ansi_warnings                     ,
   ses.ansi_padding                      ,
   ses.ansi_nulls                        ,
   ses.concat_null_yields_null           ,
   ses.transaction_isolation_level       ,
   ses.language                          ,
   ses.date_format                       , -- mdy ...
   ses.lock_timeout                      ,
   ses.deadlock_priority                 ,
   ses.row_count                         ,
   ses.prev_error                        ,
   ses.group_id                          ,
   ses.date_first                        ,
   db_name(ses.authenticating_database_id)  authenticating_database
from
   sys.dm_exec_connections                          con cross apply
   sys.dm_exec_sql_text(con.most_recent_sql_handle) sql left  join -- or inner join?
   sys.dm_exec_sessions                             ses on con.session_id = ses.session_id;
