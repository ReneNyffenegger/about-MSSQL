select 'disable_def_cnst_chk'    , case when @@options & power(2,  0) > 0 then 'yes' else 'no' end union all
select 'implicit_transactions'   , case when @@options & power(2,  1) > 0 then 'yes' else 'no' end union all
select 'cursor_close_on_commit'  , case when @@options & power(2,  2) > 0 then 'yes' else 'no' end union all
select 'ansi_warnings'           , case when @@options & power(2,  3) > 0 then 'yes' else 'no' end union all
select 'ansi_padding'            , case when @@options & power(2,  4) > 0 then 'yes' else 'no' end union all
select 'ansi_nulls'              , case when @@options & power(2,  5) > 0 then 'yes' else 'no' end union all
select 'arithabort'              , case when @@options & power(2,  6) > 0 then 'yes' else 'no' end union all
select 'arithignore'             , case when @@options & power(2,  7) > 0 then 'yes' else 'no' end union all
select 'quoted_identifier'       , case when @@options & power(2,  8) > 0 then 'yes' else 'no' end union all
select 'nocount'                 , case when @@options & power(2,  9) > 0 then 'yes' else 'no' end union all
select 'ansi_null_dflt_on'       , case when @@options & power(2, 10) > 0 then 'yes' else 'no' end union all
select 'ansi_null_dflt_off'      , case when @@options & power(2, 11) > 0 then 'yes' else 'no' end union all
select 'concat_null_yields_null' , case when @@options & power(2, 12) > 0 then 'yes' else 'no' end union all
select 'numeric_roundabort'      , case when @@options & power(2, 13) > 0 then 'yes' else 'no' end union all
select 'xact_abort'              , case when @@options & power(2, 14) > 0 then 'yes' else 'no' end;

go
