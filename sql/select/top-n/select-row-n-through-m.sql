select
   id,
   txt
from
   tq84_top_n
order by
   id
offset     5 rows
fetch next 4 rows only;
