@echo off
setlocal

set DB=tq84_db

call cleanup.bat
call create-data.bat
call export.bat
call import.bat

sqlcmd -d %DB% -Q "select p.txt, c.val from imp_test_c c join imp_test_p p on c.id_p = p.id"
