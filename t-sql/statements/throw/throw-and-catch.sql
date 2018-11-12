create procedure dbo.tq84_check_percentage
      @percentage float
as begin

   if @percentage <   0 begin
      throw 50000, 'Percentage  must be greater than 0.', 1;
   end;

   if @percentage > 100 begin
      throw 50000, 'Percentage must be smaller than 100.', 1;
   end;

   print('OK: ' + str(@percentage));

end
go


begin try
   exec tq84_check_percentage   9;
   exec tq84_check_percentage  42;

--
-- Following line causes throw to be executed which
-- is caught below in `begin catch`.
--
   exec tq84_check_percentage 123;

--
-- Following line is not reached (because line above
-- causes throw).
--
   exec tq84_check_percentage  17;
end try
begin catch
   print(error_message());
end catch
go

--
-- Output:
--
--   OK:          9
--   OK:         42
--   Percentage must be smaller than 100.
