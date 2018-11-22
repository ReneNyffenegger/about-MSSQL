create table tq84_tab (
  num   real        not null,
  txt   varchar(10) not null
);

create table tq84_tab_log (
  num          real        not null,
  txt          varchar(10) not null,
  inserted_by  varchar(50) not null,
  insert_date  datetime2
);


go -- 'CREATE TRIGGER' must be the first statement in a query batch.

create trigger tq84_tab_trg
       on      tq84_tab
for insert as
begin

--
-- "Copy" the records that are inserted into
--  tq84_tab into tq84_tab_log and add user
--  name and timestamp of insert.
--
     insert into tq84_tab_log
     select
        inserted.num,
        inserted.txt,
                    current_user,
                    sysdatetime()
     from
        inserted;

end;

go

insert into tq84_tab values ( 3, 'foo');
insert into tq84_tab values ( 1, 'foo');
insert into tq84_tab values ( 2, 'foo');

insert into tq84_tab values (22, 'bar');
insert into tq84_tab values (17, 'bar');

insert into tq84_tab values ( 5, 'baz');

insert into tq84_tab
--
-- Insert three records at once, showing that
--
   select
      min(num),
                'min ' + txt
   from
      tq84_tab
   group by
     'min ' + txt;

select * from tq84_tab_log;

go

drop table tq84_tab;
drop table tq84_tab_log;
