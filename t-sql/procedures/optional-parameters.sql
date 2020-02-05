create or alter procedure tq84_some_optional_params (
  @req_one  integer,
  @req_two  varchar(10),
  @opt_one  integer      = 42,
  @opt_two  varchar(20)  ='Hello world'
)
as
  print('req_one = ' + isNull(str(@req_one), 'n/a'));
  print('req_two = ' + isNull(    @req_two , 'n/a'));
  print('opt_one = ' + isNull(str(@opt_one), 'n/a'));
  print('opt_two = ' + isNull(    @opt_two , 'n/a'));
  print('');
go

exec tq84_some_optional_params 1, 'one' ;
exec tq84_some_optional_params 2, 'two' , 3, 'three';
exec tq84_some_optional_params 4, 'four', @opt_two = 'good bye';
go
