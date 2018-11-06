select
   object_schema_name(dep.referencing_id) sch_referencing,
   object_name       (dep.referencing_id) obj_referencing,
   ------------------------------------------------------
   dep.referenced_schema_name             sch_referenced ,
-- object_name(dep.referenced_id )        obj_referenced1,
   dep.referenced_entity_name             obj_referenced ,
   ------------------------------------------------------
   dep.referencing_class_desc             cls_referencing,
   dep.referenced_class_desc              cls_referenced
from
   sys.sql_expression_dependencies dep;
