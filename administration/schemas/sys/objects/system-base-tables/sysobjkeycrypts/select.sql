select
   obj.name,
   cry.class,
   cry.type,
   cry.status,
   cry.thumbprint
from
   sys.sysobjkeycrypts cry                       left join
   sys.sysschobjs      obj on cry.id = obj.id;
