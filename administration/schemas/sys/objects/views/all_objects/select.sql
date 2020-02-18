select
   sch.name             schema_name,
   alo.name             object_name,
-- alo.parent_object_id,
   alo.type             object_type,
   alo.type_desc        object_type_desc,
   alo.create_date      create_dt,
   alo.modify_date      modif_dt,
   alo.principal_id     object_principal_id,
   sch.principal_id     schema_principal_id,
   alo.is_ms_shipped,
   alo.is_published,
   alo.is_schema_published
from
   sys.all_objects alo                                   join
   sys.schemas     sch on alo.schema_id = sch.schema_id
where
   is_ms_shipped <>  1                      and
   alo.type_des   = 'SQL_STORED_PROCEDURE';
