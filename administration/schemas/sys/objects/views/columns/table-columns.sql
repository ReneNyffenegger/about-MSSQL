select
-- sch.name             sch_name,
-- tab.name             tab_name,
   col.name             col_name,
-- col.user_type_id,
   ust.name             user_type,
-- col.system_type_id,
   syt.name             system_type
from
   sys.schemas   sch                                          join
   sys.tables    tab on sch.schema_id      = tab.schema_id    join
   sys.columns   col on tab.object_id      = col.object_id    join
   sys.types     ust on col.user_type_id   = ust.user_type_id join
   sys.types     syt on col.system_type_id = syt.system_type_id
where
   sch.name = 'dbo'                  and
   tab.name = 'foo_bar'
order by
   col.column_id
;
