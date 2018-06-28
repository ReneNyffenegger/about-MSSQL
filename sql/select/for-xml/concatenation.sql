drop table tq84_b;
drop table tq84_a;

create table tq84_a (
  id integer primary key,
  tx varchar(10)
);

insert into tq84_a values (1, 'one'  );
insert into tq84_a values (2, 'two'  );
insert into tq84_a values (3, 'three');

create table tq84_b (
  id_a integer not null references tq84_a,
  itm  varchar(10)
);

insert into tq84_b values (1, 'foo' );
insert into tq84_b values (1, 'bar' );
insert into tq84_b values (1, 'baz' );

insert into tq84_b values (2, 'eggs');
insert into tq84_b values (2, 'why' );

--
--  Use a subquery and xml for to concatenate the children
--  for a particular row of the parent table;
--
select distinct
    a.tx,
   (select ' - ' + b.itm
      from tq84_b b
	 where b.id_a = a.id
	  for xml path (''))  concat_itm
from
    tq84_a a                  join
	tq84_b b on a.id = b.id_a;
--
-- Unfortunately, the concatenation is prefixed with a ` - `:
-- 
--    two	 - eggs - why
--    one	 - foo - bar - baz
-- 

--
-- Remove the first ' - ' of the concatenation with stuff:
--
select distinct
    a.tx,
	stuff (
   (select ' - ' + b.itm
      from tq84_b b
	 where b.id_a = a.id
	  for xml path ('')) ,
	 1, 3, ''  -- Replace characters 1 through 3 with nothing (that is: remove them)
	) concat_itm
from
    tq84_a a                  join
	tq84_b b on a.id = b.id_a;

--
--
--
-- one	foo - bar - baz
-- two	eggs - why
