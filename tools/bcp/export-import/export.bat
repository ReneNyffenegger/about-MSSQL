setlocal

rem
rem     Condition to select only select a subset of (child-) data:
rem
set CONDITION_C=val between 10 and 40

rem
rem     Create SQL statement for parent data:
rem
set SQLSTMT=                                                  ^
  select                                                      ^
     *                                                        ^
  from                                                        ^
     exp_test_p                                               ^
  where                                                       ^
     id in (select id_p from exp_test_c where %CONDITION_C%)

rem
rem     Export data
rem
bcp "%SQLSTMT%" queryout data_p.exp -c -T -t"|" -d %DB%


rem
rem     Create SQL statement for child data:
rem
set SQLSTMT=                                                  ^
  select                                                      ^
     *                                                        ^
  from                                                        ^
     exp_test_c                                               ^
  where                                                       ^
     %CONDITION_C%

rem
rem     Export data
rem
bcp "%SQLSTMT%" queryout data_c.exp -c -T -t"|" -d %DB%
