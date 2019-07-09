--
-- Create a table
--
create table spelled_rwongly (a int);

--
-- Manipulate values in table
--
insert into spelled_rwongly values (42);

--
-- Decide to rename table
--
exec sp_rename 'spelled_rwongly', 'spelled_correctly';
--
--  Caution: Changing any part of an object name could break scripts and stored procedures.
--

--
--  Use renamed table
--
select * from  spelled_correctly;
drop     table spelled_correctly;
