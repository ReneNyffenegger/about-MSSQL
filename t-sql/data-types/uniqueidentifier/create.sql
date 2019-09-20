declare
   @uid_1   uniqueidentifier,
   @uid_2   uniqueidentifier;

set @uid_1 = newid()          ; -- compliant with RFC 4122
set @uid_2 = '01234567-89ab-cdef-0123-456789abcdef';

print('uid_1 =  ' + convert(varchar(255), @uid_1));
print('uid_2 =  ' + convert(varchar(255), @uid_2));
