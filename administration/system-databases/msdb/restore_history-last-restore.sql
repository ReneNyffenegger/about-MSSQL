select
  destination_database_name  db_name,
  max  (restore_date)        last_restore_date,
  count(*           )        count_restores
from
  msdb.dbo.restorehistory
group by
  destination_database_name
order by
  destination_database_name;
