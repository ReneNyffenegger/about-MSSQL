select
   sch.name                     schema_name,
-- sch.schema_id,
-- sch.principal_id,
   dbp.name                     principal_name,
   dbp.type                     principal_type,
   dbp.type_desc                principal_type_desc,       -- SQL_USER, DATABASE_ROLE (...?)
   dbp.default_schema_name      principal_default_schema,
   dbp.authentication_type_desc principal_auth_type        -- INSTANCE, NONE          (...?)
from
   sys.schemas sch              left join
   sys.database_principals dbp on sch.principal_id = dbp.principal_id
;
