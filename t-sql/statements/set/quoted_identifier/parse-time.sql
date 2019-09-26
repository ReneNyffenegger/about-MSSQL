set nocount on

set quoted_identifier off

    select 'quoted_identifier is ' + case when @@options & power(2, 8) > 0 then 'on' else 'off' end;

set quoted_identifier on

    select 'quoted_identifier is ' + case when @@options & power(2, 8) > 0 then 'on' else 'off' end;

set quoted_identifier off

    select 'quoted_identifier is ' + case when @@options & power(2, 8) > 0 then 'on' else 'off' end;

go

-- quoted_identifier is off
-- quoted_identifier is off
-- quoted_identifier is off
