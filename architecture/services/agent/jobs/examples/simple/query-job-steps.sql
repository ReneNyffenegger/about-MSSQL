select
   stp.step_uid,
   stp.step_id,
   stp.step_name,
   stp.subsystem,
   stp.additional_parameters,
   stp.database_name           step_database,
   stp.retry_attempts,
   stp.retry_interval,
   stp.last_run_date    last_run_date_step,
   stp.last_run_time    last_run_time_step,
   case stp.on_success_action when 3 then 'go on with next step' end on_success_acction
from
   msdb..sysjobs      job                              left join --  created jobs
   msdb..sysjobsteps  stp on job.job_id = stp.job_id
where
   job.name = 'tq84_job_example_job'
order by
   stp.step_id;
