select * from (
   select
   -- job.job_id,
      job.name                                   job_name,
      act.run_requested_date,
   -- run_requested_source,
      -----------------------------------------------------
      case act.run_requested_source
           when 1 then 'scheduler'
           when 2 then 'alerter'
           when 3 then 'boot'
           when 4 then 'user'
           when 5 then 'on idle'
      end                                        requester,
      -----------------------------------------------------
      act.start_execution_date,
      act.stop_execution_date,
      act.next_scheduled_run_date,
      act.last_executed_step_id,
      act.job_history_id,                     -- left join with instance_id on msdb.dbo.job_history
      act.queued_date,
      ses.session_id,
      ses.agent_start_date,
      row_number() over (partition by job.job_id order by ses.session_id desc) rn
   from
      msdb.dbo.sysjobactivity act                                             join
      msdb.dbo.syssessions    ses on act.session_id     = ses.session_id      join
      msdb.dbo.sysjobs        job on act.job_id         = job.job_id
) s
where
   rn = 1
order by
   next_scheduled_run_date;
