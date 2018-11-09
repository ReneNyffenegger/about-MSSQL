-- -------------------------------------------------------------------
--
-- First Batch. No syntax errors
--

create table tq84_batch (id integer identity, txt varchar(50));
insert into tq84_batch (txt) values ('Inserted in first batch.');

go

--
-- Second batch: insert a few more records into the table.
--

insert into tq84_batch (txt) values ('Batch 2 - a');
insert into tq84_batch (txt) values ('Batch 2 - b');
insert into tq84_batch (txt) values ('Batch 2 - c');

go

-- -------------------------------------------------------------------
--
-- Third batch: This batch contains syntactical errors
--
-- The entire batch is not executed because it contains
-- a syntactic error.
--

insert into tq84_batch (txt) values ('Batch 3 - before error.');
commit;

   -- Note the typo in the next statement:
slect * from tq84_batch;

insert into tq84_batch (txt) values ('Batch 3 - after error.');

go

-- -------------------------------------------------------------------
--
-- fourth batch: show content of table and drop it.
--

select txt from tq84_batch order by id;
   --
   -- The select statement returns:
   --
   --     Inserted in first batch.
   --     Batch 2 - a
   --     Batch 2 - b
   --     Batch 2 - c
   --

drop table tq84_batch;

go
