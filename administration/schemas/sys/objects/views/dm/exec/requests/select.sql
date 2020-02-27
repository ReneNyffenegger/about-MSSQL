select
   req.status,
   req.session_id,
   ses.login_name,
-- ses.nt_domain,
-- ses.nt_user_name,
-- req.request_id,
   ses.login_time                      session_login_time,
   CON.connect_time                    ,
   datediff(second, con.connect_time , getDate()) connect_time_seconds_ago ,
   req.start_time                      request_start_time,
-- req.sql_handle,
   sql.text                            sql_text,
   req.row_count,
   db_name(req.database_id)            db,
   user_name(req.user_id)              schema_name, -- ?
-- req.connection_id,
-- -----------------------------
-- con.connect_time,

   con.net_transport,
   con.protocol_type,
   con.auth_scheme                     authentication,  -- NTLM, KERBEROS, ...?
   --
   con.num_reads  con_num_reads , req.reads  req_reads , req.logical_reads,
   con.num_writes con_num_writes, req.writes req_writes,
   datediff(second, con.last_read , getDate()) last_read_seconds_ago ,
   datediff(second, con.last_write, getDate()) last_write_seconds_ago,
   --
   con.client_net_address, con.client_tcp_port,
   con.local_net_address , con.local_tcp_port,
   con.net_packet_size,
   --
   con.parent_connection_id,
   ses.host_name,
   ses.program_name,
   ses.client_version,
   ses.client_interface_name,
   ses.status,
   ses.context_info, -- T-SQL Statement: set context_info 0xDEADBEEF;
   ses.cpu_time,
   ses.memory_usage,
   ses.total_scheduled_time,
   ses.total_elapsed_time,
   ses.endpoint_id,
   ses.last_request_start_time,
   ses.last_request_end_time,
   ses.reads,
   ses.writes,
   ses.logical_reads,
   ses.is_user_process,
-- ses.host_process_id,
   ses.text_size,
-- ses.language,
-- ses.date_format,
-- ses.date_first,
-- ses.quoted_identifier,
-- ses.arithabort,
-- Settings for session:
-- ses.ansi_null_dflt_on,
-- ses.ansi_defaults,
-- ses.ansi_warnings,
-- ses.ansi_padding,
-- ses.ansi_nulls,
-- ses.concat_null_yields_null,
   ------------------------------------
   req.transaction_id,
   req.open_transaction_count,
   req.transaction_isolation_level,
-- case ses.transaction_isolation_level
--      when 0 then 'unspecified'
--	when 1 then 'read uncommitted'
--	when 2 then 'read comitted'
--	when 3 then 'repeatable read'
--	when 4 then 'serializable'
--	when 5 then 'snapshot'
--	else        '?'
-- end                               trx_isolation_lvl,
   ----------------------------------------------------
   ses.lock_timeout,
   ses.deadlock_priority,
   ses.row_count,
   ses.prev_error,
-- ses.original_security_id,
-- ses.original_login_name,
-- ses.last_successful_logon,
-- ses.last_unsuccessful_logon,
   ses.unsuccessful_logons,
   ses.group_id,
   ses.database_id,
   ses.authenticating_database_id,
   ses.open_transaction_count,
-- con.most_recent_sql_handle,
-- -----------------------------
   req.blocking_session_id,
   req.wait_type,
   req.wait_time,
   req.last_wait_type,
   req.wait_resource,
   req.open_resultset_count,
   req.context_info,
   req.percent_complete,
   req.estimated_completion_time,
   req.cpu_time,
   req.total_elapsed_time,
   req.scheduler_id,
   req.task_address,
   req.text_size,
   req.language,
   req.date_format,
   req.date_first,
   req.quoted_identifier,
   req.arithabort,
   req.ansi_null_dflt_on,
   req.ansi_defaults,
   req.ansi_warnings,
   req.ansi_padding,
   req.ansi_nulls,
   req.concat_null_yields_null,
   req.lock_timeout,
   req.deadlock_priority,
   req.prev_error,
   req.nest_level,
   req.granted_query_memory,
   req.executing_managed_code,
   req.group_id,
-- req.query_hash,
   pln.query_plan,
   req.query_plan_hash,
   req.statement_sql_handle,
   req.statement_context_id,
   req.dop,
   req.parallel_worker_count,
   req.external_script_request_id
-- req.plan_handle,
-- req.statement_start_offset,
-- req.statement_end_offset
from
   master.sys.dm_exec_requests                                                                               req                                                      join 
   master.sys.dm_exec_sessions                                                                               ses  on req.session_id    = ses.session_id    left outer join
   master.sys.dm_exec_connections                                                                            con  on req.connection_id = con.connection_id outer      apply
   master.sys.dm_exec_sql_text       (req.sql_handle)  sql                                                                                                 outer      apply
   master.sys.dm_exec_text_query_plan(req.plan_handle, req.statement_start_offset, req.statement_end_offset) pln
where
   req.status not in (
   --  'suspended' ,
   --  'running'   ,
       'sleeping'  ,
     'background'
   )
order by
   start_time desc;
