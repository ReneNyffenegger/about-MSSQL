exec msdb.dbo.sp_add_schedule  
    @schedule_name        = N'tq84_job_example_schedule',
    @freq_type            =   4,       -- 4: daily
    @freq_interval        =   4,       -- 4: daily
    @freq_subday_type     =   2,       -- 2: seconds
    @freq_subday_interval =  30,       -- Every 30 seconds.
    @active_start_time    =  null      -- start immediately
--  @active_end_time      = 
;
