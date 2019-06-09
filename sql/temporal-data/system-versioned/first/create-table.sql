--
-- Create a system-versioned table
--
create table dbo.timeTravel (
   id          integer identity primary key,
   col_one     integer,
   col_two     varchar(10),
-------------------------------------------------------------------------
--
-- Define period columns:
--
   validFrom   datetime2    generated always as row start hidden not null,
   validTo     datetime2    generated always as row end   hidden not null,
   period      for system_time (validFrom, validTo)
)
with (
   system_versioning = on (
      history_table = dbo.timeTravel_log
   )
);
