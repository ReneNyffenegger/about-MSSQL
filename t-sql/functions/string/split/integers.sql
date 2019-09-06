select
   convert(int, t.value) as i
from
   string_split('42,99,1', ',') t
--
-- i
-- -----------
-- 42
-- 99
-- 1
