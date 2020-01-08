select
   sch.schedule_id,
   sch.name                     schedule_name,
   case sch.freq_type
        when   1 then 'once'
      when   4 then 'daily'
      when   8 then 'weekly'
      when  16 then 'monthly'
      when  32 then 'monthly, relative to freq_interval'
      when  64 then 'when SQL Server Agent starts up'
      when 128 then 'when computer is idle'
      else          '?'
   end                                                                   frequency,
   sch.freq_interval,
   sch.freq_subday_interval                                              period_between_execution,
   case sch.freq_subday_type
        when   1 then 'at specified time'
      when   2 then 'seconds'
      when   4 then 'minutes'
      when   8 then 'hours'
   end                                                                   frequency_sub_type,
   case sch.freq_relative_interval
        when   0 then 'n/a'
      when   1 then 'first'
      when   2 then 'second'
      when   4 then 'fourth'
      when  16 then 'last'
   end                                                                   freq_relative_interval,
-- -------------------------------------------------------------------
-- Number of weeks or months between the scheduled execution of a job.
-- Used only if freq_type is 8, 16, or 32.
-- If value is 0, freq_recurrence_factor is unused.
   sch.freq_recurrence_factor,
-- --------------------------------------------------------------------
   msdb.dbo.agent_datetime(sch.active_start_date, sch.active_start_time) start_date,
   msdb.dbo.agent_datetime(sch.active_end_date  , sch.active_end_time  ) end_date,
   sch.originating_server_id,
   suser_sname(sch.owner_sid)                                            owner,
   sch.date_created,
   sch.date_modified,
   sch.version_number
from
   msdb.dbo.sysschedules sch;
