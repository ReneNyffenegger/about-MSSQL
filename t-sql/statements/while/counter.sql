declare
   @i integer = 0;

while @i < 10 begin
   print('i = ' + ltrim(str(@i)));
   set @i = @i + 1;
end;
