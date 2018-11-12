create table tq84_tab (
  id  integer identity,
  txt varchar(10)       not null,
  val float             not null
);
go


create procedure tq84_proc
  @set_xact_abort_on bit
as
   set nocount on;

   if @set_xact_abort_on = 1 set xact_abort on;
   else                      set xact_abort off;

   delete from tq84_tab;

   insert into tq84_tab (txt, val) values ('step 1',   42);

--
-- The following insert statement cannot insert a record because
-- val is declared not null in the table.
--
   insert into tq84_tab (txt, val) values ('step 2', null);

--
-- If the procedure has set xact_abort to on, the previous insert
-- statement will have aborted the execution of the procedure, thus
-- this insert statement will not be run in that case.
--
   insert into tq84_tab (txt, val) values ('step 3',   99);

go

--
-- First execution of procedure (with set xact_abort off)
-- 
exec tq84_proc 0
go

select txt, val from tq84_tab order by id;
go
-- txt        val
-- ---------- ----------------------
-- step 1     42
-- step 3     99

--
-- Second execution of procedure (with set xact_abort on)
-- 
exec tq84_proc 1 -- exec procedure with 'set xact_abort on'
go

select txt, val from tq84_tab order by id;
go
-- txt        val
-- ---------- ----------------------
-- step 1     42


drop procedure tq84_proc;
go

drop table tq84_tab;
go
