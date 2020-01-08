select
   msdb.dbo.agent_datetime(hst.run_date, hst.run_time) run_time,
   job.name                                            job_name,
   stp.step_name,
--
-- hst.run_duration is in HHMMSS format.
-- Convert to seconds:
--
   hst.run_duration / 10000      * 3600 + 
  (hst.run_duration / 100 % 100)   * 60 +
   hst.run_duration       % 100                        run_duration_seconds,
   stp.step_id,
-- hst.run_status,
   case hst.run_status
        when 0 then 'failed'
        when 1 then 'succeeded'
        when 2 then 'retry'
        when 3 then 'canceled'
        when 4 then 'in progress'
        else        '?'
   end                                 run_status,
   hst.message,
   stp.command,
   stp.subsystem,  -- CmdExec, TSQL ...
-- stp.additional_parameters,
   stp.flags,
-- job.job_id,
-- job.originating_server_id,
-- job.description               job_description,
   stp.cmdexec_success_code,
   stp.on_success_action,
   stp.on_success_step_id,
   stp.on_fail_action,
   stp.on_fail_step_id,
   stp.server,
   stp.database_name,
   stp.database_user_name,
   stp.retry_attempts,
   stp.os_run_priority,
   stp.output_file_name,
   stp.last_run_outcome,
   stp.last_run_date,
   stp.last_run_time,
   stp.proxy_id,
   stp.step_uid,                 -- identifies job step
   hst.sql_message_id,
   hst.sql_severity,
   hst.server,
   job.start_step_id             job_start_step_id,
-- hst.step_id                   hist_step_id,
   job.category_id,
   suser_sname(job.owner_sid)    job_owner,
   job.version_number,
-- job.*,
   hst.instance_id               hist_instance_id -- Unique identifier for history row
from
   msdb.dbo.sysjobs        job                                        join
   msdb.dbo.sysjobsteps    stp on job.job_id  = stp.job_id       left join
   msdb.dbo.sysjobhistory  hst on job.job_id  = hst.job_id   and
                                  stp.step_id = hst.step_id
order by
   hst.run_date desc,
   hst.run_time desc,
   stp.step_id
