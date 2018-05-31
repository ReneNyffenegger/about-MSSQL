create table tq84_iif (
   txt varchar(10),
   num int
);

insert into tq84_iif values ('one'  , 1);
insert into tq84_iif values ('two'  , 2);
insert into tq84_iif values ('three', 3);
insert into tq84_iif values ('four' , 4);

select
   txt,
   iif(num = 3, 99, num) -- Replace 3 with 99
from
  tq84_iif;
