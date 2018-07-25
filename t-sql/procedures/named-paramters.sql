create procedure tq84_named_params (
   @param_one  integer,
   @param_two  varchar(10)
)
as
   print('param_one is: ' + str(@param_one));
   print('param_two is: ' +     @param_two );
go

exec tq84_named_params
        @param_one = 42,
        @param_two = 'Forty-two';

drop procedure tq84_named_params;
