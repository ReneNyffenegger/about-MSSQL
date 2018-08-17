select
   mod.definition    definition,
   obj.modify_date   obj_mod_dt
from
   sys.objects       obj                                   join
   sys.sql_modules   mod on obj.object_id = mod.object_id  join
   sys.schemas       sch on obj.schema_id = sch.schema_id
where
   lower(obj.name) = 'tq84_ect' and
   lower(sch.name) = 'dbo'
;
