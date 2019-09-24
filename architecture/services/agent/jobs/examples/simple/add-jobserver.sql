exec msdb.dbo.sp_add_jobserver
   @job_name    = N'tq84_job_example_job',
   @server_name = @@servername

--  SQLServerAgent is not currently running so it cannot be notified of this action.
--
