create procedure auto_group_by(
   @tab_name      nvarchar(max),
   @aggregates    nvarchar(max),
   @group_by_cols nvarchar(max)
)
as
declare
   @sql_stmt nvarchar(max);

   set @sql_stmt = 
       N'select ' +
         @group_by_cols          + N', ' +
         @aggregates             +
       N' from '                 +
         @tab_name               +
       N' group by '             +
         @group_by_cols;

  exec sp_executeSql @sql_stmt;
;


exec auto_group_by 'information_schema.columns',
   'min(column_name), max(column_name)',
   'table_name'
