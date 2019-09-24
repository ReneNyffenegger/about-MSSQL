exec msdb..sp_delete_jobserver
    @job_name = N'tq84_job_example_job',
    @server_name = @@servername

exec msdb..sp_delete_jobstep 
   @step_id  =  1,
   @job_name = 'tq84_job_example_job';

exec msdb..sp_delete_job @job_name = N'tq84_job_example_job';
   
exec msdb..sp_delete_schedule @schedule_name = N'tq84_job_example_schedule'   
