select
  v.name
from
  sys.schemas     s join
  sys.all_views   v on s.schema_id = v.schema_id
where
  s.name = 'sys'
order by
  v.name;