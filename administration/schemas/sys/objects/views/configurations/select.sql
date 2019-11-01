select
   name                          name,
   substring(description, 1, 95) description,
   cast(minimum as integer)      minimum,
   cast(maximum as integer)      maximum,
   is_dynamic,
   is_advanced
from
   sys.configurations
order by
   name;
go
