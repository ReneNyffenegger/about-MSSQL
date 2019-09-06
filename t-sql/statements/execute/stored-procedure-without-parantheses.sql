create procedure greet_planet (
   @planet varchar(20) = 'world'
)
as
   print('Hello ' + @planet);
go

execute greet_planet
execute greet_planet 'Mars'
execute greet_planet @planet = 'Jupiter'

--
-- Cannot use paranthesis when execute stored procedure:
--
-- execute greet_planet(@planet = 'Saturn')

drop procedure greet_planet;
