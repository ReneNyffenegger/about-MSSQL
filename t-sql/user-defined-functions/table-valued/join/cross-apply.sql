create function number_sequence(
            @start_ integer,
            @end_   integer,
            @step_  integer = 1
)
returns @seq table(num integer)
as begin

  declare @num integer = @start_;

  while @num <= @end_ begin
      insert into @seq values (@num);
      set @num = @num + @step_;
  end;

  return;

end;
go

create function num_times_string(
             @num    integer,
             @string varchar(10)
)
returns @ret table (string varchar(max))
as begin

  declare @cnt integer      =  1;
  declare @str varchar(max) = '';

  while @cnt <= @num begin
      set @str = @str + @string;
      insert into @ret values (@str);
      set @cnt = @cnt + 1;
  end;

  return;
end;
go


select
   *
from
   number_sequence (2, 8, 3) s    cross apply -- cross join -- The multi-part identifier "s.num" could not be bound.
   num_times_string(s.num, '*')
;
