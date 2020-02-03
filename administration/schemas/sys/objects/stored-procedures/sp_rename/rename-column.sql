create table some_table (
   phoo  integer,
   bar   varchar(10),
   bats  date
);
go

exec sp_rename 'some_table.phoo', 'foo';
go

exec sp_columns 'some_table'
go
