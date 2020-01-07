:on error exit

drop view  if exists tq84_vw_one;
drop view  if exists tq84_vw_two;
drop table if exists tq84_tab_one;
drop table if exists tq84_tab_two;

print "creating tq84_tab_one";
go

create table tq84_tab_one (foo integer);
go

print "creating tq84_vw_one";
go

create view tq84_vw_one as select 2 * foo as foo_twice from tq84_tab_one;
go

print "creating tq84_vw_two";
go

create view tq84_vw_two as select 2 * foo as foo_twice from tq84_tab_two
go

print "creating tq84_tab_two";
go

create table tq84_tab_two (foo integer);
go
