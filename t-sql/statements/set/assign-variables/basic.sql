declare
   @var_1 varchar(10),
   @var_2 integer;

set @var_1 = 'one';
set @var_2 =  2;

print('Var_1 = ' + @var_1 + ', var_2 = ' + trim(str(@var_2)));
