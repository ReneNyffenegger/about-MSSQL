select
   en.num,
   en.txt,
   ge.txt
from (
  values
    (   1, 'one'  ),
    (   2, 'two'  ),
    (   3, 'three'),
    (   4, 'four' )
) en (num,  txt   )    left join
( values
    (   1, 'eins' ),
    (   2, 'zwei' ),
    (   4, 'vier' ),
    (   5, 'fünf' )
) ge (num,  txt   )  on en.num = ge.num;
