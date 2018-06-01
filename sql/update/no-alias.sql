create table tq84_test(a integer);

insert into tq84_test values(  42);
insert into tq84_test values(null);
insert into tq84_test values(  99);

-- Will not work because of alias:
--
-- update tq84_test t set t.a = -1 where t.a is null;

-- Ok:
   update tq84_test   set   a = -1 where   a is null;

drop table tq84_test;
