select
   col.column_name,
   col.data_type,
   col.is_nullable
from
   information_schema.columns col
where
-- col.table_catalog = 'xyz'      and
-- col.table_schema  = 'xyz'      and
   col.table_name    = 'TQ84_CPG'
order by
   col.ordinal_position;
