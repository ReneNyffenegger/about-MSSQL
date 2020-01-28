set curdir=%cd%
sqlcmd -S . -d tq84_db -i bulk-insert.sql
