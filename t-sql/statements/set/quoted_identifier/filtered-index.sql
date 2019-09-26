create table tq84_qi (
   id    integer,
   val   varchar(3)
);

insert into tq84_qi
values (1, 'foo'),
       (2, 'bar'),
       (3,  null),
       (4, 'baz'),
       (5,  null);	

go

   set quoted_identifier off 
   create unique index tq84_qi_ix on tq84_qi (val) where val is not null;
--
-- create index statement causes:
--    Msg 1934, Level 16, State 1...
--    CREATE INDEX failed because the following SET options have incorrect settings: 'QUOTED_IDENTIFIER'.
--

go

   set quoted_identifier on
   create unique index tq84_qi_ix on tq84_qi (val) where val is not null;

go

drop table tq84_qi
