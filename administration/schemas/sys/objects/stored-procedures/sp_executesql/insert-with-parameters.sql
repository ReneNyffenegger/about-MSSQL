exec sys.sp_executesql N'create table tq84_tab_one(a integer, b varchar(10))';
exec sys.sp_executesql N'create table tq84_tab_two(a integer, b varchar(10))';
go

declare
   @table_name nvarchar(20) = N'tq84_tab_one',
   @val_a      integer      =   42,
   @val_b      varchar(10)  =  'Hello';

   exec sys.sp_executesql
       @stmt   = N'insert into tq84_tab_one values (@p_a, @p_b)',
       @params = N'@p_a integer, @p_b varchar',
       @p_a    = @val_a,
       @p_b    = @val_b;
go


drop table tq84_tab_one;
drop table tq84_tab_two;
go
