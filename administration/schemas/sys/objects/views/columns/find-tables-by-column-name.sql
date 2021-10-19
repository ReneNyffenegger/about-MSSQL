select
   tab.name    table_,
   sch.name    schema_,
   col.name    column_
from
   sys.tables  tab                                    join
   sys.columns col on tab.object_id = col.object_id   join
   sys.schemas sch on tab.schema_id = sch.schema_id
where
   col.name like '%ABC%';
