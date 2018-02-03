select
  v.name
from
  sys.schemas     s join
  sys.all_views   v on s.schema_id = v.schema_id
where
  s.name = 'INFORMATION_SCHEMA'
order by
  v.name;