select
  count(*)       cnt,
  obj.type_desc  object_name
from
  sys.schemas sch      join
  sys.objects obj on sch.schema_id = obj.schema_id
where
  sch.name = 'sys'
group by
  obj.type_desc;