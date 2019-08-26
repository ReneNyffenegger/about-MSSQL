with n as (
   select  1.00     as um union all
   select  1.000001 as um union all
   select -1        as um union all
   select  0.3      as um union all
   select  0.007    as um union all
   select  123456   as um
)
select
   format(n.um,  '0'    ),
   format(n.um,  '#'    ),
   format(n.um,  '0.00' ),
   format(n.um,  '0.000'),
   format(n.um,  '#.00' ),
   format(n.um, '00.00' )
from
   n
--                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
--  0        #        0.00       0.000        #.00       00.00
--  -------  -------  ---------  -----------  ---------  ---------
--  1        1        1.00       1.000        1.00       01.00
--  1        1        1.00       1.000        1.00       01.00
--  -1       -1       -1.00      -1.000       -1.00      -01.00
--  0                 0.30       0.300        .30        00.30
--  0                 0.01       0.007        .01        00.01
--  123456   123456   123456.00  123456.000   123456.00  123456.00
