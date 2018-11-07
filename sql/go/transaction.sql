create table tq84_go_trx(
  id  integer    identity,
  txt varchar(20)
);

go

insert into tq84_go_trx (txt) values ('Insert 1')

begin transaction

insert into tq84_go_trx (txt) values ('Insert 2')

--
-- A go does not commit the current transaction...
--
go

--
-- ... therefore, the following rollback rolls back the insertion
-- of 'Insert 2' into tq84_go_trx.
--
rollback

--
-- Only 'Insert 1' is selected:
--
select txt from tq84_go_trx order by id;
