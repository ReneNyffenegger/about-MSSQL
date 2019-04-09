drop table if exists dbo.data_with_header;

create table dbo.data_with_header (
  id     integer,
  val_1  varchar(10),
  val_2  varchar(10),
);


bulk insert dbo.data_with_header
from 'C:\Users\Rene\github\about\MSSQL\t-sql\statements\bulk-insert\header\data-with-header.csv'
with (
  format    = 'CSV',
  firstRow  =     2
);
