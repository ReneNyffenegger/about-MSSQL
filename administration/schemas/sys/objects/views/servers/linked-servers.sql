select
   server_id,
   name,
   product,
   provider,  -- OLE DB provider
   data_source,
   is_remote_login_enabled,
   modify_date
from
   sys.servers
where
   is_linked = 1;
