select
-- is_disable_def_cnst_chk_on,
-- is_implicit_transactions_on,
   is_cursor_close_on_commit_on,
   is_ansi_warnings_on,
   is_ansi_padding_on,
   is_ansi_nulls_on,
   is_arithabort_on,
-- is_arithignore_on,
   is_quoted_identifier_on,
-- is_nocount_on,
-- is_ansi_null_dflt_on_on,
-- is_ansi_null_dflt_off_on,
   is_concat_null_yields_null_on,
   is_numeric_roundabort_on
-- is_xact_abort_on
from
   sys.databases
where
   name = db_name()
;
