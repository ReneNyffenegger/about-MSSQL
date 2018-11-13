create table tq84_tab_with_default_values (
  id    integer     not null identity,
  txt   varchar(20) not null,
  dt    datetime2   not null default sysdatetime()
);
go

insert into tq84_tab_with_default_values (txt) values ('foo'); waitfor delay '00:00:01';
insert into tq84_tab_with_default_values (txt) values ('bar'); waitfor delay '00:00:01';
insert into tq84_tab_with_default_values (txt) values ('baz');
go

select txt, dt from tq84_tab_with_default_values order by id;
go

drop table tq84_tab_with_default_values;
go
