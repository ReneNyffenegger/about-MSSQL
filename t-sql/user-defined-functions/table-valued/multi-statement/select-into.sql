create table src(id integer, val varchar(30));

insert into src values(1, 'one'  );
insert into src values(2, 'two'  );
insert into src values(3, 'three');

go

create function select_into(@p integer)
  returns @ret table(id integer, val varchar(30))
as
begin
  insert into
    @ret
  select *
  from
  src
  where
    id < @p;

  return;
end;
go

select * from dbo.select_into(3);
go

drop function select_into;
go

drop table src;
go
