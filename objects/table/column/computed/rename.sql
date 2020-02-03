create table some_table (
   val_1     decimal(6,2)  not null,
   val_2     decimal(6,2)  not null,
   procudt   as val_1 * val_2
);

go

insert into some_table values
  ( 4.56,  6.78),
  ( 2.05, 11.11),
  (-6.23,  9.17);
go

exec sp_rename 'some_table.procudt', 'product'
--
-- Msg 4928, Level 16, State 1, Procedure sp_rename, Line 671 …
-- Cannot alter column 'procudt' because it is 'COMPUTED'.
--

go

alter table some_table drop column procudt;
go

alter table some_table add  product as val_1 * val_2
go

select val_1, val_2, product from some_table;
go
