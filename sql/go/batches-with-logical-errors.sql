-- -------------------------------------------------------------------
--
-- First Batch. No syntax errors
--

create table tq84_batch (id integer identity, txt varchar(20));
insert into tq84_batch (txt) values ('Batch 1 - a');

go

-- -------------------------------------------------------------------
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
-- This batch contains a logical error.
-- The error does not cause the batch to be terminated, the statement(s)
-- after the wrong error are still executed.
--

insert into tq84_batch (txt) values ('Batch 3 - a');
-- commit;

insert into tq84_batch (txt) values ('Batch 3 - b');
insert into tq84_batch (txt) values ('This string is much longer than 20 characters, hence, it is a logical error and cannot be executed.');

insert into tq84_batch (txt) values ('Batch 3 - c');

go

-- -------------------------------------------------------------------
--
-- fourth batch: show content of table and drop it.
--

select txt from tq84_batch order by id;
   --
   -- The select statement returns:
   --
   --     Batch 1 - a
   --     Batch 2 - a
   --     Batch 2 - b
   --     Batch 2 - c
   --     Batch 3 - a
   --     Batch 3 - b
   --     Batch 3 - c
   --

drop table tq84_batch;

go
