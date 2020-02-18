declare @B bit;

set @B =   0    ; print(isNull(str(@B), 'null')); --    0
set @B =   0.4  ; print(isNull(str(@B), 'null')); --    1
set @B =   0.6  ; print(isNull(str(@B), 'null')); --    1
set @B =   1    ; print(isNull(str(@B), 'null')); --    1
set @B =  -1    ; print(isNull(str(@B), 'null')); --    1
set @B =   2    ; print(isNull(str(@B), 'null')); --    1
set @B =  -2    ; print(isNull(str(@B), 'null')); --    1
set @B = 123.456; print(isNull(str(@B), 'null')); --    1
set @B =  null  ; print(isNull(str(@B), 'null')); -- null
