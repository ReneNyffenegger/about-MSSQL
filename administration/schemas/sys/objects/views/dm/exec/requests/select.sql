select
   req.status,
   req.session_id,
-- req.request_id,
   req.start_time,
-- req.sql_handle,
   sql.text                            sql_text,
   req.row_count,
   db_name(req.database_id)            db,
   user_name(req.user_id)              schema_name, -- ?
-- req.connection_id,
-- -----------------------------
-- con.connect_time,
   datediff(second, con.connect_time , getDate()) connect_time_seconds_ago ,
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
-- con.most_recent_sql_handle,
-- -----------------------------
   req.blocking_session_id,
   req.wait_type,
   req.wait_time,
   req.last_wait_type,
   req.wait_resource,
   req.open_transaction_count,
   req.open_resultset_count,
   req.transaction_id,
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
   req.transaction_isolation_level,
   req.lock_timeout,
   req.deadlock_priority,
   req.prev_error,
   req.nest_level,
   req.granted_query_memory,
   req.executing_managed_code,
   req.group_id,
   req.query_hash,
   req.query_plan_hash,
   req.statement_sql_handle,
   req.statement_context_id,
   req.dop,
   req.parallel_worker_count,
   req.external_script_request_id,
-- req.plan_handle,
   pln.query_plan
-- req.statement_start_offset,
-- req.statement_end_offset
from
   master.sys.dm_exec_requests                                                                               req                                      left outer join
   master.sys.dm_exec_connections                                                                            con  on req.connection_id = con.connection_id outer apply
   master.sys.dm_exec_sql_text       (req.sql_handle)  sql                                                                                                 outer apply
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
