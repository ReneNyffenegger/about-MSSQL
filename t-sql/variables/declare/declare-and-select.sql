set nocount on

create table tq84_some_values (val integer);

insert into tq84_some_values values (11);
insert into tq84_some_values values ( 5);
insert into tq84_some_values values (42);
insert into tq84_some_values values (31);
insert into tq84_some_values values (27);

--
-- declare a variable and assign a value from
-- a select statement:
--
declare @min_val integer = (select min(val) from tq84_some_values);

print('min_val = ' + str(@min_val));

drop table tq84_some_values ;
