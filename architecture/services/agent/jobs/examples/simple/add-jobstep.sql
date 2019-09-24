declare
    @db_name sysname = db_name();
exec msdb..sp_add_jobstep
    @job_name          = N'tq84_job_example_job',
    @step_name         = N'tq84_job_example_step',
    @step_id           =   1,  -- Used to order steps.
    @subsystem         = N'TSQL',
    @database_name     =  @db_name,
    @command           = N'exec tq84_job_example_proc',
    @on_success_action =   1, -- 1:...  /  3: Go to next step (3 should not be the value of the last step)
    @retry_attempts    =   0,
    @retry_interval    =   0
;
