drop table if exists ##tq84_items;

create table ##tq84_items (
   grp  integer,
   txt  varchar(10)
);

insert into ##tq84_items values (1, 'foo');
insert into ##tq84_items values (1, 'bar');
insert into ##tq84_items values (1, 'baz');

insert into ##tq84_items values (2, 'grapefruit');
insert into ##tq84_items values (2, 'banana');

select
   grp,
   string_agg(txt, ' - ') items
from
   ##tq84_items
group by
   grp;
--
-- grp         items
-- ----------- -------------------
-- 1           foo - bar - baz
-- 2           grapefruit - banana


select
   grp,
   string_agg(txt, ' - ') within group (order by txt) ordered_items
from
   ##tq84_items
group by
   grp;
--
-- grp         ordered_items
-- ----------- -------------------
-- 1           bar - baz - foo
-- 2           banana - grapefruit
