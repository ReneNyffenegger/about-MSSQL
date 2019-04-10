select
   item,
   [foo] as sum_foo,
   [bar] as sum_bar,
   [baz] as sum_baz
from (
   select
      item,
      grp,
      val_one
   from
      things
) as t
pivot (
  sum(val_one) for grp in ([foo], [bar], [baz])
) as v1;
