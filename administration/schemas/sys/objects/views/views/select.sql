select
   sc.name                        schema_name,
   vw.name                        view_name,
   vw.create_date                 create_dt,
   vw.modify_date                 modif_dt,
   vw.with_check_option,
   vw.is_date_correlation_view,
   is_tracked_by_cdc,
   vw.principal_id,
   vw.object_id,
   sc.schema_id,
   sc.principal_id                schema_principal_id,
   vw.type                        view_type     ,      -- ?
   vw.type_desc                   view_type_desc,      -- ?
-- vw.is_ms_shipped,                                   -- Always 0?
   vw.is_published,
   vw.is_schema_published,
   vw.is_replicated,
   vw.has_replication_filter,
   vw.has_opaque_metadata,
   vw.has_unchecked_assembly_data
from
   sys.views    vw                                 join
   sys.schemas  sc on vw.schema_id = sc.schema_id;
