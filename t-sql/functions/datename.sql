select
  datename(yyyy, sysdatetime()) year,
  datename(mm  , sysdatetime()) month,
  datename(d   , sysdatetime()) day,
  datename(hh  , sysdatetime()) hour,
  datename(mi  , sysdatetime()) minute,
  datename(ss  , sysdatetime()) second,
  --
  datename(dy  , sysdatetime()) day_of_year	
;
