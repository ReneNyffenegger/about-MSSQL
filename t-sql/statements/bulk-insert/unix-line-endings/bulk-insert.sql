drop table if exists dbo.csv_unix;

create table dbo.csv_unix (
  id     integer,
  val_1  varchar(10),
  val_2  varchar(10),
);


bulk insert dbo.csv_unix
from 'C:\Users\Rene\github\about\MSSQL\t-sql\statements\bulk-insert\unix-line-endings\data-unix.csv'
with (
   format          = 'CSV' ,
   rowTerminator   = '0x0a'
);
