with num as (
  select    11    ber         -- Start number
  union all
  select     3 +  ber         -- Increment
  from num
  where      3 +  ber < 10000 -- Maximal returned number
)
select
   num.ber
from
   num
--
-- Prevent error message
--   «The statement terminated.
--    The maximum recursion 100 has been exhausted before statement completion.»
--
   option (maxrecursion 0)
;
