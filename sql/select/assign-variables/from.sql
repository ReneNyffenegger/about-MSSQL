create table #tq84_values (
   val_1 varchar(10),
   val_2 float
);

insert into #tq84_values values
  ('one'  , 1),
  ('three', 3),
  ('seven', 7);

declare
   @max_val_1  varchar(10),
   @avg_val_2  float;

select
   @max_val_1 = max(val_1),
   @avg_val_2 = avg(val_2)
from
  #tq84_values;

print('max val_1 = ' + @max_val_1);
print('avg val 2 = ' + str(@avg_val_2, 5, 3));
