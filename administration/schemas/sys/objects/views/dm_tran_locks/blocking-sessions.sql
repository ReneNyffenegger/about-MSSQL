select
   db.name                       db_name,
   trx_lock.request_session_id,
   wait.blocking_session_id,
   object_name(parts.object_id) blocked_object,
   trx_lock.resource_type,
   sql_request.text             sql_text_request,
   sql_blocked.text             sql_text_blocked,
   trx_lock.request_mode
from
   sys.dm_tran_locks       trx_lock                                                                            join
   sys.databases           db          on db.database_id              = trx_lock.resource_database_id          join
   sys.dm_os_waiting_tasks wait        on trx_lock.lock_owner_address = wait.resource_address                  join
   sys.partitions          parts       on parts.hobt_id               = trx_lock.resource_associated_entity_id join
   sys.dm_exec_connections ses_request on ses_request.session_id      = trx_lock.request_session_id            join
   sys.dm_exec_connections ses_blocked on ses_blocked.session_id      = wait.blocking_session_id        cross apply
   sys.dm_exec_sql_text(ses_request.most_recent_sql_handle)             sql_request                     cross apply
   sys.dm_exec_sql_text(ses_blocked.most_recent_sql_handle)             sql_blocked
;
