exec msdb.dbo.sp_attach_schedule
    @job_name      = N'tq84_job_example_job',
    @schedule_name = N'tq84_job_example_schedule';
