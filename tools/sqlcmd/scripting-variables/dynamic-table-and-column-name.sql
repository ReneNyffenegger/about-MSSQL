--
--  Call this script with something like
--     sqlcmd -v tab=foo -v col=bar val=baz -i dynamic-table-and-column-name.sql     
--

create table $(tab) (
   $(col)  varchar(10)
)
go

insert into $(tab) values ("$(col)")
go