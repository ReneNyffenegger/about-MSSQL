select
   obj.name,
-- obj.xtype,
-- obj.type,     -- type seems to be always equal to xtype
-- spt.name,
   substring(spt.name, LEN(obj.xtype) + 2, len(spt.name)-len(obj.xtype)-1)  spt_name,
   obj.uid,
   obj.id,
   obj.crdate,
   obj.info,
   obj.status
from
   sys.sysobjects     obj                                         left join
   master..spt_values spt on spt.name like obj.xtype + '%' and
                             spt.type = 'O9T'
;
