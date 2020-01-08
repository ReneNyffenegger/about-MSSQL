select
   job.name                                   job_name,
   act.run_requested_date,
   run_requested_source,
   -----------------------------------------------------
   case act.run_requested_source
        when 1 then 'scheduler'
        when 2 then 'alerter'
	     when 3 then 'boot'
	     when 4 then 'user'
	     when 5 then 'on idle'
   end                                        requester,
   -----------------------------------------------------
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
