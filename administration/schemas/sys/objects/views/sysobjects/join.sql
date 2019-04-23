select
   obj.name,
-- obj.xtype,
-- obj.type,     -- type seems to be always equal to xtype
   spt.name,
   substring(spt.name, 5, len(spt.name)-3)  spt_name,
   obj.uid,
   obj.id,
   obj.crdate,
   obj.info,
   obj.status
from
   sys.sysobjects     obj                                         left join
   master..spt_values spt on spt.name like obj.xtype + '%' and
                             spt.type = 'O9T'
-- where
--  obj.name = 'sysobjects'
;
