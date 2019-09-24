select
   job.enabled,
   --
   job.date_created            date_job_created,
   job.date_modified           date_job_modified,
   --
   next_scheduled_run_date,
   datediff(ss, getdate(), next_scheduled_run_date) seconds_from_now,
   --
   act.session_id,
   act.run_requested_date,
   act.run_requested_source,
   act.start_execution_date,
   act.last_executed_step_id,
   act.last_executed_step_date,
   act.stop_execution_date,
   act.job_history_id,
   job.notify_level_eventlog,
-- job.owner_sid               job_owner_sid,
   own.name                    job_owner_name,
   --
   srv.server_id,
   srv.last_run_outcome,
   srv.last_run_date,
   srv.last_run_time,
   srv.last_run_duration,
   srv.last_outcome_message
from
   msdb.dbo.sysjobs          job                                 left join
   msdb.dbo.sysjobactivity   act on job.job_Id = act.job_id      left join
   master.sys.syslogins      own on job.owner_sid = own.sid      left join
   msdb.dbo.sysjobservers    srv on job.job_id    = srv.job_id
where
   job.name = 'tq84_job_example_job'
;
