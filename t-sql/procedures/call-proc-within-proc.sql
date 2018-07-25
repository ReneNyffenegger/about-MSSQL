create procedure tq84_callee(@txt as varchar(10)) as
   print 'callee says: ' + @txt;
go

create procedure tq84_caller(@txt as varchar(10)) as
   print 'caller says: ' + @txt;
   execute tq84_callee 'bar';
go

exec tq84_caller 'foo';

drop procedure tq84_caller;
drop procedure tq84_callee;
go
