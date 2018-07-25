create procedure tq84_declare_variables(@num integer) as
declare
   @num_times_2  integer,
   @num_squared  integer;

   select
      @num_times_2 = @num * 2,
      @num_squared = @num * @num;

   print str(@num) + ' * 2 = ' + str(@num_times_2);
   print str(@num) + '^2   = ' + str(@num_squared);

go

exec tq84_declare_variables 42;

drop procedure tq84_declare_variables;
