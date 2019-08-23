create table tq84_data (
  txt varchar(10) primary key,
  n_1 integer,
  n_2 integer,
  n_3 integer
);

insert into tq84_data values ('bar',   7, null,    6);
insert into tq84_data values ('baz',   5,    8,    9);
insert into tq84_data values ('foo',   3,    4,    2);

select
   txt,
  (select max(n) from (values (n_1), (n_2), (n_3) ) as v(n) ) greatest_n,
  (select min(n) from (values (n_1), (n_2), (n_3) ) as v(n) ) least_n
from
   tq84_data
order by
   txt;
--
-- bar   7   6
-- baz   9   5
-- foo   4   2
