drop table if exists dbo.semicolon_separated_data;
go

create table dbo.semicolon_separated_data (
  id     integer,
  val_1  varchar(10),
  val_2  varchar(10),
);
go

bulk insert dbo.semicolon_separated_data
from '$(curdir)\header-and-semicolons.csv'
with (
  format          = 'CSV',
  firstRow        =  2   ,  -- start with second row because first row is the header
  fieldTerminator = ';'     -- data is separated with semicolons
);
