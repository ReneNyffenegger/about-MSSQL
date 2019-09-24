select
   his.run_date,
   his.run_time,
   his.run_duration,
   his.instance_id,
   his.step_id,
   his.step_name,
   his.run_status,
   his.sql_message_id,
   his.sql_severity,
   his.message,
   his.server
from
   msdb.dbo.sysjobs          job                             left join
   msdb.dbo.sysjobhistory    his on job.job_id = his.job_id
where
   job.name = 'tq84_job_example_job'
order by
   his.instance_id desc
;
