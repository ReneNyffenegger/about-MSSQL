select
  tab.name   tab_name,
  col.name   col_name
from
  sys.tables  tab join
  sys.columns col on tab.object_id = col.object_id
where
  col.name like '%FOO%';
