select
   t.value
from
   string_split('foo,bar,baz', ',') t;
--
-- value
-- -----------
-- foo
-- bar
-- baz
