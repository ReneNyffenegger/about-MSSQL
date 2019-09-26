    set nocount on

    set quoted_identifier off
    select '1st batch, quoted_identifier is ' + case when @@options & power(2, 8) > 0 then 'on' else 'off' end;

go

    select '2nd batch, quoted_identifier is ' + case when @@options & power(2, 8) > 0 then 'on' else 'off' end;
    set quoted_identifier on

go

    select '3rd batch, quoted_identifier is ' + case when @@options & power(2, 8) > 0 then 'on' else 'off' end;
--    
-- 1st batch, quoted_identifier is off
-- 2nd batch, quoted_identifier is on
-- 3rd batch, quoted_identifier is on    
