create procedure tq84_job_example_proc as
   insert into tq84_job_example_tab(dt_insert) values (sysdatetime())
go
