create table dbo.tq84_identity (
  id   integer identity
       primary key, -- identity columns are not automatically made primary keys.
  txt  varchar(10)
);

insert into tq84_identity (txt) values ('foo');
insert into tq84_identity (txt) values ('bar');
insert into tq84_identity (txt) values ('baz');

select * from tq84_identity;
--
-- id          txt
-- ----------- ----------
-- 1           foo
-- 2           bar
-- 3           baz

drop table tq84_identity;
