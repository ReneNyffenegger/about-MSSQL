set nocount on

declare
   @some_data table (
                 id   integer primary key,
                 val  varchar(20) not null
              );
declare
   @ids_b     table (
                 id   integer
              );

insert into @some_data values
   (1, 'foo'),
   (2, 'bar'),
   (3, 'baz');

insert into
   @ids_b
select
   id
from
   @some_data
where
   val like 'b%';

select
   id
from
   @ids_b;
--
-- id
-- -----------
-- 2
-- 3
