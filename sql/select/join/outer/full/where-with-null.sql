create table tq84_left (
   meta  varchar(  3),
   id    integer     ,
   val   decimal(5,2)
);

create table tq84_right (
   meta  varchar(  3),
   id    integer     ,
   val   decimal(5,2)
);

go


--
--     foo:
--
insert into tq84_left  values ('foo', 1,  1.11);
insert into tq84_left  values ('foo', 2,  2.22);
insert into tq84_left  values ('foo', 3,  3.33);
--
insert into tq84_right values ('foo', 2, 20.20);
insert into tq84_right values ('foo', 3, null );
insert into tq84_right values ('foo', 4, 40.40);

--
--     bar:
--
insert into tq84_left  values ('bar', 1,  1   );
insert into tq84_left  values ('bar', 4,  4   );
insert into tq84_left  values ('bar', 5,  5   );
--
insert into tq84_right values ('bar', 2,  2.2 );
insert into tq84_right values ('bar', 4,  4.4 );

--
--     baz:
--
insert into tq84_right values ('baz', 7, 77.77);

--
--     some null values
--
insert into tq84_left  values(null, 2, 0.02);
insert into tq84_right values(null, 2, 0.02);
insert into tq84_right values(null, 4, 0.04);

select
   coalesce(l.meta, r.meta)    meta,
   coalesce(l.id  , r.id  )    id,
   l.val                       val_l,
   r.val                       val_r
from
   tq84_left  l full outer join
   tq84_right r on l.meta = r.meta and l.id = r.id
--where
--   coalesce(l.meta, r.meta) = 'bar'
;

drop table tq84_left;
drop table tq84_right;
