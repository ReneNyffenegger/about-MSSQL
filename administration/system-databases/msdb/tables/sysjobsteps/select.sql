select
   job.name              job_name,
   stp.step_id,
   stp.step_name,
   ------------------------------------------------------------------
   case when stp.last_run_date > 0 then
        msdb.dbo.agent_datetime(stp.last_run_date, stp.last_run_time)
   else
        null
   end                                                                last_run_date,
   ------------------------------------------------------------------
   stp.last_run_duration / 10000      * 3600 + 
  (stp.last_run_duration / 100 % 100) *   60 +
   stp.last_run_duration       % 100                                  last_run_duration_seconds,
   ------------------------------------------------------------------
   case stp.last_run_outcome
        when 0 then 'failed'
        when 1 then 'succeeded'
        when 2 then 'retry'
        when 3 then 'canceled'
        when 5 then 'unknown'
        else        '?'
   end                                                               last_run_outcome,
   ------------------------------------------------------------------
   stp.last_run_duration,
   stp.subsystem,
   stp.command,
   stp.database_name,
   stp.output_file_name,
   stp.step_uid
from
   msdb.dbo.sysjobsteps  stp                             join
   msdb.dbo.sysjobs      job on stp.job_id = job.job_id
;
