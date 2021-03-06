create table tq84_nums (
   num  integer,
   txt  varchar(10)
);

insert into tq84_nums values (1, 'one'  );
insert into tq84_nums values (2, 'two'  );
insert into tq84_nums values (2, 'TWO'  );
insert into tq84_nums values (3, 'three');

go

create  procedure tq84_too_many_rows(@num integer) as
  declare
     @txt                varchar(10)     ,
     @rowcount           integer         ,
     @warn_too_many_rows varchar(50) = '';
  select
     @txt = txt
  from
     tq84_nums
  where
     num = @num
  order by
     txt;

  set @rowcount = @@rowcount;
  if  @rowcount > 1
     set @warn_too_many_rows = ' (Warning, rowcount is ' + str(@rowcount) + ')';

  print 'txt = ' + @txt + @warn_too_many_rows;
go

exec tq84_too_many_rows 1;
--
--   Note: SQL Server, contrary to Oracle which raises TOO_MANY_ROWS,
--         does not raise an error in this case.
--         It just prints the values of the last record found.
--         This is just a disaster waiting to happen.
--
exec tq84_too_many_rows 2;
go

drop table     tq84_nums;
drop procedure tq84_too_many_rows;
go
