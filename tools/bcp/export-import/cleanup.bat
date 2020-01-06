@echo off

sqlcmd -d %DB% -Q "drop table if exists imp_test_c"
sqlcmd -d %DB% -Q "drop table if exists imp_test_p"
sqlcmd -d %DB% -Q "drop table if exists exp_test_c"
sqlcmd -d %DB% -Q "drop table if exists exp_test_p"
