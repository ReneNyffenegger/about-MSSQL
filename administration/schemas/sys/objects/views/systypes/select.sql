select
   tp.name,
   tp.xtype,
   tp.status,
   tp.xusertype,
   tp.length,
   tp.xprec,
   tp.xscale,
   tp.tdefault,
   tp.domain,
   tp.uid,
   tp.reserved,
   tp.collationid,
   tp.usertype,
   tp.variable,
   tp.allownulls,
   tp.type,
   tp.printfmt,
   tp.prec,
   tp.scale,
   tp.collation
from
   sys.systypes tp
order by
   tp.name;
