declare
   @val_1  varchar(20),
   @val_2  varchar(20),
   @val_3  integer;

select
   @val_1  = 'Hello World, ',
   @val_2  = 'the number is: ',
   @val_3  =  42;

print(@val_1 + @val_2 + trim(str(@val_3)));
