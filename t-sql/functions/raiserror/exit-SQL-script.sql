--
-- Check if connected to database TQ84_DB/
-- If not, terminate process:
--
if db_name() != 'TQ84_DB' begin
   raisError('Wrong database', 20, -1) with log;
   --
   -- Message will be somthing like
   --    Msg 2745, Level 16, State 2, Line 2
   --    Process ID 55 has raised user error 50000, severity 20. SQL Server is terminating this process.
   --    Msg 50000, Level 20, State 1, Line 2
   --    Wrong database
   --    Msg 596, Level 21, State 1, Line 0
   --    Cannot continue the execution because the session is in the kill state.
   --    Msg 0, Level 20, State 0, Line 0
   --    A severe error occurred on the current command.  The results, if any, should be discarded.
end

print('db_name successfully checked');

go

print('I am in another batch.');

go
