--
-- Create two tables
--
exec sys.sp_executeSql N'create table tq84_tab_one(a integer, b varchar(10))';
exec sys.sp_executeSql N'create table tq84_tab_two(a integer, b varchar(10))';
go


declare
--
--  Use a variable that specifies the destination table
--  of an insert statement:
--
   @table_name nvarchar(20) = N'tq84_tab_one',
--
--  Variable to store SQL statement that is passed to sp_executeSql.
--
   @sqlStmt    nvarchar(max),
--
--  Use two more variables that will be passed to sp_executesql
--  as parameters of the dynamic sql statement:
--
   @val_a      integer      =   42,
   @val_b      varchar(10)  =  'Hello';

--
--  Unfortunately, strings that are passed to the @stmt parameter of
--  sp_executeSql need to pre-assembled (or concatenated):
--
    set @sqlStmt = N'insert into ' + @table_name + ' values (@p_a, @p_b)'

--
--  Execute the statement:
--
   exec sys.sp_executeSql
       @stmt   =   @sqlStmt,  -- Cannot use + to concatene string here!
       @params = N'@p_a integer, @p_b varchar',
       @p_a    =   @val_a,
       @p_b    =   @val_b;
go

--
-- Select from the table
--
exec sys.sp_executeSql N'select * from tq84_tab_one';


drop table tq84_tab_one;
drop table tq84_tab_two;
go
