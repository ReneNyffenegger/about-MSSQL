select
   class_desc,
   case dbp.class
        when 0 then db_name()
        when 1 then object_name(major_id)
        when 3 then schema_name(major_id)
   end class_to_securable,
   user_name(dbp.grantor_principal_id) grantor,
   user_name(dbp.grantee_principal_id) grantee,
   dbp.permission_name
from
   sys.database_permissions dbp;
