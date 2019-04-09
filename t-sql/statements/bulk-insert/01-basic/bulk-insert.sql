drop table if exists dbo.csv_simple;

create table dbo.csv_simple (
  id     integer,
  val_1  varchar(10),
  val_2  varchar(10),
);


bulk insert dbo.csv_simple
from 'C:\Users\OMIS.Rene\github\about\MSSQL\t-sql\statements\bulk-insert\01-basic\data.csv'
with (format = 'CSV');
