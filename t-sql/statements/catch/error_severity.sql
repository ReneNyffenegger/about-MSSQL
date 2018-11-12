create table tq84_tab (a integer identity, txt varchar(10) not null);
go

set nocount on

declare
   @res float,
   @ti  tinyint;

begin try
   set @res = 123.456 / 0.0;
end try begin catch
   print('Division error caused severity level                             ' + str(error_severity()));
end catch;

begin try
   insert into tq84_tab (txt) values (null);
end try begin catch
   print('Trying to insert null into not-null column caused severity level ' + str(error_severity()));
end catch;

begin try
   set @ti = 200 + 100;
end try begin catch
   print('Arithmetic overflow caused severty level                         ' + str(error_severity()));
end catch;

go

-- Output:
--
-- Division error caused severity level                                     16
-- Trying to insert null into not-null column caused severity level         16
-- Arithmetic overflow caused severty level                                 16

drop table tq84_tab;
go
