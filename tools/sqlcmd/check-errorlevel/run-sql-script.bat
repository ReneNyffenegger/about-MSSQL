@set script_name=%1

@rem
@rem  Invoke sqlcmd
@rem  Pass it the -b flag so that it terminates
@rem  when it encounters an error
@rem 
@sqlcmd -b -i %script_name% -o run-sql-script.log

@rem
@rem  after calling sqlcmd, we're checking errorlevel
@rem  to find out if the script ran without error.
@rem
@if not errorlevel 1 goto script_ok
   @echo "! Script %script_name% not ok, it returned %errorlevel% !"
:script_ok

