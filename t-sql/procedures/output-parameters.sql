if object_id('dbo.tq84_tab', 'u') is not null
   drop table dbo.tq84_tab;
go
 
create table dbo.tq84_tab (
   id  integer     identity,
   txt varchar(10) not null
);
go
 
 
if object_id('dbo.tq84_ins', 'p') is not null
   drop procedure dbo.tq84_ins;
go
 
create procedure dbo.tq84_ins
   @txt varchar(10),
   @id  integer output
as
   set nocount on;
 
   insert into tq84_tab (txt) values (@txt);
 
   set @id = @@identity;
go
 
declare
   @id_foo integer,
   @id_bar integer,
   @id_baz integer;
 
--
-- Note: the keyword output needs to be stated
-- even when the procedure is executed...
-- 
   exec dbo.tq84_ins 'foo', @id_foo output;
   exec dbo.tq84_ins 'bar', @id_bar output;
   exec dbo.tq84_ins 'baz', @id_baz output;
 
go
 
select * from tq84_tab;
