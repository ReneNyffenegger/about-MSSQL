declare  @num int = 3;

select
  case @num
      when 1 then 'one'
	  when 2 then 'two'
	  when 3 then 'three'
	  when 4 then 'four'
	  when 5 then 'five'
	  else        '?'
  end;