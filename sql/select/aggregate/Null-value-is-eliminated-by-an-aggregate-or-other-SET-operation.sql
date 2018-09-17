 -- Null value is eliminated by an aggregate or other SET operation

set nocount       on;
set ansi_warnings on;

create table tq84_tab (
   id integer
);

insert into tq84_tab values (1);
insert into tq84_tab values (3);
insert into tq84_tab values (2);

select max(id) from tq84_tab;
--
-- Query returns 3
--

insert into tq84_tab values (null);
select max(id) from tq84_tab;
--
-- Query returns 3.
-- Because "ansi_warnings" is set to on, it also raises an
--    Null value is eliminated by an aggregate or other SET operation
--

select max(id) from tq84_tab where id is not null;
--
-- Because null values are explicitely excluded with the
-- where condition, the query just returns 3 and no
-- warning is issued
--


--
-- The warning can also be eliminated by setting "ansi_warnings" to off.
-- However, this is not a very good idea as it also turns off warnings
-- when a value is divided by zero
--
set ansi_warnings off;
select max(id) from tq84_tab;

drop table tq84_tab;
