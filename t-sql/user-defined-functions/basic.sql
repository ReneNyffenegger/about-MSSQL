if object_id('dbo.tq84_repeat', 'fn') is not null
   drop function dbo.tq84_repeat;
go

create function dbo.tq84_repeat (
   @pattern varchar(max),
   @count   integer
)
returns varchar(max)
as
begin
   declare
     @ret varchar(max) = '';

     while @count > 0 begin
        set @ret   = @ret + @pattern;
        set @count = @count - 1
     end;

    return @ret;
end;
go

print(dbo.tq84_repeat('* ', 10));
