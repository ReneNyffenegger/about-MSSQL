select
  sch.name       schema_name,
  obj.name       object_name,
  obj.type_desc  object_type
from
  sys.schemas sch      join
  sys.objects obj on sch.schema_id = obj.schema_id
where
  sch.name = 'sys'
;