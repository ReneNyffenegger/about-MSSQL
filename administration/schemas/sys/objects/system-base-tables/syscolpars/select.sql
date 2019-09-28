select
   tab.name tab_name,
   col.name col_name
from
   sys.sysschobjs tab join
   sys.syscolpars   col  on tab.id = col.id
order by
   tab.name,
   col.colid;
