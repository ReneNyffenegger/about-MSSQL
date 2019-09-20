select
   tab.type_desc,
   tab.name           table_name,
   tab.object_id,
   sch.name           schema_name,
   tab.create_date,
   tab.modify_date,
   tab.temporal_type_desc,
   tab.uses_ansi_nulls,
   tab.is_ms_shipped
from
   sys.tables   tab join
   sys.schemas  sch on tab.schema_id = sch.schema_id
;
