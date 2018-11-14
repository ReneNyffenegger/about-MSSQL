create table tq84_integers (
  grp varchar(1),
  num  integer
);

insert into tq84_integers values ('A', 1);
insert into tq84_integers values ('A', 2);
insert into tq84_integers values ('A', 3);

insert into tq84_integers values ('B', 7);
insert into tq84_integers values ('B', 8);

select
   grp,
   avg(    num) avg_num_beware,
   avg(1.0*num) avg_num_correct
from
   tq84_integers
group by
   grp;

drop table tq84_integers;
