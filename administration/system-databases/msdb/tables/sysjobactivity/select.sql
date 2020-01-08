select
   job.name                                   job_name,
   act.run_requested_date,
   act.run_requested_source,
   act.queued_date,
   act.start_execution_date,
   act.last_executed_step_id,
   act.stop_execution_date,
   act.job_history_id,                     -- left join with instance_id on msdb.dbo.job_history
   act.next_scheduled_run_date,
   ses.agent_start_date
from
   msdb.dbo.sysjobactivity act                                             join
   msdb.dbo.syssessions    ses on act.session_id     = ses.session_id      join
   msdb.dbo.sysjobs        job on act.job_id         = job.job_id
order by
   next_scheduled_run_date;
